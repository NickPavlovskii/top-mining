<template>
  <section
    class="buy-asic-promo-banners"
    aria-label="Промо-баннеры"
  >
    <div class="buy-asic-promo-banners__inner">
      <podbor-mining-hotel-promo-banner
        v-for="banner in banners"
        :key="banner.id"
        :banner="banner"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import PodborMiningHotelPromoBanner from '~/components/podbor/banners/PodborMiningHotelPromoBanner.vue'

  const { promoBanners } = useBuyAsicPage()
  const banners = computed(() => promoBanners.value.items)
</script>

<style scoped>
  .buy-asic-promo-banners {
    background: var(--tm-ink);
    padding: 0 0 88px;
  }

  .buy-asic-promo-banners__inner {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 24px;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  @media (max-width: 900px) {
    .buy-asic-promo-banners {
      padding: 0 0 56px;
    }

    .buy-asic-promo-banners__inner {
      gap: 16px;
      padding: 0 16px;
    }
  }
</style>
