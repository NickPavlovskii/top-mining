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

      <ul class="podbor-offer__benefits">
        <li
          v-for="(item, index) in offer.benefits"
          :key="index"
          class="podbor-offer__benefit"
        >
          <img
            class="podbor-offer__check"
            alt=""
            aria-hidden="true"
            :src="checkIcon"
          >
          <span class="podbor-offer__benefit-text">{{ item }}</span>
        </li>
      </ul>
    </article>
  </section>
</template>

<script setup lang="ts">
  import checkIcon from '~/assets/images/podbor-majning-otelya/check-icon.png'
  import { PODBOR_MINING_HOTEL_OFFER } from '~/common/modules/top-mining/podbor-mining-hotel'

  const offer = PODBOR_MINING_HOTEL_OFFER
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

  .podbor-offer__benefits {
    margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .podbor-offer__benefit {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 15px;
  }

  .podbor-offer__check {
    flex-shrink: 0;
    width: 32px;
    height: 32px;
    display: block;
    object-fit: contain;
  }

  .podbor-offer__benefit-text {
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  @media (max-width: 1600px) {
    .podbor-offer__card {
      padding: 30px;
    }

    .podbor-offer__benefits {
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

    .podbor-offer__benefit-text {
      font-size: 15px;
      line-height: 22px;
    }

    .podbor-offer__check {
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

    .podbor-offer__check {
      width: 24px;
      height: 24px;
    }

    .podbor-offer__benefit-text {
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-offer__benefits {
      gap: 12px;
    }
  }
</style>
