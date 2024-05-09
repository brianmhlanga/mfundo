import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{
    const {data: {id,student_id}} = await readBody(event);
    const response = {};
    
    try {
        const exam =  await prisma.exam.findUnique({
            where: {
                id
            },
            include: {
                questions: true,
                subject: true,
                solutions: {
                    where: {
                        student_id: student_id
                    }
                }
            }
        })

        response['exam'] = exam
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
});