<script setup lang="ts">
import CalculatorHero from '~/components/calculator/hero/CalculatorHero.vue'
import CalculatorForm from '~/components/calculator/form/CalculatorForm.vue'
import CalculatorAbout from '~/components/calculator/about/CalculatorAbout.vue'
import TopMiningEpicBlocks from '~/components/top-mining/TopMiningEpicBlocks.vue'

const { t } = useT()

useSeoMeta({
  title: () => t('calculator.seoTitle'),
  description: () => t('calculator.seoDescription'),
})
</script>

<template>
  <div class="calculator-page">
    <calculator-hero />
    <calculator-form />
    <calculator-about />
    <div class="calculator-page__epic">
      <div class="calculator-page__epic-inner">
        <top-mining-epic-blocks />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.calculator-page {
  display: flex;
  flex-direction: column;
  gap: 0;
  background: var(--tm-surface-dark);
  color: var(--tm-white);
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
  background: linear-gradient(
    180deg,
    var(--tm-surface-mist) 0%,
    var(--tm-white) 28%,
    var(--tm-white) 100%
  );
  color: var(--tm-page-bg);
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
