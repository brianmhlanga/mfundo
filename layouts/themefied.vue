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
            
            
            <div class="all-sections" :class="{ 'loading': loading }">
              <landing-home/>
              <slot/>
              <landing-footer/>
            </div>
        
          </body>
  
          <!-- ========== footer start =========== -->

  </template>
  <script setup>
  const loading = ref(true);
  
  onMounted(() => {
      setTimeout(() => {
          loading.value = false;
      }, 2000);
  });
  </script>
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
    font-family: Poppins, sans-serif;
    background: #edf2f9;
  }
  .all-sections {
      position: relative; /* Required for positioning the spinner */
      transition: opacity 0.3s ease-in-out;
  }
  
  .loading {
      opacity: 0;
      pointer-events: none; /* Prevent interaction during loading */
  }
  
  .spinner {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      border: 4px solid rgba(255, 255, 255, 0.3);
      border-top: 4px solid #fff;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      animation: spin 1s linear infinite;
  }
  
  @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
  }
  </style>
  <style scoped>
  /* body {
    zoom: 0.7;
  } */
  body {
    .loader {
  height: 4px;
  width: 130px;
  --c:no-repeat linear-gradient(#6100ee 0 0);
  background: var(--c),var(--c),#d7b8fc;
  background-size: 60% 100%;
  animation: l16 3s infinite;
}
@keyframes l16 {
  0%   {background-position:-150% 0,-150% 0}
  66%  {background-position: 250% 0,-150% 0}
  100% {background-position: 250% 0, 250% 0}
}
    padding: 0;
    margin: 0;
    font-size: 16px;
    color: #4B5673;
    /* color: #7884A7; */
    line-height: 28px;
    overflow-x: clip !important;
    font-family: Poppins, sans-serif;
    background: #edf2f9;
}
  </style>