<template>
  <section class="buy-asic-hero">
    <div class="buy-asic-hero__inner">
      <nav
        class="buy-asic-hero__breadcrumbs"
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
            class="buy-asic-hero__breadcrumbs-link"
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
          class="buy-asic-hero__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="buy-asic-hero__breadcrumbs-current"
            itemprop="name"
          >
            {{ copy.breadcrumb }}
          </span>
          <meta
            itemprop="position"
            content="2"
          >
        </span>
      </nav>

      <div class="buy-asic-hero__stage">
        <h1 class="buy-asic-hero__title">
          {{ copy.title }}
        </h1>

        <div
          class="buy-asic-hero__ribbon"
          aria-label="Компании по продаже ASIC"
        >
          <div class="buy-asic-hero__ribbon-rotator">
            <div class="buy-asic-hero__ribbon-track">
              <div
                v-for="loop in 4"
                :key="loop"
                class="buy-asic-hero__ribbon-group"
              >
                <nuxt-link
                  v-for="company in copy.companies"
                  class="buy-asic-hero__ribbon-link"
                  :key="`${loop}-${company.id}`"
                  :to="`/sale_asic/${company.slug}/`"
                  :tabindex="loop === 1 ? undefined : -1"
                  :aria-hidden="loop === 1 ? undefined : 'true'"
                >
                  <buy-asic-company-card :company="company" />
                </nuxt-link>
              </div>
            </div>
          </div>
        </div>

        <div class="buy-asic-hero__copy">
          <p class="buy-asic-hero__subtitle">
            {{ copy.subtitleLead }}
            <span class="buy-asic-hero__subtitle-accent">{{ copy.subtitleAccent }}</span>
          </p>

          <div class="buy-asic-hero__bottom">
            <div class="buy-asic-hero__benefits-card">
              <p class="buy-asic-hero__companies-intro buy-asic-hero__companies-intro--desktop">
                {{ copy.companiesIntro }}
              </p>
              <p class="buy-asic-hero__companies-intro buy-asic-hero__companies-intro--mobile">
                {{ copy.companiesIntroMobile }}
              </p>

              <top-mining-icon-list :items="copy.benefits" />
            </div>

            <div class="buy-asic-hero__form-card">
              <h2 class="buy-asic-hero__form-title">
                {{ copy.formTitle }}
              </h2>

              <form
                class="buy-asic-hero__form"
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

                <button
                  type="submit"
                  class="buy-asic-hero__submit"
                >
                  <span>{{ copy.submitLabel }}</span>
                  <img
                    class="buy-asic-hero__submit-icon"
                    alt=""
                    aria-hidden="true"
                    :src="arrowIcon"
                  >
                </button>

                <label class="buy-asic-hero__honeypot">
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
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { BUY_ASIC_PAGE } from '~/common/modules/top-mining/buy-asic-page'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'
  import BuyAsicCompanyCard from '~/components/buy-asic/hero/BuyAsicCompanyCard.vue'

  const copy = BUY_ASIC_PAGE

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }
    // TODO: отправка заявки «Помогаем купить ASIC выгодно»
  }
</script>

<style scoped>
  .buy-asic-hero {
    background: var(--tm-ink);
    border-radius: 64px 64px 0 0;
    padding: 64px 0 80px;
    color: #fff;
    overflow: hidden;
  }

  .buy-asic-hero__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .buy-asic-hero__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 6px 8px;
    margin-bottom: 40px;
    color: rgba(255, 255, 255, 0.85);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .buy-asic-hero__breadcrumbs-link {
    color: inherit;
    font-weight: 600;
    text-decoration: none;
  }

  .buy-asic-hero__breadcrumbs-link:hover,
  .buy-asic-hero__breadcrumbs-link:focus-visible {
    color: #fff;
  }

  .buy-asic-hero__breadcrumbs-sep {
    opacity: 0.55;
  }

  .buy-asic-hero__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.92);
  }

  .buy-asic-hero__stage {
    display: flex;
    flex-direction: column;
  }

  .buy-asic-hero__title {
    margin: 0 0 48px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(36px, 5vw, 72px);
    font-weight: 500;
    line-height: 1.08;
    text-transform: uppercase;
  }

  .buy-asic-hero__ribbon {
    margin: 0 0 56px;
    overflow: hidden;
  }

  .buy-asic-hero__ribbon-rotator {
    display: block;
  }

  .buy-asic-hero__ribbon-track {
    display: flex;
    flex-direction: row;
    width: max-content;
    will-change: transform;
    animation: buy-asic-marquee-x 36s linear infinite;
  }

  .buy-asic-hero__ribbon:hover .buy-asic-hero__ribbon-track {
    animation-play-state: paused;
  }

  .buy-asic-hero__ribbon-group {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    gap: 20px;
    padding-right: 20px;
  }

  .buy-asic-hero__ribbon-link {
    flex: 0 0 auto;
    color: inherit;
    text-decoration: none;
  }

  .buy-asic-hero__subtitle {
    margin: 0 0 32px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(20px, 2.2vw, 32px);
    font-weight: 400;
    line-height: 1.25;
  }

  .buy-asic-hero__subtitle-accent {
    color: #ff741f;
  }

  .buy-asic-hero__bottom {
    display: grid;
    grid-template-columns: minmax(0, 1.15fr) minmax(320px, 0.85fr);
    gap: 40px;
    align-items: start;
  }

  .buy-asic-hero__benefits-card {
    padding: 32px;
    border-radius: 32px;
    background: #1f1f1f;
  }

  .buy-asic-hero__companies-intro {
    margin: 0 0 24px;
    color: rgba(255, 255, 255, 0.72);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
  }

  .buy-asic-hero__companies-intro--mobile {
    display: none;
  }

  .buy-asic-hero__form-card {
    padding: 40px;
    border-radius: 32px;
    background: #1f1f1f;
  }

  .buy-asic-hero__form-title {
    margin: 0 0 32px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
  }

  .buy-asic-hero__form {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .buy-asic-hero__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    width: 100%;
    height: 56px;
    padding: 0 24px;
    border: 0;
    border-radius: 999px;
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      background 0.2s ease,
      box-shadow 0.2s ease,
      color 0.2s ease;
  }

  .buy-asic-hero__submit:hover,
  .buy-asic-hero__submit:focus-visible {
    background: transparent;
    box-shadow: 0 0 0 1px #ff741f inset;
    color: #fff;
  }

  .buy-asic-hero__submit-icon {
    width: 14px;
    height: 14px;
    object-fit: contain;
  }

  .buy-asic-hero__honeypot,
  .buy-asic-hero__visually-hidden {
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

  @keyframes buy-asic-marquee-x {
    from {
      transform: translateX(0);
    }

    to {
      transform: translateX(-50%);
    }
  }

  @keyframes buy-asic-marquee-y {
    from {
      transform: translateY(0);
    }

    to {
      transform: translateY(-25%);
    }
  }

  /* Большой экран: наклонная бесконечная лента справа */
  @media (min-width: 1440px) {
    .buy-asic-hero__stage {
      display: grid;
      grid-template-columns: minmax(0, 1fr) minmax(460px, 42%);
      grid-template-areas:
        'title ribbon'
        'copy ribbon';
      column-gap: 0;
      align-items: start;
    }

    .buy-asic-hero__title {
      grid-area: title;
      margin: 0 0 32px;
      max-width: 900px;
    }

    .buy-asic-hero__copy {
      grid-area: copy;
      position: relative;
      z-index: 2;
    }

    .buy-asic-hero__ribbon {
      grid-area: ribbon;
      position: relative;
      z-index: 1;
      align-self: stretch;
      min-height: 820px;
      margin: -40px -20px -60px 0;
      overflow: hidden;
      pointer-events: none;
    }

    .buy-asic-hero__ribbon-rotator {
      position: absolute;
      top: 50%;
      left: 28%;
      width: 220px;
      transform: translate(-20%, -50%) rotate(-28deg);
      transform-origin: center center;
      pointer-events: auto;
    }

    .buy-asic-hero__ribbon-track {
      display: flex;
      flex-direction: column;
      width: 220px;
      animation: buy-asic-marquee-y 40s linear infinite;
    }

    .buy-asic-hero__ribbon-group {
      flex-direction: column;
      flex-shrink: 0;
      gap: 14px;
      padding-right: 0;
      padding-bottom: 14px;
    }

    .buy-asic-hero__ribbon-link {
      width: 220px;
    }

    .buy-asic-hero__bottom {
      grid-template-columns: 1fr;
      max-width: 640px;
    }
  }

  @media (max-width: 1439px) {
    .buy-asic-hero {
      border-radius: 32px 32px 0 0;
      padding: 30px 0 80px;
    }

    .buy-asic-hero__inner {
      padding: 0 24px;
    }

    .buy-asic-hero__breadcrumbs {
      margin-bottom: 32px;
    }

    .buy-asic-hero__title {
      margin-bottom: 32px;
    }

    .buy-asic-hero__ribbon {
      margin-bottom: 40px;
    }

    .buy-asic-hero__ribbon-group {
      gap: 12px;
      padding-right: 12px;
    }

    .buy-asic-hero__benefits-card,
    .buy-asic-hero__form-card {
      padding: 24px;
      border-radius: 24px;
    }
  }

  /* Компактный планшетный вид: лента компаний + 2 колонки */
  @media (min-width: 768px) and (max-width: 1439px) {
    .buy-asic-hero {
      padding: 28px 0 56px;
    }

    .buy-asic-hero__inner {
      max-width: 960px;
      padding: 0 20px;
    }

    .buy-asic-hero__breadcrumbs {
      margin-bottom: 24px;
      font-size: 16px;
      line-height: 22px;
    }

    .buy-asic-hero__title {
      margin-bottom: 20px;
      font-size: clamp(30px, 4.8vw, 44px);
    }

    .buy-asic-hero__ribbon {
      margin-bottom: 20px;
    }

    .buy-asic-hero__subtitle {
      margin-bottom: 20px;
      font-size: 18px;
      line-height: 1.3;
    }

    .buy-asic-hero__bottom {
      grid-template-columns: minmax(0, 1.08fr) minmax(0, 0.92fr);
      gap: 14px;
      align-items: stretch;
    }

    .buy-asic-hero__benefits-card,
    .buy-asic-hero__form-card {
      padding: 18px;
      border-radius: 20px;
    }

    .buy-asic-hero__companies-intro {
      margin-bottom: 14px;
      font-size: 13px;
      line-height: 18px;
    }

    .buy-asic-hero__companies-intro--mobile {
      display: none;
    }

    .buy-asic-hero__companies-intro--desktop {
      display: block;
    }

    .buy-asic-hero__form-title {
      margin-bottom: 16px;
      font-size: 15px;
      line-height: 20px;
    }

    .buy-asic-hero__form {
      gap: 12px;
    }

    .buy-asic-hero__submit {
      height: 46px;
      font-size: 13px;
      line-height: 18px;
    }
  }

  @media (max-width: 767px) {
    .buy-asic-hero {
      border-radius: 24px 24px 0 0;
      padding: 24px 0 56px;
    }

    .buy-asic-hero__inner {
      padding: 0 16px;
    }

    .buy-asic-hero__bottom {
      grid-template-columns: 1fr;
      gap: 16px;
    }

    .buy-asic-hero__breadcrumbs {
      margin-bottom: 20px;
      font-size: 14px;
    }

    .buy-asic-hero__title {
      margin-bottom: 24px;
      font-size: 28px;
    }

    .buy-asic-hero__subtitle {
      margin-bottom: 20px;
      font-size: 18px;
    }

    .buy-asic-hero__companies-intro--desktop {
      display: none;
    }

    .buy-asic-hero__companies-intro--mobile {
      display: block;
    }

    .buy-asic-hero__benefits-card,
    .buy-asic-hero__form-card {
      padding: 16px;
      border-radius: 16px;
    }

    .buy-asic-hero__form-title {
      margin-bottom: 20px;
      font-size: 16px;
      line-height: 22px;
    }

    .buy-asic-hero__submit {
      height: 46px;
      font-size: 14px;
    }
  }
</style>
