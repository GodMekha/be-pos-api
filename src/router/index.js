/**
 * ລວມທຸກ route — ທຸກ endpoint (ຍົກເວັ້ນ login/register) ຜ່ານ guard(resource, action)
 * ເຊິ່ງກວດ token (auth) ແລະ ສິດ (authorize) ຕາມ config/permissions.js
 */
import { Router } from "express";
import authRoutes from "./routes/auth.routes.js";
import categoryRoutes from "./routes/category.routes.js";
import customerRoutes from "./routes/customer.routes.js";
import historyInventoryRoutes from "./routes/historyInventory.routes.js";
import historyProductRoutes from "./routes/historyProduct.routes.js";
import inventoryRoutes from "./routes/inventory.routes.js";
import orderRoutes from "./routes/order.routes.js";
import packageRoutes from "./routes/package.routes.js";
import partRoutes from "./routes/part.routes.js";
import productRoutes from "./routes/product.routes.js";
import purchaseRoutes from "./routes/purchase.routes.js";
import sellRoutes from "./routes/sell.routes.js";
import supplyRoutes from "./routes/supply.routes.js";

const router = Router();

[
    authRoutes,
    categoryRoutes,
    customerRoutes,
    historyInventoryRoutes,
    historyProductRoutes,
    inventoryRoutes,
    orderRoutes,
    packageRoutes,
    partRoutes,
    productRoutes,
    purchaseRoutes,
    sellRoutes,
    supplyRoutes,
].forEach((routes) => router.use(routes));

export default router;
