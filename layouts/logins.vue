<template>
    <link rel="stylesheet" type="text/css" href="/logins/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/logins/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="/logins/css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="/logins/css/iofrm-theme8.css">
    <!-- Import all the site's css files -->
    <!-- ======== sidebar-nav start =========== -->
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
  
        <!-- ========== header start ========== -->
     
        <!-- ========== header end ========== -->
    
        <!-- ========== section start ========== -->
        <body>
          <slot/>
        </body>

        <!-- ========== footer start =========== -->

</template>

<script>

export default defineNuxtComponent ( { 
    head(){
        return {
            meta: [
              { charset: 'utf-8' },
              { name: 'viewport', content: 'width=device-width, initial-scale=0.7' },
              {
                hid: 'description',
                name: 'Mfundo - Online Education Platform',
                content: 'Silverlands Holdings Zambia'
              }
            ],
            link: [
                { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
              ],
            script: [
              {
                src: "/js/jquery-3.5.1.js"
              },
              {
                src: "/logins/js/jquery.min.js"
              },
              {
                src: "/logins/js/popper.min.js"
              },
              {
                src: "/logins/js/bootstrap.min.js"
              },
              {
                src: "/logins/js/main.js"
              }
            ] 
        } 
    }
})
</script>
<style scoped>
body {
    background-color: #ffffff !important;
}
</style>