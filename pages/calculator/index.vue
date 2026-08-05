<script setup lang="ts">
import { CALCULATOR_PAGE } from '~/common/modules/top-mining'
import CalculatorHero from '~/components/calculator/hero/CalculatorHero.vue'
import CalculatorForm from '~/components/calculator/form/CalculatorForm.vue'
import CalculatorAbout from '~/components/calculator/about/CalculatorAbout.vue'
import TopMiningEpicBlocks from '~/components/top-mining/TopMiningEpicBlocks.vue'

useSeoMeta({
  title: CALCULATOR_PAGE.seoTitle,
  description: CALCULATOR_PAGE.seoDescription,
})
</script>

<template>
  <div class="calculator-page">
    <CalculatorHero />
    <CalculatorForm />
    <CalculatorAbout />
    <div class="calculator-page__epic">
      <div class="calculator-page__epic-inner">
        <TopMiningEpicBlocks />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.calculator-page {
  display: flex;
  flex-direction: column;
  gap: 0;
  background: var(--tm-ink, #1a1a1a);
  color: var(--tm-white, #fff);
}

.calculator-page__epic {
  position: relative;
  z-index: 2;
  width: 100%;
  margin-top: clamp(-48px, -4vw, -32px);
  padding:
    clamp(56px, 7vw, 96px)
    clamp(16px, 2vw, 32px)
    clamp(40px, 5vw, 80px);
  border-radius: clamp(32px, 5vw, 64px) clamp(32px, 5vw, 64px) 0 0;
  background: linear-gradient(180deg, #f2f2f2 0%, #fff 28%, #fff 100%);
  color: var(--tm-black, #141414);
}

.calculator-page__epic-inner {
  width: 100%;
  max-width: 1720px;
  margin: 0 auto;
}

@media (min-width: 901px) {
  .calculator-page__epic {
    padding-inline: 60px;
  }
}
</style>
