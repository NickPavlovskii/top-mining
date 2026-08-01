<template>
  <teleport to="body">
    <transition name="stroy-bm-modal">
      <div
        v-if="open && model"
        class="stroy-bm-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="stroy-bm-modal-title"
        @keydown.esc.prevent="close"
      >
        <button
          type="button"
          class="stroy-bm-modal__backdrop"
          :aria-label="copy.closeLabel"
          @click="close"
        />

        <div
          ref="panelRef"
          class="stroy-bm-modal__panel"
          tabindex="-1"
        >
          <button
            type="button"
            class="stroy-bm-modal__close"
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

          <div class="stroy-bm-modal__body">
            <h2
              id="stroy-bm-modal-title"
              class="stroy-bm-modal__title"
            >
              {{ model.title }}
            </h2>

            <div class="stroy-bm-modal__media">
              <img
                class="stroy-bm-modal__image"
                alt=""
                aria-hidden="true"
                :src="pdfImage"
              >
            </div>

            <p class="stroy-bm-modal__text">
              {{ copy.downloadPromptPrefix }}
              {{ ' ' }}
              {{ model.label.toLowerCase() }}
            </p>

            <form
              class="stroy-bm-modal__form"
              @submit.prevent="onSubmit"
            >
              <div class="stroy-bm-modal__form-row">
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
                  class="stroy-bm-modal__submit"
                  preset="contact-pill"
                  variant="primary"
                  size="big"
                  surface="dark"
                  type="submit"
                  :title="copy.submitLabel"
                  :append-icon="arrowIcon"
                />
              </div>

              <label class="stroy-bm-modal__honeypot">
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
    </transition>
  </teleport>
</template>

<script setup lang="ts">
  import pdfImage from '~/assets/images/stroitelstvo-data-czentrov/business-model-pdf.png'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import {
    STROITELSTVO_DATA_CZENTROV_PAGE,
    type StroyBusinessModelItem,
  } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const open = defineModel<boolean>('open', { default: false })

  defineProps<{
    model: StroyBusinessModelItem | null
  }>()

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.models.businessModelModal
  const panelRef = ref<HTMLElement | null>(null)
  const phone = ref('')
  const honeypot = ref('')
  const privacyAccepted = ref(true)

  function close() {
    open.value = false
  }

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки на скачивание бизнес-модели
    close()
  }

  watch(open, async (isOpen) => {
    if (!import.meta.client) {
      return
    }

    document.body.style.overflow = isOpen ? 'hidden' : ''

    if (isOpen) {
      phone.value = ''
      honeypot.value = ''
      await nextTick()
      panelRef.value?.focus()
    }
  })

  onBeforeUnmount(() => {
    if (import.meta.client) {
      document.body.style.overflow = ''
    }
  })
</script>

<style scoped>
  .stroy-bm-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .stroy-bm-modal__backdrop {
    position: absolute;
    inset: 0;
    margin: 0;
    padding: 0;
    border: 0;
    background: rgb(0 0 0 / 55%);
    cursor: pointer;
  }

  .stroy-bm-modal__panel {
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

  .stroy-bm-modal__close {
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

  .stroy-bm-modal__close:hover,
  .stroy-bm-modal__close:focus-visible {
    color: #1a1a1a;
    background: #e8e8e8;
  }

  .stroy-bm-modal__body {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
    padding: 60px;
    text-align: center;
  }

  .stroy-bm-modal__title {
    margin: 0;
    max-width: 520px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 30px;
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
  }

  .stroy-bm-modal__media {
    width: min(100%, 534px);
  }

  .stroy-bm-modal__image {
    display: block;
    width: 100%;
    height: auto;
    object-fit: contain;
  }

  .stroy-bm-modal__text {
    margin: 0;
    max-width: 420px;
    color: #1a1a1a;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .stroy-bm-modal__form {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 16px;
    width: 100%;
    max-width: 600px;
  }

  .stroy-bm-modal__form-row {
    display: flex;
    gap: 16px;
    align-items: stretch;
    width: 100%;
  }

  .stroy-bm-modal__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .stroy-bm-modal__form-row :deep(.top-mining-input__control) {
    height: 56px;
    border-color: #757575;
    color: #000;
    background: #fff;
  }

  .stroy-bm-modal__form-row :deep(.top-mining-input__control::placeholder) {
    color: #9a9a9a;
  }

  .stroy-bm-modal__form-row :deep(.top-mining-input__control:focus-visible) {
    border-color: #1a1a1a;
  }

  .stroy-bm-modal__form-row :deep(
    .stroy-bm-modal__submit.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
    max-width: 261px;
  }

  .stroy-bm-modal__form-row :deep(
    .stroy-bm-modal__submit .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .stroy-bm-modal__honeypot {
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

  .stroy-bm-modal__form :deep(.top-mining-privacy-consent__text),
  .stroy-bm-modal__form :deep(.top-mining-privacy-consent) {
    color: #5c5c5c;
  }

  .stroy-bm-modal__form :deep(.top-mining-privacy-consent__link:hover),
  .stroy-bm-modal__form :deep(.top-mining-privacy-consent__link:focus-visible) {
    color: #1a1a1a;
  }

  .stroy-bm-modal-enter-active,
  .stroy-bm-modal-leave-active {
    transition: opacity 0.28s ease;
  }

  .stroy-bm-modal-enter-active .stroy-bm-modal__panel,
  .stroy-bm-modal-leave-active .stroy-bm-modal__panel {
    transition:
      transform 0.32s cubic-bezier(0.22, 1, 0.36, 1),
      opacity 0.28s ease;
  }

  .stroy-bm-modal-enter-from,
  .stroy-bm-modal-leave-to {
    opacity: 0;
  }

  .stroy-bm-modal-enter-from .stroy-bm-modal__panel,
  .stroy-bm-modal-leave-to .stroy-bm-modal__panel {
    opacity: 0;
    transform: translateY(16px) scale(0.96);
  }

  @media (prefers-reduced-motion: reduce) {
    .stroy-bm-modal-enter-active,
    .stroy-bm-modal-leave-active,
    .stroy-bm-modal-enter-active .stroy-bm-modal__panel,
    .stroy-bm-modal-leave-active .stroy-bm-modal__panel {
      transition: none;
    }
  }

  @media (max-width: 767px) {
    .stroy-bm-modal__panel {
      width: min(100%, 520px);
      border-radius: 24px;
    }

    .stroy-bm-modal__body {
      gap: 20px;
      padding: 40px 20px;
    }

    .stroy-bm-modal__title {
      margin-right: 28px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .stroy-bm-modal__text {
      max-width: 288px;
      font-size: 14px;
    }

    .stroy-bm-modal__form-row {
      flex-direction: column;
      gap: 12px;
    }

    .stroy-bm-modal__form-row :deep(
      .stroy-bm-modal__submit.top-mining-button.q-btn.top-mining-button--contact-pill
    ) {
      width: 100%;
      max-width: none;
    }
  }
</style>
