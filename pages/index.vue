<template>
    <NuxtLayout name="themefied">
        <div class="all-sections">
        <!-- ~~~ Loader & Go-Top ~~~ -->
        <div class="overlayer"></div>

        <span class="go-top">
            <i class="fas fa-angle-up"></i>
        </span>
        <!-- ~~~ Loader & Go-Top ~~~ -->


        <!-- ~~~ Header Section ~~~ -->
        <header>
            <div class="custom-container">
                <div class="header-area">
                    <div class="logo">
                        <a href="./index.html">
                            <img src="/images/mfundo.svg" alt="logo">
                        </a>
                    </div>
                    <ul class="menu d-none d-lg-flex flex-wrap">
                        <li>
                            <a href="#0">Home</a>
                            <ul class="submenu">
                                <li>
                                    <a href="./index.html">Home 1</a>
                                </li>
                                <li>
                                    <a href="./index-2.html">Home 2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="./about.vue">About Us</a>
                        </li>
                        <li>
                            <a href="#courses">Courses</a>
                        </li>
                        <li>
                            <a href="contact.html">Contact</a>
                        </li>
                    </ul>
                    <div class="header-bar ml-4">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <span v-if="first_name" class="mr-2">Hi, {{first_name}} {{ last_name }}</span>
                    <NuxtLink  v-if="profile ? profile === 'ADMIN' : false" to="/admin/dashboard" class="custom-buttonn"><span>Admin</span></NuxtLink>
                    <NuxtLink v-if="first_name" @click="logOut" class="custom-button"><span>Log Out</span></NuxtLink>
                    <div v-else>
                    <NuxtLink  to="/login" class="custom-buttonn"><span>Log In</span></NuxtLink>
                    <NuxtLink to="/register" class="custom-button"><span>Sign Up</span></NuxtLink>
                    </div>
                   
                </div>
            </div>
        </header>
        <!-- ~~~ Header Section ~~~ -->

        <!-- ~~~ Mobile Menu ~~~ -->
        <div class="mobile-menu">
            <span class="close-mobile-menu">
                <i class="fas fa-times"></i>
            </span>
            <div class="w-100 d-flex flex-wrap justify-content-center align-items-center">
                <form class="course-search-form mr-sm-4">
                    <select class="select-bar rounded">
                        <option value="01">Category</option>
                        <option value="02">Physics</option>
                        <option value="03">Chemistry</option>
                        <option value="04">History</option>
                        <option value="05">Geometry</option>
                        <option value="06">LoremIp</option>
                        <option value="07">UI/UX</option>
                        <option value="08">Laravel</option>
                    </select>
                    <input type="text" name="name" placeholder="Search Courses" class="rounded">
                    <button type="submit" class="rounded"><i class="flaticon-loupe"></i></button>
                </form>
                <a href="#0" class="custom-button"><i class="fas fa-user"></i><span>Sign Up</span></a>
                <div class="w-100 d-lg-none">
                    <ul class="menu">
                        <li>
                            <a href="#0">Home</a>
                            <ul class="submenu">
                                <li>
                                    <a href="./index.html">Home 1</a>
                                </li>
                                <li>
                                    <a href="./index-2.html">Home 2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="./about.html">About Us</a>
                        </li>
                        <li>
                            <a href="#0">Courses</a>
                            <ul class="submenu">
                                <li>
                                    <a href="./courses.html">Courses</a>
                                </li>
                                <li>
                                    <a href="./course-details.html">Course Details</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#0">Pages</a>
                            <ul class="submenu">
                                <li>
                                    <a href="./instructor.html">Instructor</a>
                                </li>
                                <li>
                                    <a href="./gallery.html">Gallery</a>
                                </li>
                                <li>
                                    <a href="./events.html">Event</a>
                                </li>
                                <li>
                                    <a href="./upcoming-events.html">Upcoming Events</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#0">Blog</a>
                            <ul class="submenu">
                                <li>
                                    <a href="./blog.html">Blogs</a>
                                </li>
                                <li>
                                    <a href="./blog-details.html">Blog Details</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- ~~~ Mobile Menu ~~~ -->


        <!-- ~~~ Banner Section ~~~ -->
        <section class="banner-section banner-overlay bg_img" data-img="./assets/images/banner/banner-bg.jpg">
            <div class="container">
                <div class="banner-content cl-white">
                    <h1 class="titlee">Powerful Online Quiz and Exams Solution</h1>
                    <p class=minidescription>Create, send and analyze your tests, quizzes and assessments for free with Mfundo</p>
                    <div class="banner-button-area">
                        <NuxtLink to="#courses" class="custom-button btn-md"><span>View courses</span><i class="fas fa-play-circle"></i></NuxtLink>
                        <NuxtLink to="/register" class="custom-button btn-md theme-one"><span>Register now</span><i class="flaticon-tap-1"></i></NuxtLink>
                    </div>
                </div>
            </div>
            <div class="banner-thumb">
                <div class="rounded-shape shape-1"></div>
                <div class="rounded-shape shape-2"></div>
                <div class="rounded-shape shape-3"></div>
            </div>
        </section>
        <!-- ~~~ Banner Section ~~~ -->


        <!-- ~~~ Feature Section ~~~ -->
        <section class="feature-section pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-center mb-30-none">
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-book-reader"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Education Services</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis fermentum metus.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-laptop-house"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Online/Offline Class</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis fermentum metus.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-chalkboard-teacher"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Expert Mentor</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis fermentum metus.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-10">
                        <div class="feature-item">
                            <div class="icon">
                                <i class="fas fa-headset"></i>
                            </div>
                            <div class="content">
                                <h6 class="title">Lifetime Support</h6>
                                <span class="shape"></span>
                                <p class="fs-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis fermentum metus.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ~~~ Feature Section ~~~ -->


        <!-- ~~~ Course Section ~~~ -->
        <section class="course-section pt-120 pb-120 section-bg oh pos-rel">
            <div class="course-top-shape">
                <img src="/images/course-top-shape.png" alt="course">
            </div>
            <div class="course-bottom-shape">
                <img src="/images/course-bottom-shape.png" alt="course">
            </div>
            <div class="container">
                <div class="section-header">
                    <span class="category">AVAILABLE COURSES</span>
                    <h2 id="courses" class="title">Online Courses</h2>
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
                                    <Button class="custom-button theme-one rounded" label="History"></Button>
                                    <Button @click="checkSignedIn(exam?.id)" class="custom-button theme-one rounded" label="Take Exam"></Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ~~~ Course Section ~~~ -->


        <!-- ~~~ Counter Section ~~~ -->
        <!-- <section class="counter-section pt-120 pb-120 title-lay bg_img" data-img="./assets/images/counter/counter-bg.jpg" id="apply">
            <div class="container">
                <div class="d-flex flex-wrap justify-content-between align-items-center">
                    <div class="odo-area">
                        <div class="odo-wrap">
                            <div class="odo-item">
                                <div class="odo-in">
                                    <div class="odo-head">
                                        <h2 class="title odometer" data-odo="60">0</h2>
                                        <h2 class="title">+</h2>
                                    </div>
                                    <h5 class="subtitle">Teachers</h5>
                                </div>
                            </div>
                            <div class="odo-item">
                                <div class="odo-in">
                                    <div class="odo-head">
                                        <h2 class="title odometer" data-odo="8">0</h2>
                                        <h2 class="title">k+</h2>
                                    </div>
                                    <h5 class="subtitle">Students</h5>
                                </div>
                            </div>
                            <div class="odo-item">
                                <div class="odo-in">
                                    <div class="odo-head">
                                        <h2 class="title odometer" data-odo="75">0</h2>
                                        <h2 class="title">+</h2>
                                    </div>
                                    <h5 class="subtitle">Courses</h5>
                                </div>
                            </div>
                            <div class="odo-item">
                                <div class="odo-in">
                                    <div class="odo-head">
                                        <h2 class="title odometer" data-odo="13">0</h2>
                                        <h2 class="title">+</h2>
                                    </div>
                                    <h5 class="subtitle">National Awards</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="apply-form-wrapper">
                        <h5 class="title">Apply Now</h5>
                        <form class="apply-form">
                            <div class="apply-group">
                                <label for="name" class="label-name">Full Name</label>
                                <label for="name" class="label-icon"><i class="fas fa-user"></i></label>
                                <input type="text" id="name" name="name">
                            </div>
                            <div class="apply-group">
                                <label for="email" class="label-name">Enter Email</label>
                                <label for="email" class="label-icon"><i class="fas fa-envelope"></i></label>
                                <input type="text" id="email" name="email">
                            </div>
                            <div class="apply-group">
                                <label for="phone" class="label-name">Phone Number</label>
                                <label for="phone" class="label-icon"><i class="fas fa-phone"></i></label>
                                <input type="text"  id="phone" name="phone">
                            </div>
                            <div class="apply-group mb-0">
                                <button type="submit">submit now <i class="fas fa-angle-right"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section> -->
        <!-- ~~~ Counter Section ~~~ -->




        <!-- ~~~ Instructor Section ~~~ -->
       
        <!-- ~~~ Instructor Section ~~~ -->

        <!-- ~~~ Testimonial Section ~~~ -->
      
        <!-- ~~~ Testimonial Section ~~~ -->


        <!-- ~~~ Sponsor Section ~~~ -->
      
        <!-- ~~~ Sponsor Section ~~~ -->


        <!-- ~~~ Footer Section ~~~ -->
        <footer class="bg_img mt-80" data-img="./assets/images/footer/footer-bg.jpg">
            <div class="footer-support">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 col-sm-10">
                            <div class="footer-support-item">
                                <div class="icon">
                                    <i class="flaticon-phone-call"></i>
                                </div>
                                <div class="content">
                                    <h5 class="title">+216 499 49 47</h5>
                                    <span class="info">Free Support Line</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-10">
                            <div class="footer-support-item">
                                <div class="icon">
                                    <i class="flaticon-headphone"></i>
                                </div>
                                <div class="content">
                                    <h5 class="title">Support Center</h5>
                                    <span class="info">365 days full support</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-10">
                            <div class="footer-support-item">
                                <div class="icon">
                                    <i class="flaticon-live"></i>
                                </div>
                                <div class="content">
                                    <h5 class="title">Live Support</h5>
                                    <span class="info">Write Online Now</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-section oh pos-rel">
                <div class="course-top-shape">
                    <img src="./assets/images/course/course-top-shape.png" alt="course">
                </div>
                <div class="course-bottom-shape">
                    <img src="./assets/images/course/course-bottom-shape.png" alt="course">
                </div>
                <div class="container">
                    <div class="footer-top">
                        <div class="footer-area">
                            <div class="footer-widget widget-link">
                                <h5 class="title">Talk to Us</h5>
                                <ul>
                                    <li>
                                        <a href="#0">About us</a>
                                    </li>
                                    <li>
                                        <a href="#0">Registration</a>
                                    </li>
                                    <li>
                                        <a href="#0">Blog</a>
                                    </li>
                                    <li>
                                        <a href="#0">Events</a>
                                    </li>
                                    <li>
                                        <a href="#0">Contact</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="footer-widget widget-link">
                                <h5 class="title">Information</h5>
                                <ul>
                                    <li>
                                        <a href="#0">Membership</a>
                                    </li>
                                    <li>
                                        <a href="#0">Purchase guide</a>
                                    </li>
                                    <li>
                                        <a href="#0">Privacy policy</a>
                                    </li>
                                    <li>
                                        <a href="#0">Terms of service</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="footer-widget widget-link">
                                <h5 class="title">Support</h5>
                                <ul>
                                    <li>
                                        <a href="#0">Documentation</a>
                                    </li>
                                    <li>
                                        <a href="#0">FAQs</a>
                                    </li>
                                    <li>
                                        <a href="#0">Condition</a>
                                    </li>
                                    <li>
                                        <a href="#0">Release Status</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="footer-widget widget-info">
                                <h5 class="title">Contact Us</h5>
                                <ul>
                                    <li>
                                        <div class="icon">
                                            <i class="fas fa-map-marker-alt"></i>
                                        </div>
                                        <div class="content">
                                            <span>12/A, Hamilton City Way, Newyork, US</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icon">
                                            <i class="fas fa-phone-alt"></i>
                                        </div>
                                        <div class="content">
                                            <a href="Tel:+880551251558">+8987 5675 754 6</a>
                                            <a href="Tel:+880551251558">+8987 5675 754 6</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icon">
                                            <i class="fas fa-envelope-open-text"></i>
                                        </div>
                                        <div class="content">
                                            <a href="Mailto:info@exampleweb.com">info@exampleweb.com</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h5 class="title">Subscribe Newsletter</h5>
                                <form class="footer-subscribe-form">
                                    <input type="text" placeholder="Enter Your Email" name="email">
                                    <button type="submit">Subscribe Now</button>
                                </form>
                            </div>
                            <div class="col-md-4">
                                <div class="thumb">
                                    <a href="./index.html">
                                        <img src="./assets/images/footer/footer-bottom.png" alt="footer">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="copyright-area">
                        <div class="left">
                            <p>&copy; Copyright 2023. All Rights Reserved.</p>
                        </div>
                        <div class="right">
                            <ul class="social-icons">
                                <li>
                                    <a href="#0"><i class="fab fa-facebook-f"></i></a>
                                </li>
                                <li>
                                    <a href="#0" class="active"><i class="fab fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#0"><i class="fab fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#0"><i class="fab fa-linkedin-in"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ~~~ Footer Section ~~~ -->
    </div>
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
    border-radius: 25px;
    border: 1px solid #3ec3ab;
    margin-right: 6px;
}

</style>