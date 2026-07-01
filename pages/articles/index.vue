<template>
  <div class="articles-page">
    <div class="articles-page__inner">
      <UBreadcrumb
        aria-label="Хлебные крошки"
        class="articles-page__breadcrumbs"
        :items="breadcrumbItems"
      >
        <template #separator>
          <span class="articles-page__breadcrumb-separator" aria-hidden="true">/</span>
        </template>
      </UBreadcrumb>

      <header class="articles-page__header">
        <h1 class="articles-page__title">
          <span class="articles-page__title-line">{{ TOP_MINING_ARTICLES_SECTION.titleLine1 }}</span>
          <span class="articles-page__title-line articles-page__title-line--accent">
            {{ TOP_MINING_ARTICLES_SECTION.titleLine2 }}
          </span>
        </h1>

        <p class="articles-page__subtitle">
          {{ TOP_MINING_ARTICLES_SECTION.subtitle }}
        </p>
      </header>

      <div
        class="articles-page__topics"
        role="tablist"
        aria-label="Темы статей"
      >
        <NuxtLink
          v-for="topic in TOP_MINING_ARTICLES_TOPICS"
          :key="topic.id"
          :to="topicLink(topic.id)"
          role="tab"
          :class="['articles-page__topic', { 'articles-page__topic--active': activeTopic === topic.id }]"
          :aria-selected="activeTopic === topic.id"
        >
          {{ topic.label }}
        </NuxtLink>
      </div>

      <div class="articles-page__toolbar">
        <div
          class="articles-page__view-toggle"
          role="group"
          aria-label="Вид списка статей"
        >
          <button
            type="button"
            :class="['articles-page__view-btn', { 'articles-page__view-btn--active': viewMode === 'grid' }]"
            aria-label="Сетка"
            :aria-pressed="viewMode === 'grid'"
            @click="setViewMode('grid')"
          >
            <img
              :src="viewGridIcon"
              alt=""
              aria-hidden="true"
              :class="['articles-page__view-icon', { 'articles-page__view-icon--active': viewMode === 'grid' }]"
            />
          </button>
          <button
            type="button"
            :class="['articles-page__view-btn', { 'articles-page__view-btn--active': viewMode === 'list' }]"
            aria-label="Список"
            :aria-pressed="viewMode === 'list'"
            @click="setViewMode('list')"
          >
            <img
              :src="viewListIcon"
              alt=""
              aria-hidden="true"
              :class="['articles-page__view-icon', { 'articles-page__view-icon--active': viewMode === 'list' }]"
            />
          </button>
        </div>
      </div>

      <div v-if="pending" class="articles-page__state">
        Загрузка…
      </div>

      <template v-else-if="paginatedArticles.length">
        <div
          v-if="viewMode === 'grid'"
          class="articles-page__grid"
        >
          <top-mining-article-card
            v-for="item in paginatedArticles"
            :key="item.id"
            :article="item"
            :to="`/articles/${item.slug}`"
            show-overlay
          />
        </div>

        <div
          v-else
          class="articles-page__list"
        >
          <top-mining-article-row
            v-for="item in paginatedArticles"
            :key="item.id"
            :article="item"
            :to="`/articles/${item.slug}`"
            title-tag="h2"
          />
        </div>

        <footer
          v-if="totalPages > 1"
          class="articles-page__pagination"
        >
          <NuxtLink
            v-if="currentPage < totalPages"
            :to="pageLink(currentPage + 1)"
            class="articles-page__next-page"
          >
            <span>Следующая страница</span>
            <img
              :src="articleArrowRight"
              alt=""
              aria-hidden="true"
              class="articles-page__next-page-arrow articles-page__arrow-icon articles-page__arrow-icon--sm"
            />
          </NuxtLink>

          <div class="articles-page__pagination-controls">
            <span class="articles-page__page-indicator">
              {{ currentPage }} из {{ totalPages }}
            </span>

            <div class="articles-page__page-nav">
              <NuxtLink
                :to="pageLink(currentPage - 1)"
                :class="['articles-page__page-btn', { 'articles-page__page-btn--disabled': currentPage <= 1 }]"
                aria-label="Предыдущая страница"
                @click="preventDisabledNav($event, currentPage <= 1)"
              >
                <img
                  :src="chevronLeft"
                  alt=""
                  aria-hidden="true"
                  class="articles-page__chevron-icon"
                />
              </NuxtLink>

              <NuxtLink
                :to="pageLink(currentPage + 1)"
                :class="[
                  'articles-page__page-btn',
                  'articles-page__page-btn--next',
                  { 'articles-page__page-btn--disabled': currentPage >= totalPages },
                ]"
                aria-label="Следующая страница"
                @click="preventDisabledNav($event, currentPage >= totalPages)"
              >
                <img
                  :src="chevronRight"
                  alt=""
                  aria-hidden="true"
                  class="articles-page__chevron-icon"
                />
              </NuxtLink>
            </div>
          </div>
        </footer>
      </template>
    </div>
  </div>
</template>

<script setup lang="ts">
  import TopMiningArticleRow from '~/components/global/TopMiningArticleRow.vue'
  import {
    TOP_MINING_ARTICLES_SECTION,
    TOP_MINING_ARTICLES_TOPICS,
    type TopMiningArticlesTopicId,
  } from '~/common/modules/top-mining/articles-section'
  import type { BreadcrumbItem } from '@nuxt/ui'
  import type { ArticlePreview, ArticlesFeedResponse } from '~/types/articles'
  import articleArrowRight from '~/assets/images/articles/arrow-right-24.png'
  import chevronLeft from '~/assets/images/articles/chevron-left.png'
  import chevronRight from '~/assets/images/articles/chevron-right.png'
  import viewGridIcon from '~/assets/images/articles/view-grid.png'
  import viewListIcon from '~/assets/images/articles/view-list.png'

  type ArticlesViewMode = 'grid' | 'list'

  const route = useRoute()
  const router = useRouter()

  const activeTopic = computed<TopMiningArticlesTopicId>(() => {
    const topic = String(route.query.topic || 'all')

    if (TOP_MINING_ARTICLES_TOPICS.some((item) => item.id === topic)) {
      return topic as TopMiningArticlesTopicId
    }

    return 'all'
  })

  const viewMode = computed<ArticlesViewMode>(() => (
    route.query.view === 'list' ? 'list' : 'grid'
  ))

  const currentPage = computed(() => {
    const page = Number(route.query.page || 1)
    return Number.isFinite(page) && page > 0 ? Math.floor(page) : 1
  })

  const perPage = computed(() => (viewMode.value === 'grid' ? 12 : 8))

  const breadcrumbItems: BreadcrumbItem[] = [
    { label: 'Главная', to: '/' },
    { label: 'Статьи' },
  ]

  const { data: feed, pending } = await useFetch<ArticlesFeedResponse>(
    () => `/api/articles?topic=${activeTopic.value}`,
    {
      key: computed(() => `articles-index-${activeTopic.value}`),
      watch: [activeTopic],
    },
  )

  const allArticles = computed<ArticlePreview[]>(() => {
    if (!feed.value) {
      return []
    }

    const items: ArticlePreview[] = []

    if (feed.value.hero) {
      items.push(feed.value.hero)
    }

    items.push(...feed.value.featured, ...feed.value.list)

    const seen = new Set<number>()

    return items.filter((item) => {
      if (seen.has(item.id)) {
        return false
      }

      seen.add(item.id)
      return true
    })
  })

  const totalPages = computed(() => (
    Math.max(1, Math.ceil(allArticles.value.length / perPage.value))
  ))

  const safeCurrentPage = computed(() => (
    Math.min(currentPage.value, totalPages.value)
  ))

  const paginatedArticles = computed(() => {
    const start = (safeCurrentPage.value - 1) * perPage.value
    return allArticles.value.slice(start, start + perPage.value)
  })

  watch([totalPages, currentPage], () => {
    if (currentPage.value > totalPages.value && totalPages.value > 0) {
      router.replace(pageLink(totalPages.value))
    }
  })

  function topicLink(topicId: TopMiningArticlesTopicId) {
    return {
      path: '/articles',
      query: buildQuery({ topic: topicId, page: 1 }),
    }
  }

  function pageLink(page: number) {
    const nextPage = Math.min(Math.max(1, page), totalPages.value)
    return {
      path: '/articles',
      query: buildQuery({ page: nextPage }),
    }
  }

  function buildQuery(overrides: { topic?: TopMiningArticlesTopicId; page?: number; view?: ArticlesViewMode }) {
    const query: Record<string, string> = {}

    const topic = overrides.topic !== undefined
      ? (overrides.topic === 'all' ? undefined : overrides.topic)
      : (activeTopic.value === 'all' ? undefined : activeTopic.value)

    const page = overrides.page !== undefined
      ? overrides.page
      : currentPage.value

    const view = overrides.view !== undefined
      ? overrides.view
      : viewMode.value

    if (topic) {
      query.topic = topic
    }

    if (page > 1) {
      query.page = String(page)
    }

    if (view !== 'grid') {
      query.view = view
    }

    return query
  }

  function setViewMode(mode: ArticlesViewMode) {
    router.push({
      path: '/articles',
      query: buildQuery({ view: mode, page: 1 }),
    })
  }

  function preventDisabledNav(event: MouseEvent, disabled: boolean) {
    if (disabled) {
      event.preventDefault()
    }
  }

  useSeoMeta({
    title: 'Статьи — ТОП МАЙНИНГ',
    description: TOP_MINING_ARTICLES_SECTION.subtitle,
  })
</script>

<style scoped>
  .articles-page {
    min-height: 100vh;
    padding: clamp(24px, 3vw, 40px) clamp(16px, 4vw, 60px) clamp(64px, 8vw, 120px);
    background:
      linear-gradient(90deg, rgba(255, 255, 255, 0.02) 0, rgba(255, 255, 255, 0.02) 1px, transparent 1px, transparent 80px),
      #141414;
    background-size: 80px 100%, auto;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    --article-arrow-filter-white: brightness(0) invert(1);
    --article-arrow-filter-orange: brightness(0) saturate(100%) invert(47%) sepia(98%)
      saturate(1450%) hue-rotate(1deg) brightness(101%) contrast(104%);
    --article-arrow-filter-dark: brightness(0);
  }

  .articles-page__inner {
    max-width: 1720px;
    margin: 0 auto;
  }

  .articles-page__breadcrumbs {
    margin: 20px 0 clamp(30px, 4vw, 50px);
    color: rgba(255, 255, 255, 0.72);
    font-size: 14px;
    line-height: 1.4;
  }

  .articles-page__breadcrumbs :deep(a) {
    color: rgba(255, 255, 255, 0.72);
    text-decoration: none;
    transition: color 0.2s ease;
  }

  .articles-page__breadcrumbs :deep(a:hover),
  .articles-page__breadcrumbs :deep(a:focus-visible) {
    color: var(--tm-orange);
  }

  .articles-page__breadcrumbs :deep([data-slot="item"]:last-child) {
    color: rgba(255, 255, 255, 0.72);
  }

  .articles-page__breadcrumbs :deep([data-slot="separator"]) {
    display: inline-flex;
    align-items: center;
  }

  .articles-page__breadcrumb-separator {
    margin: 0 8px;
    color: rgba(255, 255, 255, 0.72);
  }

  .articles-page__header {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    gap: clamp(24px, 4vw, 64px);
    margin-bottom: clamp(28px, 4vw, 44px);
  }

  .articles-page__title {
    display: flex;
    flex-direction: column;
    gap: 0;
    margin: 0;
    font-size: clamp(40px, 7vw, 120px);
    font-weight: 600;
    line-height: 1;
    letter-spacing: -0.03em;
    text-transform: uppercase;
  }

  .articles-page__title-line {
    display: block;
  }

  .articles-page__title-line--accent {
    color: var(--tm-orange);
  }

  .articles-page__subtitle {
    flex-shrink: 0;
    width: min(100%, 371px);
    margin: 0;
    color: rgba(255, 255, 255, 0.88);
    font-size: clamp(14px, 1.1vw, 18px);
    font-weight: 400;
    line-height: 1.36;
    letter-spacing: -0.02em;
    text-align: right;
  }

  .articles-page__topics {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: clamp(24px, 3vw, 36px);
  }

  .articles-page__topic {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    padding: 10px 18px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.92);
    font-size: clamp(12px, 1.1vw, 14px);
    font-weight: 400;
    line-height: 1.2;
    text-decoration: none;
    white-space: nowrap;
    transition:
      background-color 0.2s ease,
      border-color 0.2s ease,
      color 0.2s ease;
  }

  .articles-page__topic:hover:not(.articles-page__topic--active) {
    border-color: rgba(255, 255, 255, 0.34);
  }

  .articles-page__topic--active {
    border-color: transparent;
    background: var(--tm-orange-accent-gradient-horizontal);
    color: var(--jet-color);
  }

  .articles-page__toolbar {
    display: flex;
    justify-content: flex-end;
    margin-bottom: clamp(20px, 2.4vw, 28px);
  }

  .articles-page__view-toggle {
    display: inline-flex;
    align-items: center;
    gap: 10px;
  }

  .articles-page__view-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    border: 0;
    background: transparent;
    cursor: pointer;
  }

  .articles-page__view-icon {
    display: block;
    width: 22px;
    height: 22px;
    object-fit: contain;
    opacity: 0.45;
    transition: opacity 0.2s ease;
  }

  .articles-page__view-icon--active {
    opacity: 1;
  }

  .articles-page__state {
    padding: 64px 0;
    color: rgba(255, 255, 255, 0.72);
    text-align: center;
  }

  .articles-page__grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: clamp(12px, 1.6vw, 20px);
  }

  .articles-page__list {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .articles-page__arrow-icon {
    display: block;
    object-fit: contain;
    flex-shrink: 0;
    filter: var(--article-arrow-filter-white);
    transition: filter 0.2s ease;
  }

  .articles-page__arrow-icon--sm {
    width: 16px;
    height: 16px;
  }

  .articles-page__pagination {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    margin-top: clamp(32px, 4vw, 48px);
  }

  .articles-page__next-page {
    display: inline-flex;
    align-items: center;
    gap: 14px;
    min-height: 56px;
    padding: 0 clamp(24px, 3vw, 40px);
    border-radius: 999px;
    background: var(--tm-orange-accent-gradient-horizontal);
    color: var(--jet-color);
    font-size: clamp(13px, 1.2vw, 16px);
    font-weight: 600;
    letter-spacing: 0.04em;
    text-decoration: none;
    text-transform: uppercase;
    transition: transform 0.2s ease, background 0.2s ease;
  }

  .articles-page__next-page:hover {
    background: var(--tm-orange);
    transform: translateY(-1px);
  }

  .articles-page__next-page .articles-page__arrow-icon {
    filter: var(--article-arrow-filter-dark);
  }

  .articles-page__next-page-arrow {
    flex-shrink: 0;
  }

  .articles-page__pagination-controls {
    display: flex;
    align-items: center;
    gap: 18px;
  }

  .articles-page__page-indicator {
    color: rgba(255, 255, 255, 0.72);
    font-size: 14px;
    white-space: nowrap;
  }

  .articles-page__page-nav {
    display: inline-flex;
    gap: 8px;
  }

  .articles-page__page-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 44px;
    height: 44px;
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 12px;
    background: rgba(255, 255, 255, 0.04);
    color: var(--tm-white);
    font-size: 18px;
    text-decoration: none;
    transition:
      background-color 0.2s ease,
      border-color 0.2s ease;
  }

  .articles-page__page-btn--next:not(.articles-page__page-btn--disabled) {
    border-color: transparent;
    background: var(--tm-orange);
    color: var(--jet-color);
  }

  .articles-page__page-btn--next:not(.articles-page__page-btn--disabled) .articles-page__chevron-icon {
    filter: var(--article-arrow-filter-dark);
  }

  .articles-page__chevron-icon {
    display: block;
    width: 15px;
    height: 26px;
    object-fit: contain;
    filter: var(--article-arrow-filter-white);
  }

  .articles-page__page-btn--disabled {
    opacity: 0.35;
    pointer-events: none;
  }

  @media (max-width: 1100px) {
    .articles-page__grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 900px) {
    .articles-page__header {
      flex-direction: column;
      align-items: flex-start;
    }

    .articles-page__subtitle {
      width: 100%;
      margin: clamp(12px, 2.4vw, 20px) 0 0;
      text-align: left;
    }

    .articles-page__pagination {
      flex-direction: column;
      align-items: stretch;
    }

    .articles-page__pagination-controls {
      justify-content: space-between;
    }
  }

  @media (max-width: 560px) {
    .articles-page__grid {
      grid-template-columns: 1fr;
    }

    .articles-page__topics {
      flex-wrap: nowrap;
      overflow-x: auto;
      padding-bottom: 4px;
      scrollbar-width: none;
    }

    .articles-page__topics::-webkit-scrollbar {
      display: none;
    }
  }
</style>
