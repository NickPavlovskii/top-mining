<template>
  <div class="buy-asic-page">
    <buy-asic-hero />
    <buy-asic-models-marquee />
    <buy-asic-models />
    <buy-asic-useful />
  </div>
</template>

<script setup lang="ts">
  import BuyAsicHero from '~/components/buy-asic/BuyAsicHero.vue'
  import BuyAsicModels from '~/components/buy-asic/BuyAsicModels.vue'
  import BuyAsicModelsMarquee from '~/components/buy-asic/BuyAsicModelsMarquee.vue'
  import BuyAsicUseful from '~/components/buy-asic/BuyAsicUseful.vue'

  definePageMeta({
    path: '/asic-majnery-po-czenam-nizhe-rynka',
  })

  useSeoMeta({
    title: 'ASIC-майнеры по ценам ниже рынка | ТОП МАЙНИНГ',
    description:
      'Подберем майнинг-компанию, где вы сможете купить асики на 10% дешевле рынка.',
  })
</script>

<style scoped>
  .buy-asic-page {
    background: #fff;
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
