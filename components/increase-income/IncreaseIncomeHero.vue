<template>
  <section class="increase-income-hero">
    <div class="increase-income-hero__inner">
      <nav
        class="increase-income-hero__breadcrumbs"
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
            class="increase-income-hero__breadcrumbs-link"
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
          class="increase-income-hero__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="increase-income-hero__breadcrumbs-current"
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

      <div class="increase-income-hero__top">
        <h1 class="increase-income-hero__title">
          <span class="increase-income-hero__title-lead">{{ copy.titleLead }}</span>
          {{ copy.titleMain }}
        </h1>

        <div class="increase-income-hero__card">
          <p class="increase-income-hero__card-text">
            {{ copy.cardLead }}
          </p>
          <p class="increase-income-hero__card-text">
            {{ copy.cardCta }}
          </p>

          <form
            class="increase-income-hero__form"
            @submit.prevent="onSubmit"
          >
            <div class="increase-income-hero__form-row">
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
                class="increase-income-hero__submit"
              >
                <span>{{ copy.submitLabel }}</span>
                <consulting-diagonal-arrow-icon class="increase-income-hero__submit-icon" />
              </button>
            </div>

            <label class="increase-income-hero__honeypot">
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
  </section>
</template>

<script setup lang="ts">
  import { INCREASE_INCOME_PAGE } from '~/common/modules/top-mining/increase-income-page'
  import ConsultingDiagonalArrowIcon from '~/components/consulting/icons/ConsultingDiagonalArrowIcon.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const copy = INCREASE_INCOME_PAGE

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки «Увеличим ваш доход»
  }
</script>

<style scoped>
  .increase-income-hero {
    background: var(--tm-ink);
    border-radius: 64px 64px 0 0;
    padding: 64px 0;
    color: #fff;
    overflow: hidden;
  }

  .increase-income-hero__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .increase-income-hero__breadcrumbs {
    position: relative;
    z-index: 1;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 6px 8px;
    color: rgba(255, 255, 255, 0.85);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .increase-income-hero__breadcrumbs-link {
    color: inherit;
    font-weight: 600;
    text-decoration: none;
  }

  .increase-income-hero__breadcrumbs-link:hover,
  .increase-income-hero__breadcrumbs-link:focus-visible {
    color: #fff;
  }

  .increase-income-hero__breadcrumbs-sep {
    opacity: 0.55;
  }

  .increase-income-hero__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.92);
    font-weight: 400;
  }

  .increase-income-hero__top {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 144px;
  }

  .increase-income-hero__title {
    margin: 64px 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 120px;
    font-weight: 500;
    line-height: 120px;
    text-align: center;
    text-transform: uppercase;
  }

  .increase-income-hero__title-lead {
    display: block;
    margin-bottom: 0;
    color: var(--tm-ink);
    font-size: 202px;
    font-weight: 500;
    line-height: 100%;
    text-shadow:
      1px 1px rgba(255, 255, 255, 0.44),
      -1px -1px rgba(255, 255, 255, 0.44),
      1px -1px rgba(255, 255, 255, 0.44),
      -1px 1px rgba(255, 255, 255, 0.44);
  }

  .increase-income-hero__card {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 40px;
    width: 100%;
    max-width: 916px;
    margin: 0 auto;
    padding: 40px;
    border-radius: 40px;
    background: #1f1f1f;
    box-sizing: border-box;
  }

  .increase-income-hero__card-text {
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 100%;
    text-align: center;
  }

  .increase-income-hero__form {
    width: 100%;
    max-width: 378px;
  }

  .increase-income-hero__form-row {
    display: flex;
    align-items: stretch;
    gap: 20px;
  }

  .increase-income-hero__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .increase-income-hero__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    flex: 0 0 auto;
    min-width: 158px;
    height: 56px;
    margin: 0;
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
    white-space: nowrap;
    transition:
      background 0.2s ease,
      box-shadow 0.2s ease,
      color 0.2s ease;
  }

  .increase-income-hero__submit:hover,
  .increase-income-hero__submit:focus-visible {
    background: transparent;
    box-shadow: 0 0 0 1px #ff741f inset;
    color: #fff;
  }

  .increase-income-hero__submit-icon {
    flex-shrink: 0;
    width: 14px;
    height: 14px;
  }

  .increase-income-hero__honeypot {
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

  .increase-income-hero__form :deep(.top-mining-privacy-consent) {
    margin-top: 20px;
  }

  .increase-income-hero__visually-hidden {
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

  @media (max-width: 1730px) {
    .increase-income-hero__title {
      margin-bottom: 50px;
      font-size: 83px;
      line-height: 108%;
    }

    .increase-income-hero__title-lead {
      margin-bottom: 20px;
      font-size: 155px;
      line-height: 100%;
    }
  }

  @media (max-width: 1439px) {
    .increase-income-hero {
      border-radius: 32px 32px 0 0;
      padding: 30px 0;
    }

    .increase-income-hero__inner {
      padding: 0 24px;
    }

    .increase-income-hero__top {
      margin-bottom: 88px;
    }

    .increase-income-hero__title {
      margin: 40px 0;
      font-size: 24px;
      line-height: 28px;
    }

    .increase-income-hero__title-lead {
      font-size: 80px;
      line-height: 100%;
    }

    .increase-income-hero__card {
      gap: 20px;
      max-width: 478px;
      padding: 30px;
    }

    .increase-income-hero__card-text {
      font-size: 14px;
      line-height: 20px;
    }

    .increase-income-hero__form {
      max-width: 100%;
    }

    .increase-income-hero__form-row {
      gap: 10px;
    }

    .increase-income-hero__submit {
      width: 158px;
      min-width: 158px;
      height: 46px;
      font-size: 14px;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .increase-income-hero {
      border-radius: 24px 24px 0 0;
    }

    .increase-income-hero__top {
      margin-bottom: 56px;
    }

    .increase-income-hero__title {
      margin: 20px 0 30px;
      font-size: 19px;
      line-height: 100%;
      text-align: left;
    }

    .increase-income-hero__title-lead {
      margin-bottom: 5px;
      font-size: 34px;
      font-weight: 600;
      line-height: 31px;
    }

    .increase-income-hero__card {
      gap: 20px;
      width: 100%;
      max-width: none;
      padding: 15px 10px;
      border-radius: 16px;
      align-items: flex-start;
    }

    .increase-income-hero__card-text {
      width: 100%;
      color: #fff;
      font-size: 12px;
      line-height: 16px;
      text-align: left;
    }

    .increase-income-hero__form-row {
      flex-direction: column;
      gap: 10px;
    }

    .increase-income-hero__submit {
      width: 100%;
      min-width: 0;
      justify-content: center;
      padding: 0 16px;
    }
  }
</style>
