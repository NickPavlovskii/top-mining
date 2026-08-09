<template>
  <div>
    <horizontal-carousel
      :title="placement.title"
      title-id="podbor-placement-title"
    >
      <template v-if="showSkeletons">
        <carousel-offer-card-skeleton
          v-for="n in 4"
          :key="`placement-skeleton-${n}`"
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
          :cta-label="placement.ctaLabel"
          @cta="openTariffModal(offer)"
        />
      </template>

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
  import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'
  import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'
  import CarouselOfferCardSkeleton from '~/components/carousel/CarouselOfferCardSkeleton.vue'
  import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

  type PlacementResponse = {
    offers: PodborPlacementOffer[]
  }

  const { placement } = usePodborMiningHotelPage()
  const isAddModalOpen = ref(false)
  const isTariffModalOpen = ref(false)
  const selectedOffer = ref<PodborPlacementOffer | null>(null)

  const { data, pending, error } = await useFetch<PlacementResponse>(
    '/api/podbor/placement',
    {
      key: 'podbor-placement-offers',
      default: () => ({ offers: [] }),
      ignoreResponseError: true,
    },
  )

  const offers = computed(() => data.value?.offers ?? [])
  const showSkeletons = computed(
    () => pending.value || Boolean(error.value) || offers.value.length === 0,
  )

  function openTariffModal(offer: PodborPlacementOffer) {
    selectedOffer.value = offer
    isTariffModalOpen.value = true
  }
</script>
