import { prisma } from "~~/prisma/db";


export default defineEventHandler(async (event)=>{

    const { data: {subject_id,subject,description,status}} = await readBody(event);
     
    let response = {};


    try {

 
    const updateSubject = await prisma.subject.update({
     
     data: {
        name: subject,
        description,
        status
        
     },
     where: {
        id: subject_id
     }
     
    })
    
 
    response['profile'] = updateSubject
    response['success'] = true
 
    } catch(error) {
 
       console.log(error)
       response['success'] = false
       response['message'] = error.toString()
 
   }
 
    return response
 
   
 });