<template>
  <div
    class="podbor-logos"
    aria-label="Партнёры и майнинг-отели"
  >
    <div class="podbor-wrap-company-logo">
      <div
        v-for="partner in partners"
        :key="partner.src"
        class="podbor-company-logo-item"
      >
        <img
          :src="partner.src"
          :alt="partner.alt"
          loading="lazy"
          decoding="async"
        >
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_PARTNERS } from '~/common/modules/top-mining/podbor-mining-hotel'

  const partners = PODBOR_MINING_HOTEL_PARTNERS
</script>

<style scoped>
  .podbor-wrap-company-logo {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 523px;
    max-width: 100%;
    gap: 15px 0;
  }

  .podbor-company-logo-item {
    background: #fff;
    min-width: 63px;
    padding: 0 16px;
    height: 60px;
    border-radius: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: 0.3s;
  }

  .podbor-company-logo-item:hover {
    transform: scale(1.1);
  }

  .podbor-company-logo-item img {
    display: block;
    width: auto;
    max-width: 100%;
    height: auto;
    border-radius: 0;
  }

  @media (max-width: 1299px) {
    .podbor-wrap-company-logo {
      width: 100%;
      max-width: 420px;
      gap: 10px 0;
    }

    .podbor-company-logo-item {
      min-width: 48px;
      padding: 0 10px;
      height: 40px;
    }

    .podbor-company-logo-item img {
      max-height: 20px;
    }
  }

  @media (max-width: 900px) {
    .podbor-wrap-company-logo {
      max-width: 360px;
      gap: 12px 0;
    }

    .podbor-company-logo-item {
      min-width: 56px;
      padding: 0 12px;
      height: 48px;
    }

    .podbor-company-logo-item img {
      max-height: none;
    }
  }

  @media (max-width: 767px) {
    .podbor-wrap-company-logo {
      gap: 5px 6px;
      max-width: 293px;
      width: 100%;
      justify-content: flex-start;
    }

    .podbor-company-logo-item {
      height: 20px;
      min-width: auto;
      max-width: 112px;
      border-radius: 20px;
      padding: 0 7px;
    }

    .podbor-company-logo-item:nth-child(15) {
      width: 53px;
    }

    .podbor-company-logo-item:nth-child(15) img {
      max-height: fit-content;
    }

    .podbor-company-logo-item:nth-child(17) {
      width: 86px;
    }

    .podbor-company-logo-item:nth-child(17) img {
      max-height: fit-content;
    }

    .podbor-company-logo-item:nth-child(20) {
      width: 97px;
    }

    .podbor-company-logo-item img {
      width: auto;
      max-width: 100%;
      max-height: 12px;
    }
  }
</style>
