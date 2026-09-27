/**
 * =====================================================================
 *  ການແບ່ງສິດເຂົ້າໃຊ້ (RBAC) — ແກ້ສິດທັງລະບົບໄດ້ຢູ່ໄຟລ໌ນີ້ບ່ອນດຽວ
 * =====================================================================
 *  1. super_admin : ເຮັດໄດ້ທຸກຢ່າງ ເຂົ້າເຖິງທຸກຢ່າງ (ລວມທັງກຳນົດສິດ)
 *  2. admin       : ເຮັດໄດ້ທຸກຢ່າງ ຍົກເວັ້ນ ການກຳນົດ/ເພີ່ມສິດເຂົ້າໃຊ້
 *  3. sell        : ສະເພາະວຽກຂາຍ ແລະ ສັ່ງຊື້ຂອງລູກຄ້າ (ອໍເດີ, ການຂາຍ, ລູກຄ້າ)
 *  4. staff       : ສະເພາະວຽກສາງ (ກວດ/ເພີ່ມ/ແກ້/ລຶບ ວັດຖຸດິບ ແລະ ປະຫວັດເຂົ້າສາງ)
 *  -  general     : ຜູ້ໃຊ້ທີ່ລົງທະບຽນໃໝ່ — ຍັງບໍ່ມີສິດ ລໍຖ້າ super_admin ກຳນົດສິດໃຫ້
 */

export const Role = Object.freeze({
    super_admin: "super_admin",
    admin: "admin",
    sell: "sell",
    staff: "staff",
    general: "general",
});

/** ລຳດັບຊັ້ນ: ຕົວເລກສູງ = ສິດສູງ (ໃຊ້ກວດວ່າໃຜຈັດການໃຜໄດ້) */
export const RoleLevel = Object.freeze({
    [Role.super_admin]: 100,
    [Role.admin]: 50,
    [Role.sell]: 10,
    [Role.staff]: 10,
    [Role.general]: 0,
});

export const Action = Object.freeze({
    read: "read",
    create: "create",
    update: "update",
    delete: "delete",
});

/** ໂມດູນ (resource) ຂອງລະບົບ — 1 ໂຕ ຕໍ່ 1 controller + "role" ສຳລັບການກຳນົດສິດ */
export const Resource = Object.freeze({
    user: "user",
    role: "role",
    category: "category",
    customer: "customer",
    historyInventory: "historyInventory",
    historyProduct: "historyProduct",
    inventory: "inventory",
    order: "order",
    orderDetail: "orderDetail",
    package: "package",
    part: "part",
    product: "product",
    purchase: "purchase",
    purchaseDetail: "purchaseDetail",
    sell: "sell",
    sellDetail: "sellDetail",
    supply: "supply",
});

const ALL = Object.values(Action);
const READ_ONLY = [Action.read];

const grant = (resources, actions) => Object.fromEntries(resources.map((r) => [r, actions]));
const everything = (except = []) =>
    grant(Object.values(Resource).filter((r) => !except.includes(r)), ALL);

/** ຕາຕະລາງສິດ: role → { resource: [actions] } */
export const PERMISSIONS = Object.freeze({
    [Role.super_admin]: everything(),

    [Role.admin]: everything([Resource.role]),

    [Role.sell]: {
        ...grant(
            [Resource.order, Resource.orderDetail, Resource.sell, Resource.sellDetail, Resource.customer],
            ALL
        ),
        // ອ່ານຢ່າງດຽວ: ໃຊ້ເລືອກສິນຄ້າ/ແພັກເກັດ/ພະນັກງານ ຕອນຂຽນບິນ
        ...grant(
            [Resource.product, Resource.category, Resource.package, Resource.part, Resource.user],
            READ_ONLY
        ),
    },

    [Role.staff]: {
        ...grant([Resource.inventory, Resource.historyInventory, Resource.historyProduct], ALL),
        // ອ່ານຢ່າງດຽວ: ກວດສິນຄ້າໃນສາງ ແລະ ຂໍ້ມູນຜູ້ສະໜອງ/ການສັ່ງຊື້ເຂົ້າສາງ
        ...grant(
            [Resource.product, Resource.category, Resource.supply, Resource.purchase, Resource.purchaseDetail],
            READ_ONLY
        ),
    },

    [Role.general]: {},
});

export const isValidRole = (role) => Object.values(Role).includes(role);

/** role ນີ້ເຮັດ action ນີ້ກັບ resource ນີ້ໄດ້ບໍ່ */
export const can = (role, resource, action) => Boolean(PERMISSIONS[role]?.[resource]?.includes(action));

/** actor ຈັດການ (ແກ້/ລຶບ/ຣີເຊັດລະຫັດ) target ໄດ້ບໍ່ — ຕ້ອງມີສິດສູງກວ່າ ຫຼື ເປັນ super_admin */
export const canManageUser = (actorRole, targetRole) =>
    actorRole === Role.super_admin || (RoleLevel[actorRole] ?? 0) > (RoleLevel[targetRole] ?? 0);
