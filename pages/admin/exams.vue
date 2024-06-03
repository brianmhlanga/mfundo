<template>
    <NuxtLayout name="dashboard">
       <div class="block-content">
           <div class="">
           <div class="surface-section px-4 py-8 md:px-6 lg:px-8">
               <div class="font-bold text-5xl text-900 mb-3">Exams</div>
               <Button @click="navigateTo('/admin/examCreation')" class="mb-5" label="Create Exam" icon="pi pi-plus" />
               <!--table will come heres-->
               <div class="surface-card p-4 border-round">
                   <DataTable :value="exams">
               <template #header>
                   <div class="flex flex-wrap align-items-center justify-content-between gap-2">
                       <span class="text-xl text-900 font-bold">List of Exams</span>
                   </div>
               </template>
               <Column  header="Name">
                   <template #body="slotProps">
                       {{ slotProps.data.exam_name }}
                   </template>
               </Column>
               <Column  header="Exam Time">
                   <template #body="slotProps">
                       {{ slotProps.data.exam_hours }} Hour/s and {{ slotProps.data.exam_minutes }} Minutes
                   </template>
               </Column>
               <Column  header="Subjects">
                   <template #body="slotProps">
                       {{ slotProps.data.subject?.name }}
                   </template>
               </Column>
               <Column  header="Number of Questions">
                   <template #body="slotProps">
                       {{ slotProps.data.questions ? slotProps.data.questions.length : 0 }}
                   </template>
               </Column>
               <Column  header="Actions">
                   <template #body="slotProps">
                       <SplitButton
                           icon="pi pi-ellipsis-v"
                           :model="[
                               { label: 'View Questions', icon: 'pi pi-fw pi-eye', command: () => navigateTo(`/admin/viewQuestions-${slotProps?.data?.id}`) },
                               { label: 'View Students', icon: 'pi pi-fw pi-users', command: () => navigateTo(`/admin/viewStudents-${slotProps?.data?.id}`) },
          
                           ]"
                       ></SplitButton>
                   </template>
               </Column>
           </DataTable>
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
const subject = ref()
const exams = ref()
const subjects = ref()
const selected_status = ref()
const statuses = ref(["OPEN", "CLOSED"])
const description = ref()
onMounted (async () => {
   let all_subjects = await managementStore.listSubjects().then((data) => {
        subjects.value = data?.data?.subjects
   }) 
   let all_exams = await examStore.getExams().then((data) => {
    exams.value = data?.data?.exams
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