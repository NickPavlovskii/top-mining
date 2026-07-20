<template>
  <nuxt-link
    class="top-mining-article-row-link"
    :to="to"
  >
    <span class="top-mining-article-row">
      <span class="top-mining-article-row__meta">
        <span
          v-if="readingTimeLabel"
          class="top-mining-article-row__meta-item"
        >
          <img
            alt=""
            aria-hidden="true"
            class="top-mining-article-row__clock"
            :src="clockIcon"
          />
          {{ readingTimeLabel }}
        </span>
        <span class="top-mining-article-row__meta-item">
          {{ publishedLabel }}
        </span>
      </span>

      <h2
        v-if="titleTag === 'h2'"
        class="top-mining-article-row__title"
      >
        {{ article.title }}
      </h2>
      <h3
        v-else
        class="top-mining-article-row__title"
      >
        {{ article.title }}
      </h3>
      <img
        alt=""
        aria-hidden="true"
        class="top-mining-article-row__arrow"
        :src="articleArrowRight"
      />
    </span>
  </nuxt-link>
</template>

<script setup lang="ts">
  import {
    formatArticleDate,
    formatReadingTime,
  } from '~/common/modules/articles'
  import type { ArticlePreview } from '~/common/modules/articles'
  import articleArrowRight from '~/assets/images/articles/arrow-right-24.png'
  import clockIcon from '~/assets/images/articles/clock.png'

  /**
   * Строка превью статьи в компактном горизонтальном формате.
   *
   * @param {Object} article - данные статьи для отображения
   * @param {String} to - URL страницы статьи
   * @param {String} [titleTag = 'h3'] - HTML-тег заголовка: h2 или h3
   */
  const props = withDefaults(
    defineProps<{
      article: ArticlePreview
      to: string
      titleTag?: 'h2' | 'h3'
    }>(),
    {
      titleTag: 'h3',
    },
  )

  const readingTimeLabel = computed(() =>
    formatReadingTime(props.article.readingTimeMin),
  )

  const publishedLabel = computed(() =>
    formatArticleDate(props.article.publishedAt),
  )
</script>

<style scoped>
  .top-mining-article-row-link {
    display: block;
    color: inherit;
    text-decoration: none;
  }

  .top-mining-article-row {
    --article-arrow-filter-white: brightness(0) invert(1);
    --article-arrow-filter-orange: brightness(0) saturate(100%) invert(47%)
      sepia(98%) saturate(1450%) hue-rotate(1deg) brightness(101%)
      contrast(104%);

    display: grid;
    grid-template-columns: minmax(110px, 150px) minmax(0, 1fr) 40px;
    align-items: center;
    gap: clamp(12px, 2vw, 24px);
    min-height: 72px;
    padding: clamp(14px, 1.6vw, 18px) clamp(16px, 2vw, 24px);
    border-radius: clamp(14px, 1.4vw, 18px);
    background: rgba(255, 255, 255, 0.06);
    transition: background-color 0.2s ease;
  }

  .top-mining-article-row-link:hover .top-mining-article-row,
  .top-mining-article-row-link:focus-visible .top-mining-article-row {
    background: rgba(255, 255, 255, 0.1);
  }

  .top-mining-article-row-link:hover .top-mining-article-row__arrow,
  .top-mining-article-row-link:focus-visible .top-mining-article-row__arrow {
    filter: var(--article-arrow-filter-orange);
  }

  .top-mining-article-row-link:hover .top-mining-article-row__title,
  .top-mining-article-row-link:focus-visible .top-mining-article-row__title {
    color: var(--tm-orange);
  }

  .top-mining-article-row__meta {
    display: flex;
    flex-direction: column;
    gap: 6px;
    color: rgba(255, 255, 255, 0.82);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(11px, 1vw, 13px);
    line-height: 1.2;
  }

  .top-mining-article-row__meta-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .top-mining-article-row__clock {
    flex-shrink: 0;
    display: block;
    width: 16px;
    height: 16px;
    object-fit: contain;
  }

  .top-mining-article-row__title {
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(13px, 1.2vw, 16px);
    font-weight: 400;
    line-height: 1.32;
    letter-spacing: -0.01em;
    transition: color 0.2s ease;
  }

  .top-mining-article-row__arrow {
    justify-self: end;
    display: block;
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    object-fit: contain;
    filter: var(--article-arrow-filter-white);
    transition: filter 0.2s ease;
  }

  @media (max-width: 720px) {
    .top-mining-article-row {
      grid-template-columns: 1fr auto;
      grid-template-areas:
        'meta arrow'
        'title title';
    }

    .top-mining-article-row__meta {
      grid-area: meta;
    }

    .top-mining-article-row__title {
      grid-area: title;
    }

    .top-mining-article-row__arrow {
      grid-area: arrow;
    }
  }
</style>
