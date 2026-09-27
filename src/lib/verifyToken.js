import jwt from "jsonwebtoken";
import { EMessage } from "../service/message.js";
import { SECREAT_KEY, SECREAT_KEY_REFRESH } from "../config/globalKey.js";
import prisma from "../config/prisma.js";

const verifyWith = async (token, secret) => {
    const decoded = jwt.verify(token, secret); // throw ຖ້າ token ຜິດ/ໝົດອາຍຸ
    // ກັນ payload ທີ່ບໍ່ມີ id: prisma ຈະຕີຄວາມ where { user_id: undefined } ເປັນ "ບໍ່ກອງ" ແລ້ວສົ່ງ user ຄົນທຳອິດ
    if (!decoded?.id) throw new jwt.JsonWebTokenError("invalid payload");
    const user = await prisma.user.findUnique({ where: { user_id: decoded.id } });
    if (!user) throw new Error(EMessage.NotFound);
    return user;
};

export const VerifyToken = (token) => verifyWith(token, SECREAT_KEY);
export const VerifyRefreshToken = (refreshToken) => verifyWith(refreshToken, SECREAT_KEY_REFRESH);
