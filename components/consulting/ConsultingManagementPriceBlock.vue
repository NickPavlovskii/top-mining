<template>
  <div class="consulting-management-price">
    <p class="consulting-management-price__label">
      {{ priceLabel }}
    </p>
    <p class="consulting-management-price__value">
      {{ priceValue }}
    </p>

    <div class="consulting-management-price__actions">
      <a
        class="consulting-management-price__cta"
        :href="ctaHref"
      >
        <span>{{ ctaLabel }}</span>
        <consulting-diagonal-arrow-icon />
      </a>

      <nuxt-link
        v-if="detailsLabel && detailsHref"
        :class="[
          'consulting-management-price__details',
          detailsVariant === 'trans' && 'consulting-management-price__details--trans',
        ]"
        :to="detailsHref"
      >
        <span>{{ detailsLabel }}</span>
        <consulting-diagonal-arrow-icon />
      </nuxt-link>
    </div>
  </div>
</template>

<script setup lang="ts">
  defineProps<{
    priceLabel: string
    priceValue: string
    ctaLabel: string
    ctaHref: string
    detailsLabel?: string
    detailsHref?: string
    detailsVariant?: 'trans'
  }>()
</script>

<style scoped>
  .consulting-management-price {
    position: relative;
    z-index: 10;
    box-sizing: border-box;
    width: 100%;
    margin-top: 40px;
    padding: 40px;
    border: 1px solid var(--tm-orange-accent-deep);
    border-radius: 64px;
  }

  .consulting-management-price__label {
    margin: 0 0 10px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-transform: uppercase;
  }

  .consulting-management-price__value {
    margin: 0 0 20px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 40px;
    font-weight: 500;
    line-height: 50px;
    text-transform: uppercase;
  }

  .consulting-management-price__actions {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    align-items: center;
    width: 100%;
  }

  .consulting-management-price__cta,
  .consulting-management-price__details {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    height: 56px;
    padding: 0 32px;
    border-radius: 100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 22px;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background 0.2s ease,
      color 0.2s ease,
      border-color 0.2s ease;
  }

  .consulting-management-price__cta {
    border: 1px solid var(--tm-orange-accent-deep);
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-accent-deep) 2.06%,
      var(--tm-orange-accent-light) 93.25%
    );
    color: #fff;
  }

  .consulting-management-price__cta:hover {
    background: transparent;
    color: var(--tm-page-bg);
  }

  .consulting-management-price__details {
    border: 1px solid var(--tm-orange-accent-light);
    background: transparent;
    color: var(--tm-page-bg);
  }

  .consulting-management-price__details--trans {
    height: 56px;
    padding: 16px 32px;
    font-weight: 300;
    text-transform: none;
  }

  .consulting-management-price__details:hover {
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-accent-light) 2.04%,
      var(--tm-orange-accent-deep) 49.92%
    );
    color: #fff;
  }

  .consulting-management-price__details--trans:hover :deep(svg path) {
    stroke: #fff;
  }

  .consulting-management-price__cta :deep(svg),
  .consulting-management-price__details :deep(svg) {
    width: 12px;
    height: 12px;
  }

  @media (max-width: 1299px) {
    .consulting-management-price {
      margin-top: 20px;
      padding: 20px;
      border-radius: 24px;
    }

    .consulting-management-price__label {
      font-size: 14px;
      line-height: 20px;
    }

    .consulting-management-price__value {
      font-size: 24px;
      line-height: 29.76px;
    }

    .consulting-management-price__cta,
    .consulting-management-price__details {
      gap: 12px;
      height: 38px;
      padding: 8px 16px;
      font-size: 12px;
      line-height: 22px;
    }

    .consulting-management-price__cta {
      width: 100%;
      max-width: none;
    }

    .consulting-management-price__details {
      width: 100%;
      max-width: none;
    }

    .consulting-management-price__details--trans {
      align-self: center;
      width: auto;
      min-width: 200px;
    }

    .consulting-management-price__actions {
      flex-direction: column;
      gap: 10px;
    }
  }
</style>
