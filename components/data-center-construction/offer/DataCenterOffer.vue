<template>
  <section
    id="data-center-offer"
    class="data-center-offer"
    aria-labelledby="data-center-offer-title"
  >
    <div class="data-center-offer__inner">
      <div class="data-center-offer__card">
        <h2
          id="data-center-offer-title"
          class="data-center-offer__title"
        >
          {{ copy.title }}
        </h2>

        <div class="data-center-offer__text">
          <p>{{ copy.lead }}</p>
          <p>
            {{ copy.beforeAccent }}
            <span>{{ copy.accent }}</span>
            {{ copy.afterAccent }}
          </p>
        </div>

        <form
          class="data-center-offer__form"
          @submit.prevent="onSubmit"
        >
          <div class="data-center-offer__form-row">
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
              class="data-center-offer__submit"
              preset="contact-pill"
              variant="primary"
              size="big"
              surface="dark"
              type="submit"
              :title="copy.submitLabel"
              :append-icon="arrowIcon"
            />
          </div>

          <label class="data-center-offer__honeypot">
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

          <top-mining-form-status
            :status="status"
            :message="feedback"
            tone="dark"
          />
        </form>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const { t } = useT()
  const page = useDataCenterPage()
  const copy = computed(() => page.value.offer)

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')
  const {
    status,
    message: feedback,
    submit: submitLead,
  } = useSubmitLead('data-center-offer')

  async function onSubmit() {
    if (honeypot.value) {
      return
    }

    if (!privacyAccepted.value) {
      status.value = 'error'
      feedback.value = t('leads.privacyRequired')
      return
    }

    const ok = await submitLead({
      source: 'data-center-offer',
      contact: phone.value,
      website: honeypot.value,
    })

    if (ok) {
      phone.value = ''
    }
  }
</script>

<style scoped>
  .data-center-offer {
    background: var(--tm-ink);
    padding: 0 0 76px;
    color: var(--tm-white);
  }

  .data-center-offer__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-offer__card {
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

  .data-center-offer__title {
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.15;
    text-align: center;
    text-transform: uppercase;
  }

  .data-center-offer__text {
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

  .data-center-offer__text p {
    margin: 0;
  }

  .data-center-offer__text span {
    color: #ff741f;
    font-weight: 500;
  }

  .data-center-offer__form {
    width: 100%;
    max-width: 520px;
  }

  .data-center-offer__form-row {
    display: flex;
    align-items: stretch;
    gap: 16px;
  }

  .data-center-offer__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .data-center-offer__form-row :deep(
    .data-center-offer__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
  }

  .data-center-offer__form-row :deep(
    .data-center-offer__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .data-center-offer__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
    white-space: nowrap;
  }

  .data-center-offer__form :deep(.top-mining-privacy-consent) {
    margin-top: 16px;
  }

  @media (max-width: 1730px) {
    .data-center-offer__text {
      max-width: 944px;
    }
  }

  @media (max-width: 1439px) {
    .data-center-offer__text {
      gap: 10px;
      font-size: 14px;
      font-weight: 600;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .data-center-offer__inner {
      padding: 0 16px;
    }

    .data-center-offer__card {
      gap: 20px;
      padding: 24px 16px;
      border-radius: 28px;
    }

    .data-center-offer__form-row {
      flex-direction: column;
      gap: 12px;
    }
  }
</style>
