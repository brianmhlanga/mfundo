import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{
    const {data: {id}} = await readBody(event);
    const response = {};
    
    try {
        const exam =  await prisma.student.findMany({

            include: {
                answers: {
                    where: {
                        exam_id: id
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