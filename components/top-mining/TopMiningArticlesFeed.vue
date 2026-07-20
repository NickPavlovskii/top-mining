<template>
  <div class="articles-feed">
    <div
      v-if="pending"
      class="articles-feed__state"
      aria-live="polite"
    >
      Загрузка статей…
    </div>

    <template v-else-if="feed">
      <nuxt-link
        v-if="feed.hero"
        class="articles-feed__hero"
        :to="articlePath(feed.hero.slug)"
      >
        <img
          class="articles-feed__hero-image"
          loading="lazy"
          :src="feed.hero.imageUrl"
          :alt="feed.hero.imageAlt || feed.hero.title"
        />

        <div class="articles-feed__hero-bar">
          <div class="articles-feed__meta">
            <template v-if="formatReadingTime(feed.hero.readingTimeMin)">
              <span class="articles-feed__meta-item">
                <img
                  alt=""
                  aria-hidden="true"
                  class="articles-feed__clock"
                  :src="clockIcon"
                />
                {{ formatReadingTime(feed.hero.readingTimeMin) }}
              </span>
            </template>
            <span class="articles-feed__meta-item">
              {{ formatArticleDate(feed.hero.publishedAt) }}
            </span>
          </div>

          <div class="articles-feed__hero-title-wrap">
            <span
              class="articles-feed__hero-watermark"
              aria-hidden="true"
            >
              {{ heroWatermark(feed.hero.title) }}
            </span>
            <h3 class="articles-feed__hero-title">
              {{ feed.hero.title }}
            </h3>
          </div>

          <img
            class="articles-feed__arrow articles-feed__arrow-icon articles-feed__arrow-icon--md"
            alt=""
            aria-hidden="true"
            :src="articleArrowRight"
          />
        </div>
      </nuxt-link>

      <div
        v-if="feed.featured.length"
        class="articles-feed__featured"
      >
        <top-mining-article-card
          v-for="item in feed.featured"
          :key="item.id"
          :article="item"
          :to="articlePath(item.slug)"
        />
      </div>

      <div
        v-if="feed.list.length"
        class="articles-feed__list"
      >
        <top-mining-article-row
          v-for="item in feed.list"
          :key="item.id"
          :article="item"
          :to="articlePath(item.slug)"
        />
      </div>

      <top-mining-more-link
        v-if="feed.hasMore"
        class="articles-feed__more"
        size="lg"
        :to="articlesIndexPath"
        label="Смотреть ещё"
      />
    </template>
  </div>
</template>

<script setup lang="ts">
  /**
   * Лента статей по выбранной теме с hero-блоком и ссылкой «Все статьи».
   */
  import TopMiningArticleRow from '~/components/global/articles/TopMiningArticleRow.vue'
  import TopMiningMoreLink from '~/components/global/buttons/TopMiningMoreLink.vue'
  import {
    formatArticleDate,
    formatReadingTime,
  } from '~/common/modules/articles'
  import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/articles-section'
  import type { ArticlesFeedResponse } from '~/common/modules/articles'
  import clockIcon from '~/assets/images/articles/clock.png'
  import articleArrowRight from '~/assets/images/articles/arrow-right-24.png'

  const props = defineProps<{
    /** Тема статей: all, tools, investments и др. */
    topic: TopMiningArticlesTopicId
  }>()

  const topic = computed(() => props.topic)

  const { data: feed, pending } = await useFetch<ArticlesFeedResponse>(
    () => `/api/articles?topic=${topic.value}`,
    {
      key: computed(() => `articles-feed-${topic.value}`),
      watch: [topic],
    },
  )

  const articlesIndexPath = computed(() => ({
    path: '/articles',
    query: props.topic === 'all' ? undefined : { topic: props.topic },
  }))

  function articlePath(slug: string) {
    return `/articles/${slug}`
  }

  function heroWatermark(title: string) {
    return title.split(/\s+/).slice(0, 4).join(' ').toUpperCase()
  }
</script>

<style scoped>
  .articles-feed {
    width: 100%;
    max-width: 1720px;
    margin: clamp(32px, 4vw, 56px) auto 0;
    padding-bottom: clamp(40px, 5vw, 72px);
    text-align: left;
    --article-arrow-filter-white: brightness(0) invert(1);
    --article-arrow-filter-orange: brightness(0) saturate(100%) invert(47%)
      sepia(98%) saturate(1450%) hue-rotate(1deg) brightness(101%)
      contrast(104%);
  }

  .articles-feed__state {
    padding: 48px 0;
    color: rgba(255, 255, 255, 0.72);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    text-align: center;
  }

  .articles-feed__hero {
    position: relative;
    display: block;
    overflow: hidden;
    border-radius: clamp(18px, 2vw, 28px);
    text-decoration: none;
    color: inherit;
  }

  .articles-feed__hero:hover .articles-feed__hero-title {
    color: var(--tm-orange);
  }

  .articles-feed__hero:hover .articles-feed__arrow-icon {
    filter: var(--article-arrow-filter-orange);
  }

  .articles-feed__hero-image {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 6.2;
    object-fit: cover;
  }

  .articles-feed__hero-bar {
    position: absolute;
    right: clamp(16px, 2vw, 32px);
    bottom: clamp(16px, 2vw, 32px);
    left: clamp(16px, 2vw, 32px);
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    gap: clamp(16px, 2vw, 24px);
    min-height: clamp(72px, 6.5vw, 112px);
    padding: clamp(16px, 1.6vw, 24px) clamp(20px, 2vw, 32px);
    border-radius: 24px;
    background: rgba(61, 56, 56, 0.25);
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(14px, 1.1vw, 18px);
    font-weight: 400;
    line-height: 1.33;
  }

  .articles-feed__hero-title-wrap {
    position: relative;
    flex: 1 1 auto;
    min-width: 0;
    overflow: hidden;
  }

  .articles-feed__hero-watermark {
    position: absolute;
    top: 50%;
    left: 0;
    z-index: 0;
    max-width: 95%;
    overflow: hidden;
    color: rgba(255, 255, 255, 0.42);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.6vw, 68px);
    font-weight: 600;
    line-height: 1;
    letter-spacing: -0.03em;
    text-transform: uppercase;
    white-space: nowrap;
    pointer-events: none;
    user-select: none;
    filter: blur(9px);
    transform: translateY(-50%);
  }

  .articles-feed__meta {
    display: flex;
    flex-direction: column;
    flex-shrink: 0;
    gap: 6px;
    color: rgba(255, 255, 255, 0.88);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(11px, 1vw, 13px);
    font-weight: 400;
    line-height: 1.2;
  }

  .articles-feed__meta-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .articles-feed__clock {
    flex-shrink: 0;
    display: block;
    width: 16px;
    height: 16px;
    object-fit: contain;
  }

  .articles-feed__hero-title {
    position: relative;
    z-index: 1;
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 28px);
    font-weight: 500;
    line-height: 1.18;
    letter-spacing: -0.02em;
    transition: color 0.2s ease;
  }

  .articles-feed__arrow {
    flex-shrink: 0;
  }

  .articles-feed__arrow-icon {
    display: block;
    object-fit: contain;
    filter: var(--article-arrow-filter-white);
    transition: filter 0.2s ease;
  }

  .articles-feed__arrow-icon--md {
    width: 22px;
    height: 22px;
  }

  .articles-feed__featured {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: clamp(12px, 1.6vw, 20px);
    margin-top: clamp(16px, 2vw, 24px);
  }

  .articles-feed__list {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-top: clamp(20px, 2.4vw, 32px);
  }

  .articles-feed__more {
    margin-top: clamp(20px, 2.4vw, 28px);
  }

  @media (max-width: 1100px) {
    .articles-feed__featured {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 720px) {
    .articles-feed__hero-bar {
      flex-wrap: wrap;
      align-items: flex-start;
      min-height: auto;
    }

    .articles-feed__hero-title-wrap {
      order: 3;
      flex: 1 1 100%;
    }

    .articles-feed__hero-watermark {
      font-size: clamp(22px, 8vw, 36px);
      filter: blur(6px);
    }

    .articles-feed__arrow {
      margin-left: auto;
    }
  }

  @media (max-width: 560px) {
    .articles-feed__featured {
      grid-template-columns: 1fr;
    }
  }
</style>
