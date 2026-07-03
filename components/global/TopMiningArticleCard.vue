<template>
  <NuxtLink
    class="top-mining-article-card"
    :to="to"
  >
    <div class="top-mining-article-card__media">
      <img
        class="top-mining-article-card__image"
        loading="lazy"
        :src="article.imageUrl"
        :alt="article.imageAlt || article.title"
      />

      <div
        v-if="showOverlay"
        class="top-mining-article-card__overlay"
      >
        <span>{{ overlayTitle }}</span>
      </div>
    </div>

    <div class="top-mining-article-card__body">
      <div class="top-mining-article-card__meta">
        <span
          v-if="readingTimeLabel"
          class="top-mining-article-card__meta-item"
        >
          <img
            alt=""
            aria-hidden="true"
            class="top-mining-article-card__clock"
            :src="clockIcon"
          />
          {{ readingTimeLabel }}
        </span>
        <span class="top-mining-article-card__meta-item">
          {{ publishedLabel }}
        </span>
      </div>

      <p class="top-mining-article-card__text">
        {{ displayText }}
      </p>
    </div>
  </NuxtLink>
</template>

<script setup lang="ts">
  import {
    formatArticleDate,
    formatReadingTime,
  } from '~/common/modules/articles'
  import type { ArticlePreview } from '~/types/articles'
  import clockIcon from '~/assets/images/articles/clock.png'

  const props = withDefaults(
    defineProps<{
      article: ArticlePreview
      to: string
      showOverlay?: boolean
    }>(),
    {
      showOverlay: false,
    },
  )

  const readingTimeLabel = computed(() =>
    formatReadingTime(props.article.readingTimeMin),
  )

  const publishedLabel = computed(() =>
    formatArticleDate(props.article.publishedAt),
  )

  const displayText = computed(
    () => props.article.excerpt || props.article.title,
  )

  const overlayTitle = computed(() => {
    const title = props.article.title

    return title.length > 72 ? `${title.slice(0, 72)}…` : title
  })
</script>

<style scoped>
  .top-mining-article-card {
    display: flex;
    flex-direction: column;
    min-width: 0;
    text-decoration: none;
    color: inherit;
  }

  .top-mining-article-card:hover .top-mining-article-card__text {
    color: var(--tm-orange);
  }

  .top-mining-article-card__media {
    position: relative;
    overflow: hidden;
    border-radius: clamp(14px, 1.4vw, 20px);
  }

  .top-mining-article-card__image {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 10;
    object-fit: cover;
    transition: transform 0.35s ease;
  }

  .top-mining-article-card:hover .top-mining-article-card__image {
    transform: scale(1.03);
  }

  .top-mining-article-card__overlay {
    position: absolute;
    right: 12px;
    bottom: 12px;
    left: 12px;
    padding: 12px 14px;
    border-radius: 16px;
    background: rgba(61, 56, 56, 0.25);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(11px, 1vw, 13px);
    font-weight: 600;
    line-height: 1.25;
    letter-spacing: -0.01em;
    text-transform: uppercase;
  }

  .top-mining-article-card__body {
    padding-top: 12px;
  }

  .top-mining-article-card__meta {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 10px 14px;
    margin-bottom: 10px;
    color: rgba(255, 255, 255, 0.86);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(11px, 1vw, 13px);
    font-weight: 400;
    line-height: 1.2;
  }

  .top-mining-article-card__meta-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .top-mining-article-card__clock {
    flex-shrink: 0;
    display: block;
    width: 16px;
    height: 16px;
    object-fit: contain;
  }

  .top-mining-article-card__text {
    margin: 0;
    color: rgba(255, 255, 255, 0.86);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(12px, 1.05vw, 14px);
    font-weight: 400;
    line-height: 1.38;
    letter-spacing: -0.01em;
    transition: color 0.2s ease;
  }
</style>
