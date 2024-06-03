<template>
    <NuxtLayout name="logins">
        <div class="form-body on-top-mobile">
        <div class="website-logo">
            <a href="index.html">
                <div class="logo">
                    <img class="logo-size" src="/logins/images/logo-light.svg" alt="">
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
                <div class="info-holder simple-info">
                    <div><h3>Create Profile & Start Learning!</h3></div>
                    <div><p>Fill the form, with all the required details to help us tailor make our offering</p></div>
                    <img src="/logins/images/graphic1.svg" alt="">
                </div>
            </div>
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <div class="page-links">
                            <a href="#" class="active">Create an Account</a>
                        </div>
                        <form>
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <InputText v-model="first_name" class="form-control" placeholder="First name"/>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <InputText v-model="last_name" class="form-control" placeholder="Last name"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <Calendar v-model="date_of_birth" class="w-12" placeholder="Date of Birth"/>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <Dropdown v-model="selectedCountry" :options="countries" filter optionLabel="name" placeholder="Select a Country" class="w-12 mydropdown">
                                    <template #value="slotProps">
                                        <div v-if="slotProps.value" class="flex align-items-center">
                                            <img :alt="slotProps.value.label" src="https://primefaces.org/cdn/primevue/images/flag/flag_placeholder.png" :class="`mr-2 flag flag-${slotProps.value.code.toLowerCase()}`" style="width: 18px" />
                                            <div>{{ slotProps.value.name }}</div>
                                        </div>
                                        <span v-else>
                                            {{ slotProps.placeholder }}
                                        </span>
                                    </template>
                                    <template #option="slotProps">
                                        <div class="flex align-items-center">
                                            <img :alt="slotProps.option.label" src="https://primefaces.org/cdn/primevue/images/flag/flag_placeholder.png" :class="`mr-2 flag flag-${slotProps.option.code.toLowerCase()}`" style="width: 18px" />
                                            <div>{{ slotProps.option.name }}</div>
                                        </div>
                                    </template>
                                </Dropdown>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <input v-model="email" type="email" class="form-control" placeholder="Email Address" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12">
                                    <MultiSelect v-model="selectedAreas" optionLabel="name" optionValue="id" :options="subjects" placeholder="Select Areas of Interest" :maxSelectedLabels="5" class="w-12" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <MazPhoneNumberInput v-model="phone" v-model:country-code="countryCode" show-code-on-list :preferred-countries="['ZW', 'ZA', 'DE', 'US', 'GB']" @update="cell_validation = $event,console.log(cell_validation.isValid)" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <Password class="w-12" v-model="password" toggleMask placeholder="Enter Password">
                                    <template #header>
                                        <h6>Pick a password</h6>
                                    </template>
                                    <template #footer>
                                        <Divider />
                                        <p class="mt-2">Suggestions</p>
                                        <ul class="pl-2 ml-2 mt-0" style="line-height: 1.5">
                                            <li>At least one lowercase</li>
                                            <li>At least one uppercase</li>
                                            <li>At least one numeric</li>
                                            <li>Minimum 8 characters</li>
                                        </ul>
                                    </template>
                                </Password>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <Password class="w-12" v-model="confirm_password" placeholder="Confirm Password"/>
                                </div>
                            </div>
                            <div class="row top-padding">
                                <div class="col-12 col-sm-12">
                                        <Button @click="signUp" :disabled="!first_name || !last_name || !date_of_birth || !selectedCountry || !selectedAreas || !email || !phone || !password || !confirm_password || cell_validation?.isValid === false" class="w-6 signupbtn">Sign Up</Button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</NuxtLayout>
</template>
<script lang="ts" setup>
import MazPhoneNumberInput from 'maz-ui/components/MazPhoneNumberInput'
import { useToast } from "primevue/usetoast";
import { useAuthStore } from "~/stores/auth";
import { useManagementStore } from "~/stores/management";
const authStore = useAuthStore()
const toast = useToast()
const managementStore = useManagementStore()
import countriesData from '~/json/countries.json';
const selectedCountry = ref();
const countryCode = ref();
const selectedAreas = ref()
const cell_validation = ref()
const first_name = ref()
const last_name = ref()
const date_of_birth = ref()
const school = ref()
const subjects = ref()
const grade = ref()
const email = ref()
const phone = ref()
const password = ref()
const confirm_password = ref()
const countries = ref([]);
onMounted( async() => {
  countries.value = countriesData;
  let subjectss = await managementStore.listSubjects().then((result) => {
            console.log(result)
            subjects.value = result?.data?.subjects
  })
});
const signUp = async () => {
    let data = {
       first_name: first_name.value,
       last_name: last_name.value,
       date_of_birth: date_of_birth.value,
       country: selectedCountry.value,
       school: school.value,
       grade: grade.value,
       email: email.value,
       interests: selectedAreas.value,
       phone: phone.value,
       password: password.value,
       confirm_password: confirm_password
    }
    let result = await authStore.register(data).then((data) => {
        console.log(data)
        if (data?.data?.success) {
            toast.add({severity:'info', summary: 'Success', detail: "Succesfully Registred", life: 6000});
            navigateTo('/login')
        }
        else {
                toast.add({severity:'warn', summary: 'Registration failed', detail: "Failed to Register", life: 6000});
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
.form-content .form-items {
    max-width: 616px !important;
    text-align: left;
}
.img-holder .info-holder.simple-info img {
    max-width: 288px !important;
    margin-bottom: 50px;
    /* float: left; */
}
.form-content input, .form-content .dropdown-toggle.btn-default {
    border: 0;
    border: 1px solid #C3C3C3 !important;
    /* background-color: #fff; */
    /* color: #000; */
    background-color: #fff !important;
    color: #8D8D8D;
}
.form-content {
    background-color: white !important;
}
.m-phone-number-input:not(.--no-flags) .m-phone-number-input__select .m-select-input input {
    background-color: #673AB7 !important;
    padding-left: 2.25rem !important;
    color: white !important;
}
.m-input.--should-up .m-input-label {
    color: white !important;
    transform: scale(.8) translateY(-.65em);
}
.p-checkbox .p-checkbox-box {
    border: 2px solid #ced4da;
    /* background: #ffffff00; */
    width: 22px;
    height: 22px;
    color: #495057;
    border-radius: 6px;
    transition: background-color 0.2s, color 0.2s, border-color 0.2s, box-shadow 0.2s;
}
.m-phone-number-input__country-flag.--should-have-bottom-flag {
    bottom: 2px;
    color: white;
}
.m-input-wrapper.--default-border {
    --tw-border-opacity: 0 !important;
    border-color: rgb(229 231 235 / var(--tw-border-opacity));
}
.p-dropdown {
    background: #ffffff;
    border: 1px solid #ced4da;
    transition: background-color 0.2s, color 0.2s, border-color 0.2s, box-shadow 0.2s;
    height: 43px !important;
    border-radius: 6px;
}
.p-dropdown .p-dropdown-label.p-placeholder {
    color: #7a88a4 !important;
    font-size: 15px !important;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    font-weight: 300 !important;
}
.form-content input, .form-content .dropdown-toggle.btn-default {
    width: 100%;
    padding: 9px 20px;
    text-align: left;
    border: 0;
    outline: 0;
    border-radius: 6px;
    background-color: #fff;
    font-size: 15px;
    font-weight: 300;
    color: #8D8D8D;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
    margin-bottom: 0px !important;
}
</style>