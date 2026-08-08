<template>
  <div class="article-sections">
    <section
      v-for="(section, sectionIndex) in sections"
      :id="section.id"
      :key="section.id"
      class="article-sections__section"
    >
      <h2 class="article-sections__heading">
        <template v-if="splitPlaceTitle(section.title)">
          <span class="article-sections__heading-place">
            {{ splitPlaceTitle(section.title)!.place }}
          </span>
          <span class="article-sections__heading-name">
            {{ splitPlaceTitle(section.title)!.name }}
          </span>
        </template>
        <template v-else>
          {{ section.title }}
        </template>
      </h2>

      <template
        v-for="(block, blockIndex) in section.blocks"
        :key="`${section.id}-${blockIndex}`"
      >
        <p
          v-if="block.type === 'paragraph' && block.html"
          class="article-sections__paragraph"
          v-html="block.html"
        />
        <p
          v-else-if="block.type === 'paragraph'"
          class="article-sections__paragraph"
        >
          {{ block.text }}
        </p>

        <ul
          v-else-if="block.type === 'list'"
          class="article-sections__list"
        >
          <li
            v-for="(item, itemIndex) in block.items"
            :key="itemIndex"
          >
            {{ item }}
          </li>
        </ul>

        <ol
          v-else-if="block.type === 'richList' && block.ordered !== false"
          class="article-sections__rich-list"
        >
          <li
            v-for="(item, itemIndex) in block.items"
            :key="itemIndex"
          >
            <strong>{{ itemIndex + 1 }}. {{ item.title }}.</strong>
            {{ item.text }}
          </li>
        </ol>

        <ul
          v-else-if="block.type === 'richList'"
          class="article-sections__rich-list article-sections__rich-list--unordered"
        >
          <li
            v-for="(item, itemIndex) in block.items"
            :key="itemIndex"
          >
            <strong>{{ item.title }}.</strong>
            {{ item.text }}
          </li>
        </ul>

        <figure
          v-else-if="block.type === 'image'"
          class="article-sections__figure"
        >
          <img
            :src="block.src"
            :alt="block.alt"
            class="article-sections__image"
            loading="lazy"
          >
        </figure>

        <div
          v-else-if="block.type === 'stats'"
          class="article-sections__stats"
        >
          <div
            v-for="(row, rowIndex) in block.rows"
            :key="rowIndex"
            class="article-sections__stats-row"
          >
            <div class="article-sections__stats-label">
              {{ row.label }}
            </div>
            <div class="article-sections__stats-value">
              {{ row.value }}
            </div>
          </div>
        </div>

        <div
          v-else-if="block.type === 'prosCons'"
          class="article-sections__pros-cons"
        >
          <div>
            <p class="article-sections__label">
              {{ t('articles.pros') }}
            </p>
            <ul class="article-sections__bullet-list">
              <li
                v-for="(item, itemIndex) in block.pros"
                :key="`pros-${itemIndex}`"
              >
                {{ item }}
              </li>
            </ul>
          </div>
          <div>
            <p class="article-sections__label">
              {{ t('articles.cons') }}
            </p>
            <ul class="article-sections__bullet-list">
              <li
                v-for="(item, itemIndex) in block.cons"
                :key="`cons-${itemIndex}`"
              >
                {{ item }}
              </li>
            </ul>
          </div>
        </div>
      </template>

      <hr
        v-if="sectionIndex < sections.length - 1"
        class="article-sections__divider"
      >
    </section>
  </div>
</template>

<script setup lang="ts">
  import type { ArticleSection } from '~/common/modules/articles'

  const { t } = useT()

  defineProps<{
    sections: ArticleSection[]
  }>()

  function splitPlaceTitle(title: string) {
    const match = title.match(/^(\d+\s*место:\s*)(.+)$/i)
    if (!match) {
      return null
    }

    return {
      place: match[1],
      name: match[2],
    }
  }
</script>

<style scoped>
  .article-sections__section {
    scroll-margin-top: 120px;
  }

  .article-sections__heading {
    margin: 0 0 24px;
    color: #111;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.4vw, 42px);
    font-weight: 700;
    line-height: 1.15;
    letter-spacing: 0.01em;
  }

  .article-sections__heading-place {
    font-weight: 700;
  }

  .article-sections__heading-name {
    font-weight: 800;
  }

  .article-sections__paragraph {
    margin: 0 0 18px;
    color: #1a1a1a;
    font-size: 16px;
    line-height: 1.65;
  }

  .article-sections__paragraph :deep(a) {
    color: #1a5cff;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .article-sections__paragraph :deep(a:hover),
  .article-sections__paragraph :deep(a:focus-visible) {
    color: #0f3fcf;
  }

  .article-sections__paragraph :deep(strong) {
    font-weight: 700;
  }

  .article-sections__paragraph :deep(ul) {
    margin: 0 0 8px;
    padding-left: 1.25em;
    list-style-type: disc;
  }

  .article-sections__paragraph :deep(li) {
    margin-bottom: 8px;
  }

  .article-sections__list {
    margin: 0 0 22px;
    padding-left: 1.25em;
    list-style-type: disc;
    list-style-position: outside;
    color: #1a1a1a;
    font-size: 16px;
    line-height: 1.65;
  }

  .article-sections__list li {
    margin-bottom: 10px;
    display: list-item;
  }

  .article-sections__rich-list {
    margin: 0 0 28px;
    padding: 0;
    list-style: none;
    color: #1a1a1a;
    font-size: 16px;
    line-height: 1.65;
  }

  .article-sections__rich-list li {
    margin-bottom: 18px;
  }

  .article-sections__rich-list strong {
    font-weight: 700;
  }

  .article-sections__figure {
    margin: 8px 0 20px;
  }

  .article-sections__image {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
    border-radius: 28px;
  }

  .article-sections__stats {
    display: grid;
    gap: 10px;
    margin: 0 0 22px;
  }

  .article-sections__stats-row {
    display: grid;
    grid-template-columns: minmax(0, 1.05fr) minmax(0, 1fr);
    gap: 12px;
  }

  .article-sections__stats-label,
  .article-sections__stats-value {
    display: flex;
    align-items: center;
    min-height: 48px;
    padding: 12px 18px;
    border-radius: 14px;
    font-size: 15px;
    line-height: 1.35;
  }

  .article-sections__stats-label {
    background: linear-gradient(
      90deg,
      var(--tm-orange) 0%,
      var(--tm-orange-accent-light) 100%
    );
    color: #fff;
    font-weight: 600;
  }

  .article-sections__stats-value {
    background: #f2f2f2;
    color: #222;
  }

  .article-sections__pros-cons {
    display: grid;
    gap: 18px;
    margin: 0 0 8px;
  }

  .article-sections__label {
    margin: 0 0 8px;
    color: #111;
    font-size: 16px;
    font-weight: 700;
  }

  .article-sections__bullet-list {
    margin: 0;
    padding-left: 1.25em;
    list-style-type: disc;
    list-style-position: outside;
    color: #1a1a1a;
    font-size: 16px;
    line-height: 1.55;
  }

  .article-sections__bullet-list li {
    margin-bottom: 6px;
    display: list-item;
  }

  .article-sections__divider {
    margin: 32px 0;
    border: 0;
    border-top: 1px solid #e8e8e8;
  }

  @media (max-width: 700px) {
    .article-sections__stats-row {
      grid-template-columns: 1fr;
      gap: 8px;
    }

    .article-sections__image {
      border-radius: 20px;
    }
  }
</style>
