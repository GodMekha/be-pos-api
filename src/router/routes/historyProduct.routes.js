import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import HistoryInProductController from "../../controller/user/HistoryInProduct.js";

const router = Router();
const can = (action) => guard(Resource.historyProduct, action);

router.get("/history/product/getall", can(Action.read), HistoryInProductController.getAll);
router.get("/history/product/getone/:hip_id", can(Action.read), HistoryInProductController.getOne);
router.get("/history/product/getby/:product_id", can(Action.read), HistoryInProductController.getByProduct);
router.post("/history/product/insert", can(Action.create), HistoryInProductController.Insert);
router.put("/history/product/update/:hip_id", can(Action.update), HistoryInProductController.Update);
router.delete("/history/product/delete/:hip_id", can(Action.delete), HistoryInProductController.Delete);

export default router;
