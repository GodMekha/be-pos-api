import { SECREAT_KEY, SECREAT_KEY_REFRESH } from "../config/globalKey.js";
import jwt from "jsonwebtoken";

/** ສ້າງ access token (1 ຊົ່ວໂມງ) + refresh token (3 ຊົ່ວໂມງ) ຈາກ user_id */
export const GenerateToken = async (userId) => {
    if (!userId) throw new Error("GenerateToken: userId is required");
    const payload = { id: userId };
    const token = jwt.sign(payload, SECREAT_KEY, { expiresIn: "1h" });
    const refreshToken = jwt.sign(payload, SECREAT_KEY_REFRESH, { expiresIn: "3h" });
    return { token, refreshToken };
};
