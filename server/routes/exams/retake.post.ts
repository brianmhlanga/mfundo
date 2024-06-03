import { prisma } from "~~/prisma/db";

export default defineEventHandler(async (event)=>{
    const {data: {id,student_id}} = await readBody(event);
    const response = {};
    
    try {
        // Delete solutions where examId and student_id match the provided values
        await prisma.questionAnswers.deleteMany({
            where: {
                exam_id: id,
                student_id: student_id
            }
        });
        await prisma.time.deleteMany({
            where: {
                exam_id: id,
                student_id: student_id
            }
        });

        response['success'] = true
        response['deleted_solutions'] = true
        response['deleted_solutions'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
});
