<template>
  <div class="stroy-page">
    <stroy-hero />
    <stroy-advantages />
    <stroy-offer />
    <stroy-models />
    <stroy-why-invest />
    <stroy-stages />
    <stroy-lead />
    <stroy-power-compare />
    <stroy-consult />
  </div>
</template>

<script setup lang="ts">
  import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import StroyAdvantages from '~/components/stroitelstvo/advantages/StroyAdvantages.vue'
  import StroyConsult from '~/components/stroitelstvo/cta/StroyConsult.vue'
  import StroyHero from '~/components/stroitelstvo/hero/StroyHero.vue'
  import StroyLead from '~/components/stroitelstvo/cta/StroyLead.vue'
  import StroyModels from '~/components/stroitelstvo/models/StroyModels.vue'
  import StroyOffer from '~/components/stroitelstvo/offer/StroyOffer.vue'
  import StroyPowerCompare from '~/components/stroitelstvo/power-compare/StroyPowerCompare.vue'
  import StroyStages from '~/components/stroitelstvo/stages/StroyStages.vue'
  import StroyWhyInvest from '~/components/stroitelstvo/why-invest/StroyWhyInvest.vue'

  definePageMeta({
    path: '/stroitelstvo-data-czentrov',
  })

  useSeoMeta({
    title: STROITELSTVO_DATA_CZENTROV_PAGE.seoTitle,
    description: STROITELSTVO_DATA_CZENTROV_PAGE.seoDescription,
  })
</script>

<style scoped>
  .stroy-page {
    background: var(--tm-ink);
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
