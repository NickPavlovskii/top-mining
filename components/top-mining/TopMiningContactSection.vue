<template>
  <section
    id="home-contact-form"
    :class="[
      'contact-section',
      { 'contact-section--flush': flush },
    ]"
    aria-labelledby="contact-section-question-title"
  >
    <div class="contact-section__wrapper">
      <div class="contact-section__inner">
        <div class="contact-section__grid">
          <article
            ref="questionCircleRef"
            class="contact-section__circle contact-section__circle--question"
          >
            <img
              class="contact-section__circle-bg"
              :src="contactCircleLeft"
              alt=""
              aria-hidden="true"
            />

            <div
              :class="[
                'contact-section__circle-content',
                'contact-section__circle-content--question',
                {
                  'contact-section__circle-content--compact': questionIsCompact,
                },
              ]"
              :style="questionLayoutStyle"
            >
              <div
                class="contact-section__stack contact-section__stack--question"
              >
                <h2
                  id="contact-section-question-title"
                  class="contact-section__title contact-section__title--single"
                >
                  {{ t('contact.askTitle') }}
                </h2>

                <div class="contact-section__lead-form">
                  <p class="contact-section__lead">
                    {{ t('contact.askLead') }}
                  </p>

                  <form
                    class="contact-section__form"
                    @submit.prevent="onQuestionSubmit"
                  >
                    <div class="contact-section__input-row">
                      <label class="contact-section__input-wrap">
                        <span class="contact-section__visually-hidden">
                          {{ t('contact.phoneLabel') }}
                        </span>
                        <input
                          v-model="phone"
                          type="tel"
                          class="contact-section__input"
                          autocomplete="tel"
                          inputmode="tel"
                          :placeholder="t('contact.phonePlaceholder')"
                          :disabled="phoneStatus === 'loading'"
                        />
                      </label>

                      <top-mining-round-icon-button
                        type="submit"
                        class="contact-section__submit-btn contact-section__submit-btn--send"
                        color="var(--jet-color)"
                        :aria-label="t('contact.sendPhoneAria')"
                        :disabled="phoneStatus === 'loading'"
                        :width="questionSubmitMetrics.width"
                        :height="questionSubmitMetrics.height"
                        :icon-size="questionSubmitMetrics.iconSize"
                        :background-color="TOP_MINING_CONTACT_BUTTON_GRADIENT"
                        :hover-background-color="
                          TOP_MINING_CONTACT_BUTTON_GRADIENT
                        "
                      />
                    </div>

                    <top-mining-form-status
                      :status="phoneStatus"
                      :message="phoneFeedback"
                      align="center"
                      tone="dark"
                    />
                  </form>
                </div>

                <div class="contact-section__telegram-group">
                  <p class="contact-section__divider">
                    {{ t('contact.telegramDivider') }}
                  </p>

                  <top-mining-button
                    target="_blank"
                    :class="[
                      'contact-section__telegram-btn',
                      'top-mining-button--contact-section-telegram',
                      {
                        'top-mining-button--contact-section-telegram--compact':
                          questionIsCompact,
                      },
                    ]"
                    rel="noopener noreferrer"
                    v-bind="TOP_MINING_BUTTON_PROPS"
                    :title="t('contact.telegramWrite')"
                    :bg-color="TOP_MINING_CONTACT_BUTTON_GRADIENT"
                    :color="TOP_MINING_CONTACT_TELEGRAM.buttonColor"
                    :append-icon="buttonArrow"
                    :href="TOP_MINING_CONTACT_TELEGRAM.href"
                  />
                </div>
              </div>
            </div>
          </article>

          <article
            ref="subscribeCircleRef"
            class="contact-section__circle contact-section__circle--subscribe"
          >
            <img
              class="contact-section__circle-bg"
              alt=""
              aria-hidden="true"
              :src="contactCircleRight"
            />

            <div
              :class="[
                'contact-section__circle-content',
                'contact-section__circle-content--subscribe',
                {
                  'contact-section__circle-content--compact':
                    subscribeIsCompact,
                },
              ]"
              :style="subscribeLayoutStyle"
            >
              <div
                class="contact-section__stack contact-section__stack--subscribe"
              >
                <h2
                  class="contact-section__title contact-section__title--single"
                >
                  {{ t('contact.subscribeTitle') }}
                </h2>

                <div class="contact-section__lead-form">
                  <p
                    class="contact-section__lead contact-section__lead--subscribe"
                  >
                    {{ t('contact.subscribeLead') }}
                  </p>

                  <form
                    class="contact-section__form"
                    @submit.prevent="onSubscribeSubmit"
                  >
                    <div class="contact-section__input-row">
                      <label class="contact-section__input-wrap">
                        <span class="contact-section__visually-hidden">
                          E-mail
                        </span>
                        <input
                          v-model="subscribeEmail"
                          type="email"
                          autocomplete="email"
                          class="contact-section__input"
                          :placeholder="t('footer.emailPlaceholder')"
                          :disabled="subscribeStatus === 'loading'"
                        />
                      </label>

                      <top-mining-round-icon-button
                        type="submit"
                        class="contact-section__submit-btn contact-section__submit-btn--send"
                        color="var(--jet-color)"
                        :aria-label="t('footer.subscribeAria')"
                        :disabled="subscribeStatus === 'loading'"
                        :background-color="TOP_MINING_CONTACT_BUTTON_GRADIENT"
                        :hover-background-color="
                          TOP_MINING_CONTACT_BUTTON_GRADIENT
                        "
                        :width="subscribeSubmitMetrics.width"
                        :height="subscribeSubmitMetrics.height"
                        :icon-size="subscribeSubmitMetrics.iconSize"
                      />
                    </div>

                    <top-mining-form-status
                      :status="subscribeStatus"
                      :message="subscribeMessage"
                      align="center"
                      tone="dark"
                    />
                  </form>
                </div>
              </div>
            </div>
          </article>
        </div>

        <top-mining-articles-section
          v-if="showArticles"
          v-model:active-topic="articlesTopic"
        >
          <top-mining-articles-feed :topic="articlesTopic" />
        </top-mining-articles-section>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining/ui/button'
  import {
    TOP_MINING_CONTACT_BUTTON_GRADIENT,
    TOP_MINING_CONTACT_TELEGRAM,
  } from '~/common/modules/top-mining/layout/contact-section'

  const { t } = useT()
  import buttonArrow from '~/assets/images/top-mining/button-arrow.png'
  import contactCircleLeft from '~/assets/images/top-mining/contact-circle-left.png'
  import contactCircleRight from '~/assets/images/top-mining/contact-circle-right.png'
  import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/layout/articles-section'
  import TopMiningArticlesFeed from '~/components/top-mining/TopMiningArticlesFeed.vue'
  import TopMiningArticlesSection from '~/components/top-mining/TopMiningArticlesSection.vue'

  withDefaults(
    defineProps<{
      showArticles?: boolean
      /** Без серого overlap с предыдущей секцией — сплошной тёмный фон страницы */
      flush?: boolean
    }>(),
    {
      showArticles: true,
      flush: false,
    },
  )

  const articlesTopic = ref<TopMiningArticlesTopicId>('all')

  const {
    circleRef: questionCircleRef,
    layoutStyle: questionLayoutStyle,
    isCompact: questionIsCompact,
  } = useTopMiningContactCircleLayout('question')

  const {
    circleRef: subscribeCircleRef,
    layoutStyle: subscribeLayoutStyle,
    isCompact: subscribeIsCompact,
  } = useTopMiningContactCircleLayout('subscribe')

  const phone = ref('')
  const {
    status: phoneStatus,
    message: phoneFeedback,
    submit: submitPhoneLead,
  } = useSubmitLead('home-phone')
  const {
    email: subscribeEmail,
    status: subscribeStatus,
    message: subscribeMessage,
    submit: submitSubscribe,
  } = useSubscribeEmail('contact-section')

  async function onQuestionSubmit() {
    const ok = await submitPhoneLead({
      source: 'home-phone',
      contact: phone.value,
    })

    if (ok) {
      phone.value = ''
    }
  }

  async function onSubscribeSubmit() {
    await submitSubscribe()
  }

  function getContactSubmitMetrics(layoutStyle: Ref<Record<string, string>>) {
    return computed(() => {
      const size = layoutStyle.value['--cc-btn-size'] ?? '56px'
      const sizePx = Number.parseFloat(size)

      return {
        width: size,
        height: size,
        iconSize: `${sizePx * 0.36}px`,
      }
    })
  }

  const questionSubmitMetrics = getContactSubmitMetrics(questionLayoutStyle)
  const subscribeSubmitMetrics = getContactSubmitMetrics(subscribeLayoutStyle)
</script>

<style scoped>
  .contact-section {
    position: relative;
    z-index: 4;
    margin-top: -64px;
    padding-top: 64px;
    background: #f2f2f2;
  }

  .contact-section--flush {
    margin-top: 0;
    padding-top: 0;
    background: var(--tm-page-bg);
  }

  .contact-section__wrapper {
    width: 100%;
    border-radius: 64px 64px 0 0;
    background-color: #000;
    color: var(--tm-white);
    overflow: hidden;
  }

  .contact-section--flush .contact-section__wrapper {
    border-radius: 0;
    background-color: var(--tm-page-bg);
  }

  .contact-section__inner {
    width: 100%;
    max-width: 1920px;
    margin: 0 auto;
    padding: clamp(56px, 7vw, 96px) clamp(16px, 4vw, 60px)
      clamp(48px, 6vw, 72px);
    box-sizing: border-box;
  }

  .contact-section__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: clamp(12px, 1.6vw, 20px);
    align-items: start;
    width: 100%;
    max-width: 1720px;
    margin: 0 auto;
  }

  .contact-section__circle {
    position: relative;
    min-width: 0;
    aspect-ratio: 1;
    border-radius: 50%;
    overflow: hidden;
    isolation: isolate;
  }

  .contact-section__circle--subscribe {
    margin-top: 146px;
  }

  .contact-section__circle-bg {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    pointer-events: none;
    user-select: none;
  }

  .contact-section__circle-content {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100%;
    padding: clamp(28px, 4.5vw, 56px) clamp(20px, 3.5vw, 40px);
    text-align: center;
    box-sizing: border-box;
  }

  .contact-section__circle-content--compact {
    padding: 10% 9%;
  }

  .contact-section__stack {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: min(100%, var(--cc-width));
    flex-shrink: 0;
    container-type: inline-size;
  }

  .contact-section__stack > * {
    flex-shrink: 0;
  }

  .contact-section__lead-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: var(--cc-lead-form-gap);
    width: min(100%, var(--cc-width));
    margin-top: var(--cc-title-lead-gap);
  }

  .contact-section__stack--question > .contact-section__telegram-group {
    margin-top: var(--cc-form-divider-gap);
  }

  .contact-section__telegram-group {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: var(--cc-divider-btn-gap);
    width: min(100%, var(--cc-width));
  }

  .contact-section__title {
    width: min(100%, var(--cc-width));
    max-width: 100%;
    min-width: 0;
    min-height: var(--cc-title-lh);
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: var(--cc-title-size);
    font-weight: 500;
    line-height: var(--cc-title-lh);
    letter-spacing: -0.03em;
    text-transform: uppercase;
  }

  .contact-section__title--single {
    display: block;
  }

  /* Длиннее «Подпишитесь» — масштабируем, чтобы nowrap не обрезался кругом */
  .contact-section__stack--question .contact-section__title {
    min-height: 0;
    font-size: min(var(--cc-title-size), 8cqi);
    line-height: 1.15;
  }

  .contact-section__stack--question .contact-section__title,
  .contact-section__stack--question .contact-section__lead,
  .contact-section__stack--question .contact-section__divider {
    white-space: nowrap;
  }

  .contact-section__circle-content--compact .contact-section__stack,
  .contact-section__circle-content--compact .contact-section__lead-form,
  .contact-section__circle-content--compact .contact-section__telegram-group,
  .contact-section__circle-content--compact .contact-section__form,
  .contact-section__circle-content--compact .contact-section__input-row {
    width: 100%;
    max-width: 100%;
  }

  .contact-section__circle-content--compact .contact-section__title,
  .contact-section__circle-content--compact .contact-section__lead,
  .contact-section__circle-content--compact .contact-section__divider {
    width: 100%;
    max-width: 100%;
    min-height: 0;
    white-space: normal;
  }

  .contact-section__circle-content--compact
    .contact-section__stack--question
    .contact-section__title,
  .contact-section__circle-content--compact
    .contact-section__stack--question
    .contact-section__lead,
  .contact-section__circle-content--compact
    .contact-section__stack--question
    .contact-section__divider {
    white-space: normal;
  }

  .contact-section__circle-content--compact .contact-section__input-row {
    justify-content: stretch;
  }

  .contact-section__circle-content--compact .contact-section__input-wrap {
    flex: 1 1 auto;
    width: auto;
    min-width: 0;
    max-width: none;
  }

  .contact-section__circle-content--compact .contact-section__input {
    padding-inline: 14px;
    font-size: 14px;
  }

  .contact-section
    .contact-section__circle-content--compact
    .contact-section__telegram-group
    .contact-section__telegram-btn.top-mining-button.top-mining-button--contact-section-telegram {
    width: var(--cc-tg-btn-w);
    max-width: var(--cc-tg-btn-w);
  }

  .contact-section__lead {
    width: min(100%, var(--cc-lead-max-w));
    min-height: var(--cc-lead-lh);
    margin: 0;
    color: rgba(255, 255, 255, 0.92);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: var(--cc-lead-size);
    font-weight: 400;
    line-height: var(--cc-lead-lh);
    letter-spacing: -0.02em;
    text-transform: none;
  }

  .contact-section__lead--subscribe {
    display: block;
    text-transform: lowercase;
  }

  .contact-section__form {
    width: min(100%, var(--cc-input-row-w));
  }

  .contact-section__input-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: var(--cc-input-gap);
    width: min(100%, var(--cc-input-row-w));
  }

  .contact-section__input-wrap {
    flex: 0 0 auto;
    width: min(100%, var(--cc-input-w));
    max-width: var(--cc-input-w);
  }

  .contact-section__input {
    width: 100%;
    height: var(--cc-control-h);
    padding: 0 20px;
    border: 1px solid rgba(255, 255, 255, 0.22);
    border-radius: 999px;
    background: rgba(0, 0, 0, 0.28);
    color: rgba(255, 255, 255, 0.42);
    font-family: inherit;
    font-size: clamp(14px, 1.2vw, 16px);
    line-height: 1.2;
    outline: none;
    transition: border-color 0.2s ease;
  }

  .contact-section__input::placeholder {
    color: rgba(255, 255, 255, 0.42);
  }

  .contact-section__input:focus-visible {
    border-color: rgba(255, 255, 255, 0.42);
  }

  .contact-section__divider {
    width: min(100%, var(--cc-divider-max-w));
    min-height: var(--cc-lead-lh);
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: var(--cc-lead-size);
    font-weight: 500;
    line-height: var(--cc-lead-lh);
    letter-spacing: -0.02em;
    text-transform: uppercase;
  }

  .contact-section
    .contact-section__telegram-group
    .contact-section__telegram-btn.top-mining-button.top-mining-button--contact-section-telegram {
    width: min(100%, var(--cc-tg-btn-w));
    min-width: 0;
    max-width: var(--cc-tg-btn-w);
    min-height: var(--cc-control-h);
    height: var(--cc-control-h);
    padding-inline: 20px;
    font-size: var(--cc-tg-btn-size);
    line-height: var(--cc-tg-btn-lh);
  }

  .contact-section__visually-hidden {
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

  @media (max-width: 1280px) {
    .contact-section__inner {
      padding-bottom: clamp(72px, 8vw, 112px);
    }

    .contact-section__circle--subscribe {
      margin-top: clamp(48px, 7vw, 100px);
    }
  }

  @media (max-width: 900px) {
    .contact-section {
      margin-top: -32px;
      padding-top: 32px;
    }

    .contact-section__wrapper {
      border-radius: 32px 32px 0 0;
    }

    .contact-section__inner {
      padding: clamp(32px, 6vw, 48px) clamp(16px, 4vw, 20px)
        clamp(30px, 8vw, 69px);
    }

    .contact-section__grid {
      grid-template-columns: 1fr;
      gap: 12px;
      max-width: min(100%, 420px);
      margin: 0 auto;
    }

    .contact-section__circle {
      width: 100%;
      max-width: 420px;
      margin: 0 auto;
      aspect-ratio: 1;
      border-radius: 50%;
    }

    .contact-section__circle--subscribe {
      margin-top: 0;
    }

    .contact-section__circle-content {
      height: 100%;
      justify-content: center;
    }
  }

  @media (max-width: 560px) {
    .contact-section__inner {
      padding-inline: 12px;
    }

    .contact-section__grid {
      max-width: min(100%, 382px);
      gap: 10px;
    }

    .contact-section__circle {
      max-width: 100%;
    }
  }
</style>
