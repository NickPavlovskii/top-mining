<template>
  <main class="page">
    <!-- <work-process-section @cta="onLeaveRequest" /> -->
    <top-mining-section />
    <crypto-market-section />
    <top-mining-footer />
  </main>
</template>

<script setup lang="ts">
  useHead({ title: 'Niklad' })

  function onLeaveRequest() {
    // TODO: открыть форму заявки
  }
</script>

<style scoped>
  .page {
    padding: 0;
  }
</style>
