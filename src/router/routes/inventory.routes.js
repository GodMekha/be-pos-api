import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import InventoryController from "../../controller/user/Inventory.js";

const router = Router();
const can = (action) => guard(Resource.inventory, action);

router.get("/inventory/getall", can(Action.read), InventoryController.getAll);
router.get("/inventory/getone/:inventory_id", can(Action.read), InventoryController.getOne);
router.post("/inventory/insert", can(Action.create), InventoryController.Insert);
router.put("/inventory/update/:inventory_id", can(Action.update), InventoryController.Update);
router.delete("/inventory/delete/:inventory_id", can(Action.delete), InventoryController.Delete);

export default router;
