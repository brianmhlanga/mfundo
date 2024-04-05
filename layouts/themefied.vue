<template>
    
      <!-- Import all the site's css files -->
      <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/animate.css">
    <link rel="stylesheet" href="/assets/css/odometer.css">
    <link rel="stylesheet" href="/assets/css/nice-select.css">
    <link rel="stylesheet" href="/assets/css/owl.min.css">
    <link rel="stylesheet" href="/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/assets/css/flaticon.css">
    <link rel="stylesheet" href="/assets/css/main.css">
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
                  src: "/assets/js/jquery-3.6.0.min.js"
                },
                {
                  src: "/assets/js/bootstrap.min.js"
                },
                {
                  src: "/assets/js/isotope.pkgd.min.js"
                },
                {
                  src: "/assets/js/magnific-popup.min.js"
                },
                {
                  src: "/assets/js/odometer.min.js"
                },
                {
                  src: "/assets/js/viewport.jquery.js"
                },
                {
                  src: "/assets/js/nice-select.js"
                },
                {
                  src: "/assets/js/owl.min.js"
                },
                {
                  src: "./assets/js/main.js"
                }
              ] 
          } 
      }
  })
  </script>
  <style scoped>
  /* body {
    zoom: 0.7;
  } */
  body {
    padding: 0;
    margin: 0;
    font-size: 16px;
    color: #4B5673;
    /* color: #7884A7; */
    line-height: 28px;
    overflow-x: clip !important;
    font-family: 'Mulish', sans-serif;
    background: #fff;
}
  </style>