<template>
  <section class="top-mining">
    <section class="top-mining__hero">
      <top-mining-brand-title variant="hero" />

      <div class="top-mining__dark">
        <div class="top-mining__cards">
          <article
            :class="[
              'top-mining__card',
              'top-mining__card--catalog',
            ]"
          >
            <div class="top-mining__card-content">
              <h2 class="top-mining__card-title">
                Каталог организаций
                <img :src="buttonArrow" alt="" class="top-mining__card-title-arrow" />
              </h2>

              <p class="top-mining__card-text">
                Помогаем вам найти подходящую вам компанию и проанализировать
                конкурентов.
              </p>

              <p class="top-mining__card-reviews">
                Более <strong>5000 отзывов</strong> от клиентов в майнинге
              </p>

              <div class="top-mining__card-companies">
                <span v-for="company in TOP_MINING_COMPANIES" :key="company.name">
                  <b>
                    <img
                      :src="company.logo"
                      :alt="company.name" 
                    />
                  </b>
                  <small>
                    <img 
                      :src="companyStar"
                      alt=""
                    />
                    {{ company.rate }}
                  </small>
                  <small>Отзывов: {{ company.reviews }}</small>
                </span>
              </div>

              <top-mining-button
                href="#"
                title="Смотреть все компании"
                v-bind="TOP_MINING_BUTTON_PROPS"
                :width="TOP_MINING_BUTTON_WIDTH.catalog"
                :append-icon="buttonArrow"
              />
            </div>
          </article>

          <article
            :class="[
              'top-mining__card',
              'top-mining__card--calculator',
            ]"
          >
            <div class="top-mining__card-content">
              <h2 class="top-mining__card-title">
                Калькулятор доходности
                <img :src="buttonArrow" alt="" class="top-mining__card-title-arrow" />
              </h2>

              <div class="top-mining__card-stats">
                <span>
                  <strong>350</strong>
                  Монет
                </span>
                <span>
                  <strong>500</strong>
                  Устройств
                </span>
                <span>
                  <strong>15</strong>
                  Настроек
                </span>
              </div>

              <p
                :class="[
                  'top-mining__card-text',
                  'top-mining__card-text--calculator',
                ]"
              >
                Помогаем вам оценивать потенциальную доходность от майнинга
              </p>

              <top-mining-button
                class="top-mining-button--right"
                href="#"
                title="Рассчитать"
                v-bind="TOP_MINING_BUTTON_PROPS"
                :width="TOP_MINING_BUTTON_WIDTH.card"
              />
            </div>

            <img
              alt=""
              :src="rigLarge"
              :class="[
                'top-mining__card-image',
                'top-mining__card-image--rig-large',
              ]"
            />
          </article>

          <article
            :class="[
              'top-mining__card',
              'top-mining__card--rating',
            ]"
          >
            <img
              :src="blurLeft"
              alt=""
              :class="[
                'top-mining__card-decor',
                'top-mining__card-decor--blur-left',
              ]"
            />
            <img
              :src="blurRight"
              alt=""
              :class="[
                'top-mining__card-decor',
                'top-mining__card-decor--blur-right',
              ]"
            />
            <div class="top-mining__card-content">
              <h2 class="top-mining__card-title">
                Рейтинги в майнинге
                <img :src="buttonArrow" alt="" class="top-mining__card-title-arrow" />
              </h2>

              <p class="top-mining__card-text">Помогаем вам определиться с выбором лучшей для вас компании.</p>

              <top-mining-button
                v-bind="TOP_MINING_BUTTON_PROPS"
                class="top-mining-button--right"
                href="#"
                title="Смотреть рейтинги"
                :append-icon="buttonArrow"
                :width="TOP_MINING_BUTTON_WIDTH.card"
              />
            </div>
          </article>

          <article
            :class="[
              'top-mining__card',
              'top-mining__card--telegram',
            ]"
          >
            <img
              :src="paperLarge"
              alt=""
              :class="[
                'top-mining__card-decor',
                'top-mining__card-decor--paper-large',
              ]"
            />
            <img
              :src="paperSmallNew"
              alt=""
              :class="[
                'top-mining__card-decor',
                'top-mining__card-decor--paper-small',
              ]"
            />
            <img
              :src="rigSmall"
              alt=""
              :class="[
                'top-mining__card-image',
                'top-mining__card-image--rig-small',
              ]"
            />
            <div class="top-mining__card-content">
              <h2 class="top-mining__card-title">
                Калькулятор в Telegram
                <img :src="buttonArrow" alt="" class="top-mining__card-title-arrow" />
              </h2>

              <p
                :class="[
                  'top-mining__card-text',
                  'top-mining__card-text--telegram',
                ]"
              >
                Самый удобный калькулятор доходности в Telegram
              </p>

              <top-mining-button
                class="top-mining-button--right"
                href="#"
                title="В Telegram"
                v-bind="TOP_MINING_BUTTON_PROPS"
                :width="TOP_MINING_BUTTON_WIDTH.card"
                :prepend-icon="telegramIcon"
                :append-icon="buttonArrow"
              />
            </div>
          </article>
        </div>
      </div>
    </section>
  </section>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_BUTTON_PROPS,
    TOP_MINING_BUTTON_WIDTH,
    TOP_MINING_COMPANIES,
  } from '~/common/modules/top-mining'
  import blurLeft from '~/assets/images/top-mining/blur-left.png'
  import blurRight from '~/assets/images/top-mining/blur-right.png'
  import buttonArrow from '~/assets/images/top-mining/button-arrow.png'
  import companyStar from '~/assets/images/top-mining/companies/star.png'
  import paperLarge from '~/assets/images/top-mining/paper-large.png'
  import paperSmallNew from '~/assets/images/top-mining/paper-small-new.png'
  import rigLarge from '~/assets/images/top-mining/rig-large.png'
  import rigSmall from '~/assets/images/top-mining/rig-small.png'
  import telegramIcon from '~/assets/images/top-mining/telegram-icon.png'
</script>

<style scoped>
  .top-mining {
    background: var(--tm-white);
    color: var(--tm-text-primary);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
    overflow: hidden;
  }

  .top-mining__header {
    display: grid;
    grid-template-columns: 190px 1fr 190px;
    gap: 44px;
    align-items: start;
    margin: 0 auto;
    padding: 34px 68px 34px;
  }

  .top-mining__logo {
    display: inline-flex;
    align-items: center;
    gap: 11px;
    color: var(--tm-text-primary);
    text-decoration: none;
  }

  .top-mining__logo-mark {
    width: 42px;
    height: 42px;
    object-fit: contain;
  }

  .top-mining__logo-text {
    display: grid;
    line-height: 0.85;
    text-transform: uppercase;
  }

  .top-mining__logo-title {
    color: var(--tm-text-primary);
    font-size: 36px;
    font-weight: 900;
    letter-spacing: -0.05em;
  }

  .top-mining__logo-subtitle {
    color: var(--tm-orange-dark);
    font-size: 14px;
    font-weight: 900;
    letter-spacing: -0.03em;
  }

  .top-mining__menu-toggle,
  .top-mining__mobile-menu-title,
  .top-mining__mobile-telegram {
    display: none;
  }

  .top-mining__mobile-menu-footer {
    display: contents;
  }

  .top-mining__nav {
    display: grid;
    grid-template-columns: 1.25fr 1.1fr 1fr 0.95fr;
    gap: 44px;
  }

  .top-mining__nav-heading {
    margin: 0 0 14px;
    color: var(--tm-text-primary);
    font-size: 15px;
    font-weight: 800;
  }

  .top-mining__nav-heading-number {
    display: none;
  }

  .top-mining__nav-link {
    display: flex;
    align-items: flex-start;
    gap: 7px;
    margin-bottom: 8px;
    color: var(--tm-text-muted);
    font-size: 13px;
    font-weight: 500;
    line-height: 1.15;
    text-decoration: none;
    transition: color 0.18s ease;
  }

  .top-mining__nav-link-icon,
  .top-mining__nav-column svg {
    flex: 0 0 auto;
    width: 17px;
    height: 17px;
    color: var(--tm-text-subtle);
    transition: color 0.18s ease;
  }

  @media (hover: hover) {
    .top-mining__nav-link:hover,
    .top-mining__nav-link:focus-visible {
      color: var(--tm-orange-hover);
    }

    .top-mining__nav-link:hover :is(svg, .top-mining__nav-link-icon),
    .top-mining__nav-link:focus-visible :is(svg, .top-mining__nav-link-icon) {
      color: var(--tm-orange-hover);
    }
  }

  .top-mining__nav-link:active {
    color: var(--tm-orange-hover);
  }

  .top-mining__nav-link:active :is(svg, .top-mining__nav-link-icon) {
    color: var(--tm-orange-hover);
  }

  .top-mining__nav-telegram-icon {
    flex: 0 0 auto;
    width: 17px;
    height: 17px;
    object-fit: contain;
  }

  .top-mining__nav-top-icon {
    flex: 0 0 auto;
    width: 22px;
    height: 22px;
    object-fit: contain;
  }

  .top-mining__nav-link--telegram {
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid var(--tm-border-dark);
  }

  .top-mining__nav-link--telegram svg {
    color: var(--tm-text-primary);
  }

  .top-mining__nav-more {
    display: none !important;
  }

  .top-mining-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    min-height: 0;
    padding: 0 28px;
    border-radius: 999px;
    background: linear-gradient(180deg, var(--tm-orange-gradient-start), var(--tm-orange-dark));
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 800;
    line-height: 1;
    text-decoration: none;
    text-transform: uppercase;
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3);
  }

  .top-mining-button--contact {
    justify-self: end;
    min-width: 174px;
    height: 38px;
    padding: 0 22px;
  }

  .top-mining-button--contact:hover,
  .top-mining-button--contact:focus-visible {
    background: transparent !important;
    border-color: var(--tm-orange-hover) !important;
    color: var(--tm-black) !important;
  }

  .top-mining-button :deep(.top-mining-button__inner),
  .top-mining-button :deep(.top-mining-button__inner span),
  .top-mining-button :deep(.top-mining-button__inner div) {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    color: inherit !important;
    line-height: 1 !important;
    text-align: center !important;
  }

  .top-mining__hero {
    position: relative;
    width: 100%;
    overflow: hidden;
  }

  .top-mining__dark {
    position: relative;
    z-index: 2;
    margin: 0 auto;
    padding: 52px 0 76px;
    border-radius: 40px 40px 0 0;
    background: var(--tm-black);
  }

  .top-mining__cards {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    width: calc(100% - 64px);
    margin: 0 auto;
  }

  .top-mining__card {
    position: relative;
    min-height: 170px;
    border-radius: 22px;
    background: #222222;
    color: var(--tm-white);
    overflow: hidden;
  }

  .top-mining__card--catalog,
  .top-mining__card--calculator {
    min-height: 310px;
  }

  .top-mining__card--rating,
  .top-mining__card--telegram {
    min-height: 180px;
  }

  .top-mining__card::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(circle at 8% 90%, rgba(255, 105, 24, 0.35), transparent 22%);
    opacity: 0;
  }

  .top-mining__card--rating::before,
  .top-mining__card--telegram::before {
    opacity: 1;
  }

  .top-mining__card--telegram::before {
    opacity: 0;
  }

  .top-mining__card-content {
    position: relative;
    z-index: 2;
    height: 100%;
    padding: 30px 28px;
  }

  .top-mining__card-title {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 0 0 28px;
    color: var(--tm-white);
    font-size: 29px;
    font-weight: 800;
    letter-spacing: -0.03em;
    line-height: 1;
    text-transform: uppercase;
  }

  .top-mining__card-title-arrow {
    width: 21px;
    height: 21px;
    object-fit: contain;
  }

  .top-mining__card-text {
    max-width: 360px;
    margin: 0 0 1px;
    color: #ededed;
    font-size: 16px;
    line-height: 1.28;
  }

  .top-mining__card-text--calculator {
    position: absolute;
    left: 28px;
    bottom: 30px;
    max-width: calc(100% - 260px);
    font-size: 15px;
    margin: 0;
  }

  .top-mining__card-text--telegram {
    position: absolute;
    left: 28px;
    bottom: 46px;
    max-width: calc(100% - 300px);
    font-size: 14px;
    margin: 0;
  }

  .top-mining__card-reviews strong,
  .top-mining__card-stats strong {
    color: #f26718;
  }

  .top-mining__card-reviews {
    font-size: 17px !important;
    margin-top: 0 !important;
    margin-bottom: 20px !important;
    line-height: 1.15 !important;
  }

  .top-mining__card-reviews strong {
    font-size: 34px;
    font-weight: 900;
    letter-spacing: -0.03em;
  }

  .top-mining__card-companies {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 10px;
    margin: 0 0 34px;
  }

  .top-mining__card-companies span {
    display: grid;
    gap: 1px;
    min-height: 58px;
    padding: 8px 9px;
    border-radius: 8px;
    background: var(--tm-white);
    color: var(--tm-shadow);
    font-size: 10px;
    line-height: 1.1;
  }

  .top-mining__card-companies b {
    display: flex;
    align-items: center;
    overflow: hidden;
    color: #4a4a4a;
    font-size: 11px;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .top-mining__card-companies b img {
    width: 100%;
    height: 16px;
    object-fit: contain;
    object-position: left center;
  }

  .top-mining__card-companies small {
    display: inline-flex;
    align-items: center;
    gap: 3px;
    color: #444444;
    font-size: 10px;
  }

  .top-mining__card-companies small img {
    width: 12px;
    height: auto;
    object-fit: contain;
  }

  .top-mining-button {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 280px;
    height: 48px;
    padding: 0 28px;
    font-size: 13px;
    line-height: 1;
    text-align: center;
    color: var(--tm-white) !important;
  }

  .top-mining-button svg {
    width: 14px;
    height: 14px;
  }

  .top-mining-button img {
    width: 19px;
    height: 19px;
    margin: 0 !important;
    object-fit: contain;
  }

  .top-mining-button img:first-child {
    width: 24px;
    height: 24px;
  }

  .top-mining-button--right {
    position: absolute;
    right: 28px;
    bottom: 24px;
    min-width: 150px;
    height: 42px;
    padding: 0 18px;
    font-size: 11px;
  }

  .top-mining__card--calculator .top-mining-button--right {
    right: 28px;
    bottom: 24px;
    min-width: 170px;
    height: 48px;
    font-size: 13px;
  }

  .top-mining__card--rating p {
    max-width: calc(100% - 250px);
  }

  .top-mining__card--rating .top-mining-button--right,
  .top-mining__card--telegram .top-mining-button--right {
    right: 24px;
    bottom: 30px;
    width: 148px !important;
    min-width: 148px;
    height: 40px;
    padding: 0 14px;
    font-size: 10px;
  }

  .top-mining__card--telegram .top-mining-button--right {
    bottom: 36px;
  }

  .top-mining__card-stats {
    display: flex;
    gap: 44px;
    margin: 8px 0 72px;
  }

  .top-mining__card-stats span {
    display: grid;
    gap: 3px;
    color: #e9e9e9;
    font-size: 16px;
    line-height: 1;
  }

  .top-mining__card-stats strong {
    color: #f26718;
    font-size: 36px;
    font-weight: 900;
    letter-spacing: -0.04em;
  }

  .top-mining__card-image,
  .top-mining__card-decor {
    position: absolute;
    pointer-events: none;
    user-select: none;
  }

  .top-mining__card-image {
    right: 50px;
    top: 70px;
    z-index: 1;
    object-fit: contain;
  }

  .top-mining__card-image--rig-large {
    right: clamp(28px, 4vw, 70px);
    top: clamp(58px, 5vw, 70px);
    width: clamp(240px, 19vw, 360px);
    height: auto;
  }

  .top-mining__card-image--rig-small {
    right: clamp(245px, 23vw, 360px);
    bottom: -38px;
    width: clamp(145px, 11vw, 200px);
    height: auto;
    opacity: 0.9;
  }

  .top-mining__card-decor--blur-left {
    left: -12px;
    bottom: -18px;
    width: 172px;
    height: auto;
  }

  .top-mining__card-decor--blur-right {
    right: clamp(12px, 2vw, 28px);
    top: -30px;
    width: clamp(130px, 10vw, 184px);
    height: auto;
  }

  .top-mining__card-decor--paper-large {
    right: 0;
    top: -14px;
    width: clamp(92px, 7vw, 126px);
    height: auto;
  }

  .top-mining__card-decor--paper-small {
    right: clamp(178px, 18vw, 210px);
    bottom: -22px;
    height: 80px;
    opacity: 0.65;
  }

  @media (max-width: 1200px) {
    .top-mining__header {
      grid-template-columns: 170px minmax(0, 1fr) 160px;
      gap: 24px;
      padding: 34px 32px 28px;
    }

    .top-mining__logo {
      gap: 9px;
    }

    .top-mining__logo-mark {
      width: 36px;
      height: 36px;
    }

    .top-mining__logo-title {
      font-size: 30px;
    }

    .top-mining__logo-subtitle {
      font-size: 12px;
    }

    .top-mining__nav {
      grid-template-columns: 1.1fr 1fr 0.92fr 0.9fr;
      gap: 24px;
      min-width: 0;
    }

    .top-mining__nav-heading {
      margin-bottom: 12px;
      font-size: 14px;
    }

    .top-mining__nav-link {
      gap: 6px;
      margin-bottom: 7px;
      font-size: 12px;
      line-height: 1.15;
    }

    .top-mining__nav-link-icon,
    .top-mining__nav-column svg,
    .top-mining__nav-telegram-icon {
      width: 15px;
      height: 15px;
    }

    .top-mining__nav-top-icon {
      width: 20px;
      height: 20px;
    }

    .top-mining-button--contact {
      width: 160px !important;
      min-width: 160px;
      height: 38px;
      padding: 0 16px;
      font-size: 11px;
    }

    .top-mining__card-image--rig-large {
      right: 28px;
      top: 70px;
      width: 230px;
    }

    .top-mining__card-image--rig-small {
      right: 245px;
      bottom: -34px;
      top: 115px;
      width: 140px;
    }

    .top-mining__card-decor--paper-small {
      right: 170px;
      bottom: -22px;
      width: 52px;
    }

    .top-mining__card-decor--paper-large {
      width: 88px;
    }
  }

  @media (max-width: 900px) {
    .top-mining__header {
      position: relative;
      z-index: 20;
      display: grid;
      grid-template-columns: 1fr auto;
      align-items: center;
      gap: 20px;
      padding: 20px 24px;
    }

    .top-mining__menu-toggle {
      position: relative;
      z-index: 2;
      display: grid;
      gap: 5px;
      width: 28px;
      padding: 0;
      border: 0;
      background: transparent;
      cursor: pointer;
    }

    .top-mining__menu-toggle span {
      display: block;
      width: 28px;
      height: 2px;
      background: var(--tm-black);
      transition:
        transform 0.2s ease,
        opacity 0.2s ease;
    }

    .top-mining__mobile-menu-title {
      display: none;
    }

    .top-mining__mobile-menu-footer {
      display: none;
    }

    .top-mining__mobile-telegram {
      display: none;
    }

    .top-mining__nav {
      display: grid;
      max-height: 0;
      margin-top: 0;
      opacity: 0;
      transform: translateY(-10px);
      overflow: hidden;
      pointer-events: none;
      transition:
        max-height 0.34s ease,
        margin 0.28s ease,
        opacity 0.24s ease,
        transform 0.24s ease;
    }

    .top-mining-button--contact {
      display: none;
    }

    .top-mining__header--menu-open {
      position: fixed;
      bottom: auto;
      z-index: 50;
      display: flex;
      flex-direction: column;
      width: auto;
      height: auto;
      max-height: calc(100dvh - 24px);
      margin: 0;
      padding: 30px 34px 34px;
      border-radius: 0 0 28px 28px;
      background: var(--tm-white);
      overflow-y: auto;
      scrollbar-width: none;
      overscroll-behavior: contain;
      box-shadow: 0 0 0 100vmax rgba(0, 0, 0, 0.58);
      animation: top-mining-menu-in 0.26s ease both;
    }

    .top-mining__header--menu-open::-webkit-scrollbar {
      display: none;
    }

    .top-mining__header--menu-open .top-mining__logo {
      align-self: flex-start;
      width: auto;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle {
      position: absolute;
      top: 31px;
      right: 34px;
      width: 30px;
      height: 30px;
      gap: 0;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span {
      position: absolute;
      top: 14px;
      left: 0;
      width: 30px;
      height: 2px;
      background: var(--tm-black);
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:first-child {
      transform: rotate(45deg);
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:nth-child(2) {
      opacity: 0;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:last-child {
      transform: rotate(-45deg);
    }

    .top-mining__header--menu-open .top-mining__nav {
      grid-template-columns: 1fr;
      gap: 0;
      flex: 1 1 auto;
      max-height: none;
      width: 100%;
      margin-right: 0;
      margin-left: 0;
      border: none;
      border-radius: 0;
      background: transparent;
      overflow: visible;
      opacity: 1;
      transform: translateY(0);
      pointer-events: auto;
    }

    .top-mining__nav-column {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 3px 24px;
      align-items: start;
      grid-column: 1 / -1;
      padding: 12px 0 14px;
    }

    .top-mining__nav-heading {
      grid-column: 1 / -1;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
      margin-bottom: 6px;
      color: var(--tm-black);
      font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
      font-size: 27px;
      font-weight: 700;
      line-height: 1;
      letter-spacing: -0.07em;
      padding-bottom: 8px;
      border-bottom: 1px solid #e3e3e3;
    }

    .top-mining__nav-column--ratings .top-mining__nav-heading {
      width: auto;
      margin-right: -34px;
      margin-bottom: 6px;
      margin-left: -34px;
      padding: 8px 34px;
      background: var(--tm-orange-hover);
      border-bottom: none;
      color: var(--tm-white);
    }

    .top-mining__nav-heading-text {
      min-width: 0;
      color: inherit;
      text-decoration: none;
      text-transform: uppercase;
    }

    .top-mining__nav-heading-number {
      display: inline;
      order: 3;
      margin-left: auto;
      color: inherit;
      font-size: 19px;
      font-weight: 700;
      letter-spacing: -0.04em;
    }

    .top-mining__nav-link {
      align-self: start;
      gap: 7px;
      margin-bottom: 0;
      min-width: 0;
      color: var(--tm-text-secondary);
      font-size: 14px;
      font-weight: 500;
      line-height: 1.24;
      transition: color 0.18s ease;
    }

    .top-mining__nav-link-text {
      min-width: 0;
      color: inherit;
      overflow-wrap: anywhere;
    }

    .top-mining__nav-column svg,
    .top-mining__nav-link-icon,
    .top-mining__nav-telegram-icon {
      width: 17px;
      height: 17px;
      color: var(--tm-text-subtle);
      transition: color 0.18s ease;
    }

    .top-mining__nav-top-icon {
      width: 22px;
      height: 22px;
    }

    .top-mining__header--menu-open .top-mining__nav-link--hidden {
      display: flex !important;
    }

    .top-mining__nav-link--hidden {
      display: none !important;
    }

    .top-mining__nav-more {
      display: none !important;
    }

    .top-mining__nav-link--telegram {
      grid-column: auto;
      margin-top: 0;
      padding-top: 0;
      border-top: none;
    }

    .top-mining__header--menu-open .top-mining__mobile-menu-footer {
      display: flex;
      align-items: center;
      gap: 28px;
      flex: 0 0 auto;
      margin-top: 10px;
      animation: top-mining-menu-content-in 0.28s ease 0.08s both;
    }

    .top-mining__header--menu-open .top-mining-button--contact {
      display: flex;
      align-items: center;
      justify-content: center;
      flex: 0 0 auto;
      width: auto !important;
      min-width: 260px;
      height: 48px;
      margin: 0;
      padding: 0 28px;
      font-size: 14px;
    }

    .top-mining__header--menu-open .top-mining__mobile-telegram {
      display: block;
      margin: 0;
      color: var(--tm-black);
      font-size: 16px;
      font-weight: 500;
      line-height: 1;
      text-align: left;
      text-decoration: none;
      text-transform: uppercase;
    }

    @media (hover: hover) {
      .top-mining__header--menu-open .top-mining__nav-link:hover,
      .top-mining__header--menu-open .top-mining__nav-link:focus-visible {
        color: var(--tm-orange-hover);
      }

      .top-mining__header--menu-open .top-mining__nav-link:hover :is(svg, .top-mining__nav-link-icon),
      .top-mining__header--menu-open .top-mining__nav-link:focus-visible :is(svg, .top-mining__nav-link-icon) {
        color: var(--tm-orange-hover);
      }
    }

    .top-mining__header--menu-open .top-mining__nav-link:active {
      color: var(--tm-orange-hover);
    }

    .top-mining__header--menu-open .top-mining__nav-link:active :is(svg, .top-mining__nav-link-icon) {
      color: var(--tm-orange-hover);
    }

    .top-mining__cards {
      grid-template-columns: 1fr;
      width: calc(100% - 32px);
    }

    .top-mining__card--calculator {
      min-height: 240px;
    }

    .top-mining__card--calculator .top-mining__card-content {
      padding: 26px 28px;
    }

    .top-mining__card--calculator .top-mining__card-title {
      margin-bottom: 22px;
    }

    .top-mining__card--calculator .top-mining__card-stats {
      margin: 0 0 34px;
    }

    .top-mining__card--calculator .top-mining__card-text--calculator {
      bottom: 28px;
    }

    .top-mining__card--calculator .top-mining-button--right {
      bottom: 26px;
    }

    @keyframes top-mining-menu-in {
      from {
        opacity: 0;
        transform: translateY(-16px) scale(0.98);
      }

      to {
        opacity: 1;
        transform: translateY(0) scale(1);
      }
    }

    @keyframes top-mining-menu-content-in {
      from {
        opacity: 0;
        transform: translateY(-8px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  @media (max-width: 560px) {
    .top-mining {
      --mobile-frame-width: 100%;
      background: var(--tm-white);
    }

    .top-mining__header {
      width: var(--mobile-frame-width);
      min-height: 46px;
      margin: 0 auto;
      padding: 8px 10px;
      border-radius: 0 0 14px 14px;
      background: var(--tm-white);
      transition:
        border-radius 0.24s ease,
        box-shadow 0.24s ease,
        padding 0.24s ease,
        transform 0.24s ease,
        width 0.24s ease;
    }

    .top-mining__header--menu-open {
      inset: 0;
      display: block;
      width: 100vw;
      height: 100vh;
      height: 100dvh;
      max-height: none;
      padding: 14px 18px 32px;
      border-radius: 0;
      box-shadow: none;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle {
      top: 16px;
      right: 16px;
      width: 26px;
      height: 26px;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span {
      top: 12px;
      width: 26px;
      height: 2px;
    }

    .top-mining__logo {
      gap: 9px;
      margin-bottom: 0;
    }

    .top-mining__logo-mark {
      width: 31px;
      height: 31px;
    }

    .top-mining__logo-title {
      font-size: 27px;
    }

    .top-mining__logo-subtitle {
      font-size: 10px;
    }

    .top-mining__menu-toggle {
      position: absolute;
      top: 17px;
      right: 18px;
    }

    .top-mining__mobile-menu-title {
      display: block;
      max-height: 0;
      margin: 0;
      opacity: 0;
      transform: translateY(-10px);
      transition:
        max-height 0.28s ease,
        margin 0.28s ease,
        opacity 0.22s ease,
        transform 0.22s ease;
      pointer-events: none;
    }

    .top-mining__header--menu-open .top-mining__mobile-menu-title {
      position: relative;
      container-type: inline-size;
      width: 100%;
      max-height: 40px;
      margin: 42px 0 0;
      padding: 0 2px 10px;
      color: var(--tm-black);
      font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
      font-size: clamp(26px, 9.6cqw, 31px);
      font-weight: 600;
      line-height: 1;
      letter-spacing: -0.02em;
      text-transform: uppercase;
      white-space: nowrap;
      overflow: hidden;
      opacity: 1;
      text-align: center;
      transform: translateY(0);
      pointer-events: auto;
    }

    .top-mining__mobile-menu-title-text {
      position: relative;
      display: inline-block;
      max-width: 100%;
      color: inherit;
    }

    .top-mining__mobile-menu-title-logo {
      position: absolute;
      left: 1.16em;
      top: 0.35em;
      width: 0.22em;
      height: 0.22em;
    }

    .top-mining__header--menu-open .top-mining__nav {
      width: calc(100% + 36px);
      margin-top: 0;
      margin-right: -18px;
      margin-left: -18px;
      border-top: 1px solid var(--tm-black);
      border-radius: 22px 22px 0 0;
      background: var(--tm-white);
      overflow: hidden;
    }

    .top-mining__nav-column {
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 0 14px;
      padding: 14px 18px 16px;
      border-bottom: none;
    }

    .top-mining__nav-column:nth-child(1) {
      padding-top: 16px;
    }

    .top-mining__nav-column:nth-child(2) {
      padding-top: 0;
      padding-bottom: 16px;
    }

    .top-mining__nav-column:nth-child(3),
    .top-mining__nav-column:nth-child(4) {
      padding-top: 0;
    }

    .top-mining__nav-heading {
      margin-bottom: 12px;
      font-family: inherit;
      font-size: 16px;
      font-weight: 700;
      line-height: 1.1;
      letter-spacing: -0.02em;
      padding-bottom: 0;
      border-bottom: none;
    }

    .top-mining__nav-column--ratings .top-mining__nav-heading {
      margin-right: -18px;
      margin-bottom: 12px;
      margin-left: -18px;
      padding: 10px 18px;
    }

    .top-mining__nav-heading-number {
      font-size: 16px;
      font-weight: 400;
      letter-spacing: 0;
    }

    .top-mining__nav-link {
      margin-bottom: 8px;
      font-size: 14px;
    }

    .top-mining__nav-column svg,
    .top-mining__nav-telegram-icon {
      width: 18px;
      height: 18px;
    }

    .top-mining__nav-link--telegram {
      grid-column: 1 / -1;
      margin-top: 10px;
      padding-top: 10px;
      border-top: 1px solid var(--tm-border-dark);
    }

    .top-mining__header--menu-open .top-mining__mobile-menu-footer {
      display: block;
      margin-top: 18px;
    }

    .top-mining__header--menu-open .top-mining-button--contact {
      width: 100% !important;
      min-width: 0;
      margin: 0 auto;
      font-size: 16px;
    }

    .top-mining__header--menu-open .top-mining__mobile-telegram {
      margin-top: 12px;
      color: #343434;
      font-size: 16px;
      text-align: center;
      animation: top-mining-menu-content-in 0.28s ease 0.12s both;
    }

    .top-mining__hero {
      width: var(--mobile-frame-width);
      margin: 0 auto;
      background: var(--tm-white);
      overflow: visible;
    }

    .top-mining__dark {
      padding: 58px 10px 26px;
      border-radius: 34px 34px 0 0;
    }

    .top-mining__cards {
      grid-template-columns: 1fr;
      gap: 20px;
      width: 100%;
    }

    .top-mining__card {
      border-radius: 24px;
    }

    .top-mining__card--catalog {
      min-height: 520px;
      order: 1;
    }

    .top-mining__card--calculator {
      min-height: 500px;
      order: 2;
    }

    .top-mining__card--telegram {
      min-height: 260px;
      order: 3;
    }

    .top-mining__card--rating {
      min-height: 300px;
      order: 4;
    }

    .top-mining__card-content {
      padding: 30px 18px;
    }

    .top-mining__card-title {
      max-width: 270px;
      margin-bottom: 22px;
      font-size: 27px;
      line-height: 1.18;
      letter-spacing: -0.04em;
      white-space: normal;
    }

    .top-mining__card-text {
      max-width: 280px;
      font-size: 17px;
      line-height: 1.45;
    }

    .top-mining__card-reviews {
      font-size: 20px !important;
      line-height: 1.35 !important;
    }

    .top-mining__card-reviews strong {
      display: inline;
      font-size: 24px;
    }

    .top-mining__card-reviews::before {
      content: '★';
      margin-right: 8px;
      color: var(--tm-orange-hover);
    }

    .top-mining__card-companies {
      display: flex;
      gap: 14px;
      margin-top: 34px;
      margin-bottom: 28px;
      margin-right: -18px;
      padding-right: 18px;
      overflow-x: auto;
      overflow-y: hidden;
      scroll-snap-type: x proximity;
      -webkit-overflow-scrolling: touch;
    }

    .top-mining__card-companies::-webkit-scrollbar {
      display: none;
    }

    .top-mining__card-companies span {
      flex: 0 0 145px;
      min-height: 106px;
      padding: 14px 16px;
      border-radius: 14px;
      font-size: 17px;
      scroll-snap-align: start;
    }

    .top-mining__card-companies b img {
      height: 24px;
    }

    .top-mining__card-companies small {
      font-size: 16px;
    }

    .top-mining__card-companies small img {
      width: 16px;
    }

    .top-mining-button {
      width: 100% !important;
      min-width: 0;
      height: 46px;
      font-size: 16px;
    }

    .top-mining-button--right,
    .top-mining__card--calculator .top-mining-button--right {
      position: absolute;
      left: 18px;
      right: 18px;
      bottom: 20px;
      width: auto !important;
      min-width: 0;
      height: 46px;
      font-size: 16px;
    }

    .top-mining__card-stats {
      position: absolute;
      left: 18px;
      right: 18px;
      bottom: 88px;
      justify-content: space-between;
      gap: 12px;
      margin: 0;
    }

    .top-mining__card-stats span {
      font-size: 15px;
    }

    .top-mining__card-stats strong {
      font-size: 31px;
    }

    .top-mining__card-text--calculator {
      top: 102px;
      bottom: auto;
      max-width: 280px;
      font-size: 17px;
    }

    .top-mining__card-text--telegram {
      left: 88px;
      top: 104px;
      bottom: auto;
      max-width: 190px;
      font-size: 15px;
      line-height: 1.45;
    }

    .top-mining__card-image--rig-large {
      top: 178px;
      right: 40px;
      width: 260px;
      opacity: 1;
    }

    .top-mining__card-image--rig-small {
      left: 18px;
      right: auto;
      bottom: 108px;
      width: 58px;
      opacity: 1;
    }

    .top-mining__card-decor--blur-left {
      left: -18px;
      bottom: -12px;
      width: 118px;
      opacity: 1;
    }

    .top-mining__card-decor--blur-right {
      right: -10px;
      top: -16px;
      width: 112px;
      opacity: 1;
    }

    .top-mining__card-decor--paper-large {
      right: -4px;
      top: -6px;
      width: 82px;
    }

    .top-mining__card-decor--paper-small {
      right: 86px;
      bottom: 50px;
      height: 42px;
      opacity: 0.9;
    }

    .top-mining__card--rating .top-mining-button--right {
      bottom: 20px;
    }

    .top-mining__card--rating p {
      max-width: 250px;
      font-size: 16px;
      line-height: 1.55;
    }
  }
</style>
