<template>
  <section
    ref="rootRef"
    :class="[
      'podbor-summary',
      { 'podbor-summary--visible': isVisible },
      { 'podbor-summary--reduced-motion': prefersReducedMotion },
    ]"
    aria-labelledby="podbor-summary-title"
  >
    <div class="podbor-summary__inner">
      <h2
        id="podbor-summary-title"
        class="podbor-summary__title"
      >
        {{ summary.title }}
      </h2>

      <article class="podbor-summary__card">
        <ul class="podbor-summary__benefits">
          <li
            v-for="(benefit, index) in summary.benefits"
            :key="index"
            class="podbor-summary__benefit"
          >
            <span
              class="podbor-summary__check"
              aria-hidden="true"
            >
              <Icon
                name="mdi:check"
                class="podbor-summary__check-icon"
              />
            </span>
            <span
              class="podbor-summary__phrase"
              :style="{ '--phrase-index': index }"
            >
              {{ benefit }}
            </span>
          </li>
        </ul>

        <p class="podbor-summary__note">
          <span
            class="podbor-summary__phrase"
            :style="{ '--phrase-index': notePhraseIndex }"
          >
            {{ summary.note }}
          </span>
        </p>

        <form
          class="podbor-summary__form"
          @submit.prevent="onSubmit"
        >
          <div class="podbor-summary__row">
            <label class="podbor-summary__field">
              <span class="podbor-summary__visually-hidden">Телефон</span>
              <input
                v-model="phone"
                type="tel"
                class="podbor-summary__input"
                autocomplete="tel"
                inputmode="tel"
                required
                :placeholder="summary.phonePlaceholder"
              >
            </label>

            <top-mining-button
              class="podbor-summary__submit"
              preset="contact-pill"
              variant="primary"
              size="big"
              surface="dark"
              type="submit"
              :title="summary.submitLabel"
              :append-icon="arrowIcon"
            />
          </div>

          <label class="podbor-summary__privacy">
            <input
              v-model="privacyAccepted"
              type="checkbox"
              class="podbor-summary__privacy-check"
              required
            >
            <span class="podbor-summary__privacy-text">
              {{ summary.privacyPrefix }}
              <nuxt-link
                class="podbor-summary__privacy-link"
                :to="summary.privacyHref"
              >
                {{ summary.privacyLinkLabel }}
              </nuxt-link>
            </span>
          </label>
        </form>
      </article>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { PODBOR_MINING_HOTEL_SUMMARY } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const summary = PODBOR_MINING_HOTEL_SUMMARY
  const notePhraseIndex = summary.benefits.length
  const phone = ref('')
  const privacyAccepted = ref(true)
  const rootRef = ref<HTMLElement | null>(null)
  const isVisible = ref(false)
  const prefersReducedMotion = ref(false)

  let observer: IntersectionObserver | null = null

  onMounted(() => {
    prefersReducedMotion.value = window.matchMedia(
      '(prefers-reduced-motion: reduce)',
    ).matches

    if (prefersReducedMotion.value) {
      isVisible.value = true
      return
    }

    const root = rootRef.value

    if (!root || typeof IntersectionObserver === 'undefined') {
      isVisible.value = true
      return
    }

    observer = new IntersectionObserver(
      ([entry]) => {
        if (!entry?.isIntersecting) {
          return
        }

        isVisible.value = true
        observer?.disconnect()
        observer = null
      },
      {
        threshold: 0.2,
        rootMargin: '0px 0px -10% 0px',
      },
    )

    observer.observe(root)
  })

  onBeforeUnmount(() => {
    observer?.disconnect()
    observer = null
  })

  function onSubmit() {
    if (!privacyAccepted.value) {
      return
    }

    // TODO: отправка итоговой заявки
  }
</script>

<style scoped>
  .podbor-summary {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 24px 0 48px;
  }

  .podbor-summary__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
    display: grid;
    grid-template-columns: minmax(180px, 0.35fr) minmax(0, 1fr);
    gap: 40px;
    align-items: start;
  }

  .podbor-summary__title {
    margin: 0;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(40px, 5vw, 72px);
    font-weight: 500;
    line-height: 1.05;
    text-transform: uppercase;
  }

  .podbor-summary__card {
    padding: 36px 40px;
    border-radius: 28px;
    background: #1b1b1b;
  }

  .podbor-summary__benefits {
    margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 18px;
  }

  .podbor-summary__benefit {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    color: var(--tm-off-white);
    font-size: 17px;
    line-height: 1.4;
  }

  .podbor-summary__check {
    flex-shrink: 0;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 22px;
    height: 22px;
    margin-top: 1px;
    border-radius: 5px;
    background: var(--tm-orange);
    color: #fff;
  }

  .podbor-summary__check-icon {
    width: 16px;
    height: 16px;
  }

  .podbor-summary__phrase {
    display: inline-block;
    opacity: 0.8;
    color: var(--tm-text-soft);
    filter: blur(3px);
  }

  .podbor-summary--visible .podbor-summary__phrase {
    animation: podbor-summary-fade-in 0.8s forwards
      cubic-bezier(0.11, 0, 0.5, 0);
    animation-delay: calc(var(--phrase-index) * 0.12s);
  }

  .podbor-summary--reduced-motion .podbor-summary__phrase {
    opacity: 1;
    color: var(--tm-off-white);
    filter: none;
    animation: none;
  }

  .podbor-summary--reduced-motion .podbor-summary__note .podbor-summary__phrase {
    color: rgba(255, 255, 255, 0.62);
  }

  @keyframes podbor-summary-fade-in {
    to {
      opacity: 1;
      color: var(--tm-off-white);
      filter: blur(0);
    }
  }

  .podbor-summary--visible
    .podbor-summary__note
    .podbor-summary__phrase {
    animation-name: podbor-summary-note-fade-in;
  }

  @keyframes podbor-summary-note-fade-in {
    to {
      opacity: 1;
      color: rgba(255, 255, 255, 0.62);
      filter: blur(0);
    }
  }

  .podbor-summary__note {
    margin: 28px 0;
    padding: 24px 0;
    border-top: 1px solid rgba(255, 255, 255, 0.12);
    border-bottom: 1px solid rgba(255, 255, 255, 0.12);
    font-size: 15px;
    line-height: 1.45;
  }

  .podbor-summary__form {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .podbor-summary__row {
    display: flex;
    align-items: stretch;
    gap: 16px;
  }

  .podbor-summary__field {
    display: block;
    min-width: 0;
    flex: 1 1 auto;
  }

  .podbor-summary__input {
    width: 100%;
    box-sizing: border-box;
    height: 56px;
    padding: 0 24px;
    border: 1px solid #5c5c5c;
    border-radius: 999px;
    background: transparent;
    color: var(--tm-white);
    font-size: 16px;
    line-height: 1.2;
    outline: none;
  }

  .podbor-summary__input::placeholder {
    color: rgba(255, 255, 255, 0.45);
  }

  .podbor-summary__input:focus {
    border-color: rgba(255, 255, 255, 0.7);
  }

  .podbor-summary__row
    .podbor-summary__submit.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
    flex: 0 0 auto;
    width: auto;
    max-width: max-content;
    min-width: 0;
  }

  .podbor-summary__privacy {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
  }

  .podbor-summary__privacy-check {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    accent-color: var(--tm-orange);
  }

  .podbor-summary__privacy-text {
    color: rgba(255, 255, 255, 0.55);
    font-size: 12px;
    line-height: 1.4;
  }

  .podbor-summary__privacy-link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .podbor-summary__privacy-link:hover,
  .podbor-summary__privacy-link:focus-visible {
    color: var(--tm-white);
  }

  .podbor-summary__visually-hidden {
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

  @media (max-width: 1600px) {
    .podbor-summary__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-summary__inner {
      padding: 0 24px;
      gap: 28px;
      grid-template-columns: minmax(140px, 0.3fr) minmax(0, 1fr);
    }

    .podbor-summary__card {
      padding: 28px 24px;
    }

    .podbor-summary__benefit {
      font-size: 16px;
    }
  }

  @media (max-width: 899px) {
    .podbor-summary {
      padding: 16px 0 32px;
    }

    .podbor-summary__inner {
      grid-template-columns: 1fr;
      gap: 20px;
      padding: 0 16px;
    }

    .podbor-summary__title {
      font-size: 40px;
    }

    .podbor-summary__card {
      padding: 24px 20px;
      border-radius: 24px;
    }

    .podbor-summary__row {
      flex-direction: column;
    }

    .podbor-summary__row
      .podbor-summary__submit.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
      width: 100%;
      max-width: 100%;
      min-height: 48px;
    }

    .podbor-summary__submit :deep(.top-mining-button__inner) {
      justify-content: center;
    }
  }
</style>
