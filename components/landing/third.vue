<template>
    <div class="surface-section px-4 py-8 md:px-6 lg:px-8">
    <div class="font-bold text-900 text-3xl mb-3 text-center">Key Features to Boost Your Revision</div>
    <div class="flex flex-wrap">
        <div class="w-full lg:w-6 xl:w-3 p-5">
        <img src="https://blocks.primevue.org/images/blocks/feature/feature-illustration-1.svg" alt="Image" class="w-full">
        <div class="mt-3 mb-2 font-medium text-900 text-xl">Independent Exam Creation</div>
        <span class="text-700 line-height-3">Create custom exams tailored to your study needs. Handpick questions from our extensive catalog or add your own.</span>
        <a tabindex="0" class="text-blue-500 font-medium flex align-items-center mt-2">
            <span>Explore</span>
            <i class="pi pi-arrow-right ml-3"></i>
        </a>
        </div>
        <div class="w-full lg:w-6 xl:w-3 p-5">
        <img src="https://blocks.primevue.org/images/blocks/feature/feature-illustration-2.svg" alt="Image" class="w-full">
        <div class="mt-3 mb-2 font-medium text-900 text-xl">Answer Selection</div>
        <span class="text-700 line-height-3">Choose and predetermine your answers. Practice strategic answering and reinforce your knowledge.</span>
        <a tabindex="0" class="text-blue-500 font-medium flex align-items-center mt-2">
            <span>Explore</span>
            <i class="pi pi-arrow-right ml-3"></i>
        </a>
        </div>
        <div class="w-full lg:w-6 xl:w-3 p-5">
        <img src="https://blocks.primevue.org/images/blocks/feature/feature-illustration-3.svg" alt="Image" class="w-full">
        <div class="mt-3 mb-2 font-medium text-900 text-xl">Customizable Time Limits</div>
        <span class="text-700 line-height-3">Set time limits for each exam session. Mimic real exam conditions and improve time management skills.</span>
        <a tabindex="0" class="text-blue-500 font-medium flex align-items-center mt-2">
            <span>Explore</span>
            <i class="pi pi-arrow-right ml-3"></i>
        </a>
        </div>
        <div class="w-full lg:w-6 xl:w-3 p-5">
        <img src="https://blocks.primevue.org//images/blocks/feature/feature-illustration-4.svg" alt="Image" class="w-full">
        <div class="mt-3 mb-2 font-medium text-900 text-xl">Comprehensive Exam Catalog</div>
        <span class="text-700 line-height-3">Explore a vast catalog of exams spanning various subjects and difficulty levels. Find the perfect practice material</span>
        <a tabindex="0" class="text-blue-500 font-medium flex align-items-center mt-2">
            <span>Explore</span>
            <i class="pi pi-arrow-right ml-3"></i>
        </a>
        </div>
        <div class="surface-section px-4 py-8 md:px-6 lg:px-8">
        <div class="text-center text-900 text-5xl font-bold mb-5">Our Exams</div>
        <div class="grid nogutter">
            <div v-for="exam in exams" class="col-12 md:col-6 xl:col-3 p-3">
            <div class="surface-card shadow-2 border-round p-4">
                <div class="flex border-bottom-1 surface-border pb-4">
                <div class="flex flex-column align-items-start">
                    <span class="text-xl text-900 font-medium mb-1">{{ exam?.exam_name }}</span>
                    <span class="text-600 font-medium mb-2">{{ exam?.subject?.name }}</span>
                    <span v-if="exam?.exam_hours <= 0" class="bg-blue-50 text-blue-400 border-round inline-flex py-1 px-2 text-sm">{{ exam?.exam_minutes }} Minutes</span>
                    <span v-else-if="exam?.exam_hours > 0 && exam?.exam_minutes === 0" class="bg-blue-50 text-blue-400 border-round inline-flex py-1 px-2 text-sm">Time ({{ exam?.exam_hours }} hours)</span>
                    <span v-else class="bg-blue-50 text-blue-400 border-round inline-flex py-1 px-2 text-sm">Time ({{ exam?.exam_hours }} hours & {{ exam?.exam_minutes }} minutes)</span>
                </div>
                </div>
                <div class="flex justify-content-between pt-4">
                <button class="p-button p-component p-button-outlined p-button-secondary w-6 mr-2" type="button" aria-label="View" data-pc-name="button" data-pc-section="root" data-pd-ripple="true">
                    <span class="p-button-icon p-button-icon-left pi pi-eye" data-pc-section="icon"></span>
                    <span class="p-button-label" data-pc-section="label">History</span>
                    <!---->
                    <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </button>
                <button @click="navigateTo(`/takeExam-${exam.id}-${id}`)" class="p-button p-component p-button-outlined p-button-secondary w-6 ml-2" type="button" aria-label="Follow" data-pc-name="button" data-pc-section="root" data-pd-ripple="true">
                    <span class="p-button-icon p-button-icon-left pi pi-pencil" data-pc-section="icon"></span>
                    <span class="p-button-label" data-pc-section="label">Exam</span>
                    <!---->
                    <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </button>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
    </div>
</template>
<script lang="ts" setup>
import { useExamsStore } from '~/stores/exams';
const exams = ref()
let examsStore = useExamsStore()
//@ts-ignore
const { value: { first_name, last_name, profile, id }} = useCookie('user');
onMounted( async() => {
    let result = await examsStore.getExams().then((data) => {
      exams.value = data?.data?.exams
    })
})
</script>
<style>
.custom-shadow-2 {
    background-color: #fff;
    border-radius: 20px;
    box-shadow: 0 5px 10px 0 rgba(41,61,102,.2);
    border: 1px solid #e1e8f5;
    padding: 24px 20px;
}
</style>