<template>
    <NuxtLayout name="default">
        <LandingNavbar/>
        <LandingHeader/>
        <LandingThird/>
    </NuxtLayout>
</template>
<script lang="ts" setup>
//@ts-ignore
const { value: { first_name, last_name, profile, id }} = useCookie('user');
</script>
<style>
.surface-section {
    background-color: #f2f5fb!important;
}
</style>