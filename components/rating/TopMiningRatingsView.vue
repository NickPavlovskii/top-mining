<template>
  <div
    class="ratings-page"
    :style="{ '--rating-surface': TOP_MINING_RATING_SURFACE }"
  >
    <div class="ratings-page__inner">
      <UBreadcrumb
        aria-label="Хлебные крошки"
        class="ratings-page__breadcrumbs"
        :items="breadcrumbItems"
      >
        <template #separator>
          <span
            class="ratings-page__breadcrumb-separator"
            aria-hidden="true"
          >/</span>
        </template>
      </UBreadcrumb>

      <header class="ratings-page__hero">
        <h1 class="ratings-page__title-sr">
          Рейтинги в майнинге
        </h1>
        <video
          class="ratings-page__hero-video"
          autoplay
          loop
          muted
          playsinline
          disablePictureInPicture
          preload="auto"
          aria-hidden="true"
          :src="TOP_MINING_RATING_VIDEO"
        />
      </header>

      <div class="ratings-page__grid">
        <article
          v-for="card in visibleCards"
          :id="`rating-${card.id}`"
          :key="card.id"
          :class="[
            'ratings-card',
            { 'ratings-card--highlighted': activeCategoryId === card.id },
          ]"
        >
          <h2 class="ratings-card__title">
            {{ card.title }}
          </h2>

          <ul class="ratings-card__list">
            <li
              v-for="item in card.items"
              :key="item.number"
            >
              <top-mining-rating-marquee-link
                :number="item.number"
                :label="item.label"
                :href="item.href"
              />
            </li>
          </ul>
        </article>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import type { BreadcrumbItem } from '@nuxt/ui'
  import {
    TOP_MINING_RATING_CARDS,
    TOP_MINING_RATING_SURFACE,
    TOP_MINING_RATING_VIDEO,
  } from '~/constants/top-mining/ratings'
  import TopMiningRatingMarqueeLink from '~/components/rating/TopMiningRatingMarqueeLink.vue'

  const route = useRoute()

  const activeCategoryId = computed(() => {
    const category = String(route.query.category || '')

    if (TOP_MINING_RATING_CARDS.some((card) => card.id === category)) {
      return category
    }

    return null
  })

  const visibleCards = computed(() => {
    if (!activeCategoryId.value) {
      return TOP_MINING_RATING_CARDS
    }

    return TOP_MINING_RATING_CARDS.filter(
      (card) => card.id === activeCategoryId.value,
    )
  })

  const breadcrumbItems: BreadcrumbItem[] = [
    { label: 'Главная', to: '/' },
    { label: 'Рейтинги в майнинге' },
  ]

  useHead({
    title: 'Рейтинги в майнинге — ТОП МАЙНИНГ',
  })

  onMounted(() => {
    if (!activeCategoryId.value || import.meta.server) {
      return
    }

    nextTick(() => {
      document
        .getElementById(`rating-${activeCategoryId.value}`)
        ?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    })
  })
</script>

<style scoped>
  .ratings-page {
    --rating-surface: var(--tm-rating-surface);
    --rating-card-bg: var(--tm-card-bg);

    width: 100%;
    background: var(--rating-surface);
    color: #fff;
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .ratings-page__inner {
    width: 100%;
    max-width: 1720px;
    margin: 0 auto;
    padding: clamp(28px, 4vw, 48px) clamp(20px, 4vw, 60px)
      clamp(72px, 8vw, 120px);
    box-sizing: border-box;
  }

  .ratings-page__breadcrumbs {
    margin-bottom: clamp(20px, 3vw, 32px);
  }

  .ratings-page__breadcrumbs :deep(a) {
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    text-decoration: none;
    transition: color 0.18s ease;
  }

  .ratings-page__breadcrumbs :deep(span) {
    color: rgba(255, 255, 255, 0.88);
    font-size: 14px;
  }

  .ratings-page__breadcrumb-separator {
    color: rgba(255, 255, 255, 0.35);
  }

  @media (hover: hover) {
    .ratings-page__breadcrumbs :deep(a:hover),
    .ratings-page__breadcrumbs :deep(a:focus-visible) {
      color: #fff;
    }
  }

  .ratings-page__hero {
    display: flex;
    justify-content: center;
    margin: 0 0 clamp(36px, 5vw, 64px);
    overflow: hidden;
  }

  .ratings-page__title-sr {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  .ratings-page__hero-video {
    display: block;
    width: min(100%, 720px);
    max-width: 72%;
    height: auto;
    margin: 0 auto;
    pointer-events: none;
    user-select: none;
  }

  .ratings-page__grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: clamp(20px, 2.5vw, 32px);
    align-items: stretch;
    overflow: visible;
  }

  .ratings-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 40px;
    width: 100%;
    min-height: 100%;
    padding: 40px 0;
    border: 1px solid #1c1c1c;
    border-radius: 32px;
    background: var(--rating-card-bg);
    overflow: visible;
    scroll-margin-top: 120px;
    box-sizing: border-box;
  }

  .ratings-card--highlighted {
    border-color: rgba(255, 100, 24, 0.45);
    box-shadow: 0 0 0 1px rgba(255, 100, 24, 0.12);
  }

  .ratings-card__title {
    margin: 0;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.2vw, 30px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.03em;
    text-align: center;
  }

  .ratings-card__list {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
    width: 100%;
    margin: 0;
    padding: 0;
    list-style: none;
    color: #757575;
    font-size: 20px;
    font-weight: 400;
    line-height: 34px;
  }

  .ratings-card__list > li {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    min-height: 48px;
    text-align: center;
    cursor: pointer;
  }

  @media (max-width: 900px) {
    .ratings-card__list {
      gap: 16px;
      font-size: 18px;
      line-height: 30px;
    }

    .ratings-card__list > li {
      min-height: 44px;
    }
  }

  @media (max-width: 560px) {
    .ratings-card__list {
      gap: 14px;
      font-size: 16px;
      line-height: 26px;
    }

    .ratings-card__list > li {
      min-height: 40px;
    }
  }

  @media (max-width: 900px) {
    .ratings-card {
      gap: 32px;
      padding: 32px 0;
      border-radius: 28px;
    }
  }

  @media (max-width: 560px) {
    .ratings-page__inner {
      padding-inline: 16px;
    }

    .ratings-page__hero-video {
      width: min(100%, 420px);
      max-width: 100%;
    }

    .ratings-card {
      gap: 28px;
      padding: 28px 0;
      border-radius: 24px;
    }

    .ratings-card__title {
      font-size: 20px;
    }
  }
</style>
