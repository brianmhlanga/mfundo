import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{

    const response = {};
    
    try {
        const exams =  await prisma.exam.findMany({
            include: {
                questions: true,
                subject: true
            }
        })

        response['exams'] = exams
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
});