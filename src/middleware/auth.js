import { VerifyToken } from "../lib/verifyToken.js";
import { EMessage } from "../service/message.js";
import { resError } from "../service/response.js";
import { can } from "../config/permissions.js";

const readBearerToken = (req) => {
    const header = req.headers.authorization || "";
    const [scheme, token] = header.split(" ");
    return scheme === "Bearer" && token ? token : null;
};

/**
 * ກວດ token → ແນບ req.user = { user_id, username, role, ... } (ບໍ່ມີ password)
 */
export const auth = async (req, res, next) => {
    const token = readBearerToken(req);
    if (!token) return resError(res, 401, EMessage.Unauthorized, "Missing Bearer token");

    let user;
    try {
        user = await VerifyToken(token);
    } catch (error) {
        return resError(res, 401, EMessage.Unauthorized, error?.name || String(error));
    }

    if (!user.active) return resError(res, 403, EMessage.AccountDisabled);

    const { password, ...safeUser } = user;
    req.user = safeUser;
    return next();
};

/**
 * ກວດສິດຕາມຕາຕະລາງ PERMISSIONS: authorize("product", "create")
 * ຕ້ອງໃຊ້ຕໍ່ຈາກ auth ສະເໝີ
 */
export const authorize = (resource, action) => (req, res, next) => {
    const role = req.user?.role;
    if (!role) return resError(res, 401, EMessage.Unauthorized);
    if (!can(role, resource, action)) {
        return resError(res, 403, EMessage.Forbidden, `role "${role}" ບໍ່ມີສິດ ${action} ${resource}`);
    }
    return next();
};

/** ໃຊ້ໃນ router: guard(Resource.product, Action.read) → [auth, authorize(...)] */
export const guard = (resource, action) => [auth, authorize(resource, action)];
