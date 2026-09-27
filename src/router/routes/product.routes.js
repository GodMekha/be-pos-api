import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import ProductController from "../../controller/user/Product.js";

const router = Router();
const can = (action) => guard(Resource.product, action);

router.get("/product/getAll", can(Action.read), ProductController.getAll);
router.get("/product/getBy/:category_id", can(Action.read), ProductController.getBy);
router.get("/product/getOne/:product_id", can(Action.read), ProductController.getOne);
router.post("/product/insert", can(Action.create), ProductController.Insert);
router.put("/product/update/:product_id", can(Action.update), ProductController.UpdateProduct);
router.delete("/product/delete/:product_id", can(Action.delete), ProductController.DeleteProduct);

export default router;
