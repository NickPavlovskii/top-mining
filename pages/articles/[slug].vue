<template>
  <article class="article-page">
    <div
      v-if="showArticleSkeleton"
      class="article-page__skeleton"
      aria-busy="true"
      aria-live="polite"
    >
      <div class="article-page__skeleton-hero" />
      <div class="article-page__skeleton-line article-page__skeleton-line--title" />
      <div class="article-page__skeleton-line" />
      <div class="article-page__skeleton-line article-page__skeleton-line--short" />
      <div class="article-page__skeleton-cover" />
      <div class="article-page__skeleton-line" />
      <div class="article-page__skeleton-line" />
      <div class="article-page__skeleton-line article-page__skeleton-line--short" />
    </div>

    <div
      v-else-if="!article"
      class="article-page__state article-page__state--empty"
    >
      {{ t('articles.empty') }}
    </div>

    <template v-else-if="article">
      <header class="article-page__hero">
        <img
          alt=""
          class="article-page__hero-decor article-page__hero-decor--tl"
          aria-hidden="true"
          :src="headerLogoBlur"
        >
        <img
          alt=""
          class="article-page__hero-decor article-page__hero-decor--br"
          aria-hidden="true"
          :src="headerLogoMark"
        >

        <div class="article-page__hero-inner">
          <nav
            class="article-page__breadcrumbs"
            :aria-label="t('common.breadcrumbsAria')"
            itemscope
            itemtype="https://schema.org/BreadcrumbList"
          >
            <span
              itemprop="itemListElement"
              itemscope
              itemtype="https://schema.org/ListItem"
            >
              <nuxt-link
                class="article-page__breadcrumbs-link"
                to="/"
                itemprop="item"
              >
                <span itemprop="name">{{ t('common.home') }}</span>
              </nuxt-link>
              <meta
                itemprop="position"
                content="1"
              >
            </span>
            <span
              class="article-page__breadcrumbs-sep"
              aria-hidden="true"
            >/</span>
            <span
              itemprop="itemListElement"
              itemscope
              itemtype="https://schema.org/ListItem"
            >
              <nuxt-link
                class="article-page__breadcrumbs-link"
                :to="sectionBreadcrumb.href"
                itemprop="item"
              >
                <span itemprop="name">{{ sectionBreadcrumb.label }}</span>
              </nuxt-link>
              <meta
                itemprop="position"
                content="2"
              >
            </span>
            <span
              class="article-page__breadcrumbs-sep"
              aria-hidden="true"
            >/</span>
            <span
              itemprop="itemListElement"
              itemscope
              itemtype="https://schema.org/ListItem"
            >
              <span
                class="article-page__breadcrumbs-current"
                itemprop="name"
              >
                {{ localizedArticle?.title }}
              </span>
              <meta
                itemprop="position"
                content="3"
              >
            </span>
          </nav>

          <div class="article-page__title-block">
            <h1 class="article-page__title">
              <span class="article-page__title-primary">
                {{ titleParts.primary }}
              </span>
              <span
                v-if="titleParts.secondary"
                class="article-page__title-secondary"
              >
                {{ titleParts.secondary }}
              </span>
            </h1>
            <p
              v-if="showExcerpt"
              class="article-page__subtitle"
            >
              {{ localizedArticle?.excerpt }}
            </p>
          </div>

          <div class="article-page__meta">
            <div
              v-if="readingTimeLabel"
              class="article-page__meta-pill"
            >
              <img
                :src="clockIcon"
                alt=""
                class="article-page__meta-icon"
                aria-hidden="true"
              >
              {{ readingTimeLabel }}
            </div>
            <div class="article-page__meta-pill article-page__meta-pill--date">
              {{ formatArticleDate(localizedArticle?.publishedAt || '') }}
            </div>
            <div
              v-if="viewsLabel"
              class="article-page__meta-pill article-page__meta-pill--views"
            >
              <Icon
                name="mdi:eye-outline"
                class="article-page__meta-icon article-page__meta-icon--eye"
                aria-hidden="true"
              />
              <span class="article-page__meta-views-text">
                {{ t('articles.views') }}<span>{{ viewsLabel }}</span>
              </span>
            </div>
          </div>
        </div>
      </header>

      <div class="article-page__shell">
        <aside class="article-page__col article-page__col--toc">
          <article-table-of-contents
            v-if="tocItems.length"
            :items="tocItems"
            :active-id="activeSectionId"
            :share-title="localizedArticle?.title || ''"
            @navigate="scrollToSection"
          />
        </aside>

        <div class="article-page__col article-page__col--main">
          <p
            class="article-page__watermark"
            aria-hidden="true"
          >
            {{ t('articles.ratingsBanner') }}
          </p>

          <div
            v-if="article.imageUrl && !isContentPending"
            class="article-page__cover"
          >
            <img
              :src="article.imageUrl"
              :alt="localizedArticle?.imageAlt || localizedArticle?.title || ''"
            >
          </div>

          <article-sections
            v-if="structuredSections?.length"
            :sections="structuredSections"
          />

          <div
            v-else-if="isContentPending"
            class="article-page__empty"
          >
            {{ t('articles.empty') }}
          </div>

          <div
            v-else
            class="article-page__content"
          >
            <p
              v-for="(paragraph, index) in contentParagraphs"
              :key="index"
            >
              {{ paragraph }}
            </p>
          </div>

          <div class="article-page__share article-page__share--desktop">
            <article-share-button
              v-if="!isContentPending"
              :label="t('articles.share')"
              size="big"
              :share-title="localizedArticle?.title || ''"
            />
          </div>
        </div>

        <aside class="article-page__col article-page__col--related">
          <article-read-also />
        </aside>
      </div>

      <article-related-ratings />

      <article-scroll-top-button
        class="article-page__scroll-top--desktop"
        :target-id="firstSectionId"
      />

      <div
        v-if="!isContentPending"
        class="article-page__mobile-actions"
      >
        <article-scroll-top-button
          inline
          always-visible
          :target-id="firstSectionId"
        />
        <article-share-button
          class="article-page__mobile-share"
          :label="t('articles.share')"
          size="big"
          :share-title="localizedArticle?.title || ''"
        />
      </div>
    </template>
  </article>
</template>

<script setup lang="ts">
  import {
    articleBlocksToSections,
    buildTocFromPlainContent,
    formatArticleDate,
    readingTimeMinutes,
    isArticleContentPending,
    plainContentToSections,
    recordArticleView,
    sectionsHaveBody,
    sectionsToToc,
    splitArticleTitle,
  } from '~/common/modules/articles'
  import type { ArticleResponse } from '~/common/modules/articles'
  import {
    TOP_MINING_ARTICLES_TOPICS,
    type TopMiningArticlesTopicId,
  } from '~/common/modules/top-mining/layout/articles-section'
  import ArticleTableOfContents from '~/components/articles/ArticleTableOfContents.vue'
  import ArticleReadAlso from '~/components/articles/ArticleReadAlso.vue'
  import ArticleRelatedRatings from '~/components/articles/ArticleRelatedRatings.vue'
  import ArticleScrollTopButton from '~/components/articles/ArticleScrollTopButton.vue'
  import ArticleSections from '~/components/articles/ArticleSections.vue'
  import ArticleShareButton from '~/components/articles/ArticleShareButton.vue'
  import clockIcon from '~/assets/images/articles/clock.png'
  import headerLogoMark from '~/assets/images/articles/header-logo-mark.png'
  import headerLogoBlur from '~/assets/images/articles/header-logo-blur.png'

  const { t } = useT()
  const { localize } = useLocalizedArticle()
  const route = useRoute()
  const slug = computed(() => String(route.params.slug || ''))

  const topicKeys: Record<TopMiningArticlesTopicId, string> = {
    all: 'home.topicAll',
    mining: 'home.topicMining',
    tools: 'home.topicTools',
    investments: 'home.topicInvestments',
    beginners: 'home.topicBeginners',
  }

  const { data: article, pending, error } = await useFetch<ArticleResponse>(
    () => `/api/articles/${slug.value}`,
    {
      watch: [slug],
      ignoreResponseError: true,
    },
  )

  const showArticleSkeleton = computed(() => {
    if (pending.value) {
      return true
    }

    if (!error.value) {
      return false
    }

    const status = Number(
      (error.value as { statusCode?: number; status?: number }).statusCode
      ?? (error.value as { status?: number }).status
      ?? 0,
    )

    return status === 0 || status >= 500
  })

  const localizedArticle = computed(() =>
    article.value ? localize(article.value) : null,
  )

  const titleParts = computed(() =>
    splitArticleTitle(localizedArticle.value?.title || ''),
  )

  const showExcerpt = computed(() => {
    const excerpt = localizedArticle.value?.excerpt?.trim()
    if (!excerpt) {
      return false
    }

    if (titleParts.value.secondary) {
      return false
    }

    return excerpt !== localizedArticle.value?.title
  })

  const readingTimeLabel = computed(() => {
    const n = readingTimeMinutes(localizedArticle.value?.readingTimeMin)
    return n == null ? null : t('articles.minRead', undefined, { n })
  })

  const liveViewCount = ref<number | null>(null)

  const displayedViewCount = computed(() => {
    if (liveViewCount.value != null) {
      return liveViewCount.value
    }
    return article.value?.viewCount ?? null
  })

  const viewsLabel = computed(() => {
    const views = displayedViewCount.value
    if (views == null || views < 0) {
      return null
    }
    return String(views)
  })

  const sectionBreadcrumb = computed(() => {
    const topicId = (article.value?.topicId || 'all') as TopMiningArticlesTopicId

    if (topicId === 'all') {
      return { label: t('articles.title'), href: '/articles/' }
    }

    const topic = TOP_MINING_ARTICLES_TOPICS.find((item) => item.id === topicId)

    return {
      label: topic ? t(topicKeys[topic.id]) : t('articles.title'),
      href: topic ? `/articles/?topic=${topic.id}` : '/articles/',
    }
  })

  const structuredSections = computed(() => {
    const fromBlocks = articleBlocksToSections(article.value?.blocks)
    // Только заголовки без абзацев (как после 018) — берём текст из content.
    if (fromBlocks?.length && sectionsHaveBody(fromBlocks)) {
      return fromBlocks
    }

    return plainContentToSections(article.value?.content)
  })

  const isContentPending = computed(() => {
    if (structuredSections.value?.length) {
      return false
    }
    return isArticleContentPending(article.value?.content)
  })

  async function trackArticleView(targetSlug: string) {
    if (!targetSlug || !article.value || isContentPending.value) {
      return
    }

    const nextCount = await recordArticleView(targetSlug)
    if (nextCount != null && slug.value === targetSlug) {
      liveViewCount.value = nextCount
      if (article.value) {
        article.value.viewCount = nextCount
      }
    }
  }

  watch(slug, () => {
    liveViewCount.value = null
  })

  watch(
    () => [slug.value, article.value?.id, isContentPending.value] as const,
    ([nextSlug, articleId, pendingContent]) => {
      if (!import.meta.client || !nextSlug || !articleId || pendingContent) {
        return
      }
      void trackArticleView(nextSlug)
    },
    { immediate: true },
  )
  const tocItems = computed(() => {
    if (isContentPending.value) {
      return []
    }

    const fromSections = sectionsToToc(structuredSections.value)
    if (fromSections.length) {
      return fromSections
    }

    if (!article.value?.content) {
      return []
    }

    return buildTocFromPlainContent(article.value.content)
  })

  const firstSectionId = computed(() => tocItems.value[0]?.id ?? null)

  const contentParagraphs = computed(() => {
    const content = article.value?.content?.trim()

    if (!content) {
      return []
    }

    return content
      .split(/\n\s*\n/)
      .map((part) => part.trim())
      .filter(Boolean)
  })

  const activeSectionId = ref<string | null>(null)
  let scrollSpyPausedUntil = 0
  let scrollSpyRaf = 0

  function getScrollSpyMarker(): number {
    if (!import.meta.client) {
      return 140
    }

    const page = document.querySelector('.article-page')
    const raw = page
      ? getComputedStyle(page).getPropertyValue('--article-sticky-top').trim()
      : ''
    const stickyTop = Number.parseFloat(raw) || 112
    return stickyTop + 28
  }

  function scrollToSection(id: string) {
    const target = document.getElementById(id)
    if (!target) {
      return
    }

    activeSectionId.value = id
    // Pause while smooth scroll finishes, so highlight doesn't jump mid-way
    scrollSpyPausedUntil = Date.now() + 1000
    target.scrollIntoView({ behavior: 'smooth', block: 'start' })
    history.replaceState(null, '', `#${id}`)
  }

  function updateActiveFromScroll() {
    if (Date.now() < scrollSpyPausedUntil) {
      return
    }

    const items = tocItems.value
    if (!items.length) {
      return
    }

    const marker = getScrollSpyMarker()
    let currentId = items[0]?.id ?? null

    for (const item of items) {
      const element = document.getElementById(item.id)
      if (!element) {
        continue
      }

      // Last section whose top has crossed the sticky header line wins
      if (element.getBoundingClientRect().top <= marker) {
        currentId = item.id
      } else {
        break
      }
    }

    // Near page bottom: force last TOC item active
    const scrollBottom = window.scrollY + window.innerHeight
    const docHeight = document.documentElement.scrollHeight
    if (docHeight - scrollBottom < 48) {
      currentId = items[items.length - 1]?.id ?? currentId
    }

    if (currentId && currentId !== activeSectionId.value) {
      activeSectionId.value = currentId
    }
  }

  function onWindowScroll() {
    if (scrollSpyRaf) {
      return
    }
    scrollSpyRaf = window.requestAnimationFrame(() => {
      scrollSpyRaf = 0
      updateActiveFromScroll()
    })
  }

  onMounted(() => {
    nextTick(() => {
      activeSectionId.value = tocItems.value[0]?.id ?? null
      updateActiveFromScroll()
      window.addEventListener('scroll', onWindowScroll, { passive: true })
      window.addEventListener('resize', onWindowScroll, { passive: true })

      const hash = route.hash.replace(/^#/, '')
      if (hash && document.getElementById(hash)) {
        scrollToSection(hash)
      }
    })
  })

  watch([slug, tocItems], () => {
    nextTick(() => {
      activeSectionId.value = tocItems.value[0]?.id ?? null
      updateActiveFromScroll()
    })
  })

  onBeforeUnmount(() => {
    window.removeEventListener('scroll', onWindowScroll)
    window.removeEventListener('resize', onWindowScroll)
    if (scrollSpyRaf) {
      window.cancelAnimationFrame(scrollSpyRaf)
    }
  })

  useSeoMeta({
    title: () => {
      const localized = article.value ? localize(article.value) : null
      return localized
        ? `${localized.title} ${t('articles.seoSuffix')}`
        : t('articles.seoArticle')
    },
    description: () => {
      const localized = article.value ? localize(article.value) : null
      return (
        localized?.excerpt
        || titleParts.value.secondary
        || localized?.title
        || ''
      )
    },
  })
</script>

<style scoped>
  .article-page {
    --article-sticky-top: 112px;
    padding: 16px 16px 80px;
    background: var(--tm-surface-light, #f3f3f3);
    color: var(--tm-black, #111);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
  }

  .article-page__state {
    padding: 48px 0;
    color: var(--tm-text-soft);
    text-align: center;
  }

  .article-page__skeleton {
    display: grid;
    gap: 14px;
    max-width: 920px;
    margin: 0 auto;
    padding: 24px 0 48px;
  }

  .article-page__skeleton-hero,
  .article-page__skeleton-cover,
  .article-page__skeleton-line {
    border-radius: 16px;
    background: linear-gradient(
      110deg,
      #ececec 0%,
      #ececec 35%,
      #f7f7f7 50%,
      #ececec 65%,
      #ececec 100%
    );
    background-size: 200% 100%;
    animation: article-page-shimmer 1.35s ease-in-out infinite;
  }

  .article-page__skeleton-hero {
    height: 72px;
    border-radius: 20px;
  }

  .article-page__skeleton-cover {
    aspect-ratio: 16 / 9;
    border-radius: 24px;
  }

  .article-page__skeleton-line {
    height: 16px;
  }

  .article-page__skeleton-line--title {
    height: 28px;
    width: 70%;
  }

  .article-page__skeleton-line--short {
    width: 45%;
  }

  @keyframes article-page-shimmer {
    0% {
      background-position: 100% 0;
    }

    100% {
      background-position: -100% 0;
    }
  }

  .article-page__state--empty,
  .article-page__empty {
    margin: 24px 0 8px;
    padding: 40px 24px;
    border-radius: 24px;
    background: #fff;
    color: var(--tm-text-soft);
    font-size: 18px;
    line-height: 1.45;
    text-align: center;
  }

  .article-page__hero {
    position: relative;
    overflow: hidden;
    margin: 0 auto 28px;
    max-width: 1770px;
    min-height: clamp(280px, 42vw, 420px);
    padding: clamp(28px, 4vw, 48px) clamp(18px, 4vw, 56px) clamp(32px, 4vw, 52px);
    border-radius: clamp(28px, 4vw, 48px);
    background: #0f0f0f;
    color: #fff;
  }

  .article-page__hero-decor {
    position: absolute;
    pointer-events: none;
    user-select: none;
    object-fit: contain;
  }

  .article-page__hero-decor--tl {
    top: -18%;
    left: -6%;
    width: min(42vw, 360px);
    opacity: 0.85;
    filter: blur(1px);
    transform: rotate(-8deg);
  }

  .article-page__hero-decor--br {
    right: -4%;
    bottom: -22%;
    width: min(38vw, 320px);
    opacity: 0.95;
    filter: blur(0.5px);
    transform: rotate(12deg);
  }

  .article-page__hero-inner {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    gap: clamp(28px, 5vw, 56px);
    max-width: 1100px;
    margin: 0 auto;
    min-height: inherit;
  }

  .article-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 6px 8px;
    color: rgba(255, 255, 255, 0.78);
    font-size: 14px;
    line-height: 1.35;
  }

  .article-page__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .article-page__breadcrumbs-link:hover,
  .article-page__breadcrumbs-link:focus-visible {
    color: #fff;
  }

  .article-page__breadcrumbs-sep {
    opacity: 0.55;
  }

  .article-page__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.9);
  }

  .article-page__title-block {
    display: grid;
    gap: clamp(12px, 2vw, 18px);
    text-align: center;
    margin-top: auto;
  }

  .article-page__title {
    display: grid;
    gap: 0.12em;
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 500;
    letter-spacing: -0.02em;
  }

  .article-page__title-primary {
    color: var(--tm-orange);
    font-size: clamp(26px, 4.6vw, 52px);
    line-height: 1.12;
    text-transform: uppercase;
  }

  .article-page__title-secondary {
    color: #fff;
    font-size: clamp(18px, 2.8vw, 34px);
    font-weight: 400;
    line-height: 1.25;
  }

  .article-page__subtitle {
    margin: 0;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 2.6vw, 32px);
    font-weight: 400;
    line-height: 1.25;
    letter-spacing: -0.02em;
  }

  .article-page__meta {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px 12px;
    margin-top: auto;
  }

  .article-page__meta-pill {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    min-height: 40px;
    padding: 8px 16px;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.1);
    color: #fff;
    font-size: 14px;
    line-height: 1.2;
    white-space: nowrap;
  }

  .article-page__meta-icon {
    display: block;
    width: 18px;
    height: 18px;
    object-fit: contain;
    flex-shrink: 0;
    filter: brightness(0) saturate(100%) invert(48%) sepia(93%) saturate(2477%)
      hue-rotate(360deg) brightness(102%) contrast(104%);
  }

  .article-page__meta-icon--eye {
    width: 18px;
    height: 18px;
    color: var(--tm-orange);
  }

  .article-page__meta-views-text {
    display: inline-flex;
    gap: 6px;
    align-items: baseline;
  }

  .article-page__meta-views-text span {
    font-weight: 600;
  }

  .article-page__shell {
    display: grid;
    grid-template-columns:
      minmax(200px, 260px)
      minmax(0, 1fr)
      minmax(180px, 240px);
    gap: 24px;
    align-items: start;
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(20px, 3vw, 36px);
    border-radius: clamp(28px, 4vw, 40px);
    background: #fff;
  }

  .article-page__col--toc,
  .article-page__col--related {
    position: sticky;
    top: var(--article-sticky-top);
    z-index: 2;
    align-self: start;
    width: 100%;
    max-height: calc(100dvh - var(--article-sticky-top) - 16px);
    min-height: 0;
    overflow: hidden;
  }

  .article-page__col--main {
    position: relative;
    min-width: 0;
    padding: 8px clamp(52px, 5.5vw, 72px) 24px 8px;
  }

  .article-page__watermark {
    position: absolute;
    top: 0;
    right: clamp(4px, 1vw, 12px);
    bottom: 0;
    z-index: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: clamp(40px, 4.5vw, 56px);
    margin: 0;
    padding: 0;
    overflow: hidden;
    color: #ebebeb;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(30px, 3vw, 48px);
    font-weight: 500;
    letter-spacing: 0.06em;
    line-height: 1;
    text-align: center;
    text-transform: uppercase;
    white-space: nowrap;
    writing-mode: vertical-rl;
    pointer-events: none;
    user-select: none;
  }

  .article-page__col--main > :not(.article-page__watermark) {
    position: relative;
    z-index: 1;
  }

  .article-page__cover {
    overflow: hidden;
    margin-bottom: 28px;
    border-radius: 24px;
  }

  .article-page__cover img {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
  }

  .article-page__content {
    font-size: 16px;
    line-height: 1.62;
  }

  .article-page__content p {
    margin: 0 0 14px;
  }

  .article-page__content p:last-child {
    margin-bottom: 0;
  }

  .article-page__share {
    display: flex;
    justify-content: center;
    margin-top: 36px;
    padding-top: 8px;
  }

  @media (max-width: 1200px) {
    .article-page__shell {
      grid-template-columns: minmax(180px, 220px) minmax(0, 1fr) minmax(160px, 200px);
      gap: 16px;
      padding: 20px;
    }
  }

  .article-page__mobile-actions {
    display: none;
  }

  @media (max-width: 1050px) {
    .article-page {
      padding-bottom: 100px;
    }

    .article-page__hero {
      margin-bottom: 0;
      border-radius: 28px 28px 0 0;
      padding-bottom: 48px;
    }

    .article-page__breadcrumbs {
      display: none;
    }

    .article-page__shell {
      grid-template-columns: 1fr;
      gap: 20px;
      margin-top: -36px;
      padding: 0 12px 18px;
      border-radius: 0;
      background: transparent;
    }

    .article-page__col--toc,
    .article-page__col--related {
      position: static;
      max-height: none;
      overflow: visible;
    }

    .article-page__watermark {
      display: none;
    }

    .article-page__col--toc {
      order: 1;
      z-index: 3;
    }

    .article-page__col--main {
      order: 2;
      padding: 20px 16px 24px;
      border-radius: 24px;
      background: #fff;
    }

    .article-page__col--related {
      order: 3;
    }

    .article-page__share--desktop {
      display: none;
    }

    .article-page__scroll-top--desktop {
      display: none !important;
    }

    .article-page__mobile-actions {
      position: fixed;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 40;
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px 16px calc(12px + env(safe-area-inset-bottom, 0px));
      background: linear-gradient(
        180deg,
        rgba(243, 243, 243, 0) 0%,
        rgba(243, 243, 243, 0.92) 28%,
        #f3f3f3 100%
      );
      pointer-events: none;
    }

    .article-page__mobile-actions > * {
      pointer-events: auto;
    }

    .article-page__mobile-share {
      flex: 1;
      min-width: 0;
    }

    .article-page__mobile-share :deep(.q-btn),
    .article-page__mobile-share :deep(.top-mining-button) {
      width: 100%;
    }
  }

  @media (max-width: 640px) {
    .article-page {
      --article-sticky-top: 88px;
      padding: 10px 10px 100px;
    }

    .article-page__hero {
      min-height: 280px;
      padding: 22px 16px 56px;
      border-radius: 24px 24px 0 0;
    }

    .article-page__hero-inner {
      gap: 24px;
      min-height: auto;
    }

    .article-page__hero-decor--tl {
      width: 58vw;
      top: -12%;
      left: -18%;
    }

    .article-page__hero-decor--br {
      width: 52vw;
      right: -16%;
      bottom: -16%;
    }

    .article-page__meta-pill {
      min-height: 36px;
      padding: 7px 12px;
      font-size: 13px;
    }

    .article-page__shell {
      margin-top: -40px;
      padding: 0 8px 14px;
    }

    .article-page__col--main {
      padding: 16px 12px 20px;
      border-radius: 20px;
    }
  }
</style>
