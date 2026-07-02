<template>
  <article class="tm-docs-panel">
    <h1>Глобальные компоненты Top Mining</h1>
    <p>
      Переиспользуемые UI-компоненты лендинга <strong>ТОП-МАЙНИНГ</strong>. Регистрируются
      глобально через <code>components/global/index.ts</code> и доступны в любом шаблоне Nuxt
      без импорта.
    </p>

    <h2>Быстрый старт</h2>
    <pre v-pre><code>npm run storybook      # http://localhost:6007
npm run build-storybook
npm run test:run       # unit-тесты компонентов</code></pre>
    <blockquote>
      Открывайте Storybook <strong>только</strong> по адресу из терминала
      (<code>http://localhost:6007</code>). Вкладка Storybook в Nuxt DevTools и папка
      <code>storybook-static/</code> — не dev-сервер.
    </blockquote>

    <h2>Каталог компонентов</h2>
    <table>
      <thead>
        <tr>
          <th>Компонент</th>
          <th>Тег</th>
          <th>Назначение</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>TopMiningButton</code></td>
          <td><code>top-mining-button</code></td>
          <td>CTA-кнопки: primary / secondary / tertiary, light / dark</td>
        </tr>
        <tr>
          <td><code>TopMiningMoreLink</code></td>
          <td><code>top-mining-more-link</code></td>
          <td>Ссылка «Ещё категории» / «Смотреть ещё» с оранжевой стрелкой</td>
        </tr>
        <tr>
          <td><code>TopMiningArticleCard</code></td>
          <td><code>top-mining-article-card</code></td>
          <td>Карточка статьи для grid-сетки</td>
        </tr>
        <tr>
          <td><code>TopMiningArticleRow</code></td>
          <td><code>top-mining-article-row</code></td>
          <td>Строка статьи для list-режима</td>
        </tr>
        <tr>
          <td><code>TopMiningRoundIconButton</code></td>
          <td><code>top-mining-round-icon-button</code></td>
          <td>Круглая иконка-кнопка (Iconify)</td>
        </tr>
        <tr>
          <td><code>TopMiningBrandTitle</code></td>
          <td><code>top-mining-brand-title</code></td>
          <td>Текстовый логотип «ТОП-МАЙНИНГ»</td>
        </tr>
      </tbody>
    </table>

    <h2>Разделы документации</h2>
    <ul>
      <li><strong>Дизайн-токены</strong> — палитра с цветовыми образцами и CSS-переменные</li>
      <li><strong>Использование в Nuxt</strong> — примеры в шаблонах, props и типы</li>
      <li><strong>Global/</strong> — интерактивные stories с Controls и автогенерируемой документацией</li>
    </ul>

    <h2>Дизайн-система</h2>
    <p>
      Компоненты опираются на токены <code>--tm-*</code> (алиасы к базовым переменным). Основной
      акцент — оранжевый <code>#ff6418</code>, тёмные поверхности —
      <code>#141414</code> / <code>#151515</code>, шрифт заголовков — <strong>Unbounded</strong>.
    </p>
  </article>
</template>
