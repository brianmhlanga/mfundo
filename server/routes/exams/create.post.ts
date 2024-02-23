import { prisma } from "~~/prisma/db";


export default defineEventHandler(async (event)=>{
    const { data: {examName,examHours,examMinutes,subject,questions}  } = await readBody(event);
    const response = {};
    
    try {  
        const createQuestionaire = await prisma.exam.create({
            data: {
                exam_name: examName,
                subject_id: subject,
                exam_hours: examHours,
                exam_minutes: examMinutes,
                questions: {
                    createMany: {
                        data: [
                            ...questions
                        ]
                    }
                }
            },
        })

        response['post'] = createQuestionaire
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
})
    