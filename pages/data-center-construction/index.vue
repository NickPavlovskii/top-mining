<template>
  <div class="data-center-page">
    <data-center-hero />
    <data-center-advantages />
    <data-center-discuss />
    <data-center-offer />
    <data-center-models />
    <data-center-why-invest />
    <data-center-stages />
    <data-center-lead />
    <data-center-power-compare />
    <data-center-consult />
  </div>
</template>

<script setup lang="ts">
  import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
  import DataCenterAdvantages from '~/components/data-center-construction/advantages/DataCenterAdvantages.vue'
  import DataCenterConsult from '~/components/data-center-construction/cta/DataCenterConsult.vue'
  import DataCenterDiscuss from '~/components/data-center-construction/cta/DataCenterDiscuss.vue'
  import DataCenterHero from '~/components/data-center-construction/hero/DataCenterHero.vue'
  import DataCenterLead from '~/components/data-center-construction/cta/DataCenterLead.vue'
  import DataCenterModels from '~/components/data-center-construction/models/DataCenterModels.vue'
  import DataCenterOffer from '~/components/data-center-construction/offer/DataCenterOffer.vue'
  import DataCenterPowerCompare from '~/components/data-center-construction/power-compare/DataCenterPowerCompare.vue'
  import DataCenterStages from '~/components/data-center-construction/stages/DataCenterStages.vue'
  import DataCenterWhyInvest from '~/components/data-center-construction/why-invest/DataCenterWhyInvest.vue'

  definePageMeta({
    path: '/data-center-construction',
  })

  useSeoMeta({
    title: DATA_CENTER_CONSTRUCTION_PAGE.seoTitle,
    description: DATA_CENTER_CONSTRUCTION_PAGE.seoDescription,
  })
</script>

<style scoped>
  .data-center-page {
    background: var(--tm-ink);
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
