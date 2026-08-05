<template>
  <section
    class="converter-hero"
    aria-labelledby="converter-hero-title"
  >
    <div class="converter-hero__inner">
      <nav
        class="converter-hero__breadcrumbs"
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
            class="converter-hero__breadcrumbs-link"
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
          class="converter-hero__breadcrumbs-sep"
          aria-hidden="true"
        >&gt;</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="converter-hero__breadcrumbs-current"
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

      <h1
        id="converter-hero-title"
        class="converter-hero__title"
      >
        {{ page.hero.titleLead }}
        <span>{{ page.hero.titleAccent }}</span>
      </h1>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/hashrate-converter-page'

  const page = HASHRATE_CONVERTER_PAGE
</script>

<style scoped>
  .converter-hero {
    background: #1f1f1f;
    color: var(--tm-white);
    padding: 24px 0 40px;
  }

  .converter-hero__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .converter-hero__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin: 0 0 40px;
    color: rgba(246, 246, 246, 0.75);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 20px;
  }

  .converter-hero__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .converter-hero__breadcrumbs-link:hover,
  .converter-hero__breadcrumbs-link:focus-visible {
    color: var(--tm-white);
  }

  .converter-hero__breadcrumbs-current {
    color: var(--tm-white);
  }

  .converter-hero__breadcrumbs-sep {
    opacity: 0.55;
  }

  .converter-hero__title {
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(36px, 5.5vw, 72px);
    font-weight: 500;
    line-height: 1.05;
    text-transform: uppercase;
    color: var(--tm-white);
  }

  .converter-hero__title span {
    color: #1f1f1f;
    text-shadow:
      1px 0 0 #757575,
      0 1px 0 #757575,
      -1px 0 0 #757575,
      0 -1px 0 #757575;
  }

  @media (max-width: 1730px) {
    .converter-hero__title span {
      display: block;
      width: 100%;
      margin-top: -22px;
      text-align: right;
    }
  }

  @media (max-width: 899px) {
    .converter-hero__inner {
      padding: 0 16px;
    }

    .converter-hero {
      padding-bottom: 28px;
    }

    .converter-hero__breadcrumbs {
      margin-bottom: 28px;
    }
  }
</style>
