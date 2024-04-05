const { PrismaClient } = require('@prisma/client');
const argon2 = require('argon2');
const prisma = new PrismaClient();

const load = async () => {
    try {
        //Hash password
        const password = "password";
        const hash = await argon2.hash(password);

        await prisma.student.upsert({
            where: {
                email: "admin@mfundo.com"
            },
            create: {
                first_name: "John",
                last_name: "Doe",
                email: "admin@mfundo.com",
                phone: "07796695858",
                profile: "ADMIN",
                password: hash
            },
            update: {
                first_name: "John",
                last_name: "Doe",
                email: "admin@mfundo.com",
                phone: "07796695885",
                profile: "ADMIN",
                password: hash
            }
        });

        console.log("Added user data");

    } catch (e) {
        console.error(e);
        process.exit(1);
    } finally {
        await prisma.$disconnect();
    };
}

load();