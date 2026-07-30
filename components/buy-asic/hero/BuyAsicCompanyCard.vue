<template>
  <article class="buy-asic-company-card">
    <img
      class="buy-asic-company-card__logo"
      loading="lazy"
      decoding="async"
      :src="company.logo"
      :alt="company.name"
    >

    <div class="buy-asic-company-card__meta">
      <span class="buy-asic-company-card__rating">{{ company.rating }}</span>
      <span
        class="buy-asic-company-card__dot"
        aria-hidden="true"
      />
      <span class="buy-asic-company-card__reviews">
        Отзывов: {{ company.reviews }}
      </span>
    </div>

    <p
      v-if="company.priceLabel"
      class="buy-asic-company-card__price"
    >
      Цена за кВт/ч: {{ company.priceLabel }}
    </p>
  </article>
</template>

<script setup lang="ts">
  import type { BuyAsicCompany } from '~/common/modules/top-mining/buy-asic-page'

  defineProps<{
    company: BuyAsicCompany
  }>()
</script>

<style scoped>
  .buy-asic-company-card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 12px;
    width: 292px;
    height: 120px;
    padding: 20px;
    border-radius: 24px;
    background: linear-gradient(180deg, #343434 0%, #1f1e1e 90.43%);
    color: #fff;
  }

  @media (min-width: 1440px) {
    .buy-asic-company-card {
      width: 220px;
      height: 92px;
      padding: 14px;
      border-radius: 18px;
      gap: 8px;
    }

    .buy-asic-company-card__logo {
      width: 32px;
      height: 32px;
      border-radius: 6px;
    }

    .buy-asic-company-card__meta {
      gap: 6px;
      font-size: 12px;
    }

    .buy-asic-company-card__rating::after {
      font-size: 10px;
    }

    .buy-asic-company-card__price {
      font-size: 11px;
    }
  }

  .buy-asic-company-card__logo {
    width: 40px;
    height: 40px;
    border-radius: 8px;
    object-fit: contain;
    background: #fff;
  }

  .buy-asic-company-card__meta {
    display: flex;
    align-items: center;
    gap: 8px;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.2;
  }

  .buy-asic-company-card__rating {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-weight: 600;
  }

  .buy-asic-company-card__rating::after {
    content: '★';
    color: #fc0;
    font-size: 12px;
  }

  .buy-asic-company-card__dot {
    width: 4px;
    height: 4px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.45);
  }

  .buy-asic-company-card__reviews {
    color: rgba(255, 255, 255, 0.85);
  }

  .buy-asic-company-card__price {
    margin: 0;
    color: rgba(255, 255, 255, 0.7);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 12px;
    line-height: 1.2;
  }

  @media (max-width: 1439px) {
    .buy-asic-company-card {
      width: 147px;
      height: 86px;
      padding: 10px;
      border-radius: 16px;
      gap: 6px;
    }

    .buy-asic-company-card__logo {
      width: 28px;
      height: 28px;
      border-radius: 6px;
    }

    .buy-asic-company-card__meta {
      gap: 4px;
      font-size: 11px;
    }

    .buy-asic-company-card__price {
      font-size: 10px;
    }
  }

  @media (min-width: 768px) and (max-width: 1439px) {
    .buy-asic-company-card {
      width: 168px;
      height: 88px;
      padding: 12px;
      border-radius: 16px;
      gap: 8px;
    }

    .buy-asic-company-card__logo {
      width: 30px;
      height: 30px;
    }

    .buy-asic-company-card__meta {
      font-size: 11px;
    }
  }
</style>
