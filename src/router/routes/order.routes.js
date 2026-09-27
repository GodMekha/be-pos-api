import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import OrderController from "../../controller/user/Order.js";
import OrderDetailController from "../../controller/user/OrderDetail.js";

const router = Router();
const order = (action) => guard(Resource.order, action);
const detail = (action) => guard(Resource.orderDetail, action);

// ---- order ----
router.get("/order/getall", order(Action.read), OrderController.getAll);
router.get("/order/getone/:order_id", order(Action.read), OrderController.getOne);
router.get("/order/getby", order(Action.read), OrderController.getByUser);
router.get("/order/status", order(Action.read), OrderController.getByStatus);
router.post("/order/insert", order(Action.create), OrderController.Insert);
router.put("/order/update/:order_id", order(Action.update), OrderController.Update);
router.put("/order/update/status/:order_id", order(Action.update), OrderController.UpdateStatus);
router.delete("/order/delete/:order_id", order(Action.delete), OrderController.Delete);

// ---- order detail ----
router.get("/order/detail/getall", detail(Action.read), OrderDetailController.getAll);
router.get("/order/detail/getone/:order_id", detail(Action.read), OrderDetailController.getOne);
router.get("/order/detail/getby/:order_id", detail(Action.read), OrderDetailController.getByOrder);
router.post("/order/detail/insert", detail(Action.create), OrderDetailController.Insert);
router.put("/order/detail/update/:ordrd_id", detail(Action.update), OrderDetailController.Update);
router.delete("/order/detail/delete/:ordrd_id", detail(Action.delete), OrderDetailController.Delete);

export default router;
