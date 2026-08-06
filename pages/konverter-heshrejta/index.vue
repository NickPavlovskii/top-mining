<script setup lang="ts">
import ConverterHero from '~/components/converter/ConverterHero.vue'
import HashrateConverterWidget from '~/components/converter/HashrateConverterWidget.vue'
import ConverterAbout from '~/components/converter/ConverterAbout.vue'
import ConverterFaq from '~/components/converter/ConverterFaq.vue'
import TopMiningEpicBlocks from '~/components/top-mining/TopMiningEpicBlocks.vue'

definePageMeta({
  path: '/konverter-heshrejta',
  hideFooterContact: true,
})

const { t } = useT()

useSeoMeta({
  title: () => t('converter.seoTitle'),
  description: () => t('converter.seoDescription'),
})
</script>

<template>
  <div class="hashrate-converter-page">
    <ConverterHero />
    <HashrateConverterWidget />
    <ConverterAbout />
    <ConverterFaq />
    <div class="hashrate-converter-page__epic">
      <div class="hashrate-converter-page__epic-inner">
        <TopMiningEpicBlocks hide-converter />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.hashrate-converter-page {
  display: flex;
  flex-direction: column;
  background: var(--tm-ink, #1a1a1a);
  color: var(--tm-white, #fff);
}

.hashrate-converter-page__epic {
  position: relative;
  z-index: 2;
  width: 100%;
  margin-top: 0;
  padding:
    clamp(40px, 5vw, 72px)
    clamp(16px, 2vw, 32px)
    clamp(40px, 5vw, 80px);
  border-radius: 0;
  background: linear-gradient(
    180deg,
    #fff 0%,
    #fff 10%,
    #f6f6f6 28%,
    #f2f2f2 42%,
    #fff 68%,
    #fff 100%
  );
  color: var(--tm-black, #141414);
}

.hashrate-converter-page__epic-inner {
  width: 100%;
  max-width: 1720px;
  margin: 0 auto;
}

@media (min-width: 901px) {
  .hashrate-converter-page__epic {
    padding-inline: 60px;
  }
}
</style>
