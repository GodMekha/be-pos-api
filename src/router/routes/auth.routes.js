import { Router } from "express";
import AuthController from "../../controller/user/Auth.js";
import { auth, guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";

const router = Router();
const { read, create, update } = Action;

// ສາທາລະນະ
router.post("/auth/login", AuthController.Login);
router.post("/auth/register", AuthController.Register); // ໄດ້ role general (ບໍ່ມີສິດ)

// ບັນຊີຕົວເອງ — ພຽງແຕ່ login
router.get("/auth/me", auth, AuthController.Me);
router.put("/auth/changePassword", auth, AuthController.ChangePassword);
router.delete("/auth/delete", auth, AuthController.DeleteUser);

// ຈັດການຜູ້ໃຊ້ — super_admin, admin
router.get("/auth/getall", guard(Resource.user, read), AuthController.getAll);
router.get("/auth/getone/:user_id", guard(Resource.user, read), AuthController.getOne);
router.post("/auth/users", guard(Resource.user, create), AuthController.CreateUser);
router.put("/auth/update/:user_id", guard(Resource.user, update), AuthController.UpdateUser);
router.put("/auth/update/active/:user_id", guard(Resource.user, update), AuthController.UpdateActive);
router.put("/auth/reset-password/:user_id", guard(Resource.user, update), AuthController.ResetPassword);
router.delete("/auth/delete/:user_id", guard(Resource.user, Action.delete), AuthController.DeleteUserById);

// ກຳນົດສິດ — super_admin ເທົ່ານັ້ນ
router.get("/auth/roles", guard(Resource.role, read), AuthController.getRoles);
router.put("/auth/role/:user_id", guard(Resource.role, update), AuthController.UpdateRole);

export default router;
