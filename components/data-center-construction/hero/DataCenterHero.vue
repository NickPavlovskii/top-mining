<template>
  <section class="data-center-hero">
    <div class="data-center-hero__inner">
      <nav
        class="data-center-hero__breadcrumbs"
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
            class="data-center-hero__breadcrumbs-link"
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
          class="data-center-hero__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <nuxt-link
            class="data-center-hero__breadcrumbs-link"
            to="/consulting/"
            itemprop="item"
          >
            <span itemprop="name">Consulting</span>
          </nuxt-link>
          <meta
            itemprop="position"
            content="2"
          >
        </span>
        <span
          class="data-center-hero__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="data-center-hero__breadcrumbs-current"
            itemprop="name"
          >
            {{ page.breadcrumb }}
          </span>
          <meta
            itemprop="position"
            content="3"
          >
        </span>
      </nav>

      <div class="data-center-hero__grid">
        <div class="data-center-hero__content">
          <h1 class="data-center-hero__title">
            {{ hero.title }}
            <span>{{ hero.titleAccent }}</span>
          </h1>

          <p class="data-center-hero__subtitle">
            {{ hero.subtitle }}
          </p>
          <p class="data-center-hero__text">
            {{ hero.text }}
          </p>

          <div class="data-center-hero__cards">
            <div class="data-center-hero__card data-center-hero__card--accent">
              <span class="data-center-hero__card-label">{{ hero.investmentLabel }}</span>
              <div class="data-center-hero__card-value">
                {{ hero.investmentValue }}
              </div>
            </div>

            <div class="data-center-hero__card">
              <span class="data-center-hero__card-label">{{ hero.paybackLabel }}</span>
              <div class="data-center-hero__card-value">
                {{ hero.paybackValue }}
              </div>
              <top-mining-button
                class="data-center-hero__card-cta"
                preset="contact-pill"
                variant="primary"
                size="big"
                surface="dark"
                :title="hero.ctaLabel"
                :href="hero.ctaHref"
                :append-icon="arrowIcon"
              />
            </div>

            <top-mining-button
              class="data-center-hero__mobile-cta"
              preset="contact-pill"
              variant="primary"
              size="big"
              surface="dark"
              :title="hero.ctaLabel"
              :href="hero.ctaHref"
              :append-icon="arrowIcon"
            />
          </div>
        </div>

        <div class="data-center-hero__media">
          <img
            class="data-center-hero__image"
            loading="eager"
            decoding="async"
            :src="hero.image"
            :alt="hero.imageAlt"
          >
        </div>
      </div>

      <p class="data-center-hero__info">
        <span
          class="data-center-hero__info-icon"
          aria-hidden="true"
        >i</span>
        {{ hero.info }}
      </p>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const page = DATA_CENTER_CONSTRUCTION_PAGE
  const hero = page.hero
</script>

<style scoped>
  .data-center-hero {
    background: var(--tm-ink);
    color: var(--tm-white);
    padding: 32px 0 48px;
  }

  .data-center-hero__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-hero__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin-bottom: 40px;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 20px;
    color: #757575;
  }

  .data-center-hero__breadcrumbs-link {
    color: #f6f6f6;
    text-decoration: none;
  }

  .data-center-hero__breadcrumbs-link:hover {
    color: var(--tm-orange);
  }

  .data-center-hero__breadcrumbs-current {
    color: #757575;
  }

  .data-center-hero__breadcrumbs-sep {
    color: #757575;
  }

  .data-center-hero__grid {
    display: grid;
    grid-template-columns: minmax(0, 1.15fr) minmax(280px, 0.85fr);
    gap: clamp(24px, 4vw, 56px);
    align-items: center;
  }

  .data-center-hero__title {
    margin: 0 0 28px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 56px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .data-center-hero__title span {
    display: block;
    margin-top: 10px;
    color: #ff741f;
  }

  .data-center-hero__subtitle {
    margin: 0 0 12px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.6vw, 22px);
    font-weight: 500;
    line-height: 1.3;
    text-transform: uppercase;
  }

  .data-center-hero__text {
    margin: 0 0 32px;
    max-width: 640px;
    color: rgba(246, 246, 246, 0.78);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
  }

  .data-center-hero__cards {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
    align-items: stretch;
  }

  .data-center-hero__card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    width: min(100%, 320px);
    min-height: 188px;
    padding: 20px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 20px;
    background: transparent;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-hero__card--accent {
    position: relative;
    overflow: hidden;
    border: none;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    color: #fff;
  }

  .data-center-hero__card--accent::before {
    position: absolute;
    right: 16px;
    bottom: 0;
    content: '₽';
    width: 88px;
    height: 120px;
    color: rgba(247, 247, 247, 0.2);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 146px;
    font-weight: 700;
    line-height: 1;
    pointer-events: none;
  }

  .data-center-hero__card-label {
    position: relative;
    z-index: 1;
  }

  .data-center-hero__card-value {
    position: relative;
    z-index: 1;
    margin-top: auto;
    padding-top: 24px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(24px, 2.4vw, 32px);
    font-weight: 500;
    line-height: 1.2;
  }

  .data-center-hero__card
    .data-center-hero__card-cta.top-mining-button.q-btn.top-mining-button--contact-pill {
    width: 100%;
    max-width: 100%;
    margin-top: 20px;
  }

  .data-center-hero__mobile-cta {
    display: none;
  }

  .data-center-hero__media {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .data-center-hero__image {
    display: block;
    width: min(100%, 560px);
    height: auto;
    object-fit: contain;
  }

  .data-center-hero__info {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    box-sizing: border-box;
    margin: 40px 0 0;
    padding: 18px 22px;
    border-radius: 20px;
    background: #1f1f1f;
    color: rgba(246, 246, 246, 0.86);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-hero__info-icon {
    flex: 0 0 auto;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: rgba(255, 116, 31, 0.18);
    color: #ff741f;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
  }

  @media (max-width: 1099px) {
    .data-center-hero__grid {
      grid-template-columns: 1fr;
    }

    .data-center-hero__media {
      order: -1;
    }

    .data-center-hero__image {
      width: min(100%, 420px);
    }
  }

  @media (max-width: 767px) {
    .data-center-hero {
      padding: 20px 0 32px;
    }

    .data-center-hero__inner {
      padding: 0 16px;
    }

    .data-center-hero__breadcrumbs {
      margin-bottom: 24px;
      font-size: 12px;
    }

    .data-center-hero__text {
      font-size: 15px;
      line-height: 22px;
    }

    .data-center-hero__card {
      width: 100%;
      min-height: 140px;
    }

    .data-center-hero__card .data-center-hero__card-cta {
      display: none;
    }

    .data-center-hero__mobile-cta {
      display: inline-flex;
      width: 100%;
      max-width: 100%;
    }

    .data-center-hero
      .data-center-hero__mobile-cta.top-mining-button.q-btn.top-mining-button--contact-pill {
      width: 100%;
      max-width: 100%;
    }

    .data-center-hero__info {
      margin-top: 24px;
      padding: 14px 16px;
      font-size: 14px;
      line-height: 20px;
    }
  }
</style>
