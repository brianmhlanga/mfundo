<template>
    <NuxtLayout name="dashboard">
       <div class="block-content">
           <div class="">
           <div class="surface-section px-4 py-8 md:px-6 lg:px-8">
               <div class="font-bold text-5xl text-900 mb-3">Questions</div>
               <Button @click="navigateTo('/admin/exams')" class="mb-5" label="Back"  />
               <!--table will come heres-->
               <div class="surface-card p-4 border-round">
                <Panel class="col-12 mb-5" v-for="(question, index) in exam?.questions">
                            <template #header>
                                <div class="flex align-items-center gap-2">
                                    <span class="font-bold">Question {{ index+1 }}</span>
                                </div>
                            </template>
                            <template #footer>
                                <div class="flex flex-wrap align-items-center">
                                    <div v-for="(answer, index) in question?.options" 
                                     class="ml-0 md:ml-2 mt-2 md:mt-0 border-1 p-1 px-2 border-round flex align-items-center font-medium surface-100 text-600 surface-border"
                                     >
                                        <i class="mr-2">{{ String.fromCharCode(65 + index) }}</i>
                                        <span>{{ answer }}</span>
                                    </div>
                                </div>
                            </template>
                          
                           
                            <template #icons>
                                  
                                <div class="flex flex-wrap align-items-center">
                                    Correct: {{ exam?.questions[index].multichoice_answer }} <br>
                                    Student Answer: {{ exam?.solutions[index].student_multichoice_answer }}
                                </div>
                            </template>
                            <p v-html="question.question" class="m-0">
                            </p>
                        </Panel>
               </div>

           </div>
           </div>
           <Dialog v-model:visible="addSubjectModal" modal header="Add Subject" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
                   <div class="p-dialog-content" data-pc-section="content">
                   <form class="flex flex-column gap-3 mt-3">
                       <div class="flex gap-3">
                       <div class="w-full">
                           <label for="cvc" class="block mb-1 text-color text-base">Subject Name</label>
                           <input v-model="subject" class="p-inputtext p-component w-full" data-pc-name="inputtext" data-pc-section="root" name="cvc" type="text" id="cvc">
                       </div>
                       <div class="w-full">
                           <label for="expiration" class="block mb-1 text-color text-base">Description</label>
                           <Textarea v-model="description" rows="5" cols="30" />
                       </div>
                       </div>
                   </form>
                   </div>
                   <div class="p-dialog-footer" data-pc-section="footer">
                   <div class="border-top-1 surface-border pt-3 flex">
                       <Button icon="pi pi-times" label="Cancel" class="p-button p-component p-button-outlined w-6 mr-2" /> 
                       <Button :disabled="!subject || !description" icon="pi pi-check" class="p-button p-component w-6 ml-2" @click="addSubject()" label="Save"/> 
                   </div>
                   </div>
               </Dialog>
               <Dialog v-model:visible="editSubjectModal" modal header="Edit Subject" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
                   <div class="p-dialog-content" data-pc-section="content">
                   <form class="flex flex-column gap-3 mt-3">
                       <div class="flex gap-3">
                       <div class="w-full">
                           <label for="cvc" class="block mb-1 text-color text-base">Subject Name</label>
                           <input v-model="subject" class="p-inputtext p-component w-full" data-pc-name="inputtext" data-pc-section="root" name="cvc" type="text" id="cvc">
                       </div>
                       <div class="w-full">
                           <label for="expiration" class="block mb-1 text-color text-base">Description</label>
                           <Textarea v-model="description" rows="5" cols="30" />
                       </div>
                       <div class="w-full">
                           <label for="expiration" class="block mb-1 text-color text-base">Status</label>
                           <Dropdown v-model="selected_status" :options="statuses" />
                       </div>
                       </div>
                   </form>
                   </div>
                   <div class="p-dialog-footer" data-pc-section="footer">
                   <div class="border-top-1 surface-border pt-3 flex">
                       <Button icon="pi pi-times" label="Cancel" class="p-button p-component p-button-outlined w-6 mr-2" /> 
                       <Button :disabled="!subject || !description" icon="pi pi-check" class="p-button p-component w-6 ml-2" @click="updateSubject()" label="Save"/> 
                   </div>
                   </div>
               </Dialog>
           <!---->
       </div>
    </NuxtLayout>
 
</template>
<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useManagementStore } from "~~/stores/management";
import { useToast } from "primevue/usetoast";
import { useExamsStore } from "~/stores/exams";
const toast = useToast()
const managementStore = useManagementStore()
const examStore = useExamsStore()
definePageMeta({
           middleware: "auth"
       });
const addSubjectModal = ref(false)
const editSubjectModal = ref(false)
const subject_id = ref(false)
const exam = ref()
const { params: { examId, userId } } = useRoute();
const subject = ref()
const exams = ref()
const subjects = ref()
const selected_status = ref()
const statuses = ref(["OPEN", "CLOSED"])
const description = ref()
onMounted(async () => {
    let data = {
            id: examId,
            student_id: userId
        }
        let examm = await examStore.reviewExam(data).then(async(result) => {
            exam.value = result?.data?.exam
            // Retrieve saved exams and time from Database
            let data = {
                exam_id: examId,
                student_id: userId
            }
        })
    })
const editSubject = (id,name,descriptionn,statuss) => {
   console.log("dddddddddddddddd",description)
   editSubjectModal.value = true
   subject_id.value = id
   subject.value = name
   description.value = descriptionn
   selected_status.value = statuss
}
const updateSubject = (async () => {

   let data = {
       subject_id: subject_id.value,
       subject: subject.value,
       description: description.value,
       status: selected_status.value,
   }
   let result = await managementStore.updateSubject(data).then( async (data) => {
       if(data?.data.success) {
       let all_subjects = await managementStore.listSubjects().then((data) => {
        subjects.value = data?.data?.subjects
       }) 
       toast.add({ severity: 'info', summary: 'Success', detail: "Updated Subject", life: 3000 });
       editSubjectModal.value = false
       subject.value = null,
       description.value = null,
       subject_id.value = null
      }
      else{

       toast.add({ severity: 'error', summary: 'Failed to update subject', detail: data.data.message, life: 3000 });
       }
   })

})
//functions
const addSubject = async () => {
   let data = {
       subject: subject.value,
       description: description.value
   }
   let result = await managementStore.addSubject(data).then( async(data) => {
       if(data.data.success) {
       let all_subjects = await managementStore.listSubjects().then((data) => {
        subjects.value = data?.data?.subjects
       }) 
       toast.add({ severity: 'info', summary: 'Success', detail: "Added Subject", life: 3000 });
       addSubjectModal.value = false
       subject.value = null,
       description.value = null,
       subject_id.value = null
      }
      else{

       toast.add({ severity: 'error', summary: 'Failed to create subject', detail: data.data.message, life: 3000 });
       }
   })
 
}
</script>
<style>
span.bg-green {
    background-color: #2eca7f;
    padding: 2px;
    border-radius: 3px;
    color: white;
}
span.bg-red {
    background-color: red;
    padding: 2px;
    border-radius: 3px;
    color: white;
}
.bg-red {
    background-color: red !important;
    color: white !important;
}
</style>