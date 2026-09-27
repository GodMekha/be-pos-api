import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import PartController from "../../controller/user/Part.js";

const router = Router();
const can = (action) => guard(Resource.part, action);

router.get("/part/getAll", can(Action.read), PartController.getAll);
router.get("/part/getOne/:id", can(Action.read), PartController.getOne);
router.post("/part/insert", can(Action.create), PartController.Insert);
router.put("/part/update/:id", can(Action.update), PartController.Update);
router.delete("/part/delete/:id", can(Action.delete), PartController.Delete);

export default router;
