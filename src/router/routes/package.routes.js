import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import PackageController from "../../controller/user/Package.js";

const router = Router();
const can = (action) => guard(Resource.package, action);

router.get("/package/getAll", can(Action.read), PackageController.getAll);
router.get("/package/getOne/:id", can(Action.read), PackageController.getOne);
router.post("/package/insert", can(Action.create), PackageController.Insert);
router.put("/package/update/:id", can(Action.update), PackageController.Update);
router.put("/package/update/status/:id", can(Action.update), PackageController.UpdateActive);
router.delete("/package/delete/:id", can(Action.delete), PackageController.Delete);

export default router;
