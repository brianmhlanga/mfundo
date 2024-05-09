<template>
    <NuxtLayout name="dashboard">
        <div class="block-content container mb-4">
           <div class="">
           <div class="surface-section px-4 py-8 md:px-6 lg:px-8">
               <div class="font-bold text-5xl text-900 mb-5">Exam Creation</div>
               <!--table will come heres-->
               <div class="surface-card p-4  border-round">
                <div class="grid formgrid p-fluid">
                    <div class="field mb-4 col-12">
                    <label for="nickname2" class="font-medium text-900">Exam Name</label>
                    <InputText v-model="exam_name" placeholder="Exam Name e.g History Grade 5" class="w-full md:w-col-12" />
                    </div>
                    <div class="field mb-4 col-12">
                    <label for="nickname2" class="font-medium text-900">Test Time</label>
                    <InputGroup>
                        <InputGroupAddon class="tect">Hours</InputGroupAddon>
                        <InputNumber v-model="hours" :min="0"/>
                        <InputGroupAddon class="tect">Minutes</InputGroupAddon>
                        <InputNumber v-model="minutes" :min="0" :max="59" />
                    </InputGroup>
                    </div>
                    <div class="field mb-4 col-12">
                    <label for="nickname2" class="font-medium text-900">Subject</label>
                        <DropDown v-model="selectedSubject"  optionLabel="name" optionValue="id" :options="subjects" placeholder="Select Subject" class="w-full md:w-14rem" />
                    </div>
                    <div class="mb-4 col-3">
                        <Button @click="createQuestionModal = true" :disabled="!exam_name || !selectedSubject || !hours&&!minutes" class="mb-5" label="Create Question" icon="pi pi-plus" />
                    </div>
                        <Panel class="col-12 mb-5" v-for="(question, index) in questions">
                            <template #header>
                                <div class="flex align-items-center gap-2">
                                    <span class="font-bold">Question {{ index+1 }}</span>
                                </div>
                            </template>
                            <template #footer>
                                <div class="flex flex-wrap align-items-center">
                                    <div v-for="(answer, index) in question?.options" 
                                     class="ml-0 md:ml-2 mt-2 md:mt-0 border-1 p-1 px-2 border-round flex align-items-center font-medium surface-100 text-600 surface-border"
                                     :class="{ 'bg-color': answer === question.multichoice_answer }">
                                        <i class="mr-2">{{ String.fromCharCode(65 + index) }}</i>
                                        <span>{{ answer }}</span>
                                    </div>
                                </div>
                            </template>
                            <template #icons>
                                <button class="p-panel-header-icon p-link mr-2">
                                    <span class="pi pi-pencil"></span>
                                </button>
                                <button @click="deleteQuestion(index)" class="p-panel-header-icon p-link mr-2">
                                    <span class="pi pi-trash"></span>
                                </button>
                            </template>
                            <p v-html="question.question" class="m-0">
                            </p>
                        </Panel>
                        <div class="mb-4 col-3">
                        <Button :disabled="questions.length < 1  || !exam_name || !selectedSubject || !hours&&!minutes" @click="createExam()" class="mb-5" label="Create Exam" icon="pi pi-file" />
                    </div>
                    </div>
                </div>
           </div>
           </div>
           <!---->
       </div>
       <Dialog v-model:visible="createQuestionModal" maximizable modal header="Create Question" :style="{ width: '50rem' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
        <div class="grid formgrid p-fluid">
                    <div class="field mb-4 col-12">
                    <label for="nickname2" class="font-medium text-900">Question</label>
                    <Editor v-model="question"/>
                    </div>
                    <div class="surface-border border-top-1 opacity-50 mb-3 col-12"></div>
                    <div v-if="question_type === 'MultiChoice'" class="field mb-4 col-12 md:col-12">
                    <label for="city2" class="font-medium text-900">Set Up Options</label>
                    <Chips :max="4" v-model="multichoice_options" :allowDuplicate="false">
                        <template #chip="slotProps">
                            <div>
                                <span><span class="innercircle">{{options[multichoice_options.indexOf(slotProps.value)]}}</span> {{slotProps.value}} </span>
                            </div>
                        </template>
                    </Chips>
                    </div>
                    <div v-if="question_type === 'MultiChoice'" class="field mb-4 col-12 md:col-12">
                    <label for="state2" class="font-medium text-900">Required Answer</label>
                    <ListBox v-model="multichoice_answer" :options="multichoice_options" optionLabel=""  style="width:100%" />
                    </div>
                    
                    <div v-if="question_type === 'Yes/No'" class="field mb-4 col-12">
                    <label for="website2" class="font-medium text-900">Required Answer</label>
                    <div class="p-inputgroup">
                        <span class="p-inputgroup-addon">Required Answer</span>
                        <ToggleButton v-model="boolean_answer" onIcon="pi pi-check" offIcon="pi pi-times" class="w-full sm:w-10rem" aria-label="Confirmation" />
                    </div>
                    </div>
                    <div class="mb-4 col-12">
                        <Button @click="pushToQuestions()" :disabled="!multichoice_options || !multichoice_answer " class="mb-5" label="Add Question" icon="pi pi-plus" />
                    </div>
                    
                    <div class="surface-border border-top-1 opacity-50 mb-3 col-12"></div>
                    
                </div>
        </Dialog>
    </NuxtLayout>
 
</template>
<script setup lang="ts">
    import {useRecruitmentStore} from "~/stores/recruitment"
    import { storeToRefs } from "pinia";
    import Quill from "quill";
    import Swal from 'sweetalert2';
    import { useToast } from 'primevue/usetoast';
    import { useManagementStore } from "~/stores/management";
    import { useExamsStore } from "~/stores/exams";

    definePageMeta({
        middleware: "auth"
    });
    const toast = useToast();
    const examsStore = useExamsStore()
    const recruitmentStore = useRecruitmentStore();
    const managementStore = useManagementStore();
    const displayResults = ref(false);
    const createQuestionModal = ref(false);
    const number_of_questions = storeToRefs(recruitmentStore).number_of_questions;
    const number_of_passed_questions = storeToRefs(recruitmentStore).number_of_passed_questions;
    const number_of_unstructured_questions = storeToRefs(recruitmentStore).number_of_unstructured_questions
    const createExamModal = ref(false)
    const displayQuestionaire = ref(false);
    const selectedSubject = ref()
    const exam_name = ref()
    const hours = ref();
    const minutes = ref();
    const menu = ref(null);
    const displayApplication = ref(false);
    const displayQuestionsList = ref(false);
    const openings = storeToRefs(recruitmentStore).jobOpenings;
    const employees = storeToRefs(recruitmentStore).employeeData
    const selectedOpening = storeToRefs(recruitmentStore).selectedOpening
    const date1 = ref();
    const toggle = (event) => {
        menu.value.toggle(event);
    };
    const items = ref([
    {
        label: 'Mark As Best Fit',
        icon: 'pi pi-angle-double-up',
        command: async () => {
            let status = "BestFit"
        }
    },
    {
        label: 'Mark As Not Fit',
        icon: 'pi pi-angle-double-down',
        command: () => {
            toast.add({ severity: 'warn', summary: 'Delete', detail: 'Data Deleted', life: 3000});
        }
    },
    {
        label: 'Mark As Moderate',
        icon: 'pi pi-angle-double-right',
        command: () => {
            toast.add({ severity: 'warn', summary: 'Delete', detail: 'Data Deleted', life: 3000});
        }
    }
]);
    const postId = storeToRefs(recruitmentStore).postId
    const question_type = ref('MultiChoice')
    const question_types = storeToRefs(recruitmentStore).question_types
    const boolean_answer = ref(false)
    const multichoice_answer = ref()
    const multichoice_options = ref()
    const options = storeToRefs(recruitmentStore).options
    const types = storeToRefs(recruitmentStore).types
    const is_editing = ref(false)
    const applicationsList = storeToRefs(recruitmentStore).applicationsList
    const question = ref()
    const questionsList = storeToRefs(recruitmentStore).questionsList
    const score = ref()
    const description = storeToRefs(recruitmentStore).description
    const department = storeToRefs(recruitmentStore).department
    const hiring_manager = storeToRefs(recruitmentStore).hiring_manager
    const deadline = storeToRefs(recruitmentStore).deadline
    const job_type = storeToRefs(recruitmentStore).job_type
    const experience = storeToRefs(recruitmentStore).experience
    const salary = storeToRefs(recruitmentStore).salary
    const location = storeToRefs(recruitmentStore).location
    const skills = storeToRefs(recruitmentStore).skills
    const vacancyList = storeToRefs(recruitmentStore).vacancyList
    const subjects = ref()
    const questions = ref([])
  
    onMounted(async ()=>{
        let subjectss = await managementStore.listSubjects().then((result) => {
            console.log(result)
            subjects.value = result?.data?.subjects
        })
    });
    const deleteQuestion = (index) => {
        questions.value.splice(index,1)
        toast.add({ severity: 'success', summary: 'Success', detail: 'Question succesfully removed', life: 3000})
    }

    const test = ({textValue}) => {
        question.value = textValue;
    }
    const openQuestionaire = (arg) => {
            displayQuestionaire.value = true;
    };
    const closeResults = () => {
            displayResults.value = false;
    };
    const openResume = async (arg: String) => {
        let file_url = "./public/uploads/" + arg;
        let pdfBuffer = await recruitmentStore.viewPDF(file_url);

        //Open the pdf in another tab
        const arr = new Uint8Array(pdfBuffer);
        const file = new Blob([arr], { type: 'application/pdf' });
        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
    };
    const openResults = async (applicantId: String,postindId:String) => {
        let results = await recruitmentStore.getResults(applicantId,postindId);
        displayResults.value = true
    };
    const openApplications = async (arg) => {
        let applications = await recruitmentStore.getApplications(arg);
        displayApplication.value = true;
    };
    const closeQuestionaire =  () => {
        displayQuestionaire.value = false;
    };
    const closeApplications =  () => {
        displayApplication.value = false;
    };
    const openQuestionaireList = async (arg) => {
        let questions = await recruitmentStore.getAllQuestions();
        let jobList = await recruitmentStore.getQuestionDetail();
        displayQuestionsList.value = true
       
    }
    const openQuestionEdit = async (arg) => {
        is_editing.value = true
        let question = await recruitmentStore.getSingleQuestion();
        
    }
    const closeQuestionaireList = () => {
        displayQuestionsList.value = false
        is_editing.value = false
    }
    const pushToQuestions = () => {
        let data = {
            question: question.value,
            question_type: question_type.value,
            multichoice_answer: multichoice_answer.value,
            boolean_answer: boolean_answer.value,
            options: multichoice_options.value,
            score: score.value,
        }
        questions.value.push(data)
        question.value = null
        multichoice_answer.value = null
        boolean_answer.value = false
        multichoice_options.value = []
        score.value = null
    }
    const createExam = async () =>{
            let data = {
                examHours: hours.value,
                examMinutes: minutes.value,
                subject: selectedSubject.value,
                examName: exam_name.value,
                questions: questions.value,
            }
            let result = await recruitmentStore.createExam(data);
             if(result.data.success){
                // const loanTypes = await setupStore.getAllLoanTypes();
                    Swal.fire({
                    title: 'Awesome',
                    text: 'Exam Successfully Created',
                    icon: 'success',
                    confirmButtonText: 'Done'})
                hours.value = null,
                minutes.value = null,
                selectedSubject.value = null,
                exam_name.value = null,
                questions.value = [],
                question.value = "",
                question_type.value = "",
                multichoice_answer.value = "",
                boolean_answer.value = false,
                multichoice_options.value = [],
                score.value = ""

                }else{
                   Swal.fire({
                    title: 'Error!',
                    text: result.data.message,
                    icon: 'error',
                    confirmButtonText: 'Try Again'
                    })
                }
        }
        const updateQuestionaire = async () =>{
            let result = await recruitmentStore.updateSingleQuestion();
          
             if(result.data.success){
                      Swal.fire({
                    title: 'Awesome',
                    text: 'Question Successfully Updated',
                    icon: 'success',
                    confirmButtonText: 'Done'})

                question.value = "",
                question_type.value = "",
                multichoice_answer.value = "",
                boolean_answer.value = false,
                multichoice_options.value = [],
                score.value = ""
                is_editing.value = false

                }else{
                   Swal.fire({
                    title: 'Error!',
                    text: result.data.message,
                    icon: 'error',
                    confirmButtonText: 'Try Again'
                    })
                }
        }
</script>
<style>
  span.innercircle {
    border: black;
    padding: 5px ;
    /* border-radius: 32px; */
    width: 25px;
    background-color: black;
    height: 25px;
    color: white;
    text-align: center;
}
.p-listbox .p-listbox-list .p-listbox-item.p-highlight {
    color: #ffffff;
    background: #2ab94d !important;
}
.p-chips .p-chips-multiple-container .p-chips-token {
    padding: 0.375rem 0.75rem;
    margin-bottom: 10px;
    margin-right: 0.5rem;
    background: #d6d6d6;
    color: #495057;
    border-radius: 16px;
}
.p-inputgroup-addon.tect {
    font-size: 10px;
}
.p-inputgroup {
    width: 30%;
}
.bg-color {
    background-color: #26cb16 !important;
    color: white !important;
}
.p-panel-content img {
    height: 210px;
    width: auto;
    margin: auto;
}
</style>
<style scoped>
.p-inputgroup-addon.tect {
    font-size: 10px;
}
.p-inputgroup {
    width: 30%;
}
</style>
