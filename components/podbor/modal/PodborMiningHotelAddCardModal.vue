<template>
  <teleport to="body">
    <div
      v-if="open"
      class="podbor-add-modal"
      role="dialog"
      aria-modal="true"
      aria-labelledby="podbor-add-modal-title"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="podbor-add-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div
        ref="panelRef"
        class="podbor-add-modal__panel"
        tabindex="-1"
      >
        <button
          type="button"
          class="podbor-add-modal__close"
          aria-label="Закрыть"
          @click="close"
        >
          <svg
            viewBox="0 0 24 24"
            width="18"
            height="18"
            aria-hidden="true"
          >
            <path
              fill="currentColor"
              d="M18.3 5.7a1 1 0 0 0-1.4-1.4L12 9.17 7.1 4.3A1 1 0 0 0 5.7 5.7L10.59 10.6 5.7 15.5a1 1 0 1 0 1.4 1.4L12 12l4.9 4.9a1 1 0 0 0 1.4-1.4L13.41 10.6z"
            />
          </svg>
        </button>

        <h2
          id="podbor-add-modal-title"
          class="podbor-add-modal__title"
        >
          {{ modal.title }}
        </h2>
        <p class="podbor-add-modal__subtitle">
          {{ modal.subtitle }}
        </p>

        <form
          class="podbor-add-modal__form"
          @submit.prevent="onSubmit"
        >
          <div class="podbor-add-modal__grid">
            <label class="podbor-add-modal__field">
              <span class="podbor-add-modal__label">{{ modal.nameLabel }}</span>
              <input
                v-model="name"
                type="text"
                class="podbor-add-modal__input"
                autocomplete="name"
                :placeholder="modal.namePlaceholder"
                required
              >
            </label>

            <label class="podbor-add-modal__field">
              <span class="podbor-add-modal__label">{{ modal.phoneLabel }}</span>
              <input
                v-model="phone"
                type="tel"
                class="podbor-add-modal__input"
                autocomplete="tel"
                inputmode="tel"
                :placeholder="modal.phonePlaceholder"
                required
              >
            </label>

            <label class="podbor-add-modal__field">
              <span class="podbor-add-modal__label">{{ modal.powerLabel }}</span>
              <input
                v-model="power"
                type="text"
                class="podbor-add-modal__input"
                inputmode="decimal"
                :placeholder="modal.powerPlaceholder"
                required
              >
            </label>

            <label class="podbor-add-modal__field">
              <span class="podbor-add-modal__label">{{ modal.regionLabel }}</span>
              <input
                v-model="region"
                type="text"
                class="podbor-add-modal__input"
                :placeholder="modal.regionPlaceholder"
                required
              >
            </label>
          </div>

          <button
            type="submit"
            class="podbor-add-modal__submit"
          >
            <span>{{ modal.submitLabel }}</span>
            <img
              class="podbor-add-modal__submit-icon"
              alt=""
              aria-hidden="true"
              :src="arrowIcon"
            >
          </button>

          <label class="podbor-add-modal__privacy">
            <input
              v-model="privacyAccepted"
              type="checkbox"
              class="podbor-add-modal__privacy-check"
              required
            >
            <span class="podbor-add-modal__privacy-text">
              {{ modal.privacyPrefix }}
              <nuxt-link
                class="podbor-add-modal__privacy-link"
                :to="modal.privacyHref"
              >
                {{ modal.privacyLinkLabel }}
              </nuxt-link>
            </span>
          </label>
        </form>
      </div>
    </div>
  </teleport>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { PODBOR_MINING_HOTEL_PLACEMENT } from '~/common/modules/top-mining/podbor-mining-hotel'

  const open = defineModel<boolean>('open', { default: false })

  const modal = PODBOR_MINING_HOTEL_PLACEMENT.modal

  const panelRef = ref<HTMLElement | null>(null)
  const name = ref('')
  const phone = ref('')
  const power = ref('')
  const region = ref('')
  const privacyAccepted = ref(true)

  function close() {
    open.value = false
  }

  function onSubmit() {
    if (!privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки на добавление площадки
    close()
  }

  watch(open, async (isOpen) => {
    if (!import.meta.client) {
      return
    }

    document.body.style.overflow = isOpen ? 'hidden' : ''

    if (isOpen) {
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
  .podbor-add-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .podbor-add-modal__backdrop {
    position: absolute;
    inset: 0;
    border: 0;
    margin: 0;
    padding: 0;
    cursor: pointer;
    background: rgb(0 0 0 / 62%);
  }

  .podbor-add-modal__panel {
    position: relative;
    z-index: 1;
    width: min(100%, 720px);
    max-height: min(92vh, 820px);
    overflow: hidden;
    padding: 40px 40px 32px;
    border-radius: 28px;
    background: #1a1a1a;
    color: #f6f6f6;
    outline: none;
    box-sizing: border-box;
  }

  .podbor-add-modal__close {
    position: absolute;
    top: 16px;
    right: 16px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.65);
    cursor: pointer;
  }

  .podbor-add-modal__close:hover,
  .podbor-add-modal__close:focus-visible {
    color: #fff;
    background: rgba(255, 255, 255, 0.08);
  }

  .podbor-add-modal__title {
    margin: 0 48px 12px 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(20px, 2.4vw, 28px);
    font-weight: 500;
    line-height: 1.2;
    text-transform: uppercase;
  }

  .podbor-add-modal__subtitle {
    margin: 0 0 28px;
    color: rgba(255, 255, 255, 0.85);
    font-size: 16px;
    line-height: 1.4;
  }

  .podbor-add-modal__form {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .podbor-add-modal__grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px 24px;
  }

  .podbor-add-modal__field {
    display: flex;
    flex-direction: column;
    gap: 8px;
    min-width: 0;
  }

  .podbor-add-modal__label {
    font-size: 14px;
    line-height: 1.3;
    color: #f6f6f6;
  }

  .podbor-add-modal__input {
    width: 100%;
    box-sizing: border-box;
    height: 52px;
    padding: 0 20px;
    border: 1px solid #5c5c5c;
    border-radius: 999px;
    background: transparent;
    color: #fff;
    font-size: 16px;
    outline: none;
  }

  .podbor-add-modal__input::placeholder {
    color: rgba(255, 255, 255, 0.4);
  }

  .podbor-add-modal__input:focus {
    border-color: rgba(255, 255, 255, 0.7);
  }

  .podbor-add-modal__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: fit-content;
    min-width: 240px;
    height: 52px;
    padding: 0 28px;
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

  .podbor-add-modal__submit:hover,
  .podbor-add-modal__submit:focus-visible {
    filter: brightness(1.06);
  }

  .podbor-add-modal__submit-icon {
    width: 14px;
    height: 14px;
    object-fit: contain;
  }

  .podbor-add-modal__privacy {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
  }

  .podbor-add-modal__privacy-check {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    accent-color: var(--tm-orange);
  }

  .podbor-add-modal__privacy-text {
    color: rgba(255, 255, 255, 0.55);
    font-size: 12px;
    line-height: 1.4;
  }

  .podbor-add-modal__privacy-link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .podbor-add-modal__privacy-link:hover,
  .podbor-add-modal__privacy-link:focus-visible {
    color: #fff;
  }

  @media (max-width: 700px) {
    .podbor-add-modal__panel {
      padding: 28px 20px 24px;
      border-radius: 20px;
    }

    .podbor-add-modal__grid {
      grid-template-columns: 1fr;
      gap: 16px;
    }

    .podbor-add-modal__submit {
      width: 100%;
    }

    .podbor-add-modal__title {
      margin-right: 36px;
      font-size: 18px;
    }

    .podbor-add-modal__subtitle {
      font-size: 14px;
      margin-bottom: 20px;
    }
  }
</style>
