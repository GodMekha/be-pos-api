import { Router } from "express";
import { guard } from "../../middleware/auth.js";
import { Action, Resource } from "../../config/permissions.js";
import CategoryController from "../../controller/user/Category.js";

const router = Router();
const can = (action) => guard(Resource.category, action);

router.get("/category/getall", can(Action.read), CategoryController.getAll);
router.get("/category/getone/:category_id", can(Action.read), CategoryController.getOne);
router.post("/category/insert", can(Action.create), CategoryController.Insert);
router.put("/category/update/:category_id", can(Action.update), CategoryController.UpdateCategory);
router.delete("/category/delete/:category_id", can(Action.delete), CategoryController.DeleteCategory);

export default router;
