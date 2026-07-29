<template>
  <section
    class="increase-income-promo"
    aria-label="Промо-баннеры"
  >
    <div class="increase-income-promo__inner">
      <top-mining-promo-banner
        v-for="card in copy.promoCards"
        :key="card.id"
        :title="card.title"
        :href="card.href"
        :button-label="card.buttonLabel"
        :image="card.image"
        :image-alt="card.imageAlt"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import { INCREASE_INCOME_PAGE } from '~/common/modules/top-mining/increase-income-page'
  import TopMiningPromoBanner from '~/components/global/banners/TopMiningPromoBanner.vue'

  const copy = INCREASE_INCOME_PAGE
</script>

<style scoped>
  .increase-income-promo {
    position: relative;
    z-index: 12;
    margin-top: -64px;
    padding: 144px 0 152px;
    border-radius: 64px 64px 0 0;
    background: #f6f6f6;
  }

  .increase-income-promo__inner {
    display: flex;
    flex-direction: column;
    gap: 48px;
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  @media (max-width: 1439px) {
    .increase-income-promo {
      margin-top: -32px;
      padding: 88px 0 110px;
      border-radius: 32px 32px 0 0;
    }

    .increase-income-promo__inner {
      gap: 40px;
      padding: 0 24px;
    }
  }

  @media (max-width: 767px) {
    .increase-income-promo {
      margin-top: -24px;
      padding: 56px 0 80px;
      border-radius: 24px 24px 0 0;
    }

    .increase-income-promo__inner {
      gap: 30px;
      padding: 0 16px;
    }
  }
</style>
