<template>
  <div class="buy-asic-page">
    <buy-asic-hero />
    <buy-asic-models-marquee />
    <buy-asic-models />
    <buy-asic-useful />
    <buy-asic-client-problems />
    <buy-asic-how-we-work />
    <buy-asic-safety-and-time />
    <buy-asic-summary />
    <buy-asic-promo-banners />
    <top-mining-contact-section
      flush
      :show-articles="false"
    />
  </div>
</template>

<script setup lang="ts">
  import BuyAsicPromoBanners from '~/components/buy-asic/banners/BuyAsicPromoBanners.vue'
  import BuyAsicHero from '~/components/buy-asic/hero/BuyAsicHero.vue'
  import BuyAsicModels from '~/components/buy-asic/models/BuyAsicModels.vue'
  import BuyAsicModelsMarquee from '~/components/buy-asic/models/BuyAsicModelsMarquee.vue'
  import BuyAsicClientProblems from '~/components/buy-asic/shared/BuyAsicClientProblems.vue'
  import BuyAsicHowWeWork from '~/components/buy-asic/shared/BuyAsicHowWeWork.vue'
  import BuyAsicSafetyAndTime from '~/components/buy-asic/shared/BuyAsicSafetyAndTime.vue'
  import BuyAsicSummary from '~/components/buy-asic/shared/BuyAsicSummary.vue'
  import BuyAsicUseful from '~/components/buy-asic/shared/BuyAsicUseful.vue'
  import TopMiningContactSection from '~/components/top-mining/TopMiningContactSection.vue'

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
