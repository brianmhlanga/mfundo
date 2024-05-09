<template>
    <NuxtLayout name="inside">
        <section class="hero-section banner-overlay bg_img" data-img="./assets/images/banner/banner-bg.jpg">
            
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">Quizzes</h1>
                    <ul class="breadcrumb cl-white p-0 m-0">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            quizzes
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- ~~~ Hero Section ~~~ -->


        <!-- ~~~ Course Section ~~~ -->
        <section class="course-section pt-120 pb-120">
            <div class="container">
                <div class="row align-items-center section-header">
                    <div class="col-lg-7">
                        <div class="section-header left-style mb-low mb-lg-0">
                            <span class="category">TOP SELECTIONS</span>
                            <h2 class="title">Online Quizzes</h2>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="d-flex flex-wrap justify-content-lg-end m--10">
                            <div class="course-select-item">
                                <select class="select-bar">
                                    <option value="c1">Photoshop</option>
                                    <option value="c2">Webdesign</option>
                                    <option value="c3">English</option>
                                    <option value="c4">History</option>
                                    <option value="c5">Wordpress</option>
                                    <option value="c6">Laravel</option>
                                    <option value="c7">Python</option>
                                    <option value="c8">Javascript</option>
                                </select>
                            </div>
                            <div class="course-select-item">
                                <select class="select-bar">
                                    <option value="o1">Select Order</option>
                                    <option value="o2">Webdesign</option>
                                    <option value="o3">English</option>
                                    <option value="o4">History</option>
                                    <option value="o5">Wordpress</option>
                                    <option value="o6">Laravel</option>
                                    <option value="o7">Python</option>
                                    <option value="o8">Javascript</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-30-none">
                    <div v-for="exam in exams" class="col-xl-4 col-md-6 col-sm-10">
                        <div class="course-item">
                            <div class="thumb">
                                <a href="#0">
                                    <img src="/images/textbooks.jpg" alt="course">
                                </a>
                            </div>
                            <div class="content">
                                <h5 class="title">
                                    <a>{{ exam?.exam_name }}</a>
                                </h5>
                                <div class="meta-area">
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="pi pi-user mr-2"></i>
                                            <span>Brian Mhlanga</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="pi pi-book mr-2"></i>
                                            <span>{{ exam?.subject?.name }}</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="pi pi-clock mr-2"></i>
                                            <span v-if="exam?.exam_hours <= 0">{{ exam?.exam_minutes }} Minutes</span>
                                            <span v-else-if="exam?.exam_hours > 0 && exam?.exam_minutes === 0">Time ({{ exam?.exam_hours }} hours)</span>
                                            <span v-else>Time ({{ exam?.exam_hours }} hours & {{ exam?.exam_minutes }} minutes)</span>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="ratings-area col-12">
                                    <Button @click="checkSignedIn(exam?.id)" class="custom-button theme-one rounded w-12" label="Take Exam"></Button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="text-center load-more mt-5">
                    <a href="./courses.html" class="custom-button theme-one">load more courses <i class="fas fa-angle-right"></i></a>
                </div>
            </div>
        </section>
    </NuxtLayout>
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
//@ts-ignore
const last_name = ref()
const first_name = ref()
const profile = ref()

const logOut = () => {
    let result = authStore.logout()
}
// const { value: { id }} = useCookie('user');
onMounted( async() => {
    let userData:any = useCookie('user').value
    id.value = userData?.id
    first_name.value = userData?.first_name
    last_name.value = userData?.last_name
    profile.value = userData?.profile
    let result = await examsStore.getExams().then((data) => {
      exams.value = data?.data?.exams
    })
})
const checkSignedIn = (examId) => {
  if(id.value) {
    navigateTo(`/takeExam-${examId}-${id.value}`)
  }
  else {
    toast.add({ severity: 'info', summary: 'Not Authenticated', detail: 'Please login, to take exam',life: 3000});
  }
}
</script>
<style scoped>
header {
    padding: 3px 0px !important;
}
ul.menu.d-none.d-lg-flex.flex-wrap {
    margin: auto;
}
.header-area .logo img {
    max-width: 75%;
    margin-left: 50px;
}
a.custom-button {
    color: #ffffff;
    text-transform: none !important;
    line-height: 48px;
    background: #634bff;
    padding: 0 35px;
    display: inline-block;
    /* text-transform: uppercase; */
    cursor: pointer;
    font-weight: 500;
    font-size: 16px;
    border-radius: 25px;
    border: 1px solid #0071f2;
}
.banner-overlay::before {
    left: 0;
    bottom: 0;
    top: 0;
    right: 0;
    background: #0f1048 !important;
}
.banner-section {
    padding: 113px 0 105px !important;
}
h1.titlee {
    font-family: Poppins, sans-serif;
    font-size: 60px;
    font-weight: 500;
    color: white;
}
content.cl-white p {
    font-family: Poppins, sans-serif !important;
    margin-top: 10px !important;
    font-size: 24px !important;
    line-height: 1.5 !important;
    color: rgba(255, 255, 255, 0.86);
}
p.minidescription {
    font-family: Poppins, sans-serif !important;
    margin-top: 10px !important;
    font-size: 24px !important;
    line-height: 1.5 !important;
    color: rgba(255, 255, 255, 0.86);
}
.feature-item {
    padding: 40px 20px;
    text-align: center;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 1px solid #E2E4FF;
    -webkit-transition: all ease 0.3s;
    -moz-transition: all ease 0.3s;
    transition: all ease 0.3s;
    margin: 0 auto 30px;
    -webkit-transition: all ease 0.3s;
    -moz-transition: all ease 0.3s;
    transition: all ease 0.3s;
    vertical-align: top;
    /* height: 120px; */
    border-radius: 5px;
    background-color: #fff;
    box-shadow: 0 5px 10px 0 rgba(41,61,102,.2);
    cursor: pointer;
    color: #2d3040;
    text-decoration: none;
    position: relative;
    overflow: hidden;
    padding: 41px;
    z-index: 1;
    transition: box-shadow .2s;
    -webkit-transition: box-shadow .2s;
    /* display: b
lock; */
}
body {
    padding: 0;
    margin: 0;
    font-size: 16px;
    color: #4B5673;
    /* color: #7884A7; */
    line-height: 28px;
    overflow-x: hidden;
    font-family: Poppins, sans-serif;
    background: #f1f5f9 !important;
}
.p-button:enabled:hover {
    background: #ffffff;
    color: #2eca7f;
    border-color: #2eca7f;
}
a.custom-buttonn {
    color: #000000 !important;
    /* text-transform: uppercase; */
    line-height: 48px;
    background: #ffffff00 !important; 
    padding: 0 35px;
    display: inline-block;
    text-transform: none!important;
    font-weight: 500;
    font-size: 16px;
    cursor: pointer;
    border-radius: 25px;
    border: 1px solid #3ec3ab;
    margin-right: 6px;
}
a.custom-button.btn-md.theme-one {
    background-color: #3ec3ab !important;
    border-color: #0c0c0c !important;
}
a.custom-button.btn-md.theme-one:hover {
    color: white !important;
}
.menu li a {
    padding: 7px !important;
    font-weight: 500 !important;
    font-family: Poppins, sans-serif !important;
    color: #07294D !important;
    text-transform: capitalize !important;
    position: relative !important;
}
</style>