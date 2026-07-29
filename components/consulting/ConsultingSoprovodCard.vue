<template>
  <article
    :class="[
      'consulting-soprovod-card',
      card.variant === 'hotel' && 'consulting-soprovod-card--hotel',
    ]"
  >
    <div class="consulting-soprovod-card__top">
      <img
        v-if="card.mobileImage"
        class="consulting-soprovod-card__mobile-image"
        width="704"
        height="172"
        loading="lazy"
        decoding="async"
        :src="card.mobileImage"
        :alt="card.mobileImageAlt ?? card.titleMobile"
      >

      <div class="consulting-soprovod-card__left">
        <div class="consulting-soprovod-card__title consulting-soprovod-card__title--desktop">
          {{ card.titleLines[0] }}<br>
          {{ card.titleLines[1] }}
        </div>
        <div class="consulting-soprovod-card__title consulting-soprovod-card__title--mobile">
          {{ card.titleMobile }}
        </div>
        <p class="consulting-soprovod-card__subtitle">
          {{ card.subtitle }}
        </p>
      </div>

      <div class="consulting-soprovod-card__right">
        <ul class="consulting-soprovod-card__list">
          <li
            v-for="(benefit, index) in card.benefits"
            :key="`${card.id}-${index}`"
            :class="[
              'consulting-soprovod-card__list-item',
              benefit.type === 'lead' && 'consulting-soprovod-card__list-item--no-style',
            ]"
          >
            <template v-if="benefit.type === 'lead'">
              <div>{{ benefit.text }}</div>
            </template>
            <template v-else>
              <div
                class="consulting-soprovod-card__ok-or-big"
                aria-hidden="true"
              />
              <div
                v-if="benefit.layout === 'cont'"
                class="consulting-soprovod-card__cont"
              >
                {{ benefit.text }}
              </div>
              <template v-else>
                {{ benefit.text }}
              </template>
            </template>
          </li>
        </ul>

        <p class="consulting-soprovod-card__footnote">
          {{ card.footnote }}
        </p>
      </div>
    </div>

    <div class="consulting-soprovod-card__bottom">
      <div
        :class="[
          'consulting-soprovod-card__bottom-art',
          `consulting-soprovod-card__bottom-art--${card.bottomImageVariant}`,
        ]"
        :style="bottomArtStyle"
        aria-hidden="true"
      />

      <p class="consulting-soprovod-card__price-label">
        {{ card.priceLabel }}
      </p>
      <p class="consulting-soprovod-card__price-value">
        {{ card.priceValue }}
      </p>

      <div class="consulting-soprovod-card__actions">
        <a
          class="consulting-soprovod-card__cta"
          :href="card.ctaHref"
        >
          <span>{{ card.ctaLabel }}</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="15"
            height="15"
            viewBox="0 0 15 15"
            fill="none"
            aria-hidden="true"
          >
            <path
              d="M4 1H14M14 1V11M14 1L4 11L1 14"
              stroke="currentColor"
            />
          </svg>
        </a>

        <nuxt-link
          class="consulting-soprovod-card__details"
          :to="card.detailsHref"
        >
          <span>{{ card.detailsLabel }}</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="15"
            height="15"
            viewBox="0 0 15 15"
            fill="none"
            aria-hidden="true"
          >
            <path
              d="M4 1H14M14 1V11M14 1L4 11L1 14"
              stroke="currentColor"
            />
          </svg>
        </nuxt-link>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  import type { ConsultingSoprovodCard } from '~/common/modules/top-mining/consulting-soprovod'
  import okOrBig from '~/assets/images/consulting/ok-or-big.png'

  const props = defineProps<{
    card: ConsultingSoprovodCard
  }>()

  const okOrBigUrl = `url(${okOrBig})`

  const bottomArtStyle = computed(() => ({
    '--bottom-art': `url(${props.card.bottomImage})`,
    '--bottom-art-compact': props.card.bottomImageCompact
      ? `url(${props.card.bottomImageCompact})`
      : `url(${props.card.bottomImage})`,
  }))
</script>

<style scoped>
  .consulting-soprovod-card {
    display: flex;
    flex-direction: column;
    gap: 48px;
    margin-bottom: 24px;
    padding: 56px;
    border-radius: 64px;
    background: #1f1f1f;
    box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    color: #fff;
    overflow: hidden;
  }

  .consulting-soprovod-card:last-child {
    margin-bottom: 0;
  }

  .consulting-soprovod-card__top {
    display: flex;
    justify-content: space-between;
    gap: 0;
  }

  .consulting-soprovod-card__mobile-image {
    display: none;
  }

  .consulting-soprovod-card__left {
    flex: 0 1 530px;
    min-width: 0;
  }

  .consulting-soprovod-card__title {
    margin: 0 0 24px;
    position: relative;
    z-index: 1;
    color: #ff741f;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-transform: uppercase;
  }

  .consulting-soprovod-card__title--mobile {
    display: none;
  }

  .consulting-soprovod-card__subtitle {
    position: relative;
    z-index: 21;
    max-width: 530px;
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .consulting-soprovod-card__right {
    flex: 1 1 auto;
    max-width: 936px;
    min-width: 0;
    position: relative;
    z-index: 10;
  }

  .consulting-soprovod-card__list {
    margin: 0 0 30px;
    padding: 0;
    list-style: none;
  }

  .consulting-soprovod-card__list-item {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 15px;
    margin-bottom: 15px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 1;
  }

  .consulting-soprovod-card__list-item--no-style {
    display: block;
    padding: 0;
    color: #ff741f;
  }

  .consulting-soprovod-card__list-item:first-child {
    margin-bottom: 30px;
  }

  .consulting-soprovod-card__cont {
    display: block;
    width: 95%;
  }

  .consulting-soprovod-card__ok-or-big {
    flex: 0 0 32px;
    width: 32px;
    height: 32px;
    background: v-bind(okOrBigUrl) no-repeat center;
    background-size: cover;
    content: '';
  }

  .consulting-soprovod-card__footnote {
    margin: 0;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 1;
  }

  .consulting-soprovod-card__bottom {
    position: relative;
    z-index: 10;
    padding: 40px;
    border-radius: 56px;
    background: #262626;
    overflow: visible;
  }

  .consulting-soprovod-card__bottom-art {
    position: absolute;
    background-repeat: no-repeat;
    background-position: center;
    pointer-events: none;
  }

  .consulting-soprovod-card__bottom-art--asic {
    top: -32px;
    right: 181px;
    width: 263px;
    height: 258px;
    background-image: var(--bottom-art);
    background-size: cover;
  }

  .consulting-soprovod-card__bottom-art--hotel {
    top: auto;
    right: 0;
    bottom: 0;
    width: 704px;
    height: 172px;
    background-image: var(--bottom-art);
  }

  .consulting-soprovod-card--hotel {
    overflow: visible;
  }

  .consulting-soprovod-card__price-label {
    margin: 0 0 10px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-transform: uppercase;
  }

  .consulting-soprovod-card__price-value {
    margin: 0 0 20px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 40px;
    font-weight: 500;
    line-height: 1;
  }

  .consulting-soprovod-card__actions {
    display: flex;
    flex-wrap: nowrap;
    gap: 20px;
  }

  .consulting-soprovod-card__cta,
  .consulting-soprovod-card__details {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    height: 52px;
    padding: 14px 28px;
    border-radius: 100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 15px;
    font-weight: 300;
    line-height: 22px;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background 0.2s ease,
      color 0.2s ease,
      border-color 0.2s ease;
  }

  .consulting-soprovod-card__cta {
    border: 1px solid #ff741f;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    color: #fff;
  }

  .consulting-soprovod-card__cta:hover {
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    color: #fff;
  }

  .consulting-soprovod-card__details {
    border: 1px solid #ff741f;
    background: transparent;
    color: #fff;
  }

  .consulting-soprovod-card__details:hover {
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    color: #fff;
  }

  .consulting-soprovod-card__cta svg,
  .consulting-soprovod-card__details svg {
    width: 12px;
    height: 12px;
  }

  @media (max-width: 1730px) {
    .consulting-soprovod-card__bottom-art--hotel {
      right: -90px;
    }
  }

  @media (max-width: 1439px) {
    .consulting-soprovod-card {
      position: relative;
      gap: 20px;
      padding: 30px;
      border-radius: 24px;
    }

    .consulting-soprovod-card__top {
      flex-direction: column;
      gap: 20px;
    }

    .consulting-soprovod-card__left {
      flex-basis: auto;
      max-width: 100%;
    }

    .consulting-soprovod-card__title {
      margin-bottom: 20px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .consulting-soprovod-card__title--desktop {
      display: none;
    }

    .consulting-soprovod-card__title--mobile {
      display: block;
    }

    .consulting-soprovod-card__subtitle {
      max-width: none;
      color: var(--tm-off-white);
      font-size: 14px;
      line-height: 20px;
      text-transform: uppercase;
    }

    .consulting-soprovod-card__mobile-image {
      display: none;
      width: 100%;
      max-width: 320px;
      height: auto;
      margin: 0 auto;
    }

    .consulting-soprovod-card__list-item {
      gap: 10px;
      margin-bottom: 15px;
      font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
      font-size: 14px;
    }

    .consulting-soprovod-card__list-item:first-child {
      margin-bottom: 20px;
    }

    .consulting-soprovod-card__ok-or-big {
      flex-basis: 20px;
      width: 20px;
      height: 20px;
    }

    .consulting-soprovod-card__footnote {
      display: none;
    }

    .consulting-soprovod-card__bottom {
      padding: 20px;
      border-radius: 20px;
    }

    .consulting-soprovod-card__bottom-art--asic {
      top: -30px;
      right: 20px;
      width: 171px;
      height: 168px;
    }

    .consulting-soprovod-card__bottom-art--hotel {
      background-image: var(--bottom-art-compact);
      right: 20px;
      bottom: 9px;
      width: 176px;
      height: 115px;
      z-index: 10;
    }

    .consulting-soprovod-card__price-label {
      font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
      font-weight: 400;
      font-size: 14px;
      line-height: 20px;
    }

    .consulting-soprovod-card__price-value {
      font-size: 20px;
      line-height: 28px;
    }

    .consulting-soprovod-card__cta,
    .consulting-soprovod-card__details {
      gap: 12px;
      height: 38px;
      padding: 8px 16px;
      font-size: 12px;
      line-height: 22px;
    }

    .consulting-soprovod-card__cta {
      width: 214px;
    }

    .consulting-soprovod-card__details {
      max-width: 170px;
    }

    .consulting-soprovod-card--hotel {
      padding-bottom: 30px;
      margin-bottom: 56px;
      overflow: visible;
    }

    .consulting-soprovod-card--hotel .consulting-soprovod-card__top {
      padding-top: 0;
    }

  }

  @media (max-width: 767px) {
    .consulting-soprovod-card__mobile-image {
      display: block;
      width: 100%;
      max-width: 320px;
      height: auto;
      margin: 0 auto;
    }

    .consulting-soprovod-card__actions {
      flex-direction: column;
      gap: 10px;
    }

    .consulting-soprovod-card__cta,
    .consulting-soprovod-card__details {
      width: 100%;
      max-width: none;
    }

    .consulting-soprovod-card__bottom-art--asic {
      display: none;
    }

    .consulting-soprovod-card__bottom-art--hotel {
      display: none;
    }
  }
</style>
