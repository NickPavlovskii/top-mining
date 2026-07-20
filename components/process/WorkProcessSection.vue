<template>
  <section class="process-section">
    <div class="process-section__panel">
      <h2 class="process-section__title">
        Процесс<br />
        работы по<br />
        разработке<br />
        сайта
      </h2>

      <div class="process-section__puzzle" aria-label="Процесс работы">
        <article
          v-for="step in PROCESS_SECTION_STEPS"
          :key="step.id"
          :class="[
            'process-section__card',
            `process-section__card--${step.id}`,
            { 'process-section__card--light': step.light },
          ]"
        >
          <span class="process-section__card-number">{{ step.id }}</span>
          <Icon :name="step.icon" class="process-section__card-icon" />
          <p class="process-section__card-text">
            <span v-for="line in step.lines" :key="line">{{ line }}</span>
          </p>
          <Icon :name="step.arrow" class="process-section__card-arrow" />
        </article>
      </div>

      <top-mining-button
        class="process-section__button"
        title="Оставить заявку"
        append-icon=""
        bg-color="var(--tm-white)"
        color="#0752bd"
        width="122px"
        :border="false"
        @click="onCtaClick"
      >
        <span>Оставить заявку</span>
        <template #append>
          <Icon name="mdi:pencil-outline" />
        </template>
      </top-mining-button>
    </div>

    <h3 class="process-section__next">
      <span>Технологии,</span>
      с которыми мы работаем
    </h3>
  </section>
</template>

<script setup lang="ts">
  import { PROCESS_SECTION_STEPS } from '~/common/modules/process'

  const emit = defineEmits<{
    cta: []
  }>()

  function onCtaClick() {
    emit('cta')
  }
</script>

<style scoped>
  .process-section {
    width: 100%;
    background: var(--tm-white);
    font-family: var(--app-font, Arial, sans-serif);
  }

  .process-section__panel {
    position: relative;
    width: min(100%, 980px);
    min-height: 462px;
    margin: 0 auto;
    overflow: visible;
    background:
      radial-gradient(circle at 18% 92%, rgba(23, 101, 223, 0.45), transparent 28%),
      linear-gradient(135deg, #1766df 0%, #0b48b0 100%);
  }

  .process-section__panel::before {
    content: '';
    position: absolute;
    top: 0;
    left: 12.5%;
    width: 58px;
    height: 58px;
    border-radius: 0 0 999px 999px;
    background: var(--tm-white);
  }

  .process-section__panel::after {
    content: '';
    position: absolute;
    left: 68.8%;
    bottom: -38px;
    width: 76px;
    height: 76px;
    border-radius: 50%;
    background: linear-gradient(135deg, #1766df 0%, #0b48b0 100%);
  }

  .process-section__title {
    position: absolute;
    top: 62px;
    left: 20.4%;
    z-index: 2;
    margin: 0;
    color: var(--tm-white);
    font-size: clamp(24px, 2.45vw, 28px);
    font-weight: 800;
    line-height: 1.06;
    letter-spacing: -0.02em;
  }

  .process-section__puzzle {
    position: absolute;
    top: 58px;
    left: 39.3%;
    width: 38.5%;
    height: 278px;
  }

  .process-section__card {
    position: absolute;
    width: 33.333%;
    height: 50%;
    color: var(--tm-white);
    background: rgba(10, 72, 178, 0.22);
    border: 1px solid rgba(255, 255, 255, 0.42);
    box-sizing: border-box;
  }

  .process-section__card--light {
    color: #0752bd;
    background: var(--tm-white);
    border-color: var(--tm-white);
  }

  .process-section__card--1 {
    top: 0;
    left: 0;
    border-radius: 8px 0 0 8px;
    border-bottom-color: rgba(255, 255, 255, 0.25);
  }

  .process-section__card--2 {
    top: 0;
    left: 33.333%;
    border-radius: 0 8px 8px 0;
  }

  .process-section__card--3 {
    top: 50%;
    left: 33.333%;
    border-radius: 0 0 8px 0;
  }

  .process-section__card--4 {
    top: 50%;
    left: 0;
    border-radius: 0 0 0 8px;
  }

  .process-section__card--5 {
    top: 50%;
    left: -33.333%;
    border-radius: 8px 0 0 8px;
  }

  .process-section__card::before,
  .process-section__card::after {
    content: '';
    position: absolute;
    z-index: 3;
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: inherit;
    border: inherit;
    box-sizing: border-box;
  }

  .process-section__card--1::before {
    left: -22px;
    top: 44%;
    background: #0f58cb;
  }

  .process-section__card--1::after {
    right: -21px;
    bottom: -22px;
    background: #0f58cb;
  }

  .process-section__card--2::before {
    left: -22px;
    top: 44%;
    background: var(--tm-white);
  }

  .process-section__card--2::after {
    left: 44%;
    bottom: -22px;
    background: var(--tm-white);
  }

  .process-section__card--3::before {
    left: 44%;
    top: -22px;
    background: #0a48b2;
  }

  .process-section__card--3::after {
    right: -22px;
    top: 44%;
    background: #0a48b2;
  }

  .process-section__card--4::before {
    right: -22px;
    top: 44%;
    background: #0f58cb;
  }

  .process-section__card--4::after {
    left: -22px;
    top: 44%;
    background: #0f58cb;
  }

  .process-section__card--5::before {
    right: -22px;
    top: 44%;
    background: var(--tm-white);
  }

  .process-section__card--5::after {
    left: 44%;
    bottom: -22px;
    background: var(--tm-white);
  }

  .process-section__card-number {
    position: absolute;
    z-index: 4;
    display: grid;
    place-items: center;
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: #0752bd;
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 800;
    box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.35);
  }

  .process-section__card--1 .process-section__card-number,
  .process-section__card--2 .process-section__card-number {
    left: -20px;
    top: 44%;
    transform: translateY(-50%);
  }

  .process-section__card--3 .process-section__card-number {
    left: 46%;
    top: -20px;
  }

  .process-section__card--4 .process-section__card-number,
  .process-section__card--5 .process-section__card-number {
    right: -20px;
    top: 44%;
    transform: translateY(-50%);
  }

  .process-section__card-icon {
    position: absolute;
    z-index: 4;
    width: 38px;
    height: 38px;
    color: currentColor;
  }

  .process-section__card--1 .process-section__card-icon {
    right: 18px;
    top: 24px;
  }

  .process-section__card--2 .process-section__card-icon {
    right: 22px;
    top: 25px;
  }

  .process-section__card--3 .process-section__card-icon {
    left: 23px;
    top: 26px;
  }

  .process-section__card--4 .process-section__card-icon {
    left: 22px;
    top: 25px;
  }

  .process-section__card--5 .process-section__card-icon {
    left: 23px;
    top: 25px;
  }

  .process-section__card-text {
    position: absolute;
    z-index: 4;
    display: grid;
    gap: 2px;
    margin: 0;
    color: currentColor;
    font-size: clamp(12px, 1.15vw, 14px);
    font-weight: 800;
    line-height: 1.15;
  }

  .process-section__card--1 .process-section__card-text,
  .process-section__card--2 .process-section__card-text {
    right: 22px;
    bottom: 26px;
  }

  .process-section__card--3 .process-section__card-text {
    left: 22px;
    bottom: 22px;
  }

  .process-section__card--4 .process-section__card-text {
    left: 22px;
    bottom: 20px;
  }

  .process-section__card--5 .process-section__card-text {
    left: 22px;
    bottom: 21px;
  }

  .process-section__card-arrow {
    position: absolute;
    z-index: 4;
    width: 28px;
    height: 28px;
    color: currentColor;
  }

  .process-section__card--1 .process-section__card-arrow,
  .process-section__card--2 .process-section__card-arrow {
    left: 22px;
    bottom: 22px;
  }

  .process-section__card--3 .process-section__card-arrow,
  .process-section__card--4 .process-section__card-arrow,
  .process-section__card--5 .process-section__card-arrow {
    right: 22px;
    bottom: 20px;
  }

  .process-section__button {
    position: absolute;
    left: 50%;
    bottom: 78px;
    z-index: 3;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    min-width: 122px;
    height: 31px;
    padding: 0 17px;
    border: 0;
    border-radius: 7px;
    background: var(--tm-white);
    color: #0752bd;
    font-size: 8px;
    font-weight: 800;
    cursor: pointer;
    transform: translateX(-50%);
    box-shadow: 0 8px 20px rgba(5, 39, 112, 0.16);
  }

  .process-section__button svg {
    width: 14px;
    height: 14px;
  }

  .process-section__next {
    width: min(100%, 980px);
    margin: 14px auto 0;
    padding-left: 20.4%;
    color: #1d1d1f;
    font-size: clamp(22px, 2.35vw, 28px);
    font-weight: 800;
    line-height: 1.05;
  }

  .process-section__next span {
    display: block;
    color: #0752bd;
  }

  @media (max-width: 900px) {
    .process-section__panel {
      min-height: auto;
      padding: 28px 16px;
    }

    .process-section__panel::before,
    .process-section__panel::after {
      display: none;
    }

    .process-section__title,
    .process-section__puzzle,
    .process-section__button {
      position: static;
      transform: none;
    }

    .process-section__title {
      margin-bottom: 20px;
    }

    .process-section__puzzle {
      display: grid;
      width: 100%;
      height: auto;
      gap: 10px;
    }

    .process-section__card {
      position: relative;
      left: auto;
      top: auto;
      width: 100%;
      min-height: 130px;
      border-radius: 18px;
    }

    .process-section__card::before,
    .process-section__card::after {
      display: none;
    }

    .process-section__card-number {
      left: 16px !important;
      top: 16px !important;
      right: auto !important;
      transform: none !important;
    }

    .process-section__button {
      margin: 18px auto 0;
    }

    .process-section__next {
      padding: 0 16px;
    }
  }
</style>
