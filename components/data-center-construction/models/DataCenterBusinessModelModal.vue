<template>
  <teleport to="body">
    <transition name="data-center-bm-modal">
      <div
        v-if="open && model"
        class="data-center-bm-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="data-center-bm-modal-title"
        @keydown.esc.prevent="close"
      >
        <button
          type="button"
          class="data-center-bm-modal__backdrop"
          :aria-label="copy.closeLabel"
          @click="close"
        />

        <div
          ref="panelRef"
          class="data-center-bm-modal__panel"
          tabindex="-1"
        >
          <button
            type="button"
            class="data-center-bm-modal__close"
            :aria-label="copy.closeLabel"
            @click="close"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              aria-hidden="true"
            >
              <path
                d="M18 6L6 18"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
              <path
                d="M6 6L18 18"
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
            </svg>
          </button>

          <div class="data-center-bm-modal__body">
            <h2
              id="data-center-bm-modal-title"
              class="data-center-bm-modal__title"
            >
              {{ model.title }}
            </h2>

            <div class="data-center-bm-modal__media">
              <img
                class="data-center-bm-modal__image"
                alt=""
                aria-hidden="true"
                :src="pdfImage"
              >
            </div>

            <p class="data-center-bm-modal__text">
              {{ copy.downloadPromptPrefix }}
              {{ ' ' }}
              {{ model.label.toLowerCase() }}
            </p>

            <form
              class="data-center-bm-modal__form"
              @submit.prevent="onSubmit"
            >
              <div class="data-center-bm-modal__form-row">
                <top-mining-input
                  v-model="phone"
                  type="tel"
                  name="your-telegram"
                  autocomplete="tel"
                  inputmode="tel"
                  required
                  :placeholder="copy.phonePlaceholder"
                  :accessible-label="copy.phoneLabel"
                />

                <top-mining-button
                  class="data-center-bm-modal__submit"
                  preset="contact-pill"
                  variant="primary"
                  size="big"
                  surface="dark"
                  type="submit"
                  :title="copy.submitLabel"
                  :append-icon="arrowIcon"
                />
              </div>

              <label class="data-center-bm-modal__honeypot">
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
              />
            </form>
          </div>
        </div>
      </div>
    </transition>
  </teleport>
</template>

<script setup lang="ts">
  import pdfImage from '~/assets/images/data-center-construction/business-model-pdf.png'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type { DataCenterBusinessModelItem } from '~/common/modules/top-mining/pages/data-center-construction'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const open = defineModel<boolean>('open', { default: false })

  const props = defineProps<{
    model: DataCenterBusinessModelItem | null
  }>()

  const { t } = useT()
  const page = useDataCenterPage()
  const copy = computed(() => page.value.models.businessModelModal)
  const panelRef = ref<HTMLElement | null>(null)
  const phone = ref('')
  const honeypot = ref('')
  const privacyAccepted = ref(true)
  const {
    status,
    message: feedback,
    submit: submitLead,
    resetStatus,
  } = useSubmitLead('data-center-business-model')

  let closeTimer: ReturnType<typeof setTimeout> | null = null

  function close() {
    open.value = false
  }

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
      source: 'data-center-business-model',
      contact: phone.value,
      website: honeypot.value,
      fields: {
        modelId: props.model?.id || '',
        modelLabel: props.model?.label || '',
        modelTitle: props.model?.title || '',
      },
    })

    if (ok) {
      phone.value = ''
      if (closeTimer) {
        clearTimeout(closeTimer)
      }
      closeTimer = setTimeout(() => {
        close()
      }, 1200)
    }
  }

  watch(open, async (isOpen) => {
    if (!import.meta.client) {
      return
    }

    document.body.style.overflow = isOpen ? 'hidden' : ''

    if (isOpen) {
      phone.value = ''
      honeypot.value = ''
      resetStatus()
      if (closeTimer) {
        clearTimeout(closeTimer)
        closeTimer = null
      }
      await nextTick()
      panelRef.value?.focus()
    }
  })

  onBeforeUnmount(() => {
    if (closeTimer) {
      clearTimeout(closeTimer)
    }
    if (import.meta.client) {
      document.body.style.overflow = ''
    }
  })
</script>

<style scoped>
  .data-center-bm-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .data-center-bm-modal__backdrop {
    position: absolute;
    inset: 0;
    margin: 0;
    padding: 0;
    border: 0;
    background: rgb(0 0 0 / 55%);
    cursor: pointer;
  }

  .data-center-bm-modal__panel {
    position: relative;
    z-index: 1;
    box-sizing: border-box;
    width: min(100%, 655px);
    overflow: hidden;
    border-radius: 32px;
    background: #fff;
    color: #1a1a1a;
    outline: none;
  }

  .data-center-bm-modal__close {
    position: absolute;
    top: 20px;
    right: 20px;
    z-index: 2;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: #f2f2f2;
    color: #757575;
    cursor: pointer;
  }

  .data-center-bm-modal__close:hover,
  .data-center-bm-modal__close:focus-visible {
    color: #1a1a1a;
    background: #e8e8e8;
  }

  .data-center-bm-modal__body {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
    padding: 60px;
    text-align: center;
  }

  .data-center-bm-modal__title {
    margin: 0;
    max-width: 520px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 30px;
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
  }

  .data-center-bm-modal__media {
    width: min(100%, 534px);
  }

  .data-center-bm-modal__image {
    display: block;
    width: 100%;
    height: auto;
    object-fit: contain;
  }

  .data-center-bm-modal__text {
    margin: 0;
    max-width: 420px;
    color: #1a1a1a;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-bm-modal__form {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 16px;
    width: 100%;
    max-width: 600px;
  }

  .data-center-bm-modal__form-row {
    display: flex;
    gap: 16px;
    align-items: stretch;
    width: 100%;
  }

  .data-center-bm-modal__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .data-center-bm-modal__form-row :deep(.top-mining-input__control) {
    height: 56px;
    border-color: #757575;
    color: #000;
    background: #fff;
  }

  .data-center-bm-modal__form-row :deep(.top-mining-input__control::placeholder) {
    color: #9a9a9a;
  }

  .data-center-bm-modal__form-row :deep(.top-mining-input__control:focus-visible) {
    border-color: #1a1a1a;
  }

  .data-center-bm-modal__form-row :deep(
    .data-center-bm-modal__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
    max-width: 261px;
  }

  .data-center-bm-modal__form-row :deep(
    .data-center-bm-modal__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .data-center-bm-modal__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  .data-center-bm-modal__form :deep(.top-mining-privacy-consent__text),
  .data-center-bm-modal__form :deep(.top-mining-privacy-consent) {
    color: #5c5c5c;
  }

  .data-center-bm-modal__form :deep(.top-mining-privacy-consent__link:hover),
  .data-center-bm-modal__form :deep(.top-mining-privacy-consent__link:focus-visible) {
    color: #1a1a1a;
  }

  .data-center-bm-modal-enter-active,
  .data-center-bm-modal-leave-active {
    transition: opacity 0.28s ease;
  }

  .data-center-bm-modal-enter-active .data-center-bm-modal__panel,
  .data-center-bm-modal-leave-active .data-center-bm-modal__panel {
    transition:
      transform 0.32s cubic-bezier(0.22, 1, 0.36, 1),
      opacity 0.28s ease;
  }

  .data-center-bm-modal-enter-from,
  .data-center-bm-modal-leave-to {
    opacity: 0;
  }

  .data-center-bm-modal-enter-from .data-center-bm-modal__panel,
  .data-center-bm-modal-leave-to .data-center-bm-modal__panel {
    opacity: 0;
    transform: translateY(16px) scale(0.96);
  }

  @media (prefers-reduced-motion: reduce) {
    .data-center-bm-modal-enter-active,
    .data-center-bm-modal-leave-active,
    .data-center-bm-modal-enter-active .data-center-bm-modal__panel,
    .data-center-bm-modal-leave-active .data-center-bm-modal__panel {
      transition: none;
    }
  }

  @media (max-width: 767px) {
    .data-center-bm-modal__panel {
      width: min(100%, 520px);
      border-radius: 24px;
    }

    .data-center-bm-modal__body {
      gap: 20px;
      padding: 40px 20px;
    }

    .data-center-bm-modal__title {
      margin-right: 28px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .data-center-bm-modal__text {
      max-width: 288px;
      font-size: 14px;
    }

    .data-center-bm-modal__form-row {
      flex-direction: column;
      gap: 12px;
    }

    .data-center-bm-modal__form-row :deep(
      .data-center-bm-modal__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      width: 100%;
      max-width: none;
    }
  }
</style>
