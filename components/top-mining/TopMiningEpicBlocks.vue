<template>
  <section class="epic-blocks" aria-label="Дополнительные инструменты">
    <article class="epic-block--telegram">
      <div class="epic-block__telegram-scene">
        <div class="epic-block__telegram-surface">
          <div class="epic-block__telegram-card">
            <div class="epic-block__content">
              <h2 class="epic-block__title epic-block__title--telegram">
                <span class="epic-block__title-line epic-block__title-line--head">
                  <span class="epic-block__title-word">Самый</span>
                  <span class="epic-block__highlight-text">удобный</span>
                </span>
                <span class="epic-block__title-line">калькулятор</span>
                <span class="epic-block__title-line">в&nbsp;Telegram</span>
              </h2>

              <p class="epic-block__text epic-block__text--telegram">
                Также вы можете рассчитать доходность вашего устройства
                в&nbsp;нашем Telegram-канале
              </p>
            </div>
          </div>

          <div
            class="epic-block__mockup epic-block__mockup--telegram"
            @click="toggleTelegramVideo"
          >
            <div class="epic-block__phone-shell">
              <img
                class="epic-block__mockup-phone"
                :src="tgCalcMockupBg"
                alt=""
                draggable="false"
              />

              <video
                v-if="isTelegramVideoPlaying"
                ref="telegramVideoRef"
                class="epic-block__video epic-block__video--visible"
                loop
                playsinline
                muted
                autoplay
                :src="TOP_MINING_TELEGRAM_CALC_VIDEO"
              />

              <button
                v-if="!isTelegramVideoPlaying"
                type="button"
                class="epic-block__play-button"
                aria-label="Воспроизвести видео"
                @click.stop="toggleTelegramVideo"
              >
                <span />
              </button>
            </div>
          </div>

          <div class="epic-block__telegram-actions">
            <a
              class="epic-block__button epic-block__button--telegram"
              target="_blank"
              rel="noopener noreferrer"
              :href="TOP_MINING_TELEGRAM_BOT_URL"
            >
              <Icon name="mdi:telegram" class="epic-block__button-icon" />
              <span>В Telegram</span>
              <Icon name="mdi:arrow-top-right" class="epic-block__button-arrow" />
            </a>
          </div>

          <div class="epic-block__telegram-decor-clip" aria-hidden="true">
            <img
              class="epic-block__decor-plane epic-block__decor-plane--large"
              alt=""
              :src="tgPlaneDecor"
            />

            <img
              class="epic-block__decor-plane epic-block__decor-plane--small"
              alt=""
              :src="tgPlaneSmall"
            />
          </div>
        </div>
      </div>
    </article>

    <article class="epic-block--converter">
      <div
        class="epic-block__converter-wrap"
        :style="{ '--converter-bg': `url(${konverBlockWrapBg})` }"
      >
        <h2 class="epic-block__title epic-block__title--converter">
          <span class="epic-block__title-line">Конвертер</span>
          <span class="epic-block__title-line epic-block__highlight-text">хешрейта</span>
        </h2>

        <p class="epic-block__text epic-block__text--converter">
          Теперь вы можете быстро конвертировать мощность майнинга,
          не&nbsp;уходя с&nbsp;нашего сайта
        </p>

        <a
          :href="TOP_MINING_HASHRATE_CONVERTER_URL"
          class="epic-block__button epic-block__button--orange"
        >
          <span>Перейти</span>
          <Icon name="mdi:arrow-top-right" class="epic-block__button-arrow" />
        </a>

        <img
          class="epic-block__converter-mobile-visual"
          :src="hashrateConverterVisual"
          alt=""
          aria-hidden="true"
        />
      </div>
    </article>
  </section>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_HASHRATE_CONVERTER_URL,
    TOP_MINING_TELEGRAM_BOT_URL,
    TOP_MINING_TELEGRAM_CALC_VIDEO,
  } from '~/common/modules/top-mining'
  import tgCalcMockupBg from '~/assets/images/top-mining/tg-calc-mockup-bg.png'
  import tgPlaneDecor from '~/assets/images/top-mining/tg-plane-decor.svg'
  import tgPlaneSmall from '~/assets/images/top-mining/tg-plane-small.png'
  import konverBlockWrapBg from '~/assets/images/top-mining/konver-block-wrap-bg.png'
  import hashrateConverterVisual from '~/assets/images/top-mining/hashrate-converter-visual.png'

  const telegramVideoRef = ref<HTMLVideoElement | null>(null)
  const isTelegramVideoPlaying = ref(false)
  let autoPlayTimeoutId: ReturnType<typeof setTimeout> | null = null

  function clearAutoPlayTimeout() {
    if (autoPlayTimeoutId !== null) {
      clearTimeout(autoPlayTimeoutId)
      autoPlayTimeoutId = null
    }
  }

  function playTelegramVideo() {
    clearAutoPlayTimeout()
    isTelegramVideoPlaying.value = true

    void nextTick(() => {
      const video = telegramVideoRef.value

      if (!video) {
        return
      }

      video.muted = false
      void video.play()
    })
  }

  function pauseTelegramVideo() {
    const video = telegramVideoRef.value

    if (video) {
      video.pause()
    }

    isTelegramVideoPlaying.value = false
  }

  function toggleTelegramVideo() {
    if (isTelegramVideoPlaying.value) {
      pauseTelegramVideo()
    } else {
      playTelegramVideo()
    }
  }

  onMounted(() => {
    autoPlayTimeoutId = setTimeout(() => {
      playTelegramVideo()
    }, 10_000)
  })

  onBeforeUnmount(() => {
    clearAutoPlayTimeout()
  })
</script>

<style scoped>
  .epic-blocks {
    display: grid;
    gap: clamp(40px, 5vw, 80px);
    width: 100%;
    margin: 0;
    padding: 0;
  }

  .epic-block {
    position: relative;
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(220px, 34%);
    gap: clamp(16px, 3vw, 32px);
    align-items: center;
    min-height: 300px;
    padding: clamp(32px, 4vw, 52px) clamp(24px, 4vw, 48px);
    border-radius: 32px;
    background: var(--tm-black);
    color: var(--tm-white);
    overflow: hidden;
  }

  .epic-block--telegram {
    display: block;
    min-height: 0;
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
    border-radius: 0;
    background: transparent;
    overflow: visible;
  }

  .epic-block__telegram-scene {
    position: relative;
    display: block;
    width: 100%;
    min-height: clamp(168px, 17vw, 204px);
    margin: 0;
    padding: 0;
    background: transparent;
    overflow: visible;
  }

  .epic-block__telegram-surface {
    position: relative;
    z-index: 1;
    min-height: inherit;
    padding:
      clamp(40px, 4.8vw, 56px)
      clamp(200px, 24vw, 300px)
      clamp(24px, 2.8vw, 36px)
      clamp(24px, 2.5vw, 40px);
    border-radius: clamp(32px, 4vw, 64px);
    background: #1f1f1f;
    overflow: visible;
  }

  .epic-block__telegram-card {
    position: relative;
    z-index: 2;
    min-height: 0;
    padding: 0;
    border-radius: 0;
    background: transparent;
    overflow: visible;
  }

  .epic-block__telegram-decor-clip {
    position: absolute;
    inset: 0;
    z-index: 1;
    overflow: hidden;
    border-radius: inherit;
    pointer-events: none;
  }

  .epic-block--telegram .epic-block__content {
    position: relative;
    z-index: 2;
    max-width: min(100%, 500px);
  }

  .epic-block__decor-plane {
    position: absolute;
    display: block;
    flex-shrink: 0;
    object-fit: contain;
    pointer-events: none;
    user-select: none;
  }

  .epic-block__decor-plane--large {
    position: absolute;
    right: clamp(268px, 37vw, 593px);
    bottom: clamp(-90px, -5.4vw, -32px);
    z-index: 1;
    width: clamp(168px, 16.2vw, 233px);
    height: clamp(151px, 14.5vw, 209px);
    transform: rotate(15deg);
    filter: drop-shadow(0 4px 6px rgba(20, 74, 207, 0.45));
  }

  .epic-block__decor-plane--small {
    position: absolute;
    right: clamp(7px, 2.6vw, 10px);
    top: 50%;
    z-index: 2;
    width: clamp(100px, 9.6vw, 138px);
    height: clamp(90px, 8.7vw, 125px);
    transform: translateY(-50%) rotate(0deg);
    filter: drop-shadow(0 4px 6px rgba(20, 74, 207, 0.45));
    pointer-events: none;
  }

  .epic-block__decor {
    position: absolute;
    inset: 0;
    z-index: 4;
    overflow: visible;
    border-radius: inherit;
    pointer-events: none;
  }

  .epic-block__content {
    position: relative;
    z-index: 2;
    max-width: 560px;
  }

  .epic-block__title {
    margin: 0 0 clamp(20px, 3vw, 32px);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 600;
    letter-spacing: -0.05em;
    text-transform: uppercase;
  }

  .epic-block__title--telegram {
    display: grid;
    gap: 0;
    margin-bottom: clamp(16px, 2vw, 24px);
  }

  .epic-block__title--converter {
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

  .epic-block--converter .epic-block__text--converter {
    max-width: min(100%, 520px);
    margin: 0;
    color: var(--tm-white);
    font-size: clamp(14px, 1.35vw, 17px);
    font-weight: 500;
    line-height: 1.38;
    letter-spacing: -0.01em;
  }

  .epic-block--converter .epic-block__button {
    align-self: flex-start;
    min-width: 176px;
    height: 42px;
    font-size: 12px;
  }

  .epic-block--converter {
    display: block;
    width: 100%;
    margin: 0 auto clamp(48px, 6.5vw, 110px);
  }

  .epic-block__converter-wrap {
    box-sizing: border-box;
    width: 100%;
    padding: clamp(24px, 4vw, 64px);
    border-radius: clamp(32px, 4vw, 64px);
    background-color: #1f1f1f;
    background-image: var(--converter-bg);
    background-repeat: no-repeat;
    background-position: right center;
    background-size: auto 100%;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    gap: clamp(24px, 3vw, 48px);
  }

  .epic-block__converter-mobile-visual {
    display: none;
  }

  .epic-block__title--telegram .epic-block__title-line {
    font-size: clamp(32px, 3.9vw, 58px);
    line-height: 0.98;
  }

  .epic-block__title--telegram .epic-block__title-line--head {
    margin-bottom: 4px;
    font-size: clamp(18px, 1.9vw, 28px);
    line-height: 1.06;
  }

  .epic-block__title-line {
    display: block;
    color: var(--tm-white);
    font-size: clamp(48px, 5.2vw, 88px);
    line-height: 1.08;
    letter-spacing: -0.05em;
  }

  .epic-block__title-line--head {
    display: flex;
    flex-wrap: wrap;
    align-items: baseline;
    gap: 0.18em;
    margin-bottom: 4px;
    font-size: clamp(28px, 3.2vw, 44px);
    line-height: 1.08;
    letter-spacing: -0.05em;
  }

  .epic-block__title-word {
    color: var(--tm-white);
  }

  .epic-block__highlight-text {
    color: var(--tm-black);
    text-shadow:
      2px 0 var(--tm-white),
      -2px 0 var(--tm-white),
      0 2px var(--tm-white),
      0 -2px var(--tm-white),
      1px 1px var(--tm-white),
      -1px -1px var(--tm-white),
      1px -1px var(--tm-white),
      -1px 1px var(--tm-white);
  }

  .epic-block__features {
    display: grid;
    gap: 20px;
    max-width: 400px;
  }

  .epic-block--telegram .epic-block__text--telegram {
    margin: clamp(12px, 1.4vw, 16px) 0 0;
    max-width: 460px;
    font-size: clamp(14px, 1.35vw, 17px);
    line-height: 1.38;
  }

  .epic-block__telegram-actions {
    position: relative;
    z-index: 2;
    margin-top: clamp(12px, 1.4vw, 16px);
  }

  .epic-block--telegram .epic-block__features {
    gap: clamp(12px, 1.4vw, 16px);
    max-width: 460px;
  }

  .epic-block--telegram .epic-block__text {
    font-size: clamp(14px, 1.35vw, 17px);
    line-height: 1.38;
  }

  .epic-block--telegram .epic-block__button {
    min-width: 176px;
    height: 42px;
    font-size: 12px;
  }

  .epic-block__text {
    margin: 0;
    color: rgba(255, 255, 255, 0.82);
    font-size: clamp(14px, 1.5vw, 17px);
    font-weight: 500;
    line-height: 1.4;
    letter-spacing: -0.01em;
  }

  .epic-block__button {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    width: fit-content;
    min-width: 196px;
    height: 48px;
    padding: 0 20px;
    border-radius: 999px;
    color: var(--tm-white);
    font-size: 12px;
    font-weight: 800;
    line-height: 1;
    text-decoration: none;
    text-transform: uppercase;
    transition: opacity 0.2s ease, transform 0.2s ease;
  }

  .epic-block__button:hover,
  .epic-block__button:focus-visible {
    opacity: 0.94;
    transform: translateY(-1px);
  }

  .epic-block__button--telegram {
    background: linear-gradient(180deg, #2e8ed4 0%, #3064e3 100%);
    box-shadow: 0 8px 24px rgba(48, 100, 227, 0.28);
  }

  .epic-block__button--orange {
    justify-content: space-between;
    background: var(--tm-orange);
    box-shadow: 0 8px 24px rgba(255, 100, 24, 0.24);
  }

  .epic-block__button-icon {
    width: 20px;
    height: 20px;
    flex-shrink: 0;
  }

  .epic-block__button-arrow {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    margin-left: auto;
  }

  .epic-block__mockup {
    position: relative;
    z-index: 3;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 240px;
  }

  .epic-block--telegram .epic-block__mockup {
    position: absolute;
    top: 50%;
    right: clamp(110px, 12.5vw, 186px);
    z-index: 6;
    display: block;
    min-height: 0;
    margin: 0;
    padding: 0;
    transform: translateY(-50%);
    width: clamp(240px, 24vw, 320px);
  }

  .epic-block__mockup--telegram {
    cursor: pointer;
    border: none;
    outline: none;
    background: transparent;
    box-shadow: none;
    -webkit-tap-highlight-color: transparent;
  }

  .epic-block__mockup--telegram:focus,
  .epic-block__mockup--telegram:focus-visible,
  .epic-block__mockup--telegram:focus-within {
    border: none;
    outline: none;
    box-shadow: none;
  }

  .epic-block__phone-shell {
    position: relative;
    display: block;
    width: 100%;
    max-width: none;
    overflow: hidden;
    line-height: 0;
    font-size: 0;
    border: none;
    outline: none;
  }

  .epic-block__mockup-phone {
    position: relative;
    z-index: 1;
    display: block;
    width: 100%;
    height: auto;
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
    object-fit: contain;
    object-position: center;
    pointer-events: none;
    user-select: none;
    -webkit-user-drag: none;
  }

  .epic-block__video {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 2;
    width: 93%;
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
    border-radius: 24px;
    transform: translate(-50%, -50%);
    object-fit: cover;
    object-position: center top;
    pointer-events: none;
    background: transparent;
  }

  .epic-block__play-button {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 4;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
    padding: 0;
    border: 0;
    background: transparent;
    outline: none;
    box-shadow: none;
    transform: translate(-50%, -50%);
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
  }

  .epic-block__play-button:focus,
  .epic-block__play-button:focus-visible {
    outline: none;
    box-shadow: none;
  }

  .epic-block__play-button span {
    position: relative;
    display: block;
    width: 56px;
    height: 56px;
    border: 2px solid var(--tm-orange);
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.94);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
  }

  .epic-block__play-button span::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    border-left: 16px solid var(--tm-orange);
    transform: translate(-42%, -50%);
  }

  @media (max-width: 900px) {
    .epic-blocks {
      gap: clamp(24px, 5vw, 32px);
    }

    /* —— Converter mobile —— */
    .epic-block--converter {
      margin-bottom: clamp(32px, 8vw, 56px);
    }

    .epic-block__converter-wrap {
      gap: 0;
      padding: clamp(24px, 6vw, 32px) clamp(16px, 4vw, 20px) 0;
      border-radius: clamp(24px, 6vw, 32px);
      background-image: none;
      overflow: hidden;
    }

    .epic-block--converter .epic-block__text--converter {
      max-width: none;
      margin: 0 0 clamp(20px, 5vw, 28px);
      font-size: clamp(14px, 3.8vw, 17px);
      text-align: left;
    }

    .epic-block--converter .epic-block__button {
      position: relative;
      z-index: 2;
      width: 100%;
      min-width: 0;
      height: 56px;
      margin: 0 0 clamp(-28px, -7vw, -20px);
      font-size: 13px;
    }

    .epic-block__converter-mobile-visual {
      display: block;
      width: calc(100% + clamp(32px, 8vw, 40px));
      max-width: none;
      margin: 0 calc(-1 * clamp(16px, 4vw, 20px));
      pointer-events: none;
    }

    /* —— Telegram mobile —— */
    .epic-block--telegram {
      width: 100%;
    }

    .epic-block__telegram-scene {
      width: 100%;
      min-height: 0;
    }

    .epic-block__telegram-surface {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: clamp(24px, 6vw, 32px) clamp(16px, 4vw, 20px) clamp(20px, 5vw, 28px);
      padding-right: clamp(16px, 4vw, 20px);
      border-radius: clamp(24px, 6vw, 32px);
      background: #1f1f1f;
      overflow: hidden;
    }

    .epic-block__telegram-card,
    .epic-block--telegram .epic-block__content {
      width: 100%;
      max-width: none;
      text-align: center;
    }

    .epic-block__title--telegram {
      margin-bottom: clamp(20px, 5vw, 36px);
    }

    .epic-block--telegram .epic-block__title-line--head {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 0.32em;
      margin-bottom: 10px;
      font-size: clamp(15px, 4vw, 20px);
      line-height: 1.1;
      letter-spacing: -0.04em;
      white-space: normal;
    }

    .epic-block--telegram .epic-block__title-line--head .epic-block__title-word {
      color: var(--tm-white);
      text-shadow: none;
    }

    .epic-block--telegram .epic-block__title-line--head .epic-block__highlight-text {
      color: var(--tm-black);
      text-shadow:
        2px 0 var(--tm-white),
        -2px 0 var(--tm-white),
        0 2px var(--tm-white),
        0 -2px var(--tm-white),
        1px 1px var(--tm-white),
        -1px -1px var(--tm-white),
        1px -1px var(--tm-white),
        -1px 1px var(--tm-white);
    }

    .epic-block--telegram .epic-block__title-line:not(.epic-block__title-line--head) {
      color: var(--tm-white);
      font-size: clamp(22px, 6.2vw, 32px);
      line-height: 1.05;
      word-break: break-word;
    }

    .epic-block--telegram .epic-block__text--telegram {
      display: none;
    }

    .epic-block__telegram-actions {
      order: 3;
      width: 100%;
      margin-top: 20px;
    }

    .epic-block--telegram .epic-block__button {
      width: 100%;
      min-width: 0;
      height: 56px;
      font-size: 13px;
    }

    .epic-block--telegram .epic-block__mockup {
      position: relative;
      top: auto;
      right: auto;
      display: block;
      order: 2;
      width: 100%;
      min-height: 0;
      max-width: min(65vw, 240px);
      margin: clamp(24px, 6vw, 40px) auto 0;
      transform: none;
    }

    .epic-block__decor-plane--large {
      left: clamp(-52px, -13vw, -32px);
      right: auto;
      bottom: clamp(56px, 14vw, 96px);
      width: clamp(148px, 38vw, 196px);
      height: clamp(133px, 34vw, 176px);
      transform: rotate(15deg);
    }

    .epic-block__decor-plane--small {
      right: clamp(-40px, -10vw, -22px);
      top: clamp(64px, 16vw, 96px);
      bottom: auto;
      width: clamp(96px, 24vw, 132px);
      height: clamp(86px, 22vw, 118px);
      transform: rotate(-18deg);
    }
  }

  @media (min-width: 901px) {
    .epic-blocks {
      gap: clamp(80px, 7vw, 128px);
    }

    .epic-block--telegram {
      margin-top: clamp(40px, 4.5vw, 64px);
      margin-bottom: clamp(40px, 4.5vw, 64px);
    }

    .epic-block__telegram-surface {
      padding: 60px clamp(280px, 30vw, 380px) 59px 60px;
      overflow: visible;
    }

    .epic-block__converter-wrap {
      padding: 64px;
      gap: 48px;
      border-radius: 64px;
      background-size: auto 100%;
    }

    .epic-block__title--telegram {
      margin-bottom: 59px;
    }

    .epic-block--telegram .epic-block__text--telegram {
      margin: 0;
    }

    .epic-block__telegram-actions {
      margin-top: 45px;
    }

    .epic-block--telegram .epic-block__mockup {
      z-index: 6;
      width: clamp(260px, 25vw, 340px);
      right: clamp(32px, 3.5vw, 72px);
    }
  }

  @media (min-width: 901px) and (max-width: 999px) {
    .epic-block__telegram-surface {
      padding-right: clamp(380px, 42vw, 460px);
    }

    .epic-block--telegram .epic-block__content {
      max-width: min(100%, 340px);
    }

    .epic-block--telegram .epic-block__text--telegram {
      max-width: min(100%, 320px);
    }

    .epic-block--telegram .epic-block__mockup {
      width: clamp(260px, 26vw, 300px);
      right: clamp(32px, 10vw, 100px);
    }

    .epic-block--telegram .epic-block__title-line--head .epic-block__highlight-text {
      color: #6cc4f5;
      text-shadow: none;
    }
  }

  @media (min-width: 1000px) {
    .epic-block__telegram-surface {
      padding-right: clamp(300px, 32vw, 420px);
    }

    .epic-block--telegram .epic-block__content {
      max-width: min(100%, 420px);
    }

    .epic-block--telegram .epic-block__text--telegram {
      max-width: min(100%, 400px);
    }

    .epic-block--telegram .epic-block__mockup {
      width: clamp(280px, 26vw, 360px);
      right: clamp(50px, 11vw, 124px);
    }

    .epic-block--telegram .epic-block__title-line--head .epic-block__highlight-text {
      color: var(--tm-black);
      text-shadow:
        2px 0 var(--tm-white),
        -2px 0 var(--tm-white),
        0 2px var(--tm-white),
        0 -2px var(--tm-white),
        1px 1px var(--tm-white),
        -1px -1px var(--tm-white),
        1px -1px var(--tm-white),
        -1px 1px var(--tm-white);
    }
  }

  @media (max-width: 560px) {
    .epic-blocks {
      gap: 16px;
    }

    .epic-block__converter-wrap {
      padding: clamp(22px, 5.5vw, 28px) clamp(14px, 3.5vw, 18px) 0;
      border-radius: clamp(22px, 5.5vw, 28px);
    }

    .epic-block--converter .epic-block__button {
      margin-bottom: clamp(-24px, -6.5vw, -18px);
    }

    .epic-block__converter-mobile-visual {
      width: calc(100% + clamp(28px, 7vw, 36px));
      margin: 0 calc(-1 * clamp(14px, 3.5vw, 18px));
    }

    .epic-block__telegram-surface {
      padding: clamp(22px, 5.5vw, 28px) clamp(14px, 3.5vw, 18px) clamp(18px, 4.5vw, 24px);
      padding-right: clamp(14px, 3.5vw, 18px);
      border-radius: clamp(22px, 5.5vw, 28px);
    }

    .epic-block--telegram .epic-block__title-line--head {
      font-size: clamp(14px, 3.8vw, 18px);
    }

    .epic-block--telegram .epic-block__title-line:not(.epic-block__title-line--head) {
      font-size: clamp(20px, 5.8vw, 28px);
      line-height: 1.08;
    }

    .epic-block--telegram .epic-block__title--telegram {
      margin-bottom: clamp(16px, 4vw, 24px);
    }

    .epic-block--telegram .epic-block__mockup {
      max-width: min(68vw, 240px);
    }

    .epic-block__decor-plane--large {
      left: clamp(-44px, -11vw, -26px);
      bottom: clamp(48px, 12vw, 80px);
      width: clamp(132px, 34vw, 172px);
      height: clamp(118px, 30vw, 154px);
    }

    .epic-block__decor-plane--small {
      right: clamp(-34px, -8.5vw, -18px);
      top: clamp(56px, 14vw, 84px);
      width: clamp(88px, 22vw, 118px);
      height: clamp(79px, 20vw, 106px);
    }
  }
</style>
