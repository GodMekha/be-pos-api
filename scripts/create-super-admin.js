/**
 * ສ້າງ / ຍົກລະດັບ super_admin ຄົນທຳອິດ (ໃຊ້ຄັ້ງດຽວຕອນຕິດຕັ້ງ)
 *
 *   npm run create:super-admin -- <phoneNumber> [password] [username]
 *
 * - ຖ້າເບີໂທນີ້ມີແລ້ວ → ປ່ຽນ role ເປັນ super_admin (ແລະ ເປີດໃຊ້ງານ)
 * - ຖ້າຍັງບໍ່ມີ → ສ້າງໃໝ່ (ຕ້ອງໃສ່ password)
 */
import prisma from "../src/config/prisma.js";
import { HashEncrypt } from "../src/lib/hash.js";
import { Role } from "../src/config/permissions.js";

const [phoneArg, password, username = "Super Admin"] = process.argv.slice(2);
const phoneNumber = parseInt(phoneArg);

const main = async () => {
    if (!phoneNumber) throw new Error("usage: npm run create:super-admin -- <phoneNumber> [password] [username]");

    const existing = await prisma.user.findFirst({ where: { phoneNumber } });
    if (existing) {
        await prisma.user.update({
            where: { user_id: existing.user_id },
            data: { role: Role.super_admin, active: true },
        });
        console.log(`✔ ${existing.username} (${phoneNumber}) → super_admin`);
        return;
    }

    if (!password) throw new Error("ບໍ່ພົບເບີໂທນີ້ — ກະລຸນາໃສ່ password ເພື່ອສ້າງບັນຊີໃໝ່");
    await prisma.user.create({
        data: { username, phoneNumber, password: await HashEncrypt(password), role: Role.super_admin },
    });
    console.log(`✔ ສ້າງ super_admin ໃໝ່: ${username} (${phoneNumber})`);
};

main()
    .catch((error) => {
        console.error("✖", error.message);
        process.exitCode = 1;
    })
    .finally(() => prisma.$disconnect());
