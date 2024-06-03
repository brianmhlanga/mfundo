<template>
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
                <NuxtLink to="/">
                    <img src="/images/mfundo.svg" alt="logo">
                </NuxtLink>
            </div>
            <ul class="menu d-none d-lg-flex flex-wrap">
                <li>
                    <NuxtLink to="/">Home</NuxtLink>
                </li>
                <li>
                    <a href="/about">About Us</a>
                </li>
                <li>
                    <a href="/exams">Exams</a>
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
            <!-- <form class="course-search-form ml-auto mr-4">
                        <input type="text" name="name" placeholder="Search Courses" class="rounded">
                        <button type="submit" class="rounded"><i class="flaticon-loupe"></i></button>
            </form> -->
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
            <h1 class="titlee">Powerful Online Tests & Examinations</h1>
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