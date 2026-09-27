import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import PurchaseController from "../../controller/user/Purchase.js";
import PurchaseDetailController from "../../controller/user/PurchaseDetail.js";

const router = Router();
const purchase = (action) => guard(Resource.purchase, action);
const detail = (action) => guard(Resource.purchaseDetail, action);

// ---- purchase ----
router.get("/purchase/getAll", purchase(Action.read), PurchaseController.getAll);
router.get("/purchase/getBy/:supply_id", purchase(Action.read), PurchaseController.getBySupply);
router.get("/purchase/getOne/:purchase_id", purchase(Action.read), PurchaseController.getOne);
router.post("/purchase/insert", purchase(Action.create), PurchaseController.Insert);
router.put("/purchase/update/:purchase_id", purchase(Action.update), PurchaseController.Update);
router.put("/purchase/update/status/:purchase_id", purchase(Action.update), PurchaseController.UpdateStatus);
router.delete("/purchase/delete/:purchase_id", purchase(Action.delete), PurchaseController.Delete);

// ---- purchase detail ----
router.get("/purchase/detail/getAll", detail(Action.read), PurchaseDetailController.getAll);
router.get("/purchase/detail/getBy/:purchase_id", detail(Action.read), PurchaseDetailController.getByPurchase);
router.get("/purchase/detail/getOne/:pd_id", detail(Action.read), PurchaseDetailController.getOne);
router.post("/purchase/detail/insert", detail(Action.create), PurchaseDetailController.Insert);
router.put("/purchase/detail/update/:pd_id", detail(Action.update), PurchaseDetailController.Update);
router.put("/purchase/detail/update/status/:pd_id", detail(Action.update), PurchaseDetailController.UpdateStatus);
router.delete("/purchase/detail/delete/:pd_id", detail(Action.delete), PurchaseDetailController.Delete);

export default router;
