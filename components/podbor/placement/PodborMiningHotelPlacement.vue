<template>
  <div>
    <horizontal-carousel
      :title="placement.title"
      title-id="podbor-placement-title"
    >
      <carousel-offer-card
        v-for="offer in placement.offers"
        :key="offer.id"
        :title="offer.title"
        :meta-label="offer.priceLabel"
        :meta-value="offer.priceValue"
        :location="offer.location"
        :image="offer.image"
        :cta-label="placement.ctaLabel"
        @cta="openTariffModal(offer)"
      />

      <carousel-add-card
        :label="placement.addCardLabel"
        @click="isAddModalOpen = true"
      />
    </horizontal-carousel>

    <podbor-mining-hotel-add-card-modal v-model:open="isAddModalOpen" />
    <podbor-mining-hotel-tariff-modal
      v-model:open="isTariffModalOpen"
      :offer="selectedOffer"
    />
  </div>
</template>

<script setup lang="ts">
  import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor/mining-hotel'
  import { PODBOR_MINING_HOTEL_PLACEMENT } from '~/common/modules/top-mining/podbor/mining-hotel'
  import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'
  import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'
  import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

  const placement = PODBOR_MINING_HOTEL_PLACEMENT
  const isAddModalOpen = ref(false)
  const isTariffModalOpen = ref(false)
  const selectedOffer = ref<PodborPlacementOffer | null>(null)

  function openTariffModal(offer: PodborPlacementOffer) {
    selectedOffer.value = offer
    isTariffModalOpen.value = true
  }
</script>
