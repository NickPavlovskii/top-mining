<template>
  <article class="tm-docs-panel">
    <h1>Использование в Nuxt</h1>
    <p>
      Компоненты из <code>components/global/</code> в шаблонах Nuxt можно писать без
      локального <code>import</code>. Подключение идёт двумя путями сразу.
    </p>

    <h2>Как подключается</h2>
    <ol>
      <li>
        Файлы разложены по папкам:
        <code>buttons/</code>, <code>articles/</code>, <code>labels/</code>,
        <code>pageTitle/</code>, <code>selection-controls/</code>.
      </li>
      <li>
        Nuxt auto-import: в <code>nuxt.config.ts</code> для
        <code>~/components</code> стоит <code>pathPrefix: false</code>, поэтому тег —
        <code>&lt;TopMiningButton /&gt;</code>, а не
        <code>&lt;ButtonsTopMiningButton /&gt;</code>.
      </li>
      <li>
        Плагин <code>plugins/global-components.ts</code> регистрирует набор из
        <code>components/global/index.ts</code> в kebab-case
        (<code>&lt;top-mining-button /&gt;</code>).
      </li>
    </ol>
    <p>
      В плагин входят только компоненты из <code>index.ts</code>. Остальные файлы в
      <code>global/</code> (например <code>VerificationStatusBadge</code>,
      <code>AppNotFoundCloud</code>) доступны через auto-import Nuxt.
    </p>

    <h2>Регистрация (плагин)</h2>
    <pre v-pre><code>// plugins/global-components.ts
import globalComponents from '~/components/global/index'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(globalComponents)
})

// components/global/index.ts (фрагмент)
import type { App } from 'vue'
import TopMiningButton from './buttons/TopMiningButton.vue'

export default {
  install(app: App) {
    app.component('top-mining-button', TopMiningButton)
    // …остальные из списка components
  },
}</code></pre>

    <h2>Примеры в шаблонах</h2>

    <h3>Кнопка CTA</h3>
    <pre v-pre><code>&lt;TopMiningButton
  title="Написать в Telegram"
  variant="primary"
  size="big"
  surface="dark"
  href="https://t.me/example"
  target="_blank"
/&gt;</code></pre>

    <h3>Ссылка «Смотреть ещё»</h3>
    <pre v-pre><code>&lt;TopMiningMoreLink
  to="/articles"
  label="Смотреть ещё"
  size="lg"
/&gt;</code></pre>

    <h3>Карточка статьи</h3>
    <pre v-pre><code>&lt;script setup lang="ts"&gt;
import type { ArticlePreview } from '~/common/modules/articles'

defineProps&lt;{
  article: ArticlePreview
}&gt;()
&lt;/script&gt;

&lt;template&gt;
  &lt;TopMiningArticleCard
    :article="article"
    :to="'/articles/' + article.slug"
    :show-overlay="true"
  /&gt;
&lt;/template&gt;</code></pre>
    <p>
      Props карточки: обязательные <code>article</code> и <code>to</code>, опционально
      <code>showOverlay</code>.
    </p>

    <h3>Логотип в шапке</h3>
    <pre v-pre><code>&lt;TopMiningBrandTitle variant="menu" :spaced="true" /&gt;</code></pre>

    <h2>Props и типы</h2>
    <p>
      Типы props — в <code>&lt;script setup&gt;</code> компонента. Общие типы кнопки/chip —
      в <code>common/modules/top-mining/</code>. В Storybook: раздел
      <code>Global/</code> → Controls и Docs.
    </p>

    <h2>Тестирование</h2>
    <p>
      Unit-тесты: <code>test/unit/components/global/</code>. Фикстура статьи —
      <code>test/fixtures/article-preview.ts</code>.
    </p>
    <pre><code>npm run test:run</code></pre>

    <h2>Storybook</h2>
    <pre><code>npm run storybook</code></pre>
    <p>
      Dev-сервер: <code>http://localhost:6007</code>. Фоны лендинга — панель
      <strong>Backgrounds</strong> (<code>landing-dark</code>, <code>jet</code>,
      <code>off-white</code>).
    </p>
  </article>
</template>
