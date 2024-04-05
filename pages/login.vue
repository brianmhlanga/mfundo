<template>
    <NuxtLayout name="logins">
    <div class="form-body">
        <div class="website-logo">
            <a href="index.html">
                <div class="logo">
                    <img class="logo-size" src="/images/mfundo.svg" alt="">
                </div>
            </a>
        </div>
        <div class="row">
            <div class="img-holder">
                <div class="bg"></div>
                <div class="startss">
                    <a href="index.html">
                            <img class="logo-size" src="/images/mfundo.svg" alt="">
                    </a>
                </div>
                        
                <div class="info-holder">
                    <h3>Unlock your full potential with Mfundo.</h3>
                    <p>The ultimate online quiz platform. Maximize your learning and achieve more with our innovative tools and engaging quizzes. Start your journey to success today!"</p>
                    <img src="/logins/images/graphic4.svg" alt="">
                </div>
            </div>
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <div class="page-links">
                            <a href="#" class="active">Login</a>
                        </div>
                        <form @submit.prevent="signIn">
                            <input class="form-control marginght" v-model="email" type="text" name="username" placeholder="E-mail Address" required>
                            <input class="form-control" v-model="password" type="password" name="password" placeholder="Password" required>
                            <div class="form-button">
                                <Button :loading="loading" id="submit" type="submit" class="ibtn" :disabled="!email || !password">Login</Button>
                                 <a href="forget8.html">Forget password?</a>
                            </div>
                        </form>
                        <!-- <div class="other-links">
                            <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</NuxtLayout>
</template>
<script lang="ts" setup>
import { useToast } from "primevue/usetoast";
import { useAuthStore } from "~/stores/auth";
const authStore = useAuthStore()
const toast = useToast()
const email = ref()
const loading = ref(false)
const password = ref()

definePageMeta({
        middleware: ["not-auth"]
});

const signIn = async () => {
    loading.value = true;
    let data = {
       email: email.value,
       password: password.value
    }
    let result = await authStore.login(data).then((data) => {
        console.log(data)
        if (data?.data?.success) {
            loading.value = false
            toast.add({severity:'info', summary: 'Success', detail: "Succesfully Login", life: 6000});
            navigateTo('/')
        }
        else {
                toast.add({severity:'warn', summary: 'Login failed', detail: data?.data?.message, life: 6000});
                loading.value = false
        }
    })
}
</script>
<style>
img.logo-size {
    width: auto !important;
    float: left !important;
    height: 60px !important;
    padding-left: 7px !important;
    margin-bottom: 26px !important;
}
body {
    background-color: #ffffff !important;
}
.form-content .page-links a {
    color: #000 !important;
}
.form-content .form-button .ibtn {
    background-color: #634bff !important;
    color: #ffffff !important;
    -webkit-box-shadow: 0 0 0 rgba(0, 0, 0, 0.16);
    box-shadow: 0 0 0 rgba(0, 0, 0, 0.16);
}
.form-content .form-button a {
    color: #000 !important;
}
input.form-control.marginght {
    margin-bottom: 10px !important;
}
</style>