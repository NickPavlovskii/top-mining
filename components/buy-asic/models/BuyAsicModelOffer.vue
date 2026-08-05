<template>
  <section class="buy-asic-model-offer">
    <div class="buy-asic-model-offer__inner">
      <nav
        class="buy-asic-model-offer__breadcrumbs"
        aria-label="Хлебные крошки"
        itemscope
        itemtype="https://schema.org/BreadcrumbList"
      >
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <nuxt-link
            class="buy-asic-model-offer__breadcrumbs-link"
            to="/"
            itemprop="item"
          >
            <span itemprop="name">Главная</span>
          </nuxt-link>
          <meta
            itemprop="position"
            content="1"
          >
        </span>
        <span
          class="buy-asic-model-offer__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <nuxt-link
            class="buy-asic-model-offer__breadcrumbs-link"
            :to="BUY_ASIC_PAGE_PATH"
            itemprop="item"
          >
            <span itemprop="name">{{ BUY_ASIC_PAGE.breadcrumb }}</span>
          </nuxt-link>
          <meta
            itemprop="position"
            content="2"
          >
        </span>
        <span
          class="buy-asic-model-offer__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="buy-asic-model-offer__breadcrumbs-current"
            itemprop="name"
          >
            {{ shortName }}
          </span>
          <meta
            itemprop="position"
            content="3"
          >
        </span>
      </nav>

      <h1 class="buy-asic-model-offer__title">
        {{ copy.titlePrefix }}
        {{ ' ' }}
        {{ shortName }}?
      </h1>

      <div class="buy-asic-model-offer__wrap">
        <div class="buy-asic-model-offer__left">
          <p class="buy-asic-model-offer__subtitle">
            {{ copy.subtitleLead }}
            {{ ' ' }}
            {{ shortName }}
            {{ ' ' }}
            <span class="buy-asic-model-offer__subtitle-accent">
              {{ copy.subtitleAccent }}
            </span>
          </p>

          <div
            :key="`mobile-${model.slug}`"
            class="buy-asic-model-offer__media buy-asic-model-offer__media--mobile"
          >
            <img
              class="buy-asic-model-offer__image"
              :src="model.image"
              :alt="model.name"
            >
          </div>

          <div class="buy-asic-model-offer__benefits-card">
            <p class="buy-asic-model-offer__companies-intro buy-asic-model-offer__companies-intro--desktop">
              {{ copy.companiesIntro }}
            </p>
            <p class="buy-asic-model-offer__companies-intro buy-asic-model-offer__companies-intro--mobile">
              {{ copy.companiesIntroMobile }}
            </p>

            <top-mining-icon-list :items="copy.benefits" />
          </div>

          <div class="buy-asic-model-offer__form-card">
            <h2 class="buy-asic-model-offer__form-title">
              {{ copy.formTitle }}
            </h2>

            <form
              class="buy-asic-model-offer__form"
              @submit.prevent="onSubmit"
            >
              <top-mining-input
                v-model="phone"
                type="tel"
                name="your-telegram"
                autocomplete="tel"
                inputmode="tel"
                required
                :placeholder="copy.phonePlaceholder"
                :accessible-label="copy.phonePlaceholder"
              />

              <top-mining-button
                class="buy-asic-model-offer__submit"
                type="submit"
                variant="primary"
                size="big"
                surface="dark"
                width="100%"
                :title="copy.submitLabel"
                :append-icon="arrowIcon"
              />

              <label class="buy-asic-model-offer__honeypot">
                <span>{{ copy.honeypotLabel }}</span>
                <input
                  v-model="honeypot"
                  type="text"
                  name="email"
                  tabindex="-1"
                  autocomplete="off"
                >
              </label>

              <top-mining-privacy-consent
                v-model="privacyAccepted"
                :prefix="copy.privacyPrefix"
                :privacy-link-label="copy.privacyLinkLabel"
                :privacy-href="copy.privacyHref"
              />
            </form>
          </div>
        </div>

        <div class="buy-asic-model-offer__right">
          <div
            :key="model.slug"
            class="buy-asic-model-offer__media buy-asic-model-offer__media--desktop"
          >
            <img
              class="buy-asic-model-offer__image"
              :src="model.image"
              :alt="model.name"
            >
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import type { BuyAsicModel } from '~/common/modules/top-mining/buy-asic/page'
  import {
    BUY_ASIC_MODEL_OFFER,
    BUY_ASIC_PAGE,
    BUY_ASIC_PAGE_PATH,
    getBuyAsicModelShortName,
  } from '~/common/modules/top-mining/buy-asic/page'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

  const props = defineProps<{
    model: BuyAsicModel
  }>()

  const copy = BUY_ASIC_MODEL_OFFER
  const shortName = computed(() => getBuyAsicModelShortName(props.model))

  const phone = ref('')
  const honeypot = ref('')
  const privacyAccepted = ref(true)

  function onSubmit() {
    if (honeypot.value) {
      return
    }
  }
</script>

<style scoped>
  .buy-asic-model-offer {
    background: var(--tm-ink);
    color: #fff;
  }

  .buy-asic-model-offer__inner {
    box-sizing: border-box;
    max-width: 1440px;
    margin: 0 auto;
    padding: 28px 40px 72px;
  }

  .buy-asic-model-offer__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: center;
    margin: 0 0 28px;
    color: rgba(255, 255, 255, 0.55);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.4;
  }

  .buy-asic-model-offer__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .buy-asic-model-offer__breadcrumbs-link:hover,
  .buy-asic-model-offer__breadcrumbs-link:focus-visible {
    color: #fff;
  }

  .buy-asic-model-offer__breadcrumbs-sep {
    opacity: 0.5;
  }

  .buy-asic-model-offer__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.85);
  }

  .buy-asic-model-offer__title {
    margin: 0 0 28px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 52px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .buy-asic-model-offer__wrap {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(280px, 0.95fr);
    gap: 40px 48px;
    align-items: start;
  }

  .buy-asic-model-offer__left {
    display: flex;
    flex-direction: column;
    gap: 24px;
    min-width: 0;
  }

  .buy-asic-model-offer__subtitle {
    margin: 0;
    color: rgba(255, 255, 255, 0.92);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    line-height: 1.45;
  }

  .buy-asic-model-offer__subtitle-accent {
    color: var(--tm-orange);
  }

  .buy-asic-model-offer__benefits-card,
  .buy-asic-model-offer__form-card {
    box-sizing: border-box;
    padding: 28px 28px 30px;
    border-radius: 28px;
    background: var(--buy-asic-offer-card-bg, #1a1a1a);
  }

  .buy-asic-model-offer__companies-intro {
    margin: 0 0 20px;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.35;
  }

  .buy-asic-model-offer__companies-intro--mobile {
    display: none;
  }

  .buy-asic-model-offer__form-title {
    margin: 0 0 20px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 1.3;
  }

  .buy-asic-model-offer__form {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .buy-asic-model-offer__submit {
    width: 100%;
  }

  .buy-asic-model-offer__form-card :deep(.buy-asic-model-offer__submit .q-focus-helper),
  .buy-asic-model-offer__form-card :deep(.buy-asic-model-offer__submit .q-ripple) {
    display: none !important;
    opacity: 0 !important;
    visibility: hidden !important;
  }

  @media (hover: hover) {
    .buy-asic-model-offer__form-card
      :deep(
        .buy-asic-model-offer__submit.top-mining-button:hover:not(
            .top-mining-button--disabled
          ):not(.top-mining-button--loading)
      ) {
      --tm-btn-bg: var(--buy-asic-offer-card-bg, #1a1a1a);
      --tm-btn-border: var(--tm-orange);
      background: var(--buy-asic-offer-card-bg, #1a1a1a) !important;
      background-color: var(--buy-asic-offer-card-bg, #1a1a1a) !important;
      border-color: var(--tm-orange);
      box-shadow: none !important;
    }
  }

  .buy-asic-model-offer__honeypot {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
  }

  .buy-asic-model-offer__right {
    position: relative;
    min-height: 420px;
  }

  .buy-asic-model-offer__media {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .buy-asic-model-offer__media--mobile {
    display: none;
  }

  .buy-asic-model-offer__media--desktop {
    position: absolute;
    inset: 0;
    z-index: 1;
    opacity: 1;
    transform: scale(0.1);
    animation: buy-asic-model-appear 2s ease-in-out forwards;
  }

  .buy-asic-model-offer__image {
    display: block;
    width: min(100%, 560px);
    height: auto;
    object-fit: contain;
    filter: drop-shadow(0 24px 48px rgba(0, 0, 0, 0.45));
  }

  @keyframes buy-asic-model-appear {
    from {
      opacity: 0.4;
      transform: scale(0.1);
    }

    to {
      opacity: 1;
      transform: scale(1);
    }
  }

  @media (prefers-reduced-motion: reduce) {
    .buy-asic-model-offer__media--desktop {
      transform: none;
      animation: none;
    }
  }

  @media (max-width: 1100px) {
    .buy-asic-model-offer__wrap {
      grid-template-columns: 1fr;
    }

    .buy-asic-model-offer__right {
      display: none;
    }

    .buy-asic-model-offer__media--mobile {
      display: flex;
      transform: scale(0.1);
      animation: buy-asic-model-appear 2s ease-in-out forwards;
    }

    .buy-asic-model-offer__image {
      width: min(100%, 420px);
    }
  }

  @media (max-width: 760px) {
    .buy-asic-model-offer__inner {
      padding: 20px 16px 48px;
    }

    .buy-asic-model-offer__title {
      margin-bottom: 20px;
      font-size: 28px;
    }

    .buy-asic-model-offer__subtitle {
      font-size: 16px;
    }

    .buy-asic-model-offer__benefits-card,
    .buy-asic-model-offer__form-card {
      padding: 22px 18px;
      border-radius: 22px;
    }

    .buy-asic-model-offer__companies-intro--desktop {
      display: none;
    }

    .buy-asic-model-offer__companies-intro--mobile {
      display: block;
    }

    .buy-asic-model-offer__form-title {
      font-size: 18px;
    }
  }
</style>
