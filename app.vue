<script setup lang="ts">
  import Default from './layouts/default.vue'

  useHead({
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/small-logo.ico' }],
  })
</script>

<template>
  <UApp>
    <default />
  </UApp>
</template>
