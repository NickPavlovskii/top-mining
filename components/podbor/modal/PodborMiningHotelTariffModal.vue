<template>
  <teleport to="body">
    <div
      v-if="open && offer"
      class="podbor-tariff-modal"
      role="dialog"
      aria-modal="true"
      aria-labelledby="podbor-tariff-modal-title"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="podbor-tariff-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div
        ref="panelRef"
        class="podbor-tariff-modal__panel"
        tabindex="-1"
      >
        <button
          type="button"
          class="podbor-tariff-modal__close"
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

        <div class="podbor-tariff-modal__badge">
          {{ copy.badge }}
        </div>

        <h2
          id="podbor-tariff-modal-title"
          class="podbor-tariff-modal__title"
        >
          {{ offer.capacityTitle }}
        </h2>

        <div class="podbor-tariff-modal__body">
          <div class="podbor-tariff-modal__media">
            <img
              class="podbor-tariff-modal__image"
              :src="offer.image"
              :alt="offer.title"
            >
            <p class="podbor-tariff-modal__location">
              {{ offer.location }}
            </p>
          </div>

          <div class="podbor-tariff-modal__aside">
            <p class="podbor-tariff-modal__online">
              <span>{{ copy.onlineLabel }}</span>
              <span
                class="podbor-tariff-modal__online-dot"
                aria-hidden="true"
              />
            </p>

            <p class="podbor-tariff-modal__description">
              {{ copy.description }}
            </p>

            <form
              class="podbor-tariff-modal__form"
              @submit.prevent="onSubmit"
            >
              <label class="podbor-tariff-modal__field">
                <span class="podbor-tariff-modal__visually-hidden">
                  {{ copy.phoneLabel }}
                </span>
                <input
                  v-model="phone"
                  type="tel"
                  class="podbor-tariff-modal__input"
                  autocomplete="tel"
                  inputmode="tel"
                  required
                  :placeholder="copy.phonePlaceholder"
                >
              </label>

              <button
                type="submit"
                class="podbor-tariff-modal__submit"
              >
                <span>{{ copy.submitLabel }}</span>
                <img
                  class="podbor-tariff-modal__submit-icon"
                  alt=""
                  aria-hidden="true"
                  :src="arrowIcon"
                >
              </button>

              <label class="podbor-tariff-modal__privacy">
                <input
                  v-model="privacyAccepted"
                  type="checkbox"
                  class="podbor-tariff-modal__privacy-check"
                  required
                >
                <span class="podbor-tariff-modal__privacy-text">
                  {{ copy.privacyPrefix }}
                  <nuxt-link
                    class="podbor-tariff-modal__privacy-link"
                    :to="copy.privacyHref"
                  >
                    {{ copy.privacyLinkLabel }}
                  </nuxt-link>
                </span>
              </label>
            </form>
          </div>
        </div>
      </div>
    </div>
  </teleport>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type {
    PodborOfferLeadModalCopy,
    PodborPlacementOffer,
  } from '~/common/modules/top-mining/podbor-mining-hotel'
  import { PODBOR_MINING_HOTEL_PLACEMENT } from '~/common/modules/top-mining/podbor-mining-hotel'

  const open = defineModel<boolean>('open', { default: false })

  const props = withDefaults(
    defineProps<{
      offer: PodborPlacementOffer | null
      copy?: PodborOfferLeadModalCopy
    }>(),
    {
      copy: undefined,
    },
  )

  const copy = computed(() => props.copy ?? PODBOR_MINING_HOTEL_PLACEMENT.tariffModal)

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

    // TODO: отправка заявки на тариф площадки
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
    () => props.offer?.id,
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
  .podbor-tariff-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .podbor-tariff-modal__backdrop {
    position: absolute;
    inset: 0;
    border: 0;
    margin: 0;
    padding: 0;
    cursor: pointer;
    background: rgb(0 0 0 / 62%);
  }

  .podbor-tariff-modal__panel {
    position: relative;
    z-index: 1;
    width: min(100%, 860px);
    overflow: hidden;
    padding: 36px 40px 36px;
    border-radius: 28px;
    background: #1a1a1a;
    color: #f6f6f6;
    outline: none;
    box-sizing: border-box;
    scrollbar-width: none;
  }

  .podbor-tariff-modal__panel::-webkit-scrollbar {
    display: none;
    width: 0;
    height: 0;
  }

  .podbor-tariff-modal__close {
    position: absolute;
    top: 16px;
    right: 16px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    padding: 0;
    border: 1px solid rgba(255, 255, 255, 0.25);
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.75);
    cursor: pointer;
  }

  .podbor-tariff-modal__close:hover,
  .podbor-tariff-modal__close:focus-visible {
    color: #fff;
    border-color: rgba(255, 255, 255, 0.5);
  }

  .podbor-tariff-modal__badge {
    display: inline-flex;
    align-items: center;
    margin: 0 0 16px;
    padding: 8px 16px;
    border: 1px solid rgba(255, 255, 255, 0.45);
    border-radius: 999px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 12px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
  }

  .podbor-tariff-modal__title {
    margin: 0 48px 28px 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 44px);
    font-weight: 500;
    line-height: 1.1;
    text-transform: uppercase;
  }

  .podbor-tariff-modal__body {
    display: grid;
    grid-template-columns: minmax(0, 1.05fr) minmax(0, 0.95fr);
    gap: 28px 32px;
    align-items: start;
  }

  .podbor-tariff-modal__media {
    min-width: 0;
  }

  .podbor-tariff-modal__image {
    display: block;
    width: 100%;
    aspect-ratio: 1 / 1;
    object-fit: cover;
    border-radius: 24px;
    background: #111;
  }

  .podbor-tariff-modal__location {
    margin: 14px 0 0;
    color: rgba(255, 255, 255, 0.55);
    font-size: 16px;
    line-height: 1.3;
  }

  .podbor-tariff-modal__aside {
    min-width: 0;
    padding-top: 4px;
  }

  .podbor-tariff-modal__online {
    margin: 0 0 16px;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .podbor-tariff-modal__online-dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: #22c55e;
    box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.2);
  }

  .podbor-tariff-modal__description {
    margin: 0 0 24px;
    color: rgba(255, 255, 255, 0.82);
    font-size: 16px;
    line-height: 1.45;
  }

  .podbor-tariff-modal__form {
    display: flex;
    flex-direction: column;
    gap: 14px;
  }

  .podbor-tariff-modal__field {
    display: block;
    min-width: 0;
  }

  .podbor-tariff-modal__input {
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

  .podbor-tariff-modal__input::placeholder {
    color: rgba(255, 255, 255, 0.4);
  }

  .podbor-tariff-modal__input:focus {
    border-color: rgba(255, 255, 255, 0.7);
  }

  .podbor-tariff-modal__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    height: 52px;
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

  .podbor-tariff-modal__submit:hover,
  .podbor-tariff-modal__submit:focus-visible {
    filter: brightness(1.06);
  }

  .podbor-tariff-modal__submit-icon {
    width: 14px;
    height: 14px;
    object-fit: contain;
  }

  .podbor-tariff-modal__privacy {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
  }

  .podbor-tariff-modal__privacy-check {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    accent-color: var(--tm-orange);
  }

  .podbor-tariff-modal__privacy-text {
    color: rgba(255, 255, 255, 0.55);
    font-size: 12px;
    line-height: 1.4;
  }

  .podbor-tariff-modal__privacy-link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .podbor-tariff-modal__privacy-link:hover,
  .podbor-tariff-modal__privacy-link:focus-visible {
    color: #fff;
  }

  .podbor-tariff-modal__visually-hidden {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  @media (max-width: 800px) {
    .podbor-tariff-modal__panel {
      padding: 28px 20px 24px;
      border-radius: 20px;
    }

    .podbor-tariff-modal__body {
      grid-template-columns: 1fr;
      gap: 20px;
    }

    .podbor-tariff-modal__title {
      margin-right: 40px;
      margin-bottom: 20px;
      font-size: 26px;
    }

    .podbor-tariff-modal__image {
      aspect-ratio: 16 / 10;
    }
  }
</style>
