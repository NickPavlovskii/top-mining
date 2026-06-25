<template>
  <section class="calculator-promo" aria-labelledby="calculator-promo-title">
    <div class="calculator-promo__panel">
      <div class="calculator-promo__inner">
        <div class="calculator-promo__content">
          <h2 id="calculator-promo-title" class="calculator-promo__title">
            <span class="calculator-promo__title-line calculator-promo__title-line--head">
              <span class="calculator-promo__title-word">Самый</span>
              <span class="calculator-promo__highlight-text">удобный</span>
            </span>
            <span class="calculator-promo__title-line calculator-promo__title-line--product">
              <span class="calculator-promo__title-part">майнинг-</span>
              <span class="calculator-promo__title-part">калькулятор</span>
            </span>
          </h2>

          <p class="calculator-promo__lead">
            Помогаем оценить потенциальную доходность от майнинга
          </p>

          <p class="calculator-promo__stats-label">Считаем доходность</p>

          <ul class="calculator-promo__stats">
            <li
              v-for="item in MINING_CALCULATOR_PROMO_STATS"
              :key="item.label"
            >
              <strong class="calculator-promo__stat-value calculator-promo__highlight-text">
                {{ item.value }}
              </strong>
              <span>{{ item.label }}</span>
            </li>
          </ul>
        </div>

        <div class="calculator-promo__visual" aria-hidden="true">
          <video
            class="calculator-promo__video"
            :src="MINING_CALCULATOR_PROMO_VIDEO"
            autoplay
            loop
            muted
            playsinline
            disablePictureInPicture
            preload="auto"
          />
          <img
            class="calculator-promo__image"
            :src="calculatorRigImage"
            alt=""
          />
        </div>
      </div>
      <div class="calculator-promo__epic-blocks">
        <TopMiningEpicBlocks />
      </div>
    </div>
    <div class="calculator-promo__ratings">
      <TopMiningRatingSection />
    </div>
  </section>
</template>

<script setup lang="ts">
  import TopMiningEpicBlocks from '~/components/top-mining/TopMiningEpicBlocks.vue'
  import TopMiningRatingSection from '~/components/TopMiningRatingSection.vue'
  import {
    MINING_CALCULATOR_PROMO_STATS,
    MINING_CALCULATOR_PROMO_VIDEO,
  } from '~/common/modules/top-mining'
  import calculatorRigImage from '~/assets/images/top-mining/calculator-rig.png'
</script>

<style scoped>
  .calculator-promo {
    background: var(--tm-rating-surface);
  }

  .calculator-promo__panel {
    width: 100%;
    background: var(--tm-white);
    border-radius: 60px 60px 0 0;
    overflow: hidden;
  }

  .calculator-promo__inner {
    position: relative;
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(320px, 0.9fr);
    gap: 24px;
    align-items: center;
    min-height: 480px;
    max-width: 1720px;
    margin: 0 auto;
    padding: 64px clamp(16px, 2vw, 32px) 32px;
    overflow: hidden;
  }

  .calculator-promo__epic-blocks {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 1720px;
    margin: clamp(32px, 4vw, 56px) auto 0;
    padding: 0 clamp(16px, 2vw, 32px);
    overflow: visible;
    box-sizing: border-box;
  }

  .calculator-promo__ratings {
    width: 100%;
    margin-top: 0;
    background: var(--tm-rating-surface);
  }

  .calculator-promo__content {
    position: relative;
    z-index: 2;
    max-width: min(100%, 760px);
  }

  .calculator-promo__title {
    margin: 0 0 36px;
    color: var(--tm-black);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(56px, 7.2vw, 120px);
    font-weight: 600;
    line-height: 1.08;
    letter-spacing: -0.05em;
    text-transform: uppercase;
  }

  .calculator-promo__title-line {
    display: block;
  }

  .calculator-promo__title-line--head {
    display: flex;
    flex-wrap: wrap;
    align-items: baseline;
  }

  .calculator-promo__title-line--product .calculator-promo__title-part {
    display: block;
  }

  .calculator-promo__title-word {
    color: var(--tm-black);
  }

  .calculator-promo__highlight-text {
    color: var(--tm-white);
    text-shadow:
      2px 0 var(--tm-shadow),
      -2px 0 var(--tm-shadow),
      0 2px var(--tm-shadow),
      0 -2px var(--tm-shadow),
      1px 1px var(--tm-shadow),
      -1px -1px var(--tm-shadow),
      1px -1px var(--tm-shadow),
      -1px 1px var(--tm-shadow);
  }

  .calculator-promo__lead {
    max-width: 540px;
    margin: 0 0 32px;
    color: var(--tm-black);
    font-size: clamp(18px, 2vw, 28px);
    font-weight: 500;
    line-height: 1.2;
    letter-spacing: -0.02em;
  }

  .calculator-promo__stats-label {
    margin: 0 0 18px;
    color: var(--tm-black);
    font-size: clamp(18px, 2vw, 28px);
    font-weight: 700;
    line-height: 1.2;
    letter-spacing: -0.02em;
  }

  .calculator-promo__stats {
    display: flex;
    flex-wrap: wrap;
    gap: 20px 48px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .calculator-promo__stats li {
    display: grid;
    flex: 0 0 auto;
    gap: 8px;
    min-width: 120px;
  }

  .calculator-promo__stat-value {
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(48px, 5.2vw, 88px);
    font-weight: 600;
    line-height: 1.08;
    letter-spacing: -0.05em;
  }

  .calculator-promo__stats span {
    color: var(--tm-black);
    font-size: clamp(16px, 1.6vw, 24px);
    font-weight: 500;
    line-height: 1.15;
    letter-spacing: -0.02em;
  }

  .calculator-promo__visual {
    position: absolute;
    right: 0;
    bottom: 0;
    z-index: 1;
    display: flex;
    align-items: flex-end;
    justify-content: flex-end;
    width: min(100%, 827px);
    height: calc(100% - 24px);
    pointer-events: none;
  }

  .calculator-promo__video {
    width: 100%;
    max-height: 100%;
    object-fit: contain;
    object-position: right bottom;
  }

  .calculator-promo__image {
    display: none;
  }

  @media (max-width: 900px) {
    .calculator-promo {
      background: var(--tm-white);
    }

    .calculator-promo__panel {
      border-radius: 40px 40px 0 0;
      background: var(--tm-white);
    }

    .calculator-promo__inner {
      display: grid;
      grid-template-columns: minmax(0, 1fr) minmax(220px, 42%);
      gap: 16px 24px;
      align-items: center;
      min-height: auto;
      padding: 40px 24px 32px;
    }

    .calculator-promo__content {
      max-width: none;
    }

    .calculator-promo__title {
      margin-bottom: 24px;
      font-size: clamp(40px, 5.8vw, 64px);
    }

    .calculator-promo__title-line--head {
      flex-wrap: nowrap;
    }

    .calculator-promo__title-line--product {
      white-space: nowrap;
    }

    .calculator-promo__title-line--product .calculator-promo__title-part {
      display: inline;
    }

    .calculator-promo__lead {
      margin-bottom: 24px;
      font-size: clamp(16px, 2.2vw, 22px);
    }

    .calculator-promo__stats-label {
      margin-bottom: 14px;
      font-size: clamp(16px, 2.2vw, 22px);
    }

    .calculator-promo__stats {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 8px 12px;
    }

    .calculator-promo__stats li {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      min-width: 0;
      text-align: center;
    }

    .calculator-promo__stat-value {
      display: flex;
      align-items: center;
      justify-content: center;
      width: clamp(72px, 14vw, 96px);
      height: clamp(72px, 14vw, 96px);
      padding: 0 6px;
      border: 1px solid var(--tm-border-light);
      border-radius: 50%;
      box-sizing: border-box;
      color: var(--tm-black);
      font-size: clamp(20px, 3.2vw, 28px);
      line-height: 1;
      letter-spacing: -0.03em;
      text-shadow: none;
    }

    .calculator-promo__stats span {
      font-size: clamp(11px, 1.6vw, 14px);
    }

    .calculator-promo__visual {
      position: relative;
      right: auto;
      bottom: auto;
      align-self: end;
      width: 100%;
      max-width: none;
      height: auto;
      min-height: 0;
      margin-top: 0;
      padding: 0;
      justify-content: center;
    }

    .calculator-promo__video {
      width: 100%;
      max-height: min(42vw, 280px);
      margin: 0 auto;
      object-position: center bottom;
    }
  }

  @media (min-width: 901px) {
    .calculator-promo__epic-blocks {
      margin-top: clamp(64px, 6vw, 96px);
      padding-inline: 60px;
    }

    .calculator-promo__inner {
      padding-inline: 60px;
    }
  }

  @media (max-width: 720px) and (min-width: 561px) {
    .calculator-promo__inner {
      grid-template-columns: 1fr;
    }

    .calculator-promo__visual {
      margin-top: 12px;
    }

    .calculator-promo__video {
      max-height: min(72vw, 300px);
    }
  }

  @media (max-width: 900px) {
    .calculator-promo__epic-blocks {
      width: 100%;
      max-width: none;
      padding: clamp(24px, 5vw, 32px) 0 0;
      background: var(--tm-white);
    }
  }

  @media (max-width: 560px) {
    .calculator-promo {
      background: var(--tm-rating-surface);
    }

    .calculator-promo__panel {
      border-radius: 28px 28px 0 0;
      background: var(--tm-black);
    }

    .calculator-promo__inner {
      display: flex;
      flex-direction: column;
      align-items: stretch;
      padding: 28px 18px 20px;
    }

    .calculator-promo__content {
      text-align: left;
    }

    .calculator-promo__title {
      margin-bottom: 20px;
      font-size: clamp(34px, 10vw, 48px);
      font-weight: 600;
      line-height: 0.98;
      letter-spacing: -0.05em;
      text-align: left;
    }

    .calculator-promo__title-line--head {
      display: flex;
      flex-wrap: wrap;
      justify-content: flex-start;
      align-items: baseline;
      gap: 0.32em;
      margin-bottom: 0.35em;
      font-size: clamp(15px, 4.2vw, 24px);
      font-weight: 500;
      line-height: 1.17;
      letter-spacing: 0;
      white-space: normal;
    }

    .calculator-promo__title-line--product .calculator-promo__title-part {
      display: block;
      text-align: left;
      font-size: 1em;
      font-weight: 600;
      line-height: 0.98;
    }

    .calculator-promo__title-line--head .calculator-promo__title-word,
    .calculator-promo__title-line--head .calculator-promo__highlight-text {
      background: var(--orange-accent-gradient-horizontal);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      text-shadow: none;
    }

    .calculator-promo__title-line--product .calculator-promo__title-part {
      color: var(--tm-white);
    }

    .calculator-promo__lead,
    .calculator-promo__stats-label,
    .calculator-promo__stats {
      display: none;
    }

    .calculator-promo__visual {
      order: 2;
      width: 100%;
      min-height: 240px;
      margin-top: 8px;
    }

    .calculator-promo__video {
      display: none;
    }

    .calculator-promo__image {
      display: block;
      width: min(100%, 360px);
      max-height: 280px;
      margin: 0 auto;
      object-fit: contain;
      object-position: center bottom;
    }

    .calculator-promo__epic-blocks {
      margin-top: 0;
      padding: 16px 0 24px;
      background: var(--tm-white);
    }
  }

  @media (max-width: 360px) {
    .calculator-promo__inner {
      padding-right: 14px;
      padding-left: 14px;
    }

    .calculator-promo__title {
      font-size: clamp(30px, 9.2vw, 42px);
      letter-spacing: -0.05em;
    }

    .calculator-promo__title-line--head {
      font-size: clamp(14px, 3.9vw, 22px);
    }
  }
</style>
