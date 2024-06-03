<template>
  <main>  
    
    <ConfirmDialog></ConfirmDialog>
    <ConfirmDialog group="templating">
            <template #message="slotProps">
                <div class="flex p-4">
                    <i :class="slotProps.message.icon" style="font-size: 1.5rem"></i>
                    <p class="pl-2">{{slotProps.message.message}}</p>
                </div>
            </template>
    </ConfirmDialog>
    <ConfirmDialog group="positionDialog"></ConfirmDialog>
    <Toast/>
    <NuxtPage/>
  </main>
</template>
 <style lang="scss">
    @import "~/public/css/theme.css";
.surface-section {
background-color: #f2f5fb!important;
}
.page-enter-active,
  .page-leave-active {
    transition: all 0.4s;
  }
  .page-enter-from,
  .page-leave-to {
    opacity: 0;
    filter: blur(1rem);
  }

  .layout-enter-active,
  .layout-leave-active {
    transition: all 0.4s;
  }
  .layout-enter-from,
  .layout-leave-to {
    opacity: 0;
    filter: blur(1rem);
  }
</style>