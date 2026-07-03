<template>
  <article class="tm-docs-panel">
    <h1>Использование в Nuxt</h1>
    <p>
      Компоненты из <code>components/global/</code> регистрируются в
      <code>components/global/index.ts</code> и подключаются в Nuxt как глобальные — импорт в
      страницах не нужен.
    </p>

    <h2>Регистрация</h2>
    <pre v-pre><code>// components/global/index.ts
export { default as TopMiningButton } from './TopMiningButton.vue'
// ...</code></pre>
    <p>
      Nuxt автоматически подхватывает папку <code>components/</code>; префикс
      <code>TopMining</code> сохраняется в имени тега.
    </p>

    <h2>Примеры в шаблонах</h2>

    <h3>Кнопка CTA</h3>
    <pre v-pre><code>&lt;template&gt;
  &lt;TopMiningButton
    title="Написать в Telegram"
    variant="primary"
    size="big"
    surface="dark"
    href="https://t.me/example"
    target="_blank"
  /&gt;
&lt;/template&gt;</code></pre>

    <h3>Ссылка «Смотреть ещё»</h3>
    <pre v-pre><code>&lt;template&gt;
  &lt;TopMiningMoreLink to="/articles" label="Смотреть ещё" size="lg" /&gt;
&lt;/template&gt;</code></pre>

    <h3>Карточка статьи</h3>
    <pre v-pre><code>&lt;script setup lang="ts"&gt;
import type { ArticlePreview } from '~/types/articles'

defineProps&lt;{
  article: ArticlePreview
}&gt;()
&lt;/script&gt;

&lt;template&gt;
  &lt;TopMiningArticleCard
    :article="article"
    :to="\`/articles/${article.slug}\`"
    :show-overlay="true"
  /&gt;
&lt;/template&gt;</code></pre>

    <h3>Логотип в шапке</h3>
    <pre v-pre><code>&lt;template&gt;
  &lt;TopMiningBrandTitle variant="menu" :spaced="true" /&gt;
&lt;/template&gt;</code></pre>

    <h2>Props и типы</h2>
    <p>
      Типы props объявлены в <code>&lt;script setup&gt;</code> каждого компонента. В Storybook
      доступны <strong>Controls</strong> и автогенерируемая страница
      <strong>Документация</strong> для каждого компонента в разделе <code>Global/</code>.
    </p>

    <h2>Тестирование</h2>
    <p>
      Unit-тесты лежат в <code>test/unit/components/global/</code>. Фикстура статьи —
      <code>test/fixtures/article-preview.ts</code>.
    </p>
    <pre><code>npm run test:run</code></pre>

    <h2>Storybook</h2>
    <pre><code>npm run storybook</code></pre>
    <p>
      Откройте <code>http://localhost:6007</code>. Для проверки визуала используйте панель
      <strong>Backgrounds</strong> (фоны лендинга: <code>landing-dark</code>, <code>jet</code>,
      <code>off-white</code>).
    </p>
  </article>
</template>
