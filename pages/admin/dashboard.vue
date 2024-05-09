<template>
    <NuxtLayout name="dashboard">
        <div class="grid">
  <div class="col-12 md:col-6 lg:col-3">
    <div class="surface-card shadow-2 border-round">
      <div class="p-3 flex align-items-start">
        <img src="/images/student.png" class="mr-2" style="width: 32px; height: 32px;">
        <div>
          <span class="text-700">Students</span>
        </div>
        <div class="p-2 bg-indigo-50 text-indigo-500 border-round ml-auto">{{ students }}</div>
      </div>
      <img src="/images/students.svg" class="w-11 topart">
    </div>
  </div>
  <div class="col-12 md:col-6 lg:col-3">
    <div class="surface-card shadow-2 border-round">
      <div class="p-3 flex align-items-start">
        <img src="/images/examss.png" class="mr-2" style="width: 32px; height: 32px;">
        <div>
          <span class="text-700">Exams</span>
          
        </div>
        <div class="p-2 bg-indigo-50 text-indigo-500 border-round ml-auto">{{ exams }}</div>
      </div>
      <img src="/images/exams.svg" class="w-11 topart2">
    </div>
  </div>
  <div class="col-12 md:col-6 lg:col-3">
    <div class="surface-card shadow-2 border-round">
      <div class="p-3 flex align-items-start">
        <img src="/images/coursess.png" class="mr-2" style="width: 32px; height: 32px;">
        <div>
          <span class="text-700">Subjects</span>
        </div>
        <div class="p-2 bg-indigo-50 text-indigo-500 border-round ml-auto">{{ subjects }}</div>
      </div>
      <img src="/images/subjects.svg" class="w-11 topart3">
    </div>
  </div>
  <div class="col-12 md:col-6 lg:col-3">
    <div class="surface-card shadow-2 border-round">
      <div class="p-3 flex align-items-start">
        <img src="/images/new.png" class="mr-2" style="width: 32px; height: 32px;">
        <div>
          <span class="text-700">Total Questions</span>
        </div>
        <div class="p-2 bg-indigo-50 text-indigo-500 border-round ml-auto">{{ questions }}</div>
      </div>
      <img src="/images/new.svg" class="w-11 topart4">
    </div>
  </div>
</div>
    </NuxtLayout>
  </template>
  
  <script setup lang="ts">
    import { useToast } from "primevue/usetoast";
    import { storeToRefs } from "pinia";
    import {useAdminStore} from "~/stores/admin"
    import { useAuthStore } from '@/stores/auth';
    import moment from "moment";
    import { useManagementStore } from "~/stores/management";
    const adminStore =  useAdminStore()
    const managementStore = useManagementStore()
    const authStore = useAuthStore();
    const applicants = ref()
    definePageMeta({
            middleware: "auth"
    });
    const students = ref()
    const exams = ref()
    const questions = ref()
    const subjects = ref()
    const formatCurrency = (value) => {

    return value.toLocaleString('en-US', { style: 'currency', currency: 'ZWL' });

    };
    onMounted( async() => {
      let stats = await managementStore.getStats().then((data) => {
        console.log("data",data)
        students.value = data?.data.students
        exams.value = data?.data.exams
        questions.value = data?.data.questions
        subjects.value = data?.data.subjects
      })
    })


  
  
   
  
  </script>
  
  <style>
img.topart {
    margin: 11px;
}
img.w-11.topart2 {
    height: 137px;
}
img.w-11.topart3 {
    height: 137px;
}
img.w-11.topart4 {
    height: 136px;
} 
  </style>