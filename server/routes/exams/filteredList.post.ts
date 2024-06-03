import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{
    const {interests,first} = await readBody(event);
    const response = {};
    try {
        let exa_count = await prisma.exam.count({
            where: {
                subject_id: {
                    in: interests
                }
            }
        })
        console.log("intrestsss",interests)
        const exams =  await prisma.exam.findMany({
            where: {
                subject_id: {
                    in: interests
                }
            },
            include: {
                questions: true,
                subject: {
                    
                }
            },
         skip: first,
         take: 6
        })

        response['exams'] = exams
        response['total'] = exa_count
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
});