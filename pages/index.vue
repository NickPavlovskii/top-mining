<template>
  <main class="page">
    <!-- <WorkProcessSection @cta="onLeaveRequest" /> -->
    <TopMiningSection />
    <CryptoMarketSection />
    <MiningCalculatorPromo />
    <CatalogSection />
    <TopMiningContactSection />
    <TopMiningUsefulSection />
  </main>
</template>

<script setup lang="ts">
  import CatalogSection from '~/components/catalog/CatalogSection.vue'
  import CryptoMarketSection from '~/components/crypto/CryptoMarketSection.vue'
  import MiningCalculatorPromo from '~/components/top-mining/MiningCalculatorPromo.vue'
  import TopMiningUsefulSection from '~/components/top-mining/TopMiningUsefulSection.vue'
  import TopMiningContactSection from '~/components/top-mining/TopMiningContactSection.vue'
  import TopMiningSection from '~/components/top-mining/TopMiningSection.vue'

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
