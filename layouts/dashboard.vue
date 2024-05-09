<template>
  <div class="block-content">
  <div class="" style="height: 100vh; overflow: hidden;">
    <div class="min-h-screen flex relative lg:static surface-ground">
      <div id="app-sidebar-9" class="h-screen surface-section hidden lg:block flex-shrink-0 absolute lg:static left-0 top-0 z-1 border-right-1 surface-border w-18rem lg:w-7rem select-none">
        <div class="flex flex-column h-full">
          <div class="flex align-items-center justify-content-center flex-shrink-0" style="height: 60px;">
            <img src="/images/mfundo.svg" height="30" alt="logo">
          </div>
          <div class="mt-3">
            <ul class="list-none p-0 m-0">
              <li @click="navigateTo('/admin/dashboard')">
                <a class="flex flex-row lg:flex-column align-items-center cursor-pointer p-3 lg:justify-content-center text-cyan-600 border-left-2 border-cyan-600 hover:border-300 transition-duration-150 transition-colors p-ripple" data-pd-ripple="true">
                  <i class="pi pi-home mr-2 lg:mr-0 mb-0 lg:mb-2 text-base lg:text-2xl"></i>
                  <span class="font-medium inline text-base lg:text-xs lg:block">Home</span>
                  <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </a>
              </li>
              <li @click="navigateTo('/admin/subjects')">
                <a class="flex flex-row lg:flex-column align-items-center cursor-pointer p-3 lg:justify-content-center text-600 border-left-2 border-transparent hover:border-300 transition-duration-150 transition-colors p-ripple" data-pd-ripple="true">
                  <i class="pi pi-book mr-2 lg:mr-0 mb-0 lg:mb-2 text-base lg:text-2xl"></i>
                  <span class="font-medium inline text-base lg:text-xs lg:block">Subjects</span>
                 </a>
              </li>
              <li @click="navigateTo('/admin/examCreation')">
                <a class="flex flex-row lg:flex-column align-items-center cursor-pointer p-3 lg:justify-content-center text-600 border-left-2 border-transparent hover:border-300 transition-duration-150 transition-colors p-ripple" data-pd-ripple="true">
                  <i class="pi pi-pencil mr-2 lg:mr-0 mb-0 lg:mb-2 text-base lg:text-2xl"></i>
                  <span class="font-medium inline text-base lg:text-xs lg:block">Create</span>
                 </a>
              </li>
              <li @click="navigateTo('/admin/exams')">
                <a class="flex flex-row lg:flex-column align-items-center cursor-pointer p-3 lg:justify-content-center text-600 border-left-2 border-transparent hover:border-300 transition-duration-150 transition-colors p-ripple" data-pd-ripple="true">
                  <i class="pi pi-server mr-2 lg:mr-0 mb-0 lg:mb-2 text-base lg:text-2xl"></i>
                  <span class="font-medium inline text-base lg:text-xs lg:block">Exams</span>
                 </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="min-h-screen flex flex-column relative flex-auto">
        <div class="flex justify-content-between align-items-center px-5 surface-section relative topdashnav lg:static border-bottom-1 surface-border" style="height: 60px;">
          <div class="flex">
            <a class="cursor-pointer block lg:hidden text-700 mr-3 mt-1 p-ripple" data-pd-ripple="true" data-pd-styleclass="true">
              <i class="pi pi-bars text-4xl"></i>
              <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
            </a>
          </div>
          <a class="cursor-pointer block lg:hidden text-700 p-ripple" data-pd-ripple="true" data-pd-styleclass="true">
            <i class="pi pi-ellipsis-v text-2xl"></i>
            <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
          </a>
          <SplitButton label="Actions" :model="items"></SplitButton>
        </div>
        
        <div class="p-5 flex flex-column flex-auto">
          <slot />
          
        </div>
      </div>
    </div>
  </div>
  <!---->
</div>
</template>
<script lang="ts" setup>
import { useToast } from 'primevue/usetoast';
import { useAuthStore } from '~/stores/auth';
import { useExamsStore } from '~/stores/exams';
const toast = useToast()
const exams = ref()
let examsStore = useExamsStore()
let authStore = useAuthStore()
const id = ref()
const items = ref([
    {
        label: 'Log Out',
        icon: 'pi pi-sign-out',
        command: () => {
            logOut();
        }
    }
])
const logOut = () => {
    let result = authStore.logout()
}
</script>
<style>
  .p-5.flex.flex-column.flex-auto {
    height: 300px;
    overflow-y: scroll;
    /* border: 1px solid #ccc; */
    padding: 10px;
  }
  .topdashnav {
    background-image: linear-gradient(90deg, #3ec3ab, #634bff) !important;
}
</style>