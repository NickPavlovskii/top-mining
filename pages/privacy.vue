<template>
  <article class="privacy-page">
    <div class="privacy-page__inner">
      <nav class="privacy-page__breadcrumbs" aria-label="Хлебные крошки">
        <nuxt-link to="/">Главная</nuxt-link>
        <span aria-hidden="true">/</span>
        <span>Политика конфиденциальности (обработки персональных данных)</span>
      </nav>

      <h1 class="privacy-page__title">
        Политика конфиденциальности (обработки персональных данных)
      </h1>

      <div class="privacy-page__content">
        <p>
          Настоящая политика обработки персональных данных (далее — Политика)
          составлена в соответствии с требованиями Федерального закона от
          27.07.2006 №152-ФЗ «О персональных данных» и определяет порядок
          обработки персональных данных и меры по обеспечению их безопасности,
          принимаемые Индивидуальным предпринимателем Власовым (ИНН 774331175676,
          далее — Оператор).
        </p>

        <section>
          <h2>1. Общие положения</h2>
          <p>
            1.1. Настоящая Политика применяется ко всей информации, которую
            Оператор может получить о посетителях сайта, включая пользователей,
            находящихся как в Российской Федерации, так и за её пределами.
          </p>
          <p>1.2. Целью обработки персональных данных является:</p>
          <ul>
            <li>рассылка новостей и рекламных предложений;</li>
            <li>
              аналитика поведения пользователей с целью улучшения качества
              предоставляемых услуг.
            </li>
          </ul>
          <p>
            1.3. Персональные данные не обрабатываются в рамках регистрации
            аккаунта, так как таковая не предусмотрена.
          </p>
          <p>
            1.4. Оператор обрабатывает данные добросовестно, законно и с
            соблюдением принципа минимизации.
          </p>
        </section>

        <section>
          <h2>2. Обрабатываемые данные</h2>
          <p>2.1. Персональные данные, обрабатываемые Оператором:</p>
          <ul>
            <li>адрес электронной почты;</li>
            <li>номер телефона;</li>
            <li>IP-адрес пользователя;</li>
            <li>
              а также автоматически собираемые обезличенные данные (cookies,
              информация о браузере, устройстве и т.д.).
            </li>
          </ul>
          <p>
            2.2. Оператор не собирает специальные категории персональных данных.
          </p>
        </section>

        <section>
          <h2>3. Правовые основания обработки</h2>
          <p>
            3.1. Основанием для обработки персональных данных является согласие
            субъекта персональных данных, выраженное путём использования сайта, а
            также иные основания, предусмотренные законодательством.
          </p>
          <p>
            3.2. Обработка обезличенных данных осуществляется в случае, если это
            разрешено настройками браузера пользователя.
          </p>
        </section>

        <section>
          <h2>4. Условия обработки персональных данных</h2>
          <p>
            4.1. Оператор не предоставляет персональные данные третьим лицам, за
            исключением случаев, предусмотренных законодательством РФ.
          </p>
          <p>
            4.2. Хранение персональных данных осуществляется не дольше, чем
            этого требуют цели обработки, или до момента отзыва согласия
            субъектом данных.
          </p>
          <p>
            4.3. Обработка осуществляется с использованием средств автоматизации
            и без таковых.
          </p>
        </section>

        <section>
          <h2>5. Права субъекта персональных данных</h2>
          <p>
            5.1. Пользователь вправе запросить у Оператора доступ к своим
            данным, их уточнение, блокирование или уничтожение.
          </p>
          <p>
            5.2. Отзыв согласия на обработку персональных данных осуществляется
            путём направления уведомления на электронную почту Оператора.
          </p>
        </section>

        <section>
          <h2>6. Заключительные положения</h2>
          <p>
            6.1. Оператор оставляет за собой право вносить изменения в настоящую
            Политику без предварительного уведомления.
          </p>
          <p>
            6.2. Актуальная версия Политики доступна на веб-сайте Оператора.
          </p>
          <p>
            6.3. По вопросам обработки персональных данных можно обращаться по
            адресу электронной почты:
            <a href="mailto:info@top-mining.ru">info@top-mining.ru</a>
          </p>
        </section>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  useHead({
    title: 'Политика конфиденциальности — ТОП МАЙНИНГ',
  })
</script>

<style scoped>
  .privacy-page {
    padding: 28px 24px 80px;
    background: var(--tm-surface-light);
    color: var(--tm-black);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .privacy-page__inner {
    max-width: 1440px;
    margin: 0 auto;
  }

  .privacy-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin: 0 0 24px;
    color: var(--tm-text-gray);
    font-size: 13px;
    line-height: 1.4;
  }

  .privacy-page__breadcrumbs a {
    color: var(--tm-text-gray);
    text-decoration: none;
  }

  .privacy-page__breadcrumbs a:hover,
  .privacy-page__breadcrumbs a:focus-visible {
    color: var(--tm-orange);
  }

  .privacy-page__title {
    margin: 0 0 28px;
    font-size: clamp(28px, 4vw, 52px);
    font-weight: 700;
    line-height: 1.08;
    letter-spacing: -0.03em;
  }

  .privacy-page__content {
    padding: 40px clamp(20px, 4vw, 56px) 48px;
    border-radius: 28px;
    background: var(--tm-white);
    font-size: 16px;
    line-height: 1.55;
  }

  .privacy-page__content section + section {
    margin-top: 28px;
  }

  .privacy-page__content h2 {
    margin: 0 0 14px;
    font-size: 20px;
    font-weight: 700;
    line-height: 1.25;
  }

  .privacy-page__content p {
    margin: 0 0 12px;
  }

  .privacy-page__content p:last-child,
  .privacy-page__content ul:last-child {
    margin-bottom: 0;
  }

  .privacy-page__content ul {
    margin: 0 0 12px;
    padding-left: 22px;
  }

  .privacy-page__content li + li {
    margin-top: 6px;
  }

  .privacy-page__content a {
    color: var(--tm-orange);
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  @media (max-width: 560px) {
    .privacy-page {
      padding: 18px 16px 48px;
    }

    .privacy-page__content {
      padding: 24px 18px 28px;
      border-radius: 20px;
      font-size: 14px;
    }

    .privacy-page__title {
      margin-bottom: 18px;
      font-size: 24px;
    }
  }
</style>
