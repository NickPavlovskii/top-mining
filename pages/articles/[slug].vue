<template>
  <article class="article-page">
    <div class="article-page__inner">
      <nav class="article-page__breadcrumbs" aria-label="Хлебные крошки">
        <NuxtLink to="/">Главная</NuxtLink>
        <span aria-hidden="true">/</span>
        <NuxtLink to="/articles">Статьи</NuxtLink>
        <span aria-hidden="true">/</span>
        <span>{{ article?.title }}</span>
      </nav>

      <div v-if="pending" class="article-page__state">
        Загрузка…
      </div>

      <template v-else-if="article">
        <header class="article-page__header">
          <div class="article-page__meta">
            <span
              v-if="formatReadingTime(article.readingTimeMin)"
              class="article-page__meta-item"
            >
              <img
                :src="clockIcon"
                alt=""
                aria-hidden="true"
                class="article-page__clock"
              />
              {{ formatReadingTime(article.readingTimeMin) }}
            </span>
            <span class="article-page__meta-item">
              {{ formatArticleDate(article.publishedAt) }}
            </span>
          </div>

          <h1 class="article-page__title">
            {{ article.title }}
          </h1>

          <p v-if="article.excerpt" class="article-page__excerpt">
            {{ article.excerpt }}
          </p>
        </header>

        <div v-if="article.imageUrl" class="article-page__hero">
          <img
            :src="article.imageUrl"
            :alt="article.imageAlt || article.title"
          />
        </div>

        <div class="article-page__content">
          <p
            v-for="(paragraph, index) in contentParagraphs"
            :key="index"
          >
            {{ paragraph }}
          </p>
        </div>
      </template>
    </div>
  </article>
</template>

<script setup lang="ts">
  import { formatArticleDate, formatReadingTime } from '~/common/modules/articles'
  import type { ArticleResponse } from '~/types/articles'
  import clockIcon from '~/assets/images/articles/clock.png'

  const route = useRoute()
  const slug = computed(() => String(route.params.slug || ''))

  const { data: article, pending, error } = await useFetch<ArticleResponse>(
    () => `/api/articles/${slug.value}`,
    { watch: [slug] },
  )

  watchEffect(() => {
    if (!pending.value && error.value) {
      throw createError({
        statusCode: error.value.statusCode || 404,
        statusMessage: 'Статья не найдена',
      })
    }
  })

  const contentParagraphs = computed(() => {
    const content = article.value?.content?.trim()

    if (!content) {
      return []
    }

    return content.split(/\n\s*\n/).map((part) => part.trim()).filter(Boolean)
  })

  useSeoMeta({
    title: () => (article.value ? `${article.value.title} — ТОП МАЙНИНГ` : 'Статья — ТОП МАЙНИНГ'),
    description: () => article.value?.excerpt || '',
  })
</script>

<style scoped>
  .article-page {
    padding: 28px 24px 80px;
    background: var(--tm-surface-light);
    color: var(--tm-black);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .article-page__inner {
    max-width: 960px;
    margin: 0 auto;
  }

  .article-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin: 0 0 24px;
    color: var(--tm-text-gray);
    font-size: 13px;
    line-height: 1.4;
  }

  .article-page__breadcrumbs a {
    color: var(--tm-text-gray);
    text-decoration: none;
  }

  .article-page__breadcrumbs a:hover,
  .article-page__breadcrumbs a:focus-visible {
    color: var(--tm-orange);
  }

  .article-page__state {
    padding: 48px 0;
    color: var(--tm-text-gray);
    text-align: center;
  }

  .article-page__header {
    margin-bottom: 28px;
  }

  .article-page__meta {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 10px 18px;
    margin-bottom: 16px;
    color: var(--tm-text-gray);
    font-size: 14px;
  }

  .article-page__meta-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .article-page__clock {
    display: block;
    width: 16px;
    height: 16px;
    object-fit: contain;
  }

  .article-page__title {
    margin: 0 0 14px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 44px);
    font-weight: 600;
    line-height: 1.1;
    letter-spacing: -0.03em;
  }

  .article-page__excerpt {
    margin: 0;
    color: var(--tm-text-gray);
    font-size: clamp(15px, 1.8vw, 18px);
    line-height: 1.45;
  }

  .article-page__hero {
    overflow: hidden;
    margin-bottom: 28px;
    border-radius: 24px;
  }

  .article-page__hero img {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
  }

  .article-page__content {
    padding: 36px clamp(20px, 4vw, 40px) 40px;
    border-radius: 28px;
    background: var(--tm-white);
    font-size: 16px;
    line-height: 1.62;
  }

  .article-page__content p {
    margin: 0 0 14px;
  }

  .article-page__content p:last-child {
    margin-bottom: 0;
  }

  @media (max-width: 560px) {
    .article-page {
      padding: 18px 16px 48px;
    }

    .article-page__content {
      padding: 24px 18px 28px;
      border-radius: 20px;
      font-size: 14px;
    }
  }
</style>
