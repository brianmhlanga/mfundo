<template>
    <NuxtLayout name="default">
        <div class="block-content">
        <div class="">
            <div>
            <div style="height: 200px; background: url(&quot;https://blocks.primevue.org//images/blocks/pageheading/cover.png&quot;) 0% 0% / cover no-repeat;"></div>
            <div class="px-4 py-5 md:px-6 lg:px-8 surface-section">
                <div class="flex flex-column lg:flex-row lg:align-items-center lg:justify-content-between relative" style="margin-top: -2rem; top: -70px; margin-bottom: -70px;">
                <div>
                    <div class="mb-3 surface-card shadow-2 flex align-items-center justify-content-center" style="width: 140px; height: 140px; border-radius: 10px;">
                    <img src="https://blocks.primevue.org//images/blocks/logos/hyper.svg" alt="Image" width="70" height="70">
                    </div>
                    <div class="text-900 text-3xl font-medium mb-3">{{ exam?.exam_name }}</div>
                    <p class="mt-0 mb-3 text-700 text-xl">Vitae tortor condimentum lacinia quis vel eros.</p>
                    <div class="text-600 font-medium">
                    <span>Time | {{ exam?.exam_hours }} hours | {{ exam?.exam_minutes }} minutes</span>
                    </div>
                </div>
                <div class="mt-3 lg:mt-0">
                    <p>Time left: {{ hours }}h {{ minutes }}m {{ seconds }}s</p>
                </div>
                </div>
            </div>
            </div>
        </div>
        <!---->
        </div>
        <div class="block-content">
        <div class="px-4 py-8 md:px-6 lg:px-8">
            <div class="surface-card p-4 shadow-2 border-round">
            <div class="mb-3 flex flex-column align-items-start md:flex-row md:align-items-center md:justify-content-between">
                <div class="mb-3 md:mb-0">
                <div class="text-3xl font-medium text-900 mb-3">{{ hours }}h {{ minutes }}m {{ seconds }}s</div>
                <div class="font-medium text-500 mb-3">Answer all questions</div>
                </div>
                <button class="p-button p-component" type="button" aria-label="New" data-pc-name="button" data-pc-section="root" data-pd-ripple="true">
                <span class="p-button-icon p-button-icon-left pi pi-plus" data-pc-section="icon"></span>
                <span class="p-button-label" data-pc-section="label">Cancel Exam</span>
                <!---->
                <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </button>
            </div>
            <div class="border-2 border-dashed surface-border" style="min-height: 150px;">
                <Panel class="panelMargin mb-5" v-for="(question, index) in (exam?.questions)" :key="question.id" :header="`Question ${index+1}`">
                <fieldset class="p-fieldset p-component" data-v-f31ebf78="">
                    
                    <div id="pv_id_646_content" class="p-toggleable-content" role="region" aria-labelledby="pv_id_646_header">
                    <div class="p-fieldset-content">
                        <div class="row">
                            <p class="question">Question</p> <p class="question q" v-html="question.question"></p>
                        </div>
                    </div>
                    </div>
                </fieldset>
                <fieldset v-if="question.question_type === 'MultiChoice'" class="p-fieldset p-component" data-v-f31ebf78="">
                    <div id="pv_id_646_content" class="p-toggleable-content" role="region" aria-labelledby="pv_id_646_header">
                    <div class="p-fieldset-content">
                        <div v-for="option in question.options" :key="option.id" class="field-radiobutton">
                            <RadioButton v-model="question.student_multichoice_answer" @change="compareMultichoice(index)" inputId="city1" name="city" :value="option"  />
                            <label for="city1">{{option}}</label>
                        </div>
                    </div>
                    </div>
                </fieldset>
                </Panel>
                <div class="flex justify-content-between pt-3">
                <button class="p-button p-component p-button-outlined p-button-secondary w-6 mr-2" type="button" aria-label="Clear All" data-pc-name="button" data-pc-section="root" data-pd-ripple="true">
                    <!---->
                    <span class="p-button-label" data-pc-section="label">Previous Question</span>
                    <!---->
                    <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </button>
                <button @click="submitSolutions()" class="p-button p-component p-button-outlined w-6 ml-2" type="button" aria-label="New Entry" data-pc-name="button" data-pc-section="root" data-pd-ripple="true">
                    <!---->
                    <span class="p-button-label" data-pc-section="label">Submit Solutions</span>
                    <!---->
                    <span role="presentation" aria-hidden="true" data-p-ink="true" data-p-ink-active="false" class="p-ink" data-pc-name="ripple" data-pc-section="root"></span>
                </button>
                </div>
            </div>
            
            </div>
        </div>
        </div>
        <Dialog v-model:visible="resultModal" modal header="Results" :style="{ width: '50vw' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
            <main>
            <div class="card col-12">
                <div class="card-left">
                    <h4>Your Result</h4>
                    <div class="score">
                        <h1 class="scoreline">{{ pass_percentage }}<sup>%</sup></h1>
                    </div>
                    <div class="score-content">
                        <h2 v-if="pass_percentage < 10">Poor!</h2>
                        <h2 v-if="pass_percentage >= 10 && pass_percentage < 20">Worker Harder, You will be there!</h2>
                        <h2 v-if="pass_percentage >= 20 && pass_percentage < 30">Try again!</h2>
                        <h2 v-if="pass_percentage >= 30 && pass_percentage < 40">Almost There!</h2>
                        <h2 v-if="pass_percentage >= 40 && pass_percentage < 50">Not Bad!</h2>
                        <h2 v-if="pass_percentage >= 50 && pass_percentage < 60">Good!</h2>
                        <h2 v-if="pass_percentage >= 60 && pass_percentage < 70">Really Good!</h2>
                        <h2 v-if="pass_percentage >= 70 && pass_percentage < 80">Well Done!</h2>
                        <h2 v-if="pass_percentage >= 80">Excellent!</h2>
                        <p>You scored higher than 65% of the people who have taken these tests.</p>
                    </div>
                  
                </div>
                <div class="card-right">
                    <a href="#">Continue</a>
                    <!-- <h2>Summary</h2>
                    <ul class="summary-lists">
                        <li>
                            <div class="li-left">
                                <img src="https://rvs-results-summary-component.vercel.app/assets/images/icon-reaction.svg" alt="">
                                <p>Reaction</p>
                            </div>
                            <div class="li-right">
                                <p><b>80</b> / 100</p>
                            </div>
                        </li>
                        <li>
                            <div class="li-left">
                                <img src="https://rvs-results-summary-component.vercel.app/assets/images/icon-memory.svg" alt="">
                                <p>Memory</p>
                            </div>
                            <div class="li-right">
                                <p><b>92</b> / 100</p>
                            </div>
                        </li>
                        <li>
                            <div class="li-left">
                                <img src="https://rvs-results-summary-component.vercel.app/assets/images/icon-verbal.svg" alt="">
                                <p>Verbal</p>
                            </div>
                            <div class="li-right">
                                <p><b>61</b> / 100</p>
                            </div>
                        </li>
                        <li>
                            <div class="li-left">
                                <img src="https://rvs-results-summary-component.vercel.app/assets/images/icon-visual.svg" alt="">
                                <p>Visual</p>
                            </div>
                            <div class="li-right">
                                <p><b>72</b> / 100</p>
                            </div>
                        </li>
                    </ul> -->
                  
                </div>
            </div>
            </main>
        </Dialog>
    </NuxtLayout>
</template>
<script lang="ts" setup>
import { useExamsStore } from '~/stores/exams';
import { useRecruitmentStore } from '~/stores/recruitment';
import { useToast } from 'primevue/usetoast';
import Swal from 'sweetalert2';
const { params: { examId, userId } } = useRoute();
const exam = ref()
const resultModal = ref(false)
const questions = ref()
const hours = ref()
const minutes = ref()
const seconds = ref()
const total_questions = ref()
const correct_questions = ref()
const pass_percentage = ref()
const totalSeconds = ref()
const toast = useToast();
const recruitmentStore = useRecruitmentStore()
const examsStore = useExamsStore()

let startCountdown = async (hrs, mins, secs) => {
    hours.value = hrs;
    minutes.value = mins;
    seconds.value = secs;
    totalSeconds.value = hrs * 3600 + mins * 60 + secs;

    let intervalId = setInterval(async () => {
        totalSeconds.value--;
        if (totalSeconds.value <= 0) {
            clearInterval(intervalId);
            console.log("exam over")
            await submitOnTimeOut()
            return;
        }

        hours.value = Math.floor(totalSeconds.value / 3600);
        minutes.value = Math.floor((totalSeconds.value % 3600) / 60);
        seconds.value = totalSeconds.value % 60;

        // Save time left to localStorage
        let data = {
            hours: hours.value,
            minutes: minutes.value,
            seconds: seconds.value,
            exam_id: examId,
            student_id: userId
        }
        let savedTime = await examsStore.storeTime(data)
    }, 1000);
}


const submitSolutions =  async () => {
            let data = {
                questionList: exam?.value?.questions
            }
            let result =  await examsStore.saveAnswers(data).then((data) => {
                total_questions.value = data?.data?.total
                correct_questions.value = data?.data?.correct
                pass_percentage.value = (((correct_questions.value/total_questions.value)*100).toFixed(2))
                resultModal.value = true
                if(data?.data?.success){
                    toast.add({severity: 'success', summary: 'Success', detail: 'Exam Succesfully Completed', life: 3000});
                    
                }else{
                   Swal.fire({
                    title: 'Error!',
                    text: data?.data?.message,
                    icon: 'error',
                    confirmButtonText: 'Try Again'
                    })
                }
            })
            
};
const submitOnTimeOut =  async () => {
            let data = {
                questionList: await addStudentId(exam?.value?.questions)
            }
            let result =  await examsStore.saveAnswers(data).then((data) => {
                total_questions.value = data?.data?.total
                correct_questions.value = data?.data?.correct
                pass_percentage.value = (((correct_questions.value/total_questions.value)*100).toFixed(2))
                resultModal.value = true
                if(data?.data?.success){
                    toast.add({severity: 'success', summary: 'Success', detail: 'Exam Succesfully Completed', life: 3000});
                }else{
                   Swal.fire({
                    title: 'Error!',
                    text: data?.data?.message,
                    icon: 'error',
                    confirmButtonText: 'Try Again'
                    })
                }
            })
            
};
const  addStudentId = (objects) => {
  return objects.map(obj => {
    obj.student_id = userId;
    return obj;
  });
}

onMounted(async () => {
    let data = {
        id: examId
    }
    let examm = await examsStore.getExam(data).then(async(result) => {
        exam.value = result?.data?.exam
        // Retrieve saved exams and time from Database
        let data = {
            exam_id: examId,
            student_id: userId
        }
        let saved_time = await examsStore.getTime(data).then((result) => {
            
            if(result?.data?.time === null) {
                // assign time from exam time
                startCountdown(exam.value?.exam_hours, exam.value?.exam_minutes, 0);

            } else {
                // assign time from the saved time if user has saved time
                startCountdown(result?.data?.time?.hours, result?.data?.time?.minutes,result?.data?.time?.seconds)
            }
        })
        
    })
})

const compareMultichoice = (index) => {
if (exam.value.questions[index].multichoice_answer === exam.value.questions[index].student_multichoice_answer ){
    // console.log("equal",exam.value.questions[index].multichoice_answer,exam.value.questions[index].student_multichoice_answer)
    exam.value.questions[index].correct = true
    exam.value.questions[index].student_id = userId

} else {
    // console.log("not equal",exam.value.questions[index].multichoice_answer,exam.value.questions[index].student_multichoice_answer)
    exam.value.questions[index].correct = false
    exam.value.questions[index].question_id = exam.value.questions[index].id
    exam.value.questions[index].student_id = userId

}
}


</script>

<style>
.surface-section {
    background-color: #f2f5fb!important;
}
</style>
<style>
/* primary colors */
:root {
    --light-red: hsl(0, 100%, 67%);
    --orange-yellow: hsl(39, 100%, 56%);
    --green-teal: hsl(166, 100%, 37%);
    --cobalt-blue: hsl(234, 85%, 45%);
}

/* gradient colors */
:root {
    --light-slate-blue: hsl(252, 100%, 67%);
    --light-royal-blue: hsl(241, 81%, 54%);
}

:root {
    --violet-blue: hsla(256, 72%, 46%, 1);
    --persian-blue: hsla(241, 72%, 46%, 0);
}

/* neutral colors */
:root {
    --white: hsl(0, 0%, 100%);
    --pale-blue: hsl(221, 100%, 96%);
    --light-lavendar: hsl(241, 100%, 89%);
    --dark-gray-blue: hsl(224, 30%, 27%);
}

/* font size */
:root {
    --font-size: 18px;
}

@font-face {
    font-family: 'Hanken Grotesk';
    src: url('./assets/fonts/HankenGrotesk-VariableFont_wght.ttf') format('truetype'),
         url("./assets/fonts/static/HankenGrotesk-Medium.ttf") format("truetype"),
         url("./assets/fonts/static/HankenGrotesk-Bold.ttf") format("truetype"),
         url("./assets/fonts/static/HankenGrotesk-ExtraBold.ttf") format("truetype");
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}



.cards {
    display: flex;
    flex-direction: column;
    background-color: var(--white);
    border-radius: 0px;
    width: 100%;
}

.card-left {
    background: linear-gradient(to bottom, var(--light-slate-blue) 0% 20%, var(--light-royal-blue));
    border-radius: 15px 15px 15px 15px;
    padding: 30px;
    display: flex;
    flex-direction: column;
    align-items: center;
    row-gap: 20px;
    width: 100%;
}

.card-left h4 {
    color: var(--light-lavendar);
    text-align: center;
    font-size: 20px;
}

.card-left .score 

.card-left .score h1 {
    font-size: 50px;
    color: var(--white);
}

.card-left .score span {
    color: var(--light-lavendar);
}
h1.scoreline {
    font-size: 100px;
    color: white;
}

.card-left .score-content h2 {
    font-size: 30px;
    color: var(--white);
    text-align: center;
}

.card-left .score-content p {
    margin-top: 12px;
    color: var(--light-lavendar);
    text-align: center;
}

.card-right {
    padding: 30px;
    display: flex;
    flex-direction: column;
    row-gap: 20px;
    width: 100%;
}

.card-right h2 {
    color: var(--dark-gray-blue);
}

.card-right ul {
    list-style-type: none;
    display: flex;
    flex-direction: column;
    row-gap: 12px;
}

.card-right ul li {
    display: flex;
    justify-content: space-between;
    padding: 12px;
    border-radius: 5px;
}

.card-right ul li:nth-of-type(1) {
    background: hsla(0, 100%, 67%, .1);
}

.card-right ul li:nth-of-type(2) {
    background: hsla(39, 100%, 56%, .1);
}

.card-right ul li:nth-of-type(3) {
    background: hsla(166, 100%, 37%, .1);
}

.card-right ul li:nth-of-type(4) {
    background: hsla(234, 85%, 45%, .1);
}

.card-right ul li p {
    font-weight: 500;
}

.card-right ul li .li-right p {
    color: var(--light-lavendar);
}

.card-right ul li .li-right p b {
    color: var(--dark-gray-blue);
}

.card-right a {
    background: var(--dark-gray-blue);
    padding: 12px;
    text-align: center;
    color: var(--white);
    text-decoration: none;
    font-size: var(--font-size);
    border-radius: 30px;
}

.card-right a:hover {
    background: linear-gradient(to bottom, var(--light-slate-blue) 0% 20%, var(--light-royal-blue));
}

@media (min-width: 550px) {
    body {
        height: 100vh;
    }

    main .cards {
        flex-direction: row;
        width: 550px;
        border-radius: 15px;
    }

    main .cards .card-left {
        width: 50%;
        border-radius: 15px;
    }

    main .cards .card-right {
        width: 50%;
    }
}

</style>