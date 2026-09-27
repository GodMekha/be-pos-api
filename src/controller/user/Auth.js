import { ValidateData } from "../../service/validate.js";
import { resError, resSuccess } from "../../service/response.js";
import { EMessage, SMessage } from "../../service/message.js";
import prisma from "../../config/prisma.js";
import { Decrypt, HashEncrypt } from "../../lib/hash.js";
import { GenerateToken } from "../../lib/generatToken.js";
import { Action, PERMISSIONS, Resource, Role, can, canManageUser, isValidRole } from "../../config/permissions.js";

// ---------------------------------------------------------------------
// helpers
// ---------------------------------------------------------------------
const withoutPassword = ({ password, ...user }) => user;

/** ຂໍ້ມູນຜູ້ໃຊ້ + ສິດ ທີ່ສົ່ງໃຫ້ frontend (ໃຊ້ຊ່ອນ/ສະແດງ ເມນູ ແລະ ປຸ່ມ) */
const toSession = (user) => ({ ...withoutPassword(user), permissions: PERMISSIONS[user.role] ?? {} });

const findUser = (user_id) => prisma.user.findUnique({ where: { user_id } });
const findByPhone = (phoneNumber) => prisma.user.findFirst({ where: { phoneNumber: parseInt(phoneNumber) } });

const countSuperAdmins = () => prisma.user.count({ where: { role: Role.super_admin, active: true } });

/** ກັນບໍ່ໃຫ້ລະບົບເຫຼືອ super_admin 0 ຄົນ */
const isLastSuperAdmin = async (user) => user.role === Role.super_admin && (await countSuperAdmins()) <= 1;

/**
 * ໂຫລດ target user ແລ້ວກວດວ່າ req.user ຈັດການໄດ້ບໍ່
 * @returns {Promise<{ target?: object, error?: [number, string] }>}
 */
const loadManageableUser = async (req) => {
    const target = await findUser(req.params.user_id);
    if (!target) return { error: [404, EMessage.NotFound] };
    const isSelf = target.user_id === req.user.user_id;
    if (!isSelf && !canManageUser(req.user.role, target.role)) return { error: [403, EMessage.CannotManageUser] };
    return { target };
};

export default class AuthController {
    // ---------------------------------------------------------------------
    // ສາທາລະນະ (ບໍ່ຕ້ອງ login)
    // ---------------------------------------------------------------------
    static async Login(req, res) {
        try {
            const { password, phoneNumber } = req.body;
            const validate = await ValidateData({ password, phoneNumber });
            if (validate.length > 0) return resError(res, 400, EMessage.BadRequest, validate.join(", "));

            const user = await findByPhone(phoneNumber);
            if (!user) return resError(res, 400, "Phone number Not Found");
            if ((await Decrypt(user.password)) !== password) return resError(res, 400, EMessage.BadRequest);
            if (!user.active) return resError(res, 403, EMessage.AccountDisabled);

            const tokens = await GenerateToken(user.user_id);
            return resSuccess(res, SMessage.Login, { ...toSession(user), ...tokens });
        } catch (error) {
            console.error("Login Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    /** ລົງທະບຽນເອງ → role = general (ຍັງບໍ່ມີສິດ ຈົນກວ່າ super_admin ຈະກຳນົດໃຫ້) */
    static async Register(req, res) {
        try {
            const { username, password, phoneNumber } = req.body;
            const validate = await ValidateData({ username, password, phoneNumber });
            if (validate.length > 0) return resError(res, 400, EMessage.BadRequest, validate.join(", "));
            if (await findByPhone(phoneNumber)) return resError(res, 400, "Phone number already exists");

            const user = await prisma.user.create({
                data: {
                    username,
                    phoneNumber: parseInt(phoneNumber),
                    password: await HashEncrypt(password),
                    role: Role.general,
                },
            });
            return resSuccess(res, SMessage.Register, withoutPassword(user));
        } catch (error) {
            console.error("Register Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    // ---------------------------------------------------------------------
    // ບັນຊີຂອງຕົວເອງ (login ແລ້ວ)
    // ---------------------------------------------------------------------
    /** ຂໍ້ມູນຜູ້ໃຊ້ປັດຈຸບັນ + ສິດລ່າສຸດ (frontend ເອີ້ນຕອນເປີດແອັບ) */
    static async Me(req, res) {
        try {
            const user = await findUser(req.user.user_id);
            return resSuccess(res, SMessage.getOne, toSession(user));
        } catch (error) {
            console.error("Me Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    static async ChangePassword(req, res) {
        try {
            const { oldPassword, newPassword } = req.body;
            const validate = await ValidateData({ oldPassword, newPassword });
            if (validate.length > 0) return resError(res, 400, EMessage.BadRequest, validate.join(","));

            const user = await findUser(req.user.user_id);
            if ((await Decrypt(user.password)) !== oldPassword) return resError(res, 400, EMessage.isNotMatch);

            await prisma.user.update({
                where: { user_id: user.user_id },
                data: { password: await HashEncrypt(newPassword) },
            });
            return resSuccess(res, SMessage.updated);
        } catch (error) {
            console.error("Change Password Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    static async DeleteUser(req, res) {
        try {
            const user = await findUser(req.user.user_id);
            if (await isLastSuperAdmin(user)) return resError(res, 400, EMessage.LastSuperAdmin);

            const data = await prisma.user.delete({ where: { user_id: user.user_id } });
            return resSuccess(res, SMessage.Delete, withoutPassword(data));
        } catch (error) {
            console.error("Delete Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    // ---------------------------------------------------------------------
    // ຈັດການຜູ້ໃຊ້ (ຕ້ອງມີສິດ user:* — ກວດໃນ router)
    // ---------------------------------------------------------------------
    static async getAll(req, res) {
        try {
            const { page = 1, limit = 15, search, startDate, endDate, status } = req.query;
            const query = {};

            if (search) {
                query.OR = [
                    { username: { contains: search } },
                    ...(!isNaN(search) ? [{ phoneNumber: Number(search) }] : []),
                ];
            }
            if (startDate || endDate) {
                query.createdAt = {};
                if (startDate) query.createdAt.gte = new Date(startDate);
                if (endDate) query.createdAt.lt = new Date(endDate);
            }
            if (status) query.role = status; // ?status=<role>

            const take = parseInt(limit);
            const [users, count] = await Promise.all([
                prisma.user.findMany({
                    where: query,
                    orderBy: { createdAt: "desc" },
                    skip: (parseInt(page) - 1) * take,
                    take,
                }),
                prisma.user.count({ where: query }),
            ]);
            return resSuccess(res, SMessage.getAll, {
                data: users.map(withoutPassword),
                totalPage: Math.ceil(count / take),
            });
        } catch (error) {
            console.error("Get all Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    static async getOne(req, res) {
        try {
            const user = await findUser(req.params.user_id);
            if (!user) return resError(res, 404, EMessage.NotFound);
            return resSuccess(res, SMessage.getOne, withoutPassword(user));
        } catch (error) {
            console.error("Get One Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    /**
     * ສ້າງຜູ້ໃຊ້ໂດຍ admin/super_admin
     * `role` ຈະຖືກນຳໃຊ້ສະເພາະຜູ້ທີ່ມີສິດ role:update (super_admin) — ຄົນອື່ນໄດ້ general
     */
    static async CreateUser(req, res) {
        try {
            const { username, password, phoneNumber, role } = req.body;
            const validate = await ValidateData({ username, password, phoneNumber });
            if (validate.length > 0) return resError(res, 400, EMessage.BadRequest, validate.join(", "));
            if (await findByPhone(phoneNumber)) return resError(res, 400, "Phone number already exists");

            const canAssignRole = can(req.user.role, Resource.role, Action.update);
            if (role && !canAssignRole) return resError(res, 403, EMessage.Forbidden, "ບໍ່ມີສິດກຳນົດ role");
            if (role && !isValidRole(role)) return resError(res, 400, EMessage.BadRequest, "role");

            const user = await prisma.user.create({
                data: {
                    username,
                    phoneNumber: parseInt(phoneNumber),
                    password: await HashEncrypt(password),
                    role: role || Role.general,
                },
            });
            return resSuccess(res, SMessage.Insert, withoutPassword(user));
        } catch (error) {
            console.error("Create User Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    static async UpdateUser(req, res) {
        try {
            const { username } = req.body;
            if (!username) return resError(res, 400, EMessage.BadRequest, "username");

            const { target, error } = await loadManageableUser(req);
            if (error) return resError(res, ...error);

            const user = await prisma.user.update({ where: { user_id: target.user_id }, data: { username } });
            return resSuccess(res, SMessage.updated, withoutPassword(user));
        } catch (error) {
            console.error("Update user Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    /** ເປີດ/ປິດ ການໃຊ້ງານບັນຊີ (ປິດແລ້ວ login / ເອີ້ນ API ບໍ່ໄດ້) */
    static async UpdateActive(req, res) {
        try {
            const { target, error } = await loadManageableUser(req);
            if (error) return resError(res, ...error);
            if (target.user_id === req.user.user_id) return resError(res, 400, EMessage.BadRequest, "ປິດບັນຊີຕົວເອງບໍ່ໄດ້");
            if (target.active && (await isLastSuperAdmin(target))) return resError(res, 400, EMessage.LastSuperAdmin);

            const user = await prisma.user.update({
                where: { user_id: target.user_id },
                data: { active: !target.active },
            });
            return resSuccess(res, SMessage.updated, withoutPassword(user));
        } catch (error) {
            console.error("Update active user Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    /** ຕັ້ງລະຫັດຜ່ານໃໝ່ໃຫ້ຜູ້ອື່ນ (ແທນ /auth/forgot ທີ່ເປີດສາທາລະນະ) */
    static async ResetPassword(req, res) {
        try {
            const { newPassword } = req.body;
            if (!newPassword) return resError(res, 400, EMessage.BadRequest, "newPassword");

            const { target, error } = await loadManageableUser(req);
            if (error) return resError(res, ...error);

            await prisma.user.update({
                where: { user_id: target.user_id },
                data: { password: await HashEncrypt(newPassword) },
            });
            return resSuccess(res, SMessage.updated);
        } catch (error) {
            console.error("Reset Password Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    static async DeleteUserById(req, res) {
        try {
            const { target, error } = await loadManageableUser(req);
            if (error) return resError(res, ...error);
            if (await isLastSuperAdmin(target)) return resError(res, 400, EMessage.LastSuperAdmin);

            const data = await prisma.user.delete({ where: { user_id: target.user_id } });
            return resSuccess(res, SMessage.Delete, withoutPassword(data));
        } catch (error) {
            console.error("Delete user Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }

    // ---------------------------------------------------------------------
    // ກຳນົດສິດ (role:update — super_admin ເທົ່ານັ້ນ)
    // ---------------------------------------------------------------------
    static async getRoles(req, res) {
        return resSuccess(res, SMessage.getAll, { roles: Object.values(Role), permissions: PERMISSIONS });
    }

    static async UpdateRole(req, res) {
        try {
            const { role } = req.body;
            if (!isValidRole(role)) return resError(res, 400, EMessage.BadRequest, `role ຕ້ອງເປັນ: ${Object.values(Role).join(", ")}`);

            const target = await findUser(req.params.user_id);
            if (!target) return resError(res, 404, EMessage.NotFound);
            if (role !== Role.super_admin && (await isLastSuperAdmin(target))) {
                return resError(res, 400, EMessage.LastSuperAdmin);
            }

            const user = await prisma.user.update({ where: { user_id: target.user_id }, data: { role } });
            return resSuccess(res, SMessage.updated, withoutPassword(user));
        } catch (error) {
            console.error("Update Role Controller Error:", error);
            return resError(res, 500, EMessage.ErrorServer, error.message);
        }
    }
}
