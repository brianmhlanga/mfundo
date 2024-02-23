<template>
    <div class="relative p-8 overflow-hidden bg-no-repeat bg-cover background">

    </div>
</template>
<style scoped>
.text-center.myy-6.relative {
    margin-top: 130px;
    margin-bottom: 10px;
    font-size: 0px;
}
.text-6xl {
    font-size: 6rem!important;
}
p {
    font-size: 28px;
    font-weight: 400;
    line-height: 25px;
    margin: 0px;
}
.background {
    background-image: url("/images/home.png");
    background-size: cover;
    width: auto;
    height: 450px;
}

/* Change background image for smaller screens */
@media (max-width: 768px) {
    .background {
        background-image: url("/images/home-mobile.png");
    }
}
</style>