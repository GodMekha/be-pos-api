import prisma from "../config/prisma.js";
import { EMessage } from "./message.js";

export const FindOneUser = async (user_id) => {
    if (!user_id) throw new Error(EMessage.NotFound);
    const data = await prisma.user.findUnique({ where: { user_id } });
    if (!data) throw new Error(EMessage.NotFound);
    return data;
};
