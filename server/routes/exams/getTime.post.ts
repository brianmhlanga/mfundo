import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{
    const {data: {student_id,exam_id}} = await readBody(event);
    const response = {};
    
    try {
        const existing_time =  await prisma.time.findFirst({
            where: {
                student_id,
                exam_id
            }
        })

        response['time'] = existing_time
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
});