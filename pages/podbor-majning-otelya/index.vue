<template>
  <div class="podbor-hotel-page">
    <div class="podbor-hotel-page__layout">
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

      <h1 class="podbor-hotel-page__title">
        {{ page.titleLead }}
        <span class="podbor-hotel-page__title-tail">
          {{ page.titleMid }}{{ page.titleEnd }}
        </span>
      </h1>

      <podbor-mining-hotel-logos class="podbor-hotel-page__logos" />

      <p class="podbor-hotel-page__lead">
        {{ page.description }}
        <span class="podbor-hotel-page__lead-accent">
          {{ page.descriptionAccent }}
        </span>
      </p>

      <podbor-mining-hotel-offer class="podbor-hotel-page__benefits" />
      <podbor-mining-hotel-lead-form class="podbor-hotel-page__form" />
    </div>

    <podbor-mining-hotel-marquee />

    <podbor-mining-hotel-placement />
    <podbor-mining-hotel-sale />
  </div>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_PAGE } from '~/common/modules/top-mining/podbor-mining-hotel'
  import PodborMiningHotelLeadForm from '~/components/podbor/hero/PodborMiningHotelLeadForm.vue'
  import PodborMiningHotelLogos from '~/components/podbor/hero/PodborMiningHotelLogos.vue'
  import PodborMiningHotelOffer from '~/components/podbor/hero/PodborMiningHotelOffer.vue'
  import PodborMiningHotelPlacement from '~/components/podbor/placement/PodborMiningHotelPlacement.vue'
  import PodborMiningHotelSale from '~/components/podbor/sale/PodborMiningHotelSale.vue'
  import PodborMiningHotelMarquee from '~/components/podbor/shared/PodborMiningHotelMarquee.vue'

  const page = PODBOR_MINING_HOTEL_PAGE

  useSeoMeta({
    title: 'Подбор майнинг-отеля | ТОП МАЙНИНГ',
    description:
      'Подберем майнинг-отель для размещения ASIC-майнеров на 15% дешевле рынка.',
  })
</script>

<style scoped>
  .podbor-hotel-page {
    background: #141414;
    color: var(--tm-white);
    min-height: 60vh;
  }

  .podbor-hotel-page__layout {
    max-width: 1700px;
    margin: 0 auto;
    padding: 48px 40px 80px;
    display: grid;
    grid-template-columns: minmax(0, 1fr) 523px;
    grid-template-areas:
      'crumbs crumbs'
      'title title'
      'lead lead'
      'benefits logos'
      'form logos';
    column-gap: 40px;
    row-gap: 0;
    align-items: start;
  }

  .podbor-hotel-page__breadcrumbs {
    grid-area: crumbs;
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

  .podbor-hotel-page__title {
    grid-area: title;
    margin: 40px 0 24px;
    max-width: none;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(40px, 4.2vw, 78px);
    font-weight: 500;
    line-height: 1.08;
    text-transform: uppercase;
  }

  .podbor-hotel-page__title-tail {
    white-space: nowrap;
  }

  .podbor-hotel-page__lead {
    grid-area: lead;
    margin: 0 0 32px;
    max-width: none;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 1.6vw, 28px);
    font-weight: 400;
    line-height: 1.25;
  }

  .podbor-hotel-page__lead-accent {
    color: var(--tm-orange);
  }

  .podbor-hotel-page__benefits {
    grid-area: benefits;
    min-width: 0;
    margin-bottom: 20px;
  }

  .podbor-hotel-page__form {
    grid-area: form;
    min-width: 0;
  }

  .podbor-hotel-page__logos {
    grid-area: logos;
    min-width: 0;
    width: 100%;
    max-width: 523px;
    justify-self: end;
    align-self: center;
  }

  @media (max-width: 1600px) {
    .podbor-hotel-page__layout {
      max-width: 1320px;
      padding: 40px 32px 72px;
      column-gap: 32px;
    }

    .podbor-hotel-page__title {
      margin: 32px 0 20px;
      font-size: clamp(36px, 4vw, 64px);
    }
  }

  /*
   * <1300: заголовок | логотипы,
   * лид на всю ширину, преимущества | форма
   */
  @media (max-width: 1299px) {
    .podbor-hotel-page__layout {
      max-width: 1200px;
      padding: 32px 24px 56px;
      grid-template-columns: minmax(0, 1fr) minmax(240px, 420px);
      grid-template-areas:
        'crumbs crumbs'
        'title logos'
        'lead lead'
        'benefits form';
      column-gap: 24px;
      row-gap: 0;
      align-items: start;
    }

    .podbor-hotel-page__title {
      margin: 24px 0 16px;
      max-width: 355px;
      font-size: 40px;
      line-height: 48px;
      align-self: center;
    }

    .podbor-hotel-page__title-tail {
      white-space: nowrap;
    }

    .podbor-hotel-page__logos {
      max-width: 420px;
      align-self: center;
      justify-self: end;
      margin: 24px 0 16px;
    }

    .podbor-hotel-page__lead {
      margin: 0 0 28px;
      font-size: 20px;
      line-height: 28px;
    }

    .podbor-hotel-page__benefits {
      margin-bottom: 0;
      align-self: stretch;
    }

    .podbor-hotel-page__form {
      align-self: stretch;
    }
  }

  @media (max-width: 900px) {
    .podbor-hotel-page__layout {
      grid-template-columns: 1fr;
      grid-template-areas:
        'crumbs'
        'title'
        'logos'
        'lead'
        'benefits'
        'form';
      row-gap: 16px;
      padding: 24px 16px 48px;
    }

    .podbor-hotel-page__title {
      max-width: 100%;
      margin: 8px 0 0;
      font-size: 32px;
      line-height: 1.15;
      align-self: start;
    }

    .podbor-hotel-page__title-tail {
      white-space: normal;
    }

    .podbor-hotel-page__logos {
      margin: 0;
      max-width: 360px;
      justify-self: start;
    }

    .podbor-hotel-page__lead {
      margin: 0;
      font-size: 18px;
      line-height: 1.3;
    }
  }

  @media (max-width: 767px) {
    .podbor-hotel-page__title {
      font-size: 28px;
      line-height: 32px;
    }

    .podbor-hotel-page__lead {
      font-size: 16px;
      line-height: 20px;
      max-width: 330px;
    }

    .podbor-hotel-page__logos {
      max-width: 293px;
    }
  }
</style>
