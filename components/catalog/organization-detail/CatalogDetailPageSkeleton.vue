<template>
  <div
    class="catalog-detail-skeleton"
    aria-busy="true"
    aria-live="polite"
  >
    <div class="catalog-detail-skeleton__inner">
      <nav
        class="catalog-detail-skeleton__breadcrumbs"
        :aria-label="t('common.breadcrumbsAria')"
      >
        <nuxt-link to="/">
          {{ t('common.home') }}
        </nuxt-link>
        <span aria-hidden="true">/</span>
        <nuxt-link :to="resolvedCatalogHref">
          {{ resolvedCatalogLabel }}
        </nuxt-link>
        <span aria-hidden="true">/</span>
        <span>{{ resolvedCurrentLabel }}</span>
      </nav>

      <header class="catalog-detail-skeleton__hero">
        <div class="catalog-detail-skeleton__hero-text">
          <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--title" />
          <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--title-sub" />
          <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--rating" />
        </div>
        <div class="catalog-detail-skeleton__logo" />
      </header>

      <section class="catalog-detail-skeleton__card">
        <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--card-title" />
        <div class="catalog-detail-skeleton__line" />
        <div class="catalog-detail-skeleton__line" />
        <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--short" />
      </section>

      <div class="catalog-detail-skeleton__layout">
        <div class="catalog-detail-skeleton__main">
          <section
            v-for="card in 3"
            :key="`main-${card}`"
            class="catalog-detail-skeleton__card"
          >
            <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--card-title" />
            <div
              v-for="row in 4"
              :key="`row-${card}-${row}`"
              class="catalog-detail-skeleton__row"
            >
              <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--label" />
              <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--value" />
            </div>
          </section>
        </div>

        <aside class="catalog-detail-skeleton__sidebar">
          <section
            v-for="side in 2"
            :key="`side-${side}`"
            class="catalog-detail-skeleton__card"
          >
            <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--card-title" />
            <div class="catalog-detail-skeleton__line" />
            <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--short" />
            <div class="catalog-detail-skeleton__line catalog-detail-skeleton__line--button" />
          </section>
        </aside>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CATALOG_PAGE_HREF } from '~/common/modules/catalog/nav/links'

  const props = defineProps<{
    catalogHref?: string
    catalogLabel?: string
    currentLabel?: string
  }>()

  const { t } = useT()

  const resolvedCatalogHref = computed(
    () => props.catalogHref ?? CATALOG_PAGE_HREF,
  )
  const resolvedCatalogLabel = computed(
    () => props.catalogLabel ?? t('catalog.title1'),
  )
  const resolvedCurrentLabel = computed(() => props.currentLabel ?? '…')
</script>

<style scoped>
  .catalog-detail-skeleton {
    min-height: 70vh;
    background: #0a0a0a;
    color: #fff;
  }

  .catalog-detail-skeleton__inner {
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(24px, 4vw, 40px) clamp(16px, 4vw, 60px)
      clamp(64px, 10vw, 120px);
  }

  .catalog-detail-skeleton__breadcrumbs {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 8px;
    margin: 0 0 clamp(28px, 4vw, 48px);
    color: rgba(255, 255, 255, 0.45);
    font-size: 14px;
    line-height: 1.4;
  }

  .catalog-detail-skeleton__breadcrumbs a {
    color: rgba(255, 255, 255, 0.55);
    text-decoration: none;
  }

  .catalog-detail-skeleton__breadcrumbs a:hover {
    color: #fff;
  }

  .catalog-detail-skeleton__hero {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(180px, 280px);
    gap: clamp(20px, 4vw, 40px);
    align-items: end;
    margin-bottom: clamp(24px, 4vw, 40px);
  }

  .catalog-detail-skeleton__hero-text {
    display: grid;
    gap: 14px;
  }

  .catalog-detail-skeleton__logo {
    width: 100%;
    aspect-ratio: 3 / 2;
    border-radius: 20px;
    background: linear-gradient(
      110deg,
      #1a1a1a 0%,
      #1a1a1a 35%,
      #2a2a2a 50%,
      #1a1a1a 65%,
      #1a1a1a 100%
    );
    background-size: 200% 100%;
    animation: catalog-detail-shimmer 1.35s ease-in-out infinite;
  }

  .catalog-detail-skeleton__layout {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(260px, 340px);
    gap: clamp(16px, 3vw, 28px);
    margin-top: clamp(16px, 3vw, 28px);
  }

  .catalog-detail-skeleton__main,
  .catalog-detail-skeleton__sidebar {
    display: grid;
    gap: 16px;
    align-content: start;
  }

  .catalog-detail-skeleton__card {
    display: grid;
    gap: 12px;
    padding: clamp(18px, 2.5vw, 28px);
    border-radius: 24px;
    background: #141414;
  }

  .catalog-detail-skeleton__row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 16px;
  }

  .catalog-detail-skeleton__line {
    height: 14px;
    border-radius: 999px;
    background: linear-gradient(
      110deg,
      #222 0%,
      #222 35%,
      #333 50%,
      #222 65%,
      #222 100%
    );
    background-size: 200% 100%;
    animation: catalog-detail-shimmer 1.35s ease-in-out infinite;
  }

  .catalog-detail-skeleton__line--title {
    width: min(520px, 90%);
    height: 42px;
    border-radius: 12px;
  }

  .catalog-detail-skeleton__line--title-sub {
    width: min(280px, 55%);
    height: 28px;
    border-radius: 10px;
  }

  .catalog-detail-skeleton__line--rating {
    width: 120px;
    height: 18px;
  }

  .catalog-detail-skeleton__line--card-title {
    width: min(240px, 50%);
    height: 22px;
    margin-bottom: 4px;
    border-radius: 8px;
  }

  .catalog-detail-skeleton__line--short {
    width: 62%;
  }

  .catalog-detail-skeleton__line--label {
    width: 70%;
  }

  .catalog-detail-skeleton__line--value {
    width: 55%;
    justify-self: end;
  }

  .catalog-detail-skeleton__line--button {
    width: 100%;
    height: 48px;
    margin-top: 8px;
    border-radius: 14px;
  }

  @keyframes catalog-detail-shimmer {
    0% {
      background-position: 100% 0;
    }

    100% {
      background-position: -100% 0;
    }
  }

  @media (max-width: 960px) {
    .catalog-detail-skeleton__hero,
    .catalog-detail-skeleton__layout {
      grid-template-columns: 1fr;
    }

    .catalog-detail-skeleton__logo {
      max-width: 280px;
    }
  }
</style>
