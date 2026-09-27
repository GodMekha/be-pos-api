import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import SellController from "../../controller/user/Sell.js";
import SellDetailController from "../../controller/user/SellDetail.js";

const router = Router();
const sell = (action) => guard(Resource.sell, action);
const detail = (action) => guard(Resource.sellDetail, action);

// ---- sell ----
router.get("/sell/getAll", sell(Action.read), SellController.getAll);
router.get("/sell/getBy/customer/:id", sell(Action.read), SellController.getByCustomer);
router.get("/sell/getBy/package/:id", sell(Action.read), SellController.getByPackage);
router.get("/sell/getOne/:id", sell(Action.read), SellController.getOne);
router.post("/sell/insert", sell(Action.create), SellController.Insert);
router.put("/sell/update/:id", sell(Action.update), SellController.Update);
router.put("/sell/update/status/:id", sell(Action.update), SellController.UpdateStatus);
router.delete("/sell/delete/:id", sell(Action.delete), SellController.Delete);

// ---- sell detail ----
router.get("/sell/detail/getAll", detail(Action.read), SellDetailController.getAll);
router.get("/sell/detail/getBy/sell/detail/:id", detail(Action.read), SellDetailController.getBySell);
router.get("/sell/detail/getBy/part/:id", detail(Action.read), SellDetailController.getByPart);
router.get("/sell/detail/getOne/:id", detail(Action.read), SellDetailController.getOne);
router.post("/sell/detail/insert", detail(Action.create), SellDetailController.Insert);
router.put("/sell/detail/update/:id", detail(Action.update), SellDetailController.Update);
router.delete("/sell/detail/delete/:id", detail(Action.delete), SellDetailController.Delete);

export default router;
