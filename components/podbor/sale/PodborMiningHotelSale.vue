<template>
  <div>
    <horizontal-carousel
      :title="sale.title"
      title-id="podbor-sale-title"
    >
      <carousel-offer-card
        v-for="offer in sale.offers"
        :key="offer.id"
        :title="offer.title"
        :meta-label="offer.priceLabel"
        :meta-value="offer.priceValue"
        :location="offer.location"
        :image="offer.image"
        :cta-label="sale.ctaLabel"
        @cta="openPriceModal(offer)"
      />

      <carousel-add-card
        :label="sale.addCardLabel"
        @click="isAddModalOpen = true"
      />
    </horizontal-carousel>

    <podbor-mining-hotel-add-card-modal
      v-model:open="isAddModalOpen"
      :copy="sale.modal"
    />
    <podbor-mining-hotel-tariff-modal
      v-model:open="isPriceModalOpen"
      :offer="selectedOffer"
      :copy="sale.priceModal"
    />
  </div>
</template>

<script setup lang="ts">
  import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor-mining-hotel'
  import { PODBOR_MINING_HOTEL_SALE } from '~/common/modules/top-mining/podbor-mining-hotel'
  import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'
  import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'
  import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

  const sale = PODBOR_MINING_HOTEL_SALE
  const isAddModalOpen = ref(false)
  const isPriceModalOpen = ref(false)
  const selectedOffer = ref<PodborPlacementOffer | null>(null)

  function openPriceModal(offer: PodborPlacementOffer) {
    selectedOffer.value = offer
    isPriceModalOpen.value = true
  }
</script>
