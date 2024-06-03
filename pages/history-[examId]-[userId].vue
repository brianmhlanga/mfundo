<template>
    <NuxtLayout name="inside">
        <section class="hero-section banner-overlay bg_img" data-img="/images/studentwithbooks.png">
                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">History</h1>
                    </div>
                </div>
        </section>
            <!-- ~~~ Hero Section ~~~ -->
    
    
            <!-- ~~~ Course Section ~~~ -->
            <section class="course-details-section pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="course-video-area mb-lg-0">
                                <div class="course-video-content">
                                    <h6 class="title">{{ exam?.exam_name }}</h6>
                                    <ul class="course-infos">
                                        <li>
                                            <span><i class="fas fa-clock"></i>Duration</span><span>{{ exam?.exam_hours }} hours | {{ exam?.exam_minutes }} minutes</span>
                                        </li>
                                        <li>
                                            <span><i class="fas fa-brain"></i>Questions</span><span>{{ exam?.questions.length }}</span>
                                        </li>
                                        <li>
                                            <span><i class="fas fa-puzzle-piece"></i>Current Question</span><span>{{ current_question }} of {{ exam?.questions.length }}</span>
                                        </li>
                                    </ul>
                                    <a @click="retakeExam()" class="custom-button theme-one rounded">Retake Exam<i class="fas fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                                <!-- <div class="price">
                                    {{ hours }}h {{ minutes }}m {{ seconds }}s
                                </div> -->
                                <!-- <div class="course-header">
                                    <h4 class="title">Strategic Social Media & Marketing</h4>
                                </div> -->
                                <div class="course-details-content section-bg">
                                    <div class="tab-content">
                                        <div class="tab-pane show fade active" id="overview">
                                            <div class="overview">
                                                <Panel v-show="index+1 === current_question" class="panelMargin mb-5" v-for="(question, index) in (exam?.questions)" :key="question.id" :header="`Question ${index+1}`">
                                                    <small>Please note <span class="bg-green">Green</span> indicates correct solution and <span class="bg-red">Red</span> your incorrect solution</small>
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
                                                            <div class="flex flex-wrap align-items-center">
                                                        <div v-for="(answer, Answerindex) in question?.options" 
                                                        class="ml-0 md:ml-2 mt-2 md:mt-0 border-1 p-1 px-2 border-round flex align-items-center font-medium surface-100 text-600 surface-border"
                                                        :class="{ 'bg-color': answer === exam?.questions[index].multichoice_answer,'bg-red': answer === exam?.solutions[index].student_multichoice_answer 
            && answer !== exam?.questions[index].multichoice_answer  }" >
                                                            <i class="mr-2">{{ String.fromCharCode(65 + Answerindex) }}</i>
                                                            <span>{{ answer }}</span>
                                                        </div>
                                                    </div>   
                                                    </div>
                                                    </div>
                                                </fieldset>
                                                <div class="details-buttons-area">
                                                    <a v-if="index > 0" @click="goToPrevious()" class="custom-button theme-one"><i class="fas fa-angle-left"></i>Previous Question</a>
                                                    <a v-if="index < exam?.questions.length - 1" @click="goToNext()" class="custom-button theme-one">Next Question <i class="fas fa-angle-right"></i></a>
                                                </div>
                                                </Panel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </section>   
    </NuxtLayout>
    </template>
    <script lang="ts" setup>
    import { useExamsStore } from '~/stores/exams';
    import { useRecruitmentStore } from '~/stores/recruitment';
    import { useToast } from 'primevue/usetoast';
    import Swal from 'sweetalert2';
import { SubTitle } from 'chart.js';
    const { params: { examId, userId } } = useRoute();
    const exam = ref()
    const questions = ref()
    const is_exam_over = ref(false)
    const hours = ref()
    const minutes = ref()
    const seconds = ref()
    const total_questions = ref()
    const correct_questions = ref()
    const pass_percentage = ref()
    const totalSeconds = ref()
    definePageMeta({
            middleware: "auth"
        });
    const current_question = ref(1)
    const toast = useToast();
    const recruitmentStore = useRecruitmentStore()
    const examsStore = useExamsStore()
    const goToNext = () => {
        let a = current_question.value
        let b = a + 1
        current_question.value = b
       return 
    }
    const goToPrevious = () => {
        let a = current_question.value
        let b = a - 1
        current_question.value = b
        return
    }
    //working old function
    // let startCountdown = async (hrs, mins, secs) => {
    //     hours.value = hrs;
    //     minutes.value = mins;
    //     seconds.value = secs;
    //     totalSeconds.value = hrs * 3600 + mins * 60 + secs;
    
    //     let intervalId = setInterval(async () => {
    //         totalSeconds.value--;
    //         if (totalSeconds.value <= 0) {
    //             clearInterval(intervalId);
    //             console.log("exam over")
    //             await submitOnTimeOut()
    //             return;
    //         }
    
    //         hours.value = Math.floor(totalSeconds.value / 3600);
    //         minutes.value = Math.floor((totalSeconds.value % 3600) / 60);
    //         seconds.value = totalSeconds.value % 60;
    
    //         // Save time left to localStorage
    //         let data = {
    //             hours: hours.value,
    //             minutes: minutes.value,
    //             seconds: seconds.value,
    //             exam_id: examId,
    //             student_id: userId
    //         }
    //         if (is_exam_over.value === false) {
    //             let savedTime = await examsStore.storeTime(data)
    //         } else {
    //             let savedTime = await examsStore.deleteTime(data)
    //         }
            
    //     }, 1000);
    // }



    
   
    const  addStudentId = (objects) => {
      return objects.map(obj => {
        obj.student_id = userId;
        return obj;
      });
    }
    const retakeExam = async () => {
        let data = {
            id: examId,
            student_id: userId
        }
        let examm = await examsStore.retakeExam(data).then(async(result) => {
            navigateTo(`/takeExam-${examId}-${userId}`)
        })
    }
    
    onMounted(async () => {
        let data = {
            id: examId,
            student_id: userId
        }
        let examm = await examsStore.reviewExam(data).then(async(result) => {
            exam.value = result?.data?.exam
            // Retrieve saved exams and time from Database
            let data = {
                exam_id: examId,
                student_id: userId
            }
        })
    })
    
    const compareMultichoice = (index) => {
        console.log("radio button clicked")
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
    .p-panel .p-panel-header {
    border: 1px solid #dee2e6;
    font-family: Poppins, sans-serif;
    padding: 1.25rem;
    background: #634bff;
    color: #ffffff;
    border-top-right-radius: 6px;
    border-top-left-radius: 6px;
}

.p-radiobutton.p-highlight .p-radiobutton-box {
    border-color: #10b981;
    background: #ffffff;
}
.p-radiobutton .p-radiobutton-box .p-radiobutton-icon {
    width: 0.75rem;
    height: 0.75rem;
    transition-duration: 0.2s;
    background-color: #10b981;
}
    .course-details .price {
        width: 150px !important;
        height: 95px;
        line-height: 95px;
        text-align: center;
        font-size: 20px;
        color: #ffffff;
        background: #0071f2;
        -webkit-border-radius: 0 0 50% 50%;
        -moz-border-radius: 0 0 50% 50%;
        border-radius: 0 0 50% 50%;
        font-weight: 500;
        position: absolute;
        top: 0;
        right: 15px;
    }
    .top-counter {
        font-size: 50px;
        font-weight: 500;
        margin: auto;
        padding: 45px;
    }
    .bg-color {
    background-color: #2eca7f !important;
    color: white !important;
    
}
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
    .card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: none !important;
    border-radius: .25rem;
    }
    .p-fieldset {
    border: 1px solid #dee2e6;
    margin-bottom: 5px;
    background: #ffffff;
    color: #495057;
    border-radius: 6px;
    }
    .course-details-content .overview {
    padding-top: 0 !important;
    }
    .course-details-content .tab-content {
    padding: 0 !important;
    }
    .custom-button.theme-one {
        cursor: pointer;
        border-color: #2ECA7F;
        background: #2ECA7F;
        box-shadow: 0 0 15px rgba(255, 119, 0, 0.1);
    }
    a.custom-button.theme-one.solutions {
        background-color: #634bff;
        border-color: #634bff;
    }
    a.custom-button.theme-one.solutions:hover {
        background-color: #634bff;
        border-color: #634bff;
        color: #ffffff
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