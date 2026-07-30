<template>
  <article
    :class="[
      'podbor-promo-banner',
      `podbor-promo-banner--${banner.variant}`,
    ]"
  >
    <template v-if="isHotel">
      <h2 class="podbor-promo-banner__title">
        {{ banner.title }}
      </h2>

      <div class="podbor-promo-banner__right">
        <p class="podbor-promo-banner__subtitle">
          {{ banner.subtitle }}
        </p>

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

      <div
        class="podbor-promo-banner__decor"
        aria-hidden="true"
      >
        <img
          class="podbor-promo-banner__decor-img podbor-promo-banner__decor-img--desktop"
          loading="lazy"
          decoding="async"
          alt=""
          :src="image"
        >
        <img
          v-if="imageMobile"
          class="podbor-promo-banner__decor-img podbor-promo-banner__decor-img--mobile"
          loading="lazy"
          decoding="async"
          alt=""
          :src="imageMobile"
        >
        <img
          v-if="imageMobileWide"
          class="podbor-promo-banner__decor-img podbor-promo-banner__decor-img--mobile-wide"
          loading="lazy"
          decoding="async"
          alt=""
          :src="imageMobileWide"
        >
      </div>
    </template>

    <template v-else>
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
    </template>
  </article>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import hotelDecorDesktop from '~/assets/images/buy-asic/mining-hotel-bg-1.png'
  import hotelDecorMobile from '~/assets/images/buy-asic/mining-hotel-bg-1-m.png'
  import hotelDecorMobileWide from '~/assets/images/buy-asic/mining-hotel-bg-all-m.png'
  import youMinerVisual from '~/assets/images/buy-asic/you-miner-bg.jpg'
  import asicVisual from '~/assets/images/podbor-majning-otelya/banner-asic-visual.png'
  import type { PodborPromoBanner } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const props = defineProps<{
    banner: PodborPromoBanner
  }>()

  const isHotel = computed(() => props.banner.variant === 'hotel')

  const image = computed(() => {
    if (props.banner.image) {
      return props.banner.image
    }

    if (props.banner.variant === 'hotel') {
      return hotelDecorDesktop
    }

    if (props.banner.variant === 'you-miner') {
      return youMinerVisual
    }

    return asicVisual
  })

  const imageMobile = computed(() => {
    if (props.banner.imageMobile) {
      return props.banner.imageMobile
    }

    return props.banner.variant === 'hotel' ? hotelDecorMobile : null
  })

  const imageMobileWide = computed(() =>
    props.banner.variant === 'hotel' ? hotelDecorMobileWide : null,
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

  .podbor-promo-banner--hotel {
    align-items: flex-start;
    gap: clamp(24px, 3vw, 48px);
    padding: 40px;
  }

  .podbor-promo-banner__text {
    position: relative;
    z-index: 1;
    flex: 1 1 auto;
    min-width: 0;
    max-width: 640px;
  }

  .podbor-promo-banner--you-miner {
    align-items: stretch;
    gap: 0;
    min-height: 420px;
    padding: 0 0 0 40px;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__text {
    align-self: center;
    max-width: 834px;
    padding-block: 40px;
    overflow: visible;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__title {
    width: min(914px, calc(100% + 40px));
    max-width: none;
    margin-top: 0;
    margin-left: -40px;
    margin-bottom: 60px;
    color: #ff741f;
    font-size: 126px;
    font-weight: 500;
    line-height: 1;
    white-space: normal;
    transform: rotate(-6.8deg);
    transform-origin: left center;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__subtitle {
    margin: 0 0 40px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__media {
    position: relative;
    flex: 1 1 48%;
    align-self: stretch;
    width: auto;
    max-width: min(52%, 852px);
    min-width: 280px;
    min-height: 100%;
    padding-right: 0;
  }

  .podbor-promo-banner--you-miner .podbor-promo-banner__image--desktop {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    max-width: none;
    max-height: none;
    border-radius: 0;
    object-fit: cover;
    object-position: center;
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

  .podbor-promo-banner--hotel .podbor-promo-banner__title {
    position: relative;
    z-index: 1;
    flex: 0 1 auto;
    max-width: 9.2em;
    margin: 0;
    color: #ff741f;
    font-size: 76px;
    font-weight: 500;
    line-height: 1.08;
  }

  .podbor-promo-banner__right {
    position: relative;
    z-index: 1;
    display: flex;
    flex: 1 1 auto;
    flex-direction: column;
    gap: 40px;
    max-width: 799px;
    min-width: 0;
  }

  .podbor-promo-banner__subtitle {
    margin: 0 0 28px;
    color: var(--tm-off-white);
    font-size: clamp(16px, 1.4vw, 20px);
    font-weight: 400;
    line-height: 1.4;
  }

  .podbor-promo-banner--hotel .podbor-promo-banner__subtitle {
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .podbor-promo-banner
    .podbor-promo-banner__button.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
    width: auto;
    max-width: max-content;
    min-width: 0;
  }

  .podbor-promo-banner__decor {
    position: absolute;
    right: 0;
    bottom: 0;
    z-index: 0;
    width: 633px;
    height: 176px;
    pointer-events: none;
  }

  .podbor-promo-banner__decor-img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center bottom;
  }

  .podbor-promo-banner__decor-img--mobile,
  .podbor-promo-banner__decor-img--mobile-wide {
    display: none;
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

  @media (max-width: 1730px) {
    .podbor-promo-banner--hotel .podbor-promo-banner__title {
      font-size: 64px;
      line-height: 1.08;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__right {
      max-width: 610px;
    }

    .podbor-promo-banner__decor {
      width: 549px;
      height: 161px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__title {
      width: min(677px, calc(100% + 40px));
      margin-left: -40px;
      margin-bottom: 50px;
      font-size: 106px;
      line-height: 1;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__text {
      max-width: 600px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__media {
      max-width: min(48%, 650px);
    }
  }

  @media (max-width: 1439px) {
    .podbor-promo-banner--hotel .podbor-promo-banner__title {
      max-width: 8.5em;
      font-size: 31px;
      font-weight: 600;
      line-height: 31px;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__subtitle {
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__right {
      max-width: 320px;
      gap: 20px;
      padding-right: 20px;
    }

    .podbor-promo-banner__decor {
      width: 263px;
      height: 69px;
    }

    .podbor-promo-banner__decor-img--desktop {
      display: none;
    }

    .podbor-promo-banner__decor-img--mobile {
      display: block;
    }

    .podbor-promo-banner--you-miner {
      padding-left: 30px;
      border-radius: 24px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__title {
      position: relative;
      z-index: 9;
      width: min(420px, calc(100% + 20px));
      max-width: 420px;
      margin-top: -26px;
      margin-left: -20px;
      margin-bottom: 12px;
      font-size: 60px;
      line-height: 1;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__text {
      max-width: 305px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__subtitle {
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__media {
      max-width: min(48%, 340px);
      min-width: 220px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-promo-banner {
      padding: 32px 0 32px 28px;
      border-radius: 32px;
    }

    .podbor-promo-banner--hotel {
      padding: 30px;
      border-radius: 24px;
    }

    .podbor-promo-banner--you-miner {
      padding-left: 30px;
      border-radius: 24px;
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

    .podbor-promo-banner--hotel {
      gap: 20px;
      padding: 40px 10px 101px;
      border-radius: 24px;
    }

    .podbor-promo-banner__text {
      max-width: none;
    }

    .podbor-promo-banner--asic .podbor-promo-banner__title {
      font-size: 32px;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__title {
      max-width: none;
      font-size: 40px;
      font-weight: 500;
      line-height: 1.08;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__right {
      max-width: none;
      gap: 20px;
      padding-right: 0;
    }

    .podbor-promo-banner--hotel .podbor-promo-banner__subtitle {
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-promo-banner--you-miner {
      gap: 20px;
      padding: 0 10px 40px;
      border-radius: 24px;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__text {
      display: flex;
      flex-direction: column;
      gap: 20px;
      max-width: none;
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__title {
      width: auto;
      max-width: none;
      margin-top: 0;
      margin-left: -12px;
      margin-bottom: 0;
      font-size: 50px;
      line-height: 54px;
      transform: rotate(-6.8deg);
    }

    .podbor-promo-banner--you-miner .podbor-promo-banner__subtitle {
      margin: 0;
      font-size: 14px;
      line-height: 20px;
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

    .podbor-promo-banner--you-miner .podbor-promo-banner__image--mobile {
      width: 100%;
      height: 220px;
      margin: 0;
      border-radius: 24px;
      object-fit: cover;
    }

    .podbor-promo-banner__decor {
      width: 100%;
      height: 104px;
    }

    .podbor-promo-banner__decor-img--mobile {
      display: none;
    }

    .podbor-promo-banner__decor-img--mobile-wide {
      display: block;
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
