<template>
  <section
    class="podbor-cta-section"
    aria-label="Действия по размещению"
  >
    <div class="podbor-cta-section__inner">
      <podbor-mining-hotel-cta-card
        v-for="card in cards"
        :key="card.id"
        :title-parts="card.titleParts"
        :description="card.description"
        :button-label="card.buttonLabel"
        :button-icon="card.buttonIcon"
        :image="card.image"
        :image-alt="card.imageAlt"
        @action="onAction(card.id)"
      />
    </div>

    <podbor-mining-hotel-add-card-modal
      v-model:open="isLeadModalOpen"
      :copy="leadModalCopy"
    />
  </section>
</template>

<script setup lang="ts">
  import type { PodborAddCardModalCopy } from '~/common/modules/top-mining/podbor-mining-hotel'
  import { PODBOR_MINING_HOTEL_CTA } from '~/common/modules/top-mining/podbor-mining-hotel'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelCtaCard from '~/components/podbor/cta/PodborMiningHotelCtaCard.vue'

  const cards = PODBOR_MINING_HOTEL_CTA.cards
  const isLeadModalOpen = ref(false)
  const leadModalCopy = ref<PodborAddCardModalCopy>(
    PODBOR_MINING_HOTEL_CTA.getOffersModal,
  )

  function onAction(id: string) {
    if (id === 'get-offers') {
      leadModalCopy.value = PODBOR_MINING_HOTEL_CTA.getOffersModal
      isLeadModalOpen.value = true
      return
    }

    if (id === 'add-card') {
      leadModalCopy.value = PODBOR_MINING_HOTEL_CTA.addCardModal
      isLeadModalOpen.value = true
    }
  }
</script>

<style scoped>
  .podbor-cta-section {
    background: #141414;
    padding: 24px 0 72px;
  }

  .podbor-cta-section__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
    align-items: stretch;
  }

  @media (max-width: 1600px) {
    .podbor-cta-section__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-cta-section__inner {
      padding: 0 24px;
      gap: 20px;
    }
  }

  @media (max-width: 899px) {
    .podbor-cta-section {
      padding: 8px 0 56px;
    }

    .podbor-cta-section__inner {
      grid-template-columns: 1fr;
      padding: 0 16px;
      gap: 16px;
    }
  }
</style>
