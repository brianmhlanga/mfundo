import { prisma } from "~~/prisma/db";

export default defineEventHandler(async (event) => {
    const { data: { hours, minutes, seconds, exam_id, student_id } } = await readBody(event);
    const response = {};
    
    try { 
        const findId = await prisma.time.findFirst({
            where: {
                student_id,
                exam_id
            }
        })
        const upsertTime = await prisma.time.upsert({
            update: {
                hours,
                minutes,
                seconds
            },
            create: {
                hours,
                minutes,
                seconds,
                exam_id,
                student_id
            },
            where: {
                id: findId === null ? "0" : findId.id
            }
        });

        response['post'] = upsertTime;
        response['success'] = true;
    } catch (error) {
        response['success'] = false;
        response['message'] = error.toString();
    }

    return response;
});
