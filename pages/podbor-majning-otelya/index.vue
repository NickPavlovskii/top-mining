<template>
  <div class="podbor-hotel-page">
    <header class="podbor-hotel-page__hero">
      <div class="podbor-hotel-page__hero-inner">
        <nav
          class="podbor-hotel-page__breadcrumbs"
          aria-label="Хлебные крошки"
          itemscope
          itemtype="https://schema.org/BreadcrumbList"
        >
          <span
            itemprop="itemListElement"
            itemscope
            itemtype="https://schema.org/ListItem"
          >
            <nuxt-link
              class="podbor-hotel-page__breadcrumbs-link"
              to="/"
              itemprop="item"
            >
              <span itemprop="name">Главная</span>
            </nuxt-link>
            <meta
              itemprop="position"
              content="1"
            >
          </span>
          <span
            class="podbor-hotel-page__breadcrumbs-sep"
            aria-hidden="true"
          >/</span>
          <span
            itemprop="itemListElement"
            itemscope
            itemtype="https://schema.org/ListItem"
          >
            <span
              class="podbor-hotel-page__breadcrumbs-current"
              itemprop="name"
            >
              {{ page.breadcrumb }}
            </span>
            <meta
              itemprop="position"
              content="2"
            >
          </span>
        </nav>

        <div class="podbor-hotel-page__intro">
          <h1 class="podbor-hotel-page__title">
            {{ page.title }}
          </h1>
          <p class="podbor-hotel-page__lead">
            {{ page.description }}
            <span class="podbor-hotel-page__lead-accent">
              {{ page.descriptionAccent }}
            </span>
          </p>
        </div>
      </div>
    </header>
  </div>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_PAGE } from '~/common/modules/top-mining/podbor-mining-hotel'

  const page = PODBOR_MINING_HOTEL_PAGE

  useSeoMeta({
    title: 'Подбор майнинг-отеля | ТОП МАЙНИНГ',
    description:
      'Подберем майнинг-отель для размещения ASIC-майнеров на 15% дешевле рынка.',
  })
</script>

<style scoped>
  .podbor-hotel-page {
    background: var(--tm-black);
    color: var(--tm-white);
    min-height: 60vh;
  }

  .podbor-hotel-page__hero {
    width: 100%;
    padding: clamp(28px, 4vw, 48px) clamp(20px, 5vw, 80px) clamp(48px, 8vw, 96px);
  }

  .podbor-hotel-page__hero-inner {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    gap: clamp(40px, 8vw, 88px);
  }

  .podbor-hotel-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 6px 8px;
    color: rgba(255, 255, 255, 0.85);
    font-size: 14px;
    line-height: 1.35;
  }

  .podbor-hotel-page__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .podbor-hotel-page__breadcrumbs-link:hover,
  .podbor-hotel-page__breadcrumbs-link:focus-visible {
    color: var(--tm-white);
  }

  .podbor-hotel-page__breadcrumbs-sep {
    opacity: 0.55;
  }

  .podbor-hotel-page__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.92);
  }

  .podbor-hotel-page__intro {
    display: grid;
    gap: clamp(16px, 2.5vw, 24px);
    max-width: min(1100px, 100%);
  }

  .podbor-hotel-page__title {
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 5.2vw, 56px);
    font-weight: 500;
    line-height: 1.1;
    letter-spacing: -0.02em;
    text-transform: uppercase;
    hyphens: none;
    overflow-wrap: normal;
    word-break: normal;
  }

  .podbor-hotel-page__lead {
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2.2vw, 24px);
    font-weight: 400;
    line-height: 1.35;
    letter-spacing: -0.01em;
  }

  .podbor-hotel-page__lead-accent {
    color: var(--tm-orange);
  }

  @media (max-width: 640px) {
    .podbor-hotel-page__hero {
      padding-inline: 16px;
    }
  }
</style>
