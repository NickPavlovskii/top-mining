<template>
  <section
    id="buy-asic-models"
    class="buy-asic-models"
    aria-label="Актуальные модели ASIC"
  >
    <div class="buy-asic-models__desktop">
      <horizontal-carousel
        class="buy-asic-models__carousel"
        title="Актуальные модели"
        title-id="buy-asic-models-title"
        :gap="24"
      >
        <buy-asic-model-card
          v-for="(model, index) in models.items"
          :key="`carousel-${model.id}`"
          layout="carousel"
          :model="model"
          :mountain-bg="models.mountainBg"
          :coin-label="models.coinLabel"
          :price-prefix="models.pricePrefix"
          :cta-label="models.ctaLabel"
          :vendors="vendors"
          :type-delay-ms="index * 320"
          @cta="openPriceModal"
        />
      </horizontal-carousel>
    </div>

    <div class="buy-asic-models__grid">
      <buy-asic-model-card
        v-for="(model, index) in models.items"
        :key="`grid-${model.id}`"
        layout="grid"
        :model="model"
        :mountain-bg="models.mountainBg"
        :coin-label="models.coinLabel"
        :price-prefix="models.pricePrefix"
        :cta-label="models.ctaLabel"
        :vendors="vendors"
        :type-delay-ms="index * 320"
        @cta="openPriceModal"
      />
    </div>

    <buy-asic-model-price-modal
      v-model:open="isPriceModalOpen"
      :model="selectedModel"
    />
  </section>
</template>

<script setup lang="ts">
  import type { BuyAsicModel } from '~/common/modules/top-mining/buy-asic/page'
  import {
    BUY_ASIC_MODELS,
    BUY_ASIC_MODEL_VENDORS,
  } from '~/common/modules/top-mining/buy-asic/page'
  import BuyAsicModelCard from '~/components/buy-asic/models/BuyAsicModelCard.vue'
  import BuyAsicModelPriceModal from '~/components/buy-asic/models/BuyAsicModelPriceModal.vue'
  import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'

  const models = BUY_ASIC_MODELS
  const vendors = BUY_ASIC_MODEL_VENDORS
  const isPriceModalOpen = ref(false)
  const selectedModel = ref<BuyAsicModel | null>(null)

  function openPriceModal(model: BuyAsicModel) {
    selectedModel.value = model
    isPriceModalOpen.value = true
  }
</script>

<style scoped>
  .buy-asic-models {
    background: var(--tm-ink);
  }

  .buy-asic-models__desktop {
    display: block;
  }

  .buy-asic-models__grid {
    display: none;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 28px 20px;
    max-width: 1100px;
    margin: 0 auto;
    padding: 28px 24px 56px;
  }

  .buy-asic-models__carousel :deep(.horizontal-carousel) {
    background: transparent;
    padding: 40px 0 72px;
  }

  .buy-asic-models__carousel :deep(.horizontal-carousel__inner) {
    max-width: 1700px;
    padding: 0 40px;
  }

  .buy-asic-models__carousel :deep(.horizontal-carousel__header) {
    justify-content: flex-end;
    margin-bottom: 28px;
  }

  .buy-asic-models__carousel :deep(.horizontal-carousel__title) {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
    white-space: nowrap;
  }

  .buy-asic-models__carousel :deep(.horizontal-carousel__nav-btn) {
    background: #c94a12;
  }

  .buy-asic-models__carousel
    :deep(.horizontal-carousel__nav-btn:not(.horizontal-carousel__nav-btn--inactive)) {
    background: var(--tm-orange);
  }

  /* Планшет / средний экран: сетка 3×2 как на скрине (~1050px) */
  @media (max-width: 1439px) {
    .buy-asic-models__desktop {
      display: none;
    }

    .buy-asic-models__grid {
      display: grid;
    }
  }

  @media (max-width: 900px) {
    .buy-asic-models__grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 20px 14px;
      max-width: 720px;
      padding: 20px 16px 48px;
    }
  }

  @media (max-width: 760px) {
    .buy-asic-models__grid {
      gap: 16px 12px;
      padding-top: 20px;
      padding-bottom: 40px;
    }
  }
</style>
