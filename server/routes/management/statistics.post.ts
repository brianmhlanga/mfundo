import { prisma } from "~~/prisma/db";


export default defineEventHandler(async (event)=>{

    const { data: {subject_id,subject,description,status}} = await readBody(event);
     
    let response = {};


    try {

 
    const students = await prisma.student.count()
    const subjects = await prisma.subject.count()
    const exams = await prisma.exam.count()
    const questions = await prisma.questionAnswers.count()
    
 
    response['students'] = students
    response['exams'] = exams
    response['questions'] = questions
    response['subjects'] = subjects
    response['success'] = true
 
    } catch(error) {
 
       console.log(error)
       response['success'] = false
       response['message'] = error.toString()
 
   }
 
    return response
 
   
 });