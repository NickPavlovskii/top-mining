<template>
  <article
    :class="[
      'podbor-promo-banner',
      `podbor-promo-banner--${banner.variant}`,
    ]"
  >
    <div class="podbor-promo-banner__text">
      <h2 class="podbor-promo-banner__title">
        {{ banner.title }}
      </h2>

      <p class="podbor-promo-banner__subtitle">
        {{ banner.subtitle }}
      </p>

      <img
        class="podbor-promo-banner__image podbor-promo-banner__image--mobile"
        loading="lazy"
        decoding="async"
        :src="image"
        :alt="banner.imageAlt"
      >

      <top-mining-button
        class="podbor-promo-banner__button"
        preset="contact-pill"
        variant="primary"
        size="big"
        surface="dark"
        :title="banner.buttonLabel"
        :href="banner.href"
        :target="linkTarget"
        :append-icon="arrowIcon"
      />
    </div>

    <div class="podbor-promo-banner__media">
      <img
        class="podbor-promo-banner__image podbor-promo-banner__image--desktop"
        loading="lazy"
        decoding="async"
        :src="image"
        :alt="banner.imageAlt"
      >
    </div>
  </article>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import asicVisual from '~/assets/images/podbor-majning-otelya/banner-asic-visual.png'
  import minerVisual from '~/assets/images/podbor-majning-otelya/banner-miner-visual.png'
  import type { PodborPromoBanner } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const props = defineProps<{
    banner: PodborPromoBanner
  }>()

  const image = computed(() =>
    props.banner.variant === 'asic' ? asicVisual : minerVisual,
  )

  const linkTarget = computed(() =>
    props.banner.external ? '_blank' : undefined,
  )
</script>

<style scoped>
  .podbor-promo-banner {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    width: 100%;
    overflow: hidden;
    position: relative;
    padding: 40px 0 40px 40px;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .podbor-promo-banner__text {
    position: relative;
    z-index: 1;
    flex: 1 1 auto;
    min-width: 0;
    max-width: 640px;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__text {
    max-width: none;
    overflow: visible;
  }

  .podbor-promo-banner__title {
    margin: 0 0 24px;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
  }

  .podbor-promo-banner--asic .podbor-promo-banner__title {
    font-size: clamp(36px, 4.4vw, 64px);
    line-height: 1.05;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__title {
    width: max-content;
    max-width: none;
    margin-top: 0;
    margin-left: -83px;
    margin-bottom: 60px;
    font-size: clamp(56px, 7.2vw, 126px);
    white-space: nowrap;
    transform: rotate(-6.8deg);
    transform-origin: left center;
  }

  .podbor-promo-banner__subtitle {
    margin: 0 0 28px;
    color: var(--tm-off-white);
    font-size: clamp(16px, 1.4vw, 20px);
    font-weight: 400;
    line-height: 1.4;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__subtitle {
    margin-bottom: 32px;
  }

  .podbor-promo-banner
    .podbor-promo-banner__button.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
    width: auto;
    max-width: max-content;
    min-width: 0;
  }

  .podbor-promo-banner__media {
    flex: 0 0 auto;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    align-self: stretch;
    max-width: min(52%, 720px);
  }

  .podbor-promo-banner__image {
    display: block;
    width: 100%;
    height: auto;
  }

  .podbor-promo-banner__image--mobile {
    display: none;
    margin: 0 0 24px;
    border-radius: 24px;
  }

  .podbor-promo-banner--asic .podbor-promo-banner__image--desktop {
    width: min(100%, 620px);
    max-height: 360px;
    object-fit: contain;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__media {
    max-width: min(48%, 560px);
    padding-right: 24px;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__image--desktop {
    width: 100%;
    max-height: 360px;
    border-radius: 28px;
    object-fit: cover;
  }

  @media (max-width: 1299px) {
    .podbor-promo-banner {
      padding: 32px 0 32px 28px;
      border-radius: 32px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__title {
      margin-left: -48px;
      margin-bottom: 40px;
      font-size: clamp(48px, 6.4vw, 88px);
    }
  }

  @media (max-width: 899px) {
    .podbor-promo-banner {
      flex-direction: column;
      align-items: stretch;
      gap: 0;
      padding: 28px 20px;
      border-radius: 28px;
    }

    .podbor-promo-banner__text {
      max-width: none;
    }

    .podbor-promo-banner--asic .podbor-promo-banner__title {
      font-size: 32px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__title {
      width: auto;
      max-width: 100%;
      margin-left: -12px;
      margin-bottom: 20px;
      font-size: clamp(36px, 12vw, 48px);
      white-space: normal;
    }

    .podbor-promo-banner__subtitle {
      margin-bottom: 20px;
      font-size: 16px;
    }

    .podbor-promo-banner__image--mobile {
      display: block;
    }

    .podbor-promo-banner__media {
      display: none;
    }

    .podbor-promo-banner
      .podbor-promo-banner__button.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
      width: 100%;
      max-width: 100%;
      min-height: 48px;
    }

    .podbor-promo-banner__button :deep(.top-mining-button__inner) {
      justify-content: center;
    }
  }
</style>
