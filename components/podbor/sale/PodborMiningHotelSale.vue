<template>
  <div>
    <horizontal-carousel
      :title="sale.title"
      title-id="podbor-sale-title"
    >
      <template v-if="showSkeletons">
        <carousel-offer-card-skeleton
          v-for="n in 4"
          :key="`sale-skeleton-${n}`"
        />
      </template>

      <template v-else>
        <carousel-offer-card
          v-for="offer in offers"
          :key="offer.id"
          :title="offer.title"
          :meta-label="offer.priceLabel"
          :meta-value="offer.priceValue"
          :location="offer.location"
          :image="offer.image"
          :cta-label="sale.ctaLabel"
          @cta="openPriceModal(offer)"
        />
      </template>

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
  import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor/mining-hotel'
  import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'
  import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'
  import CarouselOfferCardSkeleton from '~/components/carousel/CarouselOfferCardSkeleton.vue'
  import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

  type SaleResponse = {
    offers: PodborPlacementOffer[]
  }

  const { sale } = usePodborMiningHotelPage()
  const isAddModalOpen = ref(false)
  const isPriceModalOpen = ref(false)
  const selectedOffer = ref<PodborPlacementOffer | null>(null)

  const { data, pending, error } = await useFetch<SaleResponse>(
    '/api/podbor/sale',
    {
      key: 'podbor-sale-offers',
      default: () => ({ offers: [] }),
      ignoreResponseError: true,
    },
  )

  const offers = computed(() => data.value?.offers ?? [])
  const showSkeletons = computed(
    () => pending.value || Boolean(error.value) || offers.value.length === 0,
  )

  function openPriceModal(offer: PodborPlacementOffer) {
    selectedOffer.value = offer
    isPriceModalOpen.value = true
  }
</script>
