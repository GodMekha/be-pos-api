# api-pos — ການແບ່ງສິດເຂົ້າໃຊ້ (RBAC)

## ສິດຂອງແຕ່ລະ role

| ໂມດູນ | super_admin | admin | sell | staff |
|---|:-:|:-:|:-:|:-:|
| ກຳນົດສິດ (role) | ✅ | ❌ | ❌ | ❌ |
| ຜູ້ໃຊ້ (user) | ✅ | ✅ ¹ | 👁 | ❌ |
| ອໍເດີ / ລາຍລະອຽດອໍເດີ | ✅ | ✅ | ✅ | ❌ |
| ການຂາຍ / ລາຍລະອຽດການຂາຍ | ✅ | ✅ | ✅ | ❌ |
| ລູກຄ້າ | ✅ | ✅ | ✅ | ❌ |
| ສາງ / ວັດຖຸດິບ (inventory) | ✅ | ✅ | ❌ | ✅ |
| ປະຫວັດເຂົ້າສາງ | ✅ | ✅ | ❌ | ✅ |
| ປະຫວັດນຳເຂົ້າສິນຄ້າ | ✅ | ✅ | ❌ | ✅ |
| ສິນຄ້າ / ໝວດໝູ່ | ✅ | ✅ | 👁 | 👁 |
| ແພັກເກັດ / ອຸປະກອນ | ✅ | ✅ | 👁 | ❌ |
| ຜູ້ສະໜອງ / ການສັ່ງຊື້ເຂົ້າ (purchase) | ✅ | ✅ | ❌ | 👁 |

✅ = ເບິ່ງ/ເພີ່ມ/ແກ້/ລຶບ · 👁 = ເບິ່ງຢ່າງດຽວ · ❌ = ບໍ່ມີສິດ (API ຕອບ 403)
¹ admin ຈັດການໄດ້ສະເພາະຜູ້ໃຊ້ທີ່ສິດຕ່ຳກວ່າ (sell / staff / general) ແລະ ກຳນົດ role ບໍ່ໄດ້

`general` = ຜູ້ທີ່ລົງທະບຽນເອງ — ບໍ່ມີສິດຫຍັງຈົນກວ່າ super_admin ຈະກຳນົດ role ໃຫ້.

**ແກ້ສິດທັງລະບົບຢູ່ໄຟລ໌ດຽວ:** `src/config/permissions.js` (frontend ໄດ້ຮັບຕາຕະລາງສິດຈາກ API ຕອນ login ແລະ `/auth/me` ຈຶ່ງບໍ່ຕ້ອງແກ້ຢູ່ POS).

## ຕິດຕັ້ງຄັ້ງທຳອິດ

```bash
cp .env.example .env
npm install
npx prisma migrate deploy
# ສ້າງ super_admin ຄົນທຳອິດ (ຫຼື ຍົກລະດັບເບີໂທທີ່ມີຢູ່ແລ້ວ)
npm run create:super-admin -- 2055555555 mypassword "ຊື່ Admin"
npm start
```

ບໍ່ຕ້ອງ migrate database ເພີ່ມ — `role` ເປັນ String ຢູ່ແລ້ວ.

## ໂຄງສ້າງ

```
src/
├─ config/permissions.js     Role, Resource, Action, PERMISSIONS, can(), canManageUser()
├─ middleware/auth.js        auth (ກວດ token) · authorize(resource, action) · guard() = [auth, authorize]
├─ router/
│   ├─ index.js              ລວມທຸກ route
│   └─ routes/*.routes.js    1 ໄຟລ໌ ຕໍ່ 1 ໂມດູນ
└─ controller/user/Auth.js   login/register/me + ຈັດການຜູ້ໃຊ້ + ກຳນົດສິດ
```

ຕົວຢ່າງ route:

```js
const can = (action) => guard(Resource.product, action);
router.get("/product/getAll", can(Action.read), ProductController.getAll);
router.post("/product/insert", can(Action.create), ProductController.Insert);
```

## Endpoint ໃໝ່ / ປ່ຽນແປງ

| Method | Path | ສິດ |
|---|---|---|
| GET | `/auth/me` | login ແລ້ວ — ສົ່ງ user + role + permissions |
| POST | `/auth/users` | user:create — `role` ໃສ່ໄດ້ສະເພາະ super_admin |
| PUT | `/auth/update/:user_id` | user:update (ປ່ຽນຊື່) |
| PUT | `/auth/update/active/:user_id` | user:update (ເປີດ/ປິດບັນຊີ) |
| PUT | `/auth/reset-password/:user_id` | user:update (ຕັ້ງລະຫັດໃໝ່ໃຫ້ຜູ້ອື່ນ) |
| DELETE | `/auth/delete/:user_id` | user:delete |
| GET | `/auth/roles` | role:read — ຕາຕະລາງສິດທັງໝົດ |
| PUT | `/auth/role/:user_id` | role:update — body `{ role }` |
| ~~POST~~ | ~~`/auth/forgot`~~ | **ລຶບອອກ** (ໃຜກໍ reset ລະຫັດຂອງ super_admin ໄດ້) → ໃຊ້ reset-password ແທນ |

HTTP status: `401` = ບໍ່ມີ/token ຜິດ · `403` = ມີ token ແຕ່ບໍ່ມີສິດ ຫຼື ບັນຊີຖືກປິດ.
