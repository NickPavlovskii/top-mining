<template>
  <div class="calculator-page">
    <calculator-hero />
    <calculator-about />

    <div class="calculator-page__epic-blocks">
      <top-mining-epic-blocks />
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator-page'
  import CalculatorAbout from '~/components/calculator/about/CalculatorAbout.vue'
  import CalculatorHero from '~/components/calculator/hero/CalculatorHero.vue'
  import TopMiningEpicBlocks from '~/components/top-mining/TopMiningEpicBlocks.vue'

  definePageMeta({
    path: '/calculator',
  })

  useSeoMeta({
    title: CALCULATOR_PAGE.seoTitle,
    description: CALCULATOR_PAGE.seoDescription,
  })
</script>

<style scoped>
  .calculator-page {
    background: var(--tm-ink);
    color: var(--tm-white);
    min-height: 60vh;
  }

  .calculator-page__epic-blocks {
    box-sizing: border-box;
    width: 100%;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px 48px;
    overflow: visible;
  }

  @media (max-width: 899px) {
    .calculator-page__epic-blocks {
      padding: 0 16px 32px;
    }
  }
</style>
