import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import CustomerController from "../../controller/user/Customer.js";

const router = Router();
const can = (action) => guard(Resource.customer, action);

router.get("/customer/getall", can(Action.read), CustomerController.getAll);
router.get("/customer/getone/:customer_id", can(Action.read), CustomerController.getOne);
router.post("/customer/insert", can(Action.create), CustomerController.Insert);
router.put("/customer/update/:id", can(Action.update), CustomerController.Update);
router.put("/customer/update/active/:id", can(Action.update), CustomerController.UpdateActive);
router.delete("/customer/delete/:id", can(Action.delete), CustomerController.Delete);

export default router;
