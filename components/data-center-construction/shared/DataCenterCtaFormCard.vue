<template>
  <div
    :class="['data-center-cta-form-card', `data-center-cta-form-card--${variant}`]"
  >
    <h2
      :id="titleId"
      class="data-center-cta-form-card__title"
    >
      <template
        v-for="(line, index) in titleLines"
        :key="`${titleId}-line-${index}`"
      >
        <br v-if="index > 0">
        {{ line }}
      </template>
    </h2>

    <p class="data-center-cta-form-card__text">
      {{ text }}
    </p>

    <form
      class="data-center-cta-form-card__form"
      @submit.prevent="onSubmit"
    >
      <div class="data-center-cta-form-card__form-row">
        <top-mining-input
          v-model="phone"
          type="tel"
          name="your-telegram"
          autocomplete="tel"
          inputmode="tel"
          required
          :placeholder="resolvedPhonePlaceholder"
          :accessible-label="resolvedPhonePlaceholder"
        />

        <top-mining-button
          class="data-center-cta-form-card__submit"
          preset="contact-pill"
          variant="primary"
          size="big"
          surface="dark"
          type="submit"
          :title="submitLabel"
          :append-icon="arrowIcon"
        />
      </div>

      <label class="data-center-cta-form-card__honeypot">
        <span>{{ resolvedHoneypotLabel }}</span>
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
        class="data-center-cta-form-card__privacy"
        :prefix="resolvedPrivacyPrefix"
        :privacy-link-label="resolvedPrivacyLinkLabel"
        :privacy-href="resolvedPrivacyHref"
      />
    </form>
  </div>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type {
    DataCenterCtaFormCardProps,
    DataCenterCtaFormSubmitPayload,
  } from '~/common/modules/top-mining/pages/data-center-construction'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const props = withDefaults(defineProps<DataCenterCtaFormCardProps>(), {
    titleId: 'data-center-cta-form-title',
    variant: 'hero',
  })
  const { t } = useT()

  const emit = defineEmits<{
    submit: [payload: DataCenterCtaFormSubmitPayload]
  }>()

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')
  const resolvedPhonePlaceholder = computed(
    () => props.phonePlaceholder || t('dcConstruction.phonePlaceholder'),
  )
  const resolvedHoneypotLabel = computed(
    () => props.honeypotLabel || t('dcConstruction.honeypotLabel'),
  )
  const resolvedPrivacyPrefix = computed(
    () => props.privacyPrefix || t('common.privacyPrefix'),
  )
  const resolvedPrivacyLinkLabel = computed(
    () => props.privacyLinkLabel || t('common.privacyLink'),
  )
  const resolvedPrivacyHref = computed(() => props.privacyHref || '/privacy')

  const titleLines = computed(() =>
    props.title
      .split(/\n|<br\s*\/?>/i)
      .map((line) => line.trim())
      .filter(Boolean),
  )

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    emit('submit', { phone: phone.value })
  }
</script>

<style scoped>
  .data-center-cta-form-card {
    position: relative;
    z-index: 20;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 60px;
    padding: 100px;
    border: 1px solid #ff741f;
    border-radius: 60px;
    background: rgba(247, 247, 247, 0.06);
  }

  .data-center-cta-form-card--compact {
    gap: 40px;
    padding: 60px;
  }

  .data-center-cta-form-card__title {
    margin: 0;
    max-width: 1350px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-align: center;
    text-transform: uppercase;
  }

  .data-center-cta-form-card--compact .data-center-cta-form-card__title {
    max-width: 640px;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .data-center-cta-form-card__text {
    margin: 0;
    max-width: 720px;
    color: #f6f6f6;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    text-align: center;
  }

  .data-center-cta-form-card__form {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 612px;
  }

  .data-center-cta-form-card__form-row {
    display: flex;
    align-items: stretch;
    gap: 16px;
    width: 100%;
  }

  .data-center-cta-form-card__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .data-center-cta-form-card__form-row :deep(.top-mining-input__control) {
    border-color: #757575;
  }

  .data-center-cta-form-card__form-row :deep(
    .data-center-cta-form-card__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
    max-width: 296px;
  }

  .data-center-cta-form-card__form-row :deep(
    .data-center-cta-form-card__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .data-center-cta-form-card__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
    white-space: nowrap;
  }

  .data-center-cta-form-card__privacy {
    margin-top: 20px;
    width: 100%;
  }

  .data-center-cta-form-card__privacy :deep(.top-mining-privacy-consent__checkbox) {
    justify-content: center;
  }

  .data-center-cta-form-card__privacy :deep(.top-mining-privacy-consent__text) {
    color: #757575;
  }

  @media (max-width: 1730px) {
    .data-center-cta-form-card:not(.data-center-cta-form-card--compact) {
      gap: 40px;
      padding: 60px;
    }

    .data-center-cta-form-card:not(.data-center-cta-form-card--compact)
      .data-center-cta-form-card__title {
      max-width: 1022px;
    }

    .data-center-cta-form-card__text {
      max-width: 600px;
    }
  }

  @media (max-width: 1439px) {
    .data-center-cta-form-card {
      gap: 20px;
      padding: 40px;
      border-radius: 25px;
    }

    .data-center-cta-form-card__title {
      max-width: 338px;
      font-size: 20px;
      line-height: 28px;
    }

    .data-center-cta-form-card--compact .data-center-cta-form-card__title {
      max-width: 338px;
      font-size: 20px;
      line-height: 28px;
    }

    .data-center-cta-form-card__text {
      max-width: 410px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-cta-form-card__form {
      max-width: 500px;
    }

    .data-center-cta-form-card__form-row :deep(
      .data-center-cta-form-card__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      max-width: 244px;
    }
  }

  @media (max-width: 767px) {
    .data-center-cta-form-card {
      padding: 40px 16px;
    }

    .data-center-cta-form-card--compact .data-center-cta-form-card__title {
      max-width: 235px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-cta-form-card__text {
      max-width: 330px;
    }

    .data-center-cta-form-card__form {
      max-width: 244px;
    }

    .data-center-cta-form-card__form-row {
      flex-direction: column;
      gap: 12px;
    }

    .data-center-cta-form-card__form-row :deep(
      .data-center-cta-form-card__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      max-width: none;
      width: 100%;
    }
  }
</style>
