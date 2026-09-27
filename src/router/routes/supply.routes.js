import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import SupplyController from "../../controller/user/Supply.js";

const router = Router();
const can = (action) => guard(Resource.supply, action);

router.get("/supply/getAll", can(Action.read), SupplyController.getAll);
router.get("/supply/getOne/:supply_id", can(Action.read), SupplyController.getOne);
router.post("/supply/insert", can(Action.create), SupplyController.Insert);
router.put("/supply/update/:supply_id", can(Action.update), SupplyController.Update);
router.put("/supply/update/active/:supply_id", can(Action.update), SupplyController.UpdateActive);
router.delete("/supply/delete/:supply_id", can(Action.delete), SupplyController.Delete);

export default router;
