<template>
  <section
    class="podbor-promo-banners"
    aria-label="Промо-баннеры"
  >
    <div class="podbor-promo-banners__inner">
      <podbor-mining-hotel-promo-banner
        v-for="banner in banners"
        :key="banner.id"
        :banner="banner"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_BANNERS } from '~/common/modules/top-mining/podbor/mining-hotel'
  import PodborMiningHotelPromoBanner from '~/components/podbor/banners/PodborMiningHotelPromoBanner.vue'

  const banners = PODBOR_MINING_HOTEL_BANNERS.items
</script>

<style scoped>
  .podbor-promo-banners {
    background: var(--tm-page-bg);
    padding: 0 0 48px;
  }

  .podbor-promo-banners__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
    display: flex;
    flex-direction: column;
    gap: 24px;
  }

  @media (max-width: 1600px) {
    .podbor-promo-banners__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-promo-banners__inner {
      padding: 0 50px;
      gap: 40px;
    }
  }

  @media (max-width: 899px) {
    .podbor-promo-banners {
      padding: 0 0 32px;
    }

    .podbor-promo-banners__inner {
      padding: 0 16px;
      gap: 16px;
    }
  }
</style>
