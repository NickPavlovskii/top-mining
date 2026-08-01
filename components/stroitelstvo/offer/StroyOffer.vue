<template>
  <section
    id="stroy-offer"
    class="stroy-offer"
    aria-labelledby="stroy-offer-title"
  >
    <div class="stroy-offer__inner">
      <div class="stroy-offer__card">
        <h2
          id="stroy-offer-title"
          class="stroy-offer__title"
        >
          {{ copy.title }}
        </h2>

        <div class="stroy-offer__text">
          <p>{{ copy.lead }}</p>
          <p>
            {{ copy.beforeAccent }}
            <span>{{ copy.accent }}</span>
            {{ copy.afterAccent }}
          </p>
        </div>

        <form
          class="stroy-offer__form"
          @submit.prevent="onSubmit"
        >
          <div class="stroy-offer__form-row">
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
              class="stroy-offer__submit"
              preset="contact-pill"
              variant="primary"
              size="big"
              surface="dark"
              type="submit"
              :title="copy.submitLabel"
              :append-icon="arrowIcon"
            />
          </div>

          <label class="stroy-offer__honeypot">
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
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.offer

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки «Наше предложение»
  }
</script>

<style scoped>
  .stroy-offer {
    background: var(--tm-ink);
    padding: 0 0 76px;
    color: var(--tm-white);
  }

  .stroy-offer__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .stroy-offer__card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 28px;
    max-width: 1100px;
    margin: 0 auto;
    padding: clamp(32px, 4vw, 48px) clamp(24px, 4vw, 48px);
    border-radius: 40px;
    background: #1f1f1f;
  }

  .stroy-offer__title {
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.15;
    text-align: center;
    text-transform: uppercase;
  }

  .stroy-offer__text {
    display: flex;
    flex-direction: column;
    gap: 20px;
    max-width: 904px;
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
    text-align: center;
  }

  .stroy-offer__text p {
    margin: 0;
  }

  .stroy-offer__text span {
    color: #ff741f;
    font-weight: 500;
  }

  .stroy-offer__form {
    width: 100%;
    max-width: 520px;
  }

  .stroy-offer__form-row {
    display: flex;
    align-items: stretch;
    gap: 16px;
  }

  .stroy-offer__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .stroy-offer__form-row :deep(
    .stroy-offer__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
  }

  .stroy-offer__form-row :deep(
    .stroy-offer__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .stroy-offer__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
    white-space: nowrap;
  }

  .stroy-offer__form :deep(.top-mining-privacy-consent) {
    margin-top: 16px;
  }

  @media (max-width: 1730px) {
    .stroy-offer__text {
      max-width: 944px;
    }
  }

  @media (max-width: 1439px) {
    .stroy-offer__text {
      gap: 10px;
      font-size: 14px;
      font-weight: 600;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .stroy-offer__inner {
      padding: 0 16px;
    }

    .stroy-offer__card {
      gap: 20px;
      padding: 24px 16px;
      border-radius: 28px;
    }

    .stroy-offer__form-row {
      flex-direction: column;
      gap: 12px;
    }
  }
</style>
