import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import HistoryInInventoryController from "../../controller/user/HistoryInInventory.js";

const router = Router();
const can = (action) => guard(Resource.historyInventory, action);

router.get("/history/inventory/getall", can(Action.read), HistoryInInventoryController.getAll);
router.get("/history/inventory/getone/:history_id", can(Action.read), HistoryInInventoryController.getOne);
router.post("/history/inventory/insert", can(Action.create), HistoryInInventoryController.Insert);
router.put("/history/inventory/update/:id", can(Action.update), HistoryInInventoryController.Update);
router.put("/history/inventory/update/active/:id", can(Action.update), HistoryInInventoryController.UpdateActive);
router.delete("/history/inventory/delete/:id", can(Action.delete), HistoryInInventoryController.Delete);

export default router;
