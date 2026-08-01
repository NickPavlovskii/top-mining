<template>
  <section
    class="data-center-discuss"
    aria-labelledby="data-center-discuss-title"
    :id="copy.id"
  >
    <div class="data-center-discuss__inner">
      <h2
        id="data-center-discuss-title"
        class="data-center-discuss__title"
      >
        {{ copy.title }}
      </h2>

      <div class="data-center-discuss__card">
        <p class="data-center-discuss__text">
          {{ copy.text }}
        </p>

        <form
          class="data-center-discuss__form"
          @submit.prevent="onSubmit"
        >
          <div class="data-center-discuss__form-row">
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
              class="data-center-discuss__submit"
              preset="contact-pill"
              variant="primary"
              size="big"
              surface="dark"
              type="submit"
              :title="copy.submitLabel"
              :append-icon="arrowIcon"
            />
          </div>

          <label class="data-center-discuss__honeypot">
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
  import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/data-center-construction-page'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.discuss

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки «Готовы обсудить строительство»
  }
</script>

<style scoped>
  .data-center-discuss {
    background: var(--tm-ink);
    padding: 0 0 76px;
    color: var(--tm-white);
    scroll-margin-top: 100px;
  }

  .data-center-discuss__inner {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 40px;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-discuss__title {
    margin: 0;
    max-width: 1100px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.2vw, 48px);
    font-weight: 500;
    line-height: 1.25;
    text-align: center;
    text-transform: uppercase;
  }

  .data-center-discuss__card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 32px;
    width: 100%;
    max-width: 1100px;
    padding: clamp(32px, 4vw, 48px) clamp(24px, 4vw, 56px);
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
  }

  .data-center-discuss__text {
    margin: 0;
    max-width: 820px;
    color: #f6f6f6;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-align: center;
  }

  .data-center-discuss__form {
    width: 100%;
    max-width: 612px;
  }

  .data-center-discuss__form-row {
    display: flex;
    align-items: stretch;
    gap: 16px;
    width: 100%;
  }

  .data-center-discuss__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .data-center-discuss__form-row :deep(.top-mining-input__control) {
    border-color: #757575;
  }

  .data-center-discuss__form-row :deep(
    .data-center-discuss__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
    max-width: 296px;
  }

  .data-center-discuss__form-row :deep(
    .data-center-discuss__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .data-center-discuss__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
    white-space: nowrap;
  }

  .data-center-discuss__form :deep(.top-mining-privacy-consent) {
    margin-top: 20px;
  }

  @media (max-width: 1439px) {
    .data-center-discuss__inner {
      gap: 24px;
    }

    .data-center-discuss__title {
      font-size: 28px;
      line-height: 34px;
    }

    .data-center-discuss__card {
      gap: 24px;
      padding: 28px 20px;
      border-radius: 28px;
    }

    .data-center-discuss__text {
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-discuss__form {
      max-width: 500px;
    }

    .data-center-discuss__form-row :deep(
      .data-center-discuss__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      max-width: 244px;
    }
  }

  @media (max-width: 767px) {
    .data-center-discuss {
      padding-bottom: 56px;
    }

    .data-center-discuss__inner {
      padding: 0 16px;
    }

    .data-center-discuss__title {
      font-size: 20px;
      line-height: 28px;
    }

    .data-center-discuss__card {
      padding: 24px 16px;
      border-radius: 24px;
    }

    .data-center-discuss__form {
      max-width: none;
    }

    .data-center-discuss__form-row {
      flex-direction: column;
      gap: 12px;
    }

    .data-center-discuss__form-row :deep(
      .data-center-discuss__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      width: 100%;
      max-width: none;
    }
  }
</style>
