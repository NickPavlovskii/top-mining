<template>
  <footer :class="['site-footer', { 'site-footer--privacy': isPrivacyPage }]">
    <section
      v-if="!isPrivacyPage"
      class="site-footer__contact"
      aria-labelledby="footer-contact-title"
    >
      <h2 id="footer-contact-title" class="site-footer__contact-heading">
        Есть вопросы?
        <span>Предложения?</span>
      </h2>

      <form class="site-footer__contact-form" @submit.prevent>
        <label>
          <span>Ваше имя</span>
          <input type="text" placeholder="Ваше имя" />
        </label>

        <label>
          <span>Способ связи</span>
          <input type="text" placeholder="Телефон Telegram" />
        </label>

        <label>
          <span>Ваш вопрос / предложение</span>
          <textarea placeholder="Ваш вопрос / предложение" />
        </label>

        <label class="site-footer__contact-consent">
          <input
            v-model="isPersonalDataAccepted"
            type="checkbox"
            required
          />
          <span>
            Даю согласие на
            <NuxtLink to="/privacy">обработку персональных данных</NuxtLink>
          </span>
        </label>

        <button
          type="submit"
          class="site-footer__contact-submit"
          :disabled="!isPersonalDataAccepted"
        >
          Отправить
          <Icon name="mdi:arrow-top-right" />
        </button>
      </form>

      <ul class="site-footer__contact-benefits">
        <li>Добавим ваши асики/GPU/CPU в майнинг-калькулятор</li>
        <li>Напишем статью под ваш запрос</li>
        <li>Разместим вашу компанию в рейтинге</li>
        <li>Разместим вашу компанию в каталоге организаций</li>
      </ul>
    </section>

    <div class="site-footer__inner">
      <h2 class="site-footer__brand" aria-label="Топ - Майнинг">
        <top-mining-brand-title variant="footer" spaced />
      </h2>

      <div class="site-footer__content">
        <section class="site-footer__subscribe">
          <h3>Подписаться на новости</h3>

          <form class="site-footer__form" @submit.prevent>
            <label class="site-footer__input-wrap">
              <span class="site-footer__visually-hidden">E-mail</span>
              <input type="email" placeholder="E-mail" />
            </label>

            <top-mining-round-icon-button
              type="submit"
              size="small"
              ariaLabel="Подписаться"
            />
          </form>

          <NuxtLink to="/privacy" class="site-footer__privacy">
            Политика конфиденциальности
          </NuxtLink>
        </section>

        <nav class="site-footer__nav" aria-label="Навигация футера">
          <div class="site-footer__nav-column">
            <component
              :is="getFooterLinkComponent(link)"
              v-for="link in TOP_MINING_FOOTER_CALCULATOR_LINKS"
              :key="link.label"
              v-bind="getFooterLinkProps(link)"
            >
              {{ link.label }}
              <Icon name="mdi:arrow-top-right" />
            </component>
            <a
              target="_blank"
              rel="noopener noreferrer"
              class="site-footer__telegram"
              :href="TOP_MINING_FOOTER_TELEGRAM_HREF"
            >
              Telegram
            </a>
          </div>

          <div class="site-footer__nav-column">
            <component
              v-for="link in TOP_MINING_FOOTER_MAIN_LINKS"
              :key="link.label"
              v-bind="getFooterLinkProps(link)"
              :is="getFooterLinkComponent(link)"
            >
              {{ link.label }}
              <Icon name="mdi:arrow-top-right" />
            </component>
            <small>© 2026 Топ - Майнинг</small>
          </div>
        </nav>
      </div>

      <div class="site-footer__scroll-wrap">
        <top-mining-round-icon-button
          class="site-footer__scroll-top"
          ariaLabel="Наверх"
          @click="scrollToTop"
        />
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
  import { NuxtLink } from '#components'
  import type { TopMiningFooterNavLink } from '~/common/modules/top-mining/footer-nav'
  import {
    TOP_MINING_FOOTER_CALCULATOR_LINKS,
    TOP_MINING_FOOTER_MAIN_LINKS,
    TOP_MINING_FOOTER_TELEGRAM_HREF,
  } from '~/common/modules/top-mining/footer-nav'

  const route = useRoute()
  const isPersonalDataAccepted = ref(false)

  const isPrivacyPage = computed(() => route.path === '/privacy')

  function isExternalFooterLink(link: TopMiningFooterNavLink) {
    return link.external ?? /^https?:\/\//.test(link.href)
  }

  function getFooterLinkComponent(link: TopMiningFooterNavLink) {
    return isExternalFooterLink(link) || link.href.startsWith('#') ? 'a' : NuxtLink
  }

  function getFooterLinkProps(link: TopMiningFooterNavLink) {
    if (isExternalFooterLink(link)) {
      return {
        href: link.href,
        target: '_blank',
        rel: 'noopener noreferrer',
      }
    }

    if (link.href.startsWith('#')) {
      return { href: link.href }
    }

    return { to: link.href }
  }

  function scrollToTop() {
    if (import.meta.server) {
      return
    }

    window.scrollTo({ top: 0, behavior: 'smooth' })
  }
</script>

<style scoped>
  .site-footer {
    position: relative;
    z-index: 2;
    margin-top: -42px;
    padding: 0;
    border-radius: 0;
    background: transparent;
    color: var(--tm-black);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
    overflow: hidden;
  }

  .site-footer--privacy {
    margin-top: 0;
  }

  .site-footer--privacy .site-footer__inner {
    border-radius: 0;
  }

  .site-footer--privacy .site-footer__inner::before {
    display: none;
  }

  .site-footer__contact {
    padding: 0 46px 64px;
    border-radius: 60px 60px 0 0;
    background: var(--tm-black);
    color: var(--tm-white);
    text-align: center;
    overflow: hidden;
  }

  .site-footer__contact-heading {
    margin: 144px 0 56px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(34px, 7.2vw, 120px);
    font-weight: 500;
    line-height: 1.08;
    text-transform: uppercase;
  }

  .site-footer__contact-heading span {
    display: block;
  }

  .site-footer__contact-form {
    display: grid;
    gap: 22px;
    max-width: 520px;
    margin: 0 auto 64px;
  }

  .site-footer__contact-form label:not(.site-footer__contact-consent) {
    display: grid;
    gap: 10px;
    text-align: center;
  }

  .site-footer__contact-form label:not(.site-footer__contact-consent) span {
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 800;
    line-height: 1;
    text-transform: uppercase;
  }

  .site-footer__contact-consent {
    display: flex !important;
    flex-direction: row;
    align-items: center;
    gap: 10px;
    text-align: left;
    cursor: pointer;
  }

  .site-footer__contact-consent input {
    flex: 0 0 auto;
    width: 18px;
    height: 18px;
    margin: 0;
    padding: 0;
    border: 1px solid rgba(255, 255, 255, 0.45);
    border-radius: 4px;
    background: transparent;
    accent-color: var(--tm-orange);
    cursor: pointer;
  }

  .site-footer__contact-consent span {
    flex: 1 1 auto;
    min-width: 0;
    color: var(--tm-white);
    font-size: 11px;
    font-weight: 800;
    line-height: 1.25;
    text-align: left;
    text-transform: uppercase;
  }

  .site-footer__contact-consent a {
    color: var(--tm-white);
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .site-footer__contact-consent a:hover,
  .site-footer__contact-consent a:focus-visible {
    color: var(--tm-orange);
  }

  .site-footer__contact-form input:not([type='checkbox']),
  .site-footer__contact-form textarea {
    width: 100%;
    border: 1px solid rgba(255, 255, 255, 0.45);
    border-radius: 999px;
    background: transparent;
    color: var(--tm-white);
    font: inherit;
    outline: none;
  }

  .site-footer__contact-form input:not([type='checkbox']) {
    height: 48px;
    padding: 0 18px;
    font-size: 14px;
  }

  .site-footer__contact-form textarea {
    min-height: 120px;
    padding: 14px 18px;
    border-radius: 14px;
    font-size: 14px;
    resize: vertical;
  }

  .site-footer__contact-form input:not([type='checkbox'])::placeholder,
  .site-footer__contact-form textarea::placeholder {
    color: rgba(255, 255, 255, 0.45);
  }

  .site-footer__contact-submit {
    display: inline-flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    height: 48px;
    padding: 0 18px;
    border: 1px solid var(--tm-orange);
    border-radius: 999px;
    background: var(--tm-orange);
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 800;
    line-height: 1;
    text-transform: uppercase;
    cursor: pointer;
    transition: opacity 0.2s ease;
  }

  .site-footer__contact-submit:disabled {
    opacity: 0.45;
    cursor: not-allowed;
  }

  .site-footer__contact-submit svg {
    width: 16px;
    height: 16px;
  }

  .site-footer__contact-benefits {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 0;
    max-width: 1440px;
    margin: 0 auto;
    padding: 0;
    list-style: none;
  }

  .site-footer__contact-benefits li {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 88px;
    padding: 0 24px;
    border-left: 1px solid rgba(255, 255, 255, 0.12);
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 600;
    line-height: 1.25;
    text-align: center;
  }

  .site-footer__contact-benefits li:first-child {
    border-left: 0;
  }

  @media (max-width: 1919px) {
    .site-footer__contact-heading {
      font-size: clamp(34px, 7.2vw, 96px);
    }
  }

  @media (max-width: 1100px) and (min-width: 901px) {
    .site-footer__contact-heading {
      font-size: clamp(48px, 6.8vw, 72px);
      line-height: 1.06;
    }
  }

  .site-footer__inner {
    position: relative;
    padding: 54px 46px 56px;
    border-radius: 48px 48px 0 0;
    background: var(--tm-white);
  }

  .site-footer__inner::before {
    content: '';
    position: absolute;
    inset: 0;
    left: 50%;
    z-index: -1;
    width: 100vw;
    border-radius: inherit;
    background: var(--tm-white);
    transform: translateX(-50%);
  }

  .site-footer__brand {
    position: relative;
    z-index: 1;
    margin: 0 0 36px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(78px, 10.8vw, 148px);
    font-weight: 600;
    line-height: 0.78;
    letter-spacing: -0.08em;
    text-align: center;
    text-transform: uppercase;
    white-space: nowrap;
  }

  .site-footer__brand::after {
    content: attr(aria-label);
    position: absolute;
    left: 50%;
    top: 0.42em;
    z-index: -1;
    width: 100%;
    color: rgba(21, 21, 21, 0.58);
    filter: blur(7px);
    transform: translateX(-50%) scaleY(0.72);
    pointer-events: none;
  }

  .site-footer__content {
    display: grid;
    grid-template-columns: 1fr 1.7fr;
    gap: 80px;
    align-items: start;
  }

  .site-footer__subscribe h3 {
    margin: 0 0 18px;
    font-size: 20px;
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
  }

  .site-footer__form {
    display: flex;
    align-items: center;
    gap: 10px;
    max-width: 360px;
    margin-bottom: 34px;
  }

  .site-footer__input-wrap {
    flex: 1 1 auto;
  }

  .site-footer__input-wrap input {
    width: 100%;
    height: 38px;
    padding: 0 18px;
    border: 1px solid var(--tm-border-light);
    border-radius: 999px;
    background: var(--tm-white);
    color: var(--tm-black);
    font: inherit;
    outline: none;
  }

  .site-footer__input-wrap input::placeholder {
    color: var(--tm-text-placeholder);
  }

  .site-footer__scroll-wrap {
    position: absolute;
    right: 0;
    bottom: 0;
  }

  .site-footer__scroll-top {
    flex-shrink: 0;
  }

  .site-footer__privacy {
    color: var(--tm-black);
    font-size: 13px;
    text-decoration: none;
    text-transform: uppercase;
  }

  .site-footer__nav {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 0;
  }

  .site-footer__nav-column {
    display: grid;
    align-content: start;
    gap: 8px;
    min-height: 128px;
    padding-left: 28px;
    border-left: 1px solid var(--tm-border);
  }

  .site-footer__nav-column a,
  .site-footer__nav-column small {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    color: var(--tm-black);
    font-size: 13px;
    font-weight: 500;
    line-height: 1;
    text-decoration: none;
    text-transform: uppercase;
  }

  .site-footer__nav-column a:hover,
  .site-footer__nav-column a:focus-visible {
    color: var(--tm-orange);
  }

  .site-footer__nav-column svg {
    width: 13px;
    height: 13px;
  }

  .site-footer__telegram,
  .site-footer__nav-column small {
    margin-top: 34px;
  }

  @media (max-width: 1200px) {
    .site-footer__contact {
      padding-right: 38px;
      padding-left: 38px;
    }

    .site-footer__inner {
      padding-right: 38px;
      padding-left: 38px;
    }

    .site-footer__brand {
      margin-bottom: 28px;
      font-size: clamp(74px, 9vw, 104px);
      letter-spacing: -0.075em;
    }

    .site-footer__content {
      gap: 54px;
    }
  }

  .site-footer__visually-hidden {
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

  @media (max-width: 900px) {
    .site-footer {
      margin-top: -30px;
    }

    .site-footer__contact {
      padding: 0 26px 48px;
      border-radius: 40px 40px 0 0;
    }

    .site-footer__contact-heading {
      margin-top: 96px;
      margin-bottom: 40px;
      font-size: clamp(40px, 8.5vw, 64px);
      line-height: 1.06;
    }

    .site-footer__contact-form {
      margin-bottom: 48px;
    }

    .site-footer__contact-benefits li {
      min-height: 72px;
      padding: 0 14px;
      font-size: 11px;
    }

    .site-footer__inner {
      padding: 42px 26px 46px;
      border-radius: 34px 34px 0 0;
    }

    .site-footer__brand {
      overflow: hidden;
      isolation: isolate;
      margin-bottom: 40px;
      padding-bottom: 10px;
      font-size: clamp(42px, 14.5vw, 80px);
      letter-spacing: -0.08em;
    }

    .site-footer__brand::after {
      top: 0.4em;
      filter: blur(5px);
    }

    .site-footer__content {
      grid-template-columns: 1fr;
      gap: 34px;
    }

    .site-footer__nav {
      gap: 24px;
    }

    .site-footer__nav-column {
      padding-left: 18px;
    }

    .site-footer__scroll-wrap {
      right: 0;
      bottom: 0;
    }
  }

  @media (max-width: 560px) {
    .site-footer {
      margin-top: -18px;
      padding: 0;
      border-radius: 0;
      background: transparent;
      overflow: visible;
    }

    .site-footer__contact {
      padding: 50px 30px 42px;
      border-radius: 28px 28px 0 0;
      background: var(--tm-black);
    }

    .site-footer__contact-heading {
      margin: 0 0 24px;
      color: var(--tm-white);
      font-size: 34px;
      font-weight: 900;
      line-height: 0.95;
      letter-spacing: -0.05em;
    }

    .site-footer__contact-heading span {
      margin-top: 4px;
      font-size: 22px;
      letter-spacing: -0.03em;
    }

    .site-footer__contact-form {
      display: grid;
      gap: 14px;
      max-width: 290px;
      margin: 0 auto 26px;
    }

    .site-footer__contact-form label:not(.site-footer__contact-consent) {
      display: grid;
      gap: 7px;
      text-align: center;
    }

    .site-footer__contact-form label:not(.site-footer__contact-consent) span {
      color: var(--tm-white);
      font-size: 12px;
      font-weight: 800;
      line-height: 1;
      text-transform: uppercase;
    }

    .site-footer__contact-consent {
      display: flex !important;
      flex-direction: row;
      align-items: center;
      gap: 7px;
    }

    .site-footer__contact-consent input {
      width: 12px;
      height: 12px;
      margin: 0;
    }

    .site-footer__contact-consent span {
      font-size: 7px;
      line-height: 1.2;
    }

    .site-footer__contact-form input:not([type='checkbox']),
    .site-footer__contact-form textarea {
      width: 100%;
      border: 1px solid rgba(255, 255, 255, 0.45);
      border-radius: 999px;
      background: transparent;
      color: var(--tm-white);
      font: inherit;
      outline: none;
    }

    .site-footer__contact-form input:not([type='checkbox']) {
      height: 24px;
      padding: 0 10px;
      font-size: 8px;
    }

    .site-footer__contact-form textarea {
      min-height: 58px;
      padding: 9px 10px;
      border-radius: 10px;
      font-size: 8px;
      resize: vertical;
    }

    .site-footer__contact-form input:not([type='checkbox'])::placeholder,
    .site-footer__contact-form textarea::placeholder {
      color: rgba(255, 255, 255, 0.45);
    }

    .site-footer__contact-submit {
      display: inline-flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      width: 100%;
      height: 24px;
      padding: 0 12px;
      border: 1px solid var(--tm-orange);
      border-radius: 999px;
      background: var(--tm-orange);
      color: var(--tm-white);
      font-size: 8px;
      font-weight: 800;
      line-height: 1;
      text-transform: uppercase;
    }

    .site-footer__contact-submit:disabled {
      opacity: 0.45;
    }

    .site-footer__contact-submit svg {
      width: 10px;
      height: 10px;
    }

    .site-footer__contact-benefits {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 0;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .site-footer__contact-benefits li {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 40px;
      padding: 0 8px;
      border-left: 1px solid rgba(255, 255, 255, 0.12);
      color: var(--tm-white);
      font-size: 9px;
      font-weight: 600;
      line-height: 1.15;
      text-align: center;
    }

    .site-footer__contact-benefits li:first-child {
      border-left: 0;
    }

    .site-footer__inner {
      padding: 34px 18px 40px;
      border-radius: 28px 28px 0 0;
      background: var(--tm-white);
      overflow: hidden;
    }

    .site-footer__scroll-wrap {
      position: static;
      display: flex;
      justify-content: flex-end;
      margin-top: 20px;
    }

    .site-footer__brand {
      container-type: inline-size;
      width: 100%;
      margin-bottom: 24px;
      overflow: hidden;
      isolation: isolate;
      font-size: clamp(28px, 9.8cqw, 40px);
      line-height: 0.82;
      letter-spacing: -0.088em;
      white-space: nowrap;
    }

    .site-footer__brand::after {
      top: 0.44em;
      filter: blur(4px);
      max-width: 100%;
    }

    .site-footer__content,
    .site-footer__nav {
      grid-template-columns: 1fr;
    }

    .site-footer__form {
      max-width: none;
      margin-bottom: 24px;
    }

    .site-footer__nav-column {
      min-height: auto;
      padding-left: 0;
      border-left: 0;
    }

    .site-footer__telegram,
    .site-footer__nav-column small {
      margin-top: 16px;
    }
  }
</style>
