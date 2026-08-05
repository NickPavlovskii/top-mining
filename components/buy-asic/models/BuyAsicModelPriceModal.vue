<template>
  <teleport to="body">
    <div
      v-if="open && model"
      class="buy-asic-price-modal"
      role="dialog"
      aria-modal="true"
      aria-labelledby="buy-asic-price-modal-title"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="buy-asic-price-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div
        ref="panelRef"
        class="buy-asic-price-modal__panel"
        tabindex="-1"
      >
        <button
          type="button"
          class="buy-asic-price-modal__close"
          aria-label="Закрыть"
          @click="close"
        >
          <img
            class="buy-asic-price-modal__close-icon"
            alt=""
            aria-hidden="true"
            :src="closeIcon"
          >
        </button>

        <div class="buy-asic-price-modal__body">
          <div class="buy-asic-price-modal__aside">
            <h2
              id="buy-asic-price-modal-title"
              class="buy-asic-price-modal__title"
            >
              {{ model.name }}
            </h2>

            <p class="buy-asic-price-modal__online">
              <span>{{ copy.onlineLabel }}</span>
              <span
                class="buy-asic-price-modal__online-dot"
                aria-hidden="true"
              />
            </p>

            <p class="buy-asic-price-modal__description">
              {{ copy.descriptionPrefix }}
              {{ ' ' }}
              {{ model.name }}
              {{ ' ' }}
              {{ copy.descriptionSuffix }}
            </p>

            <form
              class="buy-asic-price-modal__form"
              @submit.prevent="onSubmit"
            >
              <top-mining-input
                v-model="phone"
                type="tel"
                autocomplete="tel"
                inputmode="tel"
                required
                :placeholder="copy.phonePlaceholder"
                :accessible-label="copy.phoneLabel"
              />

              <button
                type="submit"
                class="buy-asic-price-modal__submit"
              >
                <span>{{ copy.submitLabel }}</span>
                <img
                  class="buy-asic-price-modal__submit-icon"
                  alt=""
                  aria-hidden="true"
                  :src="arrowIcon"
                >
              </button>

              <top-mining-privacy-consent
                v-model="privacyAccepted"
                :prefix="copy.privacyPrefix"
                :privacy-link-label="copy.privacyLinkLabel"
                :privacy-href="copy.privacyHref"
              />
            </form>
          </div>

          <div class="buy-asic-price-modal__media">
            <img
              class="buy-asic-price-modal__image"
              :src="model.image"
              :alt="model.name"
            >
          </div>
        </div>
      </div>
    </div>
  </teleport>
</template>

<script setup lang="ts">
  import type { BuyAsicModel } from '~/common/modules/top-mining/buy-asic/page'
  import { BUY_ASIC_MODELS } from '~/common/modules/top-mining/buy-asic/page'
  import closeIcon from '~/assets/images/top-mining/icons/close-icon.png'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const open = defineModel<boolean>('open', { default: false })

  const props = defineProps<{
    model: BuyAsicModel | null
  }>()

  const copy = BUY_ASIC_MODELS.priceModal
  const panelRef = ref<HTMLElement | null>(null)
  const phone = ref('')
  const privacyAccepted = ref(true)

  function close() {
    open.value = false
  }

  function onSubmit() {
    if (!privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки на цену модели ASIC
    close()
  }

  watch(open, async (isOpen) => {
    if (!import.meta.client) {
      return
    }

    document.body.style.overflow = isOpen ? 'hidden' : ''

    if (isOpen) {
      phone.value = ''
      await nextTick()
      panelRef.value?.focus()
    }
  })

  watch(
    () => props.model?.id,
    () => {
      phone.value = ''
    },
  )

  onBeforeUnmount(() => {
    if (import.meta.client) {
      document.body.style.overflow = ''
    }
  })
</script>

<style scoped>
  .buy-asic-price-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .buy-asic-price-modal__backdrop {
    position: absolute;
    inset: 0;
    margin: 0;
    padding: 0;
    border: 0;
    background: rgb(0 0 0 / 62%);
    cursor: pointer;
  }

  .buy-asic-price-modal__panel {
    position: relative;
    z-index: 1;
    box-sizing: border-box;
    width: min(100%, 920px);
    padding: 44px 48px;
    overflow: hidden;
    border-radius: 36px;
    background: #1a1a1a;
    color: #fff;
    outline: none;
  }

  .buy-asic-price-modal__close {
    position: absolute;
    top: 18px;
    right: 18px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    padding: 0;
    border: 1px solid rgba(255, 255, 255, 0.22);
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.75);
    cursor: pointer;
  }

  .buy-asic-price-modal__close:hover,
  .buy-asic-price-modal__close:focus-visible {
    color: #fff;
    border-color: rgba(255, 255, 255, 0.5);
  }

  .buy-asic-price-modal__close-icon {
    display: block;
    width: 14px;
    height: 14px;
    object-fit: contain;
    mix-blend-mode: screen;
  }

  .buy-asic-price-modal__body {
    display: grid;
    grid-template-columns: minmax(0, 1.15fr) minmax(0, 0.85fr);
    gap: 28px 40px;
    align-items: center;
  }

  .buy-asic-price-modal__aside {
    min-width: 0;
    padding-right: 8px;
  }

  .buy-asic-price-modal__title {
    margin: 0 48px 20px 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.1;
    text-transform: uppercase;
  }

  .buy-asic-price-modal__online {
    display: inline-flex;
    gap: 10px;
    align-items: center;
    margin: 0 0 16px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .buy-asic-price-modal__online-dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: #22c55e;
    box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.2);
  }

  .buy-asic-price-modal__description {
    margin: 0 0 28px;
    color: rgba(255, 255, 255, 0.88);
    font-size: 16px;
    line-height: 1.45;
  }

  .buy-asic-price-modal__form {
    display: flex;
    flex-direction: column;
    gap: 14px;
  }

  .buy-asic-price-modal__submit {
    display: inline-flex;
    gap: 10px;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 56px;
    padding: 0 24px;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
  }

  .buy-asic-price-modal__submit:hover,
  .buy-asic-price-modal__submit:focus-visible {
    filter: brightness(1.06);
  }

  .buy-asic-price-modal__submit-icon {
    width: 14px;
    height: 14px;
    object-fit: contain;
  }

  .buy-asic-price-modal__media {
    min-width: 0;
  }

  .buy-asic-price-modal__image {
    display: block;
    width: 100%;
    aspect-ratio: 1 / 1;
    object-fit: contain;
    background: transparent;
    filter: drop-shadow(0 18px 40px rgba(0, 0, 0, 0.45));
  }

  @media (max-width: 800px) {
    .buy-asic-price-modal__panel {
      padding: 28px 20px 24px;
      border-radius: 24px;
    }

    .buy-asic-price-modal__body {
      grid-template-columns: 1fr;
      gap: 20px;
    }

    .buy-asic-price-modal__aside {
      padding-right: 0;
    }

    .buy-asic-price-modal__title {
      margin-right: 40px;
      margin-bottom: 16px;
      font-size: 24px;
    }

    .buy-asic-price-modal__media {
      order: -1;
      max-width: 220px;
      margin: 0 auto;
    }
  }
</style>
