import { prisma } from "~~/prisma/db";



export default defineEventHandler(async (event)=>{
    const {data: {questionList}  } = await readBody(event);
    const response = {};
    const renameIdToQuestionId = (array) => {
        return array.map(obj => {
            return {
                ...obj,
                question_id: obj.id,
                id: undefined
            };
        });
    }
    try {
        const deleteAll = await prisma.questionAnswers.deleteMany({
            where: {
                student_id: questionList[0].student_id,
                exam_id: questionList[0].exam_id
            }
        });
        const createQuestionaire = await prisma.questionAnswers.createMany({
            data: await renameIdToQuestionId(questionList),
        })
        const total = await prisma.questionAnswers.count({
            where: {
                student_id: questionList[0].student_id,
                exam_id: questionList[0].exam_id
            }
        })
        const result = await prisma.questionAnswers.count({
            where: {
                student_id: questionList[0].student_id,
                exam_id: questionList[0].exam_id,
                correct: true
            }
        })
        response['created'] = createQuestionaire,
        response['total'] = total,
        response['correct'] = result
        response['success'] = true
    } catch (error) {
        response['success'] = false
        response['message'] = error.toString()
    }

    return response;
})
    