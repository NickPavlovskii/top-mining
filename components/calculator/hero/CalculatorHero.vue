<template>
  <section
    class="calculator-hero"
    aria-labelledby="calculator-hero-title"
  >
    <div class="calculator-hero__inner">
      <nav
        class="calculator-hero__breadcrumbs"
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
            class="calculator-hero__breadcrumbs-link"
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
          class="calculator-hero__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="calculator-hero__breadcrumbs-current"
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

      <div
        class="calculator-hero__brands"
        role="navigation"
        aria-label="Производители ASIC"
      >
        <nuxt-link
          v-for="brand in page.brands"
          :key="brand.id"
          class="calculator-hero__brand"
          :to="brand.href"
          :aria-label="brand.label"
        >
          <img
            class="calculator-hero__brand-logo"
            loading="lazy"
            decoding="async"
            :src="brand.logo"
            :alt="brand.label"
          >
        </nuxt-link>
      </div>

      <div class="calculator-hero__main">
        <h1
          id="calculator-hero-title"
          class="calculator-hero__title"
        >
          <span
            v-for="(line, index) in page.hero.titleLines"
            :key="`${line}-${index}`"
            class="calculator-hero__title-line"
          >
            {{ line }}
          </span>
        </h1>

        <div class="calculator-hero__visual">
          <img
            class="calculator-hero__image"
            :src="page.hero.image"
            :alt="page.hero.imageAlt"
            loading="eager"
            decoding="async"
          >
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator/page'

  const page = CALCULATOR_PAGE
</script>

<style scoped>
  .calculator-hero {
    background: var(--tm-ink);
    color: var(--tm-white);
    padding: 24px 0 48px;
  }

  .calculator-hero__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .calculator-hero__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin: 0 0 28px;
    color: rgba(246, 246, 246, 0.75);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 20px;
  }

  .calculator-hero__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .calculator-hero__breadcrumbs-link:hover,
  .calculator-hero__breadcrumbs-link:focus-visible {
    color: var(--tm-white);
  }

  .calculator-hero__breadcrumbs-current {
    color: var(--tm-white);
  }

  .calculator-hero__breadcrumbs-sep {
    opacity: 0.55;
  }

  .calculator-hero__brands {
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    box-sizing: border-box;
    width: 100%;
    margin: 0 0 48px;
    padding: 18px 28px;
    overflow-x: auto;
    border-radius: 999px;
    background: #fff;
    scrollbar-width: thin;
  }

  .calculator-hero__brand {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    padding: 8px 10px;
    border: 1px solid transparent;
    border-radius: 16px;
    text-decoration: none;
    transition:
      border-color 0.2s ease,
      background-color 0.2s ease;
  }

  .calculator-hero__brand:hover,
  .calculator-hero__brand:focus-visible {
    border-color: #ff741f;
    background: rgba(255, 116, 31, 0.06);
    outline: none;
  }

  .calculator-hero__brand-logo {
    display: block;
    width: auto;
    max-width: 108px;
    height: 28px;
    object-fit: contain;
  }

  .calculator-hero__main {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(240px, 420px);
    gap: 40px;
    align-items: end;
  }

  .calculator-hero__title {
    margin: 0;
    max-width: 720px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(36px, 5.5vw, 72px);
    font-weight: 500;
    line-height: 1.05;
    text-transform: uppercase;
  }

  .calculator-hero__title-line {
    display: block;
  }

  .calculator-hero__visual {
    display: flex;
    justify-content: flex-end;
    align-items: flex-end;
  }

  .calculator-hero__image {
    display: block;
    width: min(100%, 420px);
    height: auto;
    object-fit: contain;
  }

  @media (max-width: 1439px) {
    .calculator-hero__brands {
      margin-bottom: 36px;
      padding: 14px 18px;
    }

    .calculator-hero__brand-logo {
      max-width: 88px;
      height: 24px;
    }

    .calculator-hero__main {
      gap: 28px;
      grid-template-columns: minmax(0, 1fr) minmax(180px, 320px);
    }
  }

  @media (max-width: 899px) {
    .calculator-hero__inner {
      padding: 0 16px;
    }

    .calculator-hero {
      padding-bottom: 32px;
    }

    .calculator-hero__brands {
      gap: 4px;
      margin-bottom: 28px;
      padding: 12px 14px;
      border-radius: 28px;
    }

    .calculator-hero__brand {
      min-height: 36px;
      padding: 6px 8px;
    }

    .calculator-hero__main {
      grid-template-columns: 1fr;
      gap: 24px;
      align-items: start;
    }

    .calculator-hero__visual {
      justify-content: center;
    }

    .calculator-hero__image {
      width: min(100%, 280px);
    }
  }
</style>
