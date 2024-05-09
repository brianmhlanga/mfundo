<template>
    <NuxtLayout name="inside">
        <section class="hero-section banner-overlay bg_img" data-img="./assets/images/banner/banner-bg.jpg">
            
            <div class="custom-container">
                <div class="hero-content">
                    <h1 class="title uppercase cl-white">About Us</h1>
                    <ul class="breadcrumb cl-white p-0 m-0">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li>
                            about us
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- ~~~ Hero Section ~~~ -->


        <!-- ~~~ Course Section ~~~ -->
        <section class="feature-section pt-120 pb-120">
            <div class="container">
                <div class="section-header">
                    <span class="category">Features</span>
                    <h2 class="title"><span>Our Special</span> Features</h2>
                </div>
                <div class="row justify-content-center mb-30-none">
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-book-reader"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Quality Content</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Our practice exams are regularly updated to reflect the latest exam standards and trends.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-laptop-house"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Interactive Learning</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">With Mfundo, you get instant feedback on your performance, detailed explanations for each question, and personalized progress tracking.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-chalkboard-teacher"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Accesibility</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">We strive to make our platform user-friendly and accessible from any device, enabling you to study anytime, anywhere.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-headset"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Community Support</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Join a community of like-minded individuals who are dedicated to mutual success. Share tips, seek advice, and find motivation among peers.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="about-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 align-self-end d-none d-lg-block">
                        <div class="about-thumb rtl">
                            <img src="/images/similey.png" alt="about">
                        </div>
                    </div>
                    <div class="col-lg-6 pb-120">
                        <div class="section-header text-lg-left mb-0">
                            <h2 class="title">About Mfundo</h2>
                            <p>Mfundo is Your premier destination for comprehensive and reliable practice exams. Our mission is to empower learners and professionals alike to achieve their academic and career goals through effective test preparation.</p>
                            <h2 class="minor">Our Vision</h2>
                            <p>At Mfundo, we believe that the right preparation is the key to success. We envision a world where every student has access to the resources they need to excel in their exams and move confidently towards their future aspirations.</p>
                            <h2 class="minor">Our Approach</h2>
                            <p>We have a student-focused approach and strive to give as study content to help you make sure you’ve crossed all your t’s. Mfundo offers an extensive library of practice exams across a wide range of subjects and certifications. Our tests are meticulously crafted by experts to mirror the format and difficulty of actual exams, providing a realistic and challenging practice environment.</p>
                            <h2 class="minor">Our Commitment</h2>
                            <p>We are committed to providing an exceptional learning experience that is both affordable and effective. Whether you're a student preparing for college entrance exams or a professional seeking certification, Mfundo is here to support you every step of the way.Join us at Mfundo, where your success is our priority. Let's embark on this journey together and unlock your full potential.Start Practicing Today</p>
                            <a href="#0" class="custom-button theme-one">get in touch</a>
                        </div>
                    </div>
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
.about-thumb.rtl {
    margin-bottom: 285px;
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
h2.minor {
    font-size: 20px;
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