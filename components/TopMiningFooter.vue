<template>
  <footer class="site-footer">
    <section class="site-footer__mobile-contact" aria-labelledby="footer-contact-title">
      <h2 id="footer-contact-title">
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

        <button type="submit" class="site-footer__contact-submit">
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
        <span class="site-footer__brand-text">
          <img
            class="site-footer__brand-logo"
            :src="logoMark"
            alt=""
          />
          ТОП - МАЙНИНГ
        </span>
      </h2>

      <div class="site-footer__content">
        <section class="site-footer__subscribe">
          <h3>Подписаться на новости</h3>

          <form class="site-footer__form" @submit.prevent>
            <label class="site-footer__input-wrap">
              <span class="site-footer__visually-hidden">E-mail</span>
              <input type="email" placeholder="E-mail" />
            </label>

            <round-icon-button
              type="submit"
              size="small"
              aria-label="Подписаться"
            />
          </form>

          <a href="#" class="site-footer__privacy">
            Политика конфиденциальности
          </a>
        </section>

        <nav class="site-footer__nav" aria-label="Навигация футера">
          <div class="site-footer__nav-column">
            <a href="#">Майнинг-калькулятор <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">ASIC-майнеры <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">GPU <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">CPU <Icon name="mdi:arrow-top-right" /></a>
            <a href="#" class="site-footer__telegram">Telegram</a>
          </div>

          <div class="site-footer__nav-column">
            <a href="#">Рейтинги <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">Статьи <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">Каталог организаций <Icon name="mdi:arrow-top-right" /></a>
            <a href="#">Site map <Icon name="mdi:arrow-top-right" /></a>
            <small>© 2024 Топ - Майнинг</small>
          </div>
        </nav>
      </div>

      <div class="site-footer__scroll-wrap">
        <round-icon-button
          class="site-footer__scroll-top"
          aria-label="Наверх"
          @click="scrollToTop"
        />
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

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
    padding: 54px 46px 56px;
    border-radius: 48px 48px 0 0;
    background: #ffffff;
    color: #151515;
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
    overflow: hidden;
  }

  .site-footer__inner {
    position: relative;
    max-width: 1440px;
    margin: 0 auto;
  }

  .site-footer__mobile-contact {
    display: none;
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

  .site-footer__brand-text {
    position: relative;
    display: inline-block;
  }

  .site-footer__brand-logo {
    position: absolute;
    left: 1.04em;
    top: 0.24em;
    width: 0.28em;
    height: 0.28em;
    object-fit: contain;
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
    border: 1px solid #cfcfcf;
    border-radius: 999px;
    background: #ffffff;
    color: #151515;
    font: inherit;
    outline: none;
  }

  .site-footer__input-wrap input::placeholder {
    color: #8c8c8c;
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
    color: #151515;
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
    border-left: 1px solid #d8d8d8;
  }

  .site-footer__nav-column a,
  .site-footer__nav-column small {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    color: #151515;
    font-size: 13px;
    font-weight: 500;
    line-height: 1;
    text-decoration: none;
    text-transform: uppercase;
  }

  .site-footer__nav-column a:hover,
  .site-footer__nav-column a:focus-visible {
    color: #ff6418;
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
    .site-footer {
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

    .site-footer__mobile-contact {
      display: block;
      padding: 50px 30px 42px;
      border-radius: 28px;
      background:
        radial-gradient(circle at 50% 24%, rgba(255, 255, 255, 0.06), transparent 32%),
        #151515;
      color: #ffffff;
      text-align: center;
    }

    .site-footer__mobile-contact h2 {
      margin: 0 0 24px;
      color: #ffffff;
      font-size: 34px;
      font-weight: 900;
      line-height: 0.95;
      letter-spacing: -0.05em;
      text-transform: uppercase;
    }

    .site-footer__mobile-contact h2 span {
      display: block;
      margin-top: 4px;
      font-size: 22px;
      letter-spacing: -0.03em;
    }

    .site-footer__contact-form {
      display: grid;
      gap: 14px;
      max-width: 230px;
      margin: 0 auto 26px;
    }

    .site-footer__contact-form label {
      display: grid;
      gap: 7px;
      text-align: center;
    }

    .site-footer__contact-form label span {
      color: #ffffff;
      font-size: 12px;
      font-weight: 800;
      line-height: 1;
      text-transform: uppercase;
    }

    .site-footer__contact-form input,
    .site-footer__contact-form textarea {
      width: 100%;
      border: 1px solid rgba(255, 255, 255, 0.45);
      border-radius: 999px;
      background: transparent;
      color: #ffffff;
      font: inherit;
      outline: none;
    }

    .site-footer__contact-form input {
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

    .site-footer__contact-form input::placeholder,
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
      border: 1px solid #ff6418;
      border-radius: 999px;
      background: #ff6418;
      color: #ffffff;
      font-size: 8px;
      font-weight: 800;
      line-height: 1;
      text-transform: uppercase;
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
      color: #ffffff;
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
      background: #ffffff;
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

    .site-footer__brand-text {
      max-width: 100%;
    }

    .site-footer__brand-logo {
      left: 1.03em;
      top: 0.32em;
      width: 0.26em;
      height: 0.26em;
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
