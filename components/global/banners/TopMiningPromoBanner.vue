<template>
  <article class="tm-promo-banner">
    <div class="tm-promo-banner__content">
      <h2 class="tm-promo-banner__title">
        {{ title }}
      </h2>

      <nuxt-link
        class="tm-promo-banner__button"
        :to="href"
        :target="external ? '_blank' : undefined"
        :rel="external ? 'noopener noreferrer' : undefined"
      >
        <span>{{ buttonLabel }}</span>
        <consulting-diagonal-arrow-icon class="tm-promo-banner__button-icon" />
      </nuxt-link>
    </div>

    <div
      class="tm-promo-banner__media"
      aria-hidden="true"
    >
      <img
        class="tm-promo-banner__image"
        loading="lazy"
        decoding="async"
        :src="image"
        :alt="imageAlt"
      >
    </div>
  </article>
</template>

<script setup lang="ts">
  import ConsultingDiagonalArrowIcon from '~/components/consulting/icons/ConsultingDiagonalArrowIcon.vue'

  withDefaults(
    defineProps<{
      title: string
      href: string
      image: string
      imageAlt?: string
      buttonLabel?: string
      external?: boolean
    }>(),
    {
      imageAlt: '',
      buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
      external: false,
    },
  )
</script>

<style scoped>
  .tm-promo-banner {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    width: 100%;
    min-height: 280px;
    padding: 40px;
    overflow: hidden;
    border-radius: 40px;
    background: #fff;
    box-sizing: border-box;
  }

  .tm-promo-banner__content {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    flex: 1 1 auto;
    min-width: 0;
    max-width: 737px;
  }

  .tm-promo-banner__title {
    margin: 0 0 40px;
    color: var(--tm-ink);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-transform: uppercase;
  }

  .tm-promo-banner__button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    width: 329px;
    height: 48px;
    padding: 0;
    border: 1px solid #ec5100;
    border-radius: 100px;
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 48px;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background 0.2s ease,
      color 0.2s ease;
  }

  .tm-promo-banner__button:hover,
  .tm-promo-banner__button:focus-visible {
    background: transparent;
    color: var(--tm-ink);
  }

  .tm-promo-banner__button-icon {
    flex-shrink: 0;
    width: 15px;
    height: 15px;
  }

  .tm-promo-banner__media {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    width: min(48%, 640px);
    display: flex;
    align-items: center;
    justify-content: flex-end;
    pointer-events: none;
  }

  .tm-promo-banner__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
    object-position: right center;
  }

  @media (max-width: 1439px) {
    .tm-promo-banner {
      min-height: 200px;
      padding: 30px;
      border-radius: 24px;
    }

    .tm-promo-banner__content {
      max-width: 400px;
    }

    .tm-promo-banner__title {
      margin-bottom: 20px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .tm-promo-banner__media {
      width: min(42%, 360px);
    }
  }

  @media (max-width: 767px) {
    .tm-promo-banner {
      min-height: 0;
      flex-direction: column;
      align-items: stretch;
      gap: 20px;
      padding: 15px 10px 20px;
      border-radius: 24px;
    }

    .tm-promo-banner__content {
      max-width: none;
    }

    .tm-promo-banner__title {
      max-width: 258px;
      margin-bottom: 20px;
      font-size: 20px;
      line-height: 28px;
    }

    .tm-promo-banner__button {
      width: 241px;
      font-size: 12px;
      line-height: 22px;
    }

    .tm-promo-banner__media {
      position: relative;
      top: auto;
      right: auto;
      bottom: auto;
      width: 100%;
      height: 160px;
      order: -1;
      justify-content: center;
    }

    .tm-promo-banner__image {
      object-position: center;
    }
  }
</style>
