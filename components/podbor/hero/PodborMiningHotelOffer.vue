<template>
  <section
    class="podbor-offer"
    aria-labelledby="podbor-offer-title"
  >
    <article class="podbor-offer__card">
      <h2
        id="podbor-offer-title"
        class="podbor-offer__title"
      >
        <strong>{{ offer.titleLead }}</strong>{{ offer.titleRest }}
      </h2>

      <top-mining-icon-list
        class="podbor-offer__list"
        :items="offer.benefits"
        :icon-src="checkIcon"
      />
    </article>
  </section>
</template>

<script setup lang="ts">
  import checkIcon from '~/assets/images/podbor-majning-otelya/check-icon.png'
  import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'

  const { offer } = usePodborMiningHotelPage()
</script>

<style scoped>
  .podbor-offer {
    width: 100%;
    min-width: 0;
  }

  .podbor-offer__card {
    background: #1f1f1f;
    border-radius: 32px;
    padding: 40px;
    box-sizing: border-box;
  }

  .podbor-offer__title {
    margin: 0 0 24px;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-offer__title strong {
    font-weight: 700;
  }

  .podbor-offer__list :deep(.top-mining-icon-list) {
    gap: 20px;
  }

  .podbor-offer__list :deep(.top-mining-icon-list__item) {
    align-items: center;
    gap: 15px;
  }

  @media (max-width: 1600px) {
    .podbor-offer__card {
      padding: 30px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list) {
      gap: 15px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-offer {
      height: 100%;
    }

    .podbor-offer__card {
      height: 100%;
      padding: 24px;
    }

    .podbor-offer__title {
      font-size: 16px;
      line-height: 22px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list__item) {
      font-size: 15px;
      line-height: 22px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list__icon) {
      width: 28px;
      height: 28px;
    }
  }

  @media (max-width: 767px) {
    .podbor-offer__card {
      border-radius: 16px;
      padding: 16px;
    }

    .podbor-offer__title {
      font-size: 14px;
      line-height: 20px;
      margin-bottom: 16px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list) {
      gap: 12px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list__item) {
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-offer__list :deep(.top-mining-icon-list__icon) {
      width: 24px;
      height: 24px;
    }
  }
</style>
