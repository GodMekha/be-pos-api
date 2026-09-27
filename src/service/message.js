export const SMessage = { //Success Message
  Register: "Register Success",
  Login: "Login Success",
  Insert: "Insert Success",
  getAll: "Get All Success",
  getOne: "Get One Success",
  getBy: "Get By Success",
  updated: "Updated Success",
  deleted: "Deleted Success",
  search: "Search Success",
  Delete: "Deleted Success",
}
export const EMessage = {
  BadRequest: "Bad Request",
  ErrorServer: "Internal Server Error",
  NotFound: "Not Found",
  Unauthorized: "Unauthorized",
  Uauthorization: "Unauthorized", // ຊື່ເກົ່າ (ສະກົດຜິດ) — ເກັບໄວ້ເພື່ອບໍ່ໃຫ້ໂຄດເກົ່າພັງ
  Forbidden: "Forbidden: ທ່ານບໍ່ມີສິດເຂົ້າໃຊ້ສ່ວນນີ້",
  AccountDisabled: "ບັນຊີຖືກປິດການໃຊ້ງານ",
  CannotManageUser: "ທ່ານບໍ່ມີສິດຈັດການຜູ້ໃຊ້ຄົນນີ້",
  LastSuperAdmin: "ຕ້ອງມີ super_admin ຢ່າງໜ້ອຍ 1 ຄົນ",
  ErrorInsert: "Faild Insert",
  ErrorUpdate: "Faild Updated",
  ErrorDelete: "Faild Deleted",
  isNotMatch: "Is Not Match"
}
// Role ຍ້າຍໄປຢູ່ config/permissions.js (export ຕໍ່ຈາກບ່ອນນີ້ເພື່ອບໍ່ໃຫ້ import ເກົ່າພັງ)
export { Role } from "../config/permissions.js";
export const OrderStatus = {
  await: "await",
  pedding: "pedding",
  success: "success",
  cancel: "cancel",
} 
