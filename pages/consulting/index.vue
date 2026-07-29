<template>
  <div class="consulting-page top-consulting-page">
    <div class="consulting-page__inner">
      <nav
        class="consulting-page__breadcrumbs"
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
            class="consulting-page__breadcrumbs-link"
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
          class="consulting-page__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span
          itemprop="itemListElement"
          itemscope
          itemtype="https://schema.org/ListItem"
        >
          <span
            class="consulting-page__breadcrumbs-current"
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

      <h1 class="consulting-page__title">
        <span class="consulting-page__title-lead">{{ page.titleLead }}</span>{{ page.titleMid }}
        <div class="consulting-page__title-rest">
          {{ page.titleRest }}
        </div>
      </h1>

      <div
        class="bg-top-wrap"
        :style="{ backgroundImage: `url(${page.heroBanner})` }"
      >
        <div class="left-top">
          {{ page.heroLead }}
        </div>
        <div class="top-right">
          <div class="text-top">
            {{ page.heroStatLead }}
          </div>
          <div class="text-number">
            {{ page.heroStatValue }}
          </div>
          <div class="text-top text-top-b">
            {{ page.heroStatTail }}
          </div>
        </div>
      </div>

      <div class="i-wrap">
        <p
          v-for="(paragraph, index) in page.intro.paragraphs"
          :key="`intro-${index}`"
        >
          {{ paragraph.before }}<b>{{ paragraph.bold }}</b>
        </p>
        <p class="bg-grey">
          {{ page.intro.highlight }}
        </p>
      </div>
    </div>

    <consulting-enter-mining />
    <consulting-why-us />
    <consulting-companies-banner />
    <consulting-soprovod />
    <consulting-management />
    <consulting-black-ring />
    <consulting-best-speaker />
  </div>
</template>

<script setup lang="ts">
  import { CONSULTING_PAGE } from '~/common/modules/top-mining/consulting-page'
  import ConsultingBestSpeaker from '~/components/consulting/ConsultingBestSpeaker.vue'
  import ConsultingBlackRing from '~/components/consulting/ConsultingBlackRing.vue'
  import ConsultingCompaniesBanner from '~/components/consulting/ConsultingCompaniesBanner.vue'
  import ConsultingEnterMining from '~/components/consulting/ConsultingEnterMining.vue'
  import ConsultingManagement from '~/components/consulting/ConsultingManagement.vue'
  import ConsultingSoprovod from '~/components/consulting/ConsultingSoprovod.vue'
  import ConsultingWhyUs from '~/components/consulting/ConsultingWhyUs.vue'

  const page = CONSULTING_PAGE

  useSeoMeta({
    title: page.seoTitle,
    description: page.seoDescription,
  })
</script>

<style scoped>
  .consulting-page {
    padding: 64px 0 0;
    background: var(--tm-page-bg);
    color: var(--tm-white);
    backdrop-filter: blur(200px);
    border-radius: 64px 64px 0 0;
    min-height: 60vh;
  }

  .consulting-page__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px 48px;
  }

  .consulting-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 6px 8px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    line-height: 1.35;
  }

  .consulting-page__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .consulting-page__breadcrumbs-link:hover,
  .consulting-page__breadcrumbs-link:focus-visible {
    color: var(--tm-off-white);
  }

  .consulting-page__breadcrumbs-sep {
    opacity: 0.55;
  }

  .consulting-page__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.72);
  }

  .consulting-page__title {
    margin: 56px 0 64px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 57px;
    font-weight: 500;
    line-height: 58px;
    text-align: left;
    text-transform: uppercase;
  }

  .consulting-page__title-lead {
    font-size: 120px;
    font-weight: 500;
    line-height: 120px;
  }

  .consulting-page__title-rest {
    font-size: 63px;
    font-weight: 500;
    line-height: 58px;
    letter-spacing: 0.6px;
  }

  .bg-top-wrap {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 446px;
    margin-bottom: 20px;
    border-radius: 64px;
    background-color: #1f1f1f;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    overflow: hidden;
  }

  .bg-top-wrap .left-top {
    max-width: 830px;
    padding-left: 80px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 64px;
    font-weight: 500;
    line-height: 64px;
    text-align: left;
  }

  .bg-top-wrap .top-right {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 446px;
    height: 100%;
    border-radius: 64px;
    background: #1f1f1f;
    backdrop-filter: blur(40px);
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 40px;
    font-weight: 600;
    line-height: 34px;
    text-align: left;
  }

  .bg-top-wrap .top-right .text-top {
    margin-bottom: 10px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 1;
  }

  .bg-top-wrap .top-right .text-top-b {
    text-align: right;
  }

  .bg-top-wrap .top-right .text-number {
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 140px;
    font-weight: 500;
    line-height: 140px;
    text-align: left;
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
  }

  .i-wrap {
    position: relative;
    z-index: 2;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
    padding: 164px 80px 80px;
    border-radius: 64px;
    background: #1f1f1f;
    text-align: center;
  }

  .i-wrap::before {
    content: 'i';
    position: absolute;
    top: 80px;
    left: calc(50% - 10px);
    width: 20px;
    height: 64px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 64px;
    font-weight: 700;
    line-height: 1;
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
  }

  .i-wrap p {
    margin: 0;
    padding: 0;
    color: var(--tm-off-white);
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .i-wrap p b {
    font-weight: 700;
  }

  .i-wrap .bg-grey {
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding: 20px;
    border-radius: 30px;
    background: #262626;
  }

  @media (max-width: 1600px) {
    .consulting-page__inner {
      max-width: 1320px;
      padding: 0 32px;
    }

    .consulting-page__title {
      font-size: 44px;
      line-height: 64px;
    }

    .consulting-page__title-lead {
      font-size: 96px;
      line-height: 103.68px;
    }

    .consulting-page__title-rest {
      font-size: 49px;
      line-height: 64px;
      letter-spacing: 1px;
    }

    .bg-top-wrap .left-top {
      max-width: 600px;
      padding-left: 64px;
      font-size: 48px;
      line-height: 64px;
    }
  }

  @media (max-width: 1299px) {
    .consulting-page {
      padding: 48px 0 120px;
      border-radius: 32px 32px 0 0;
    }

    .consulting-page__inner {
      padding: 0 24px;
    }

    .consulting-page__title {
      margin: 32px 0 40px;
      font-size: 25px;
      font-weight: 400;
      line-height: 30px;
    }

    .consulting-page__title-lead {
      font-size: 48px;
      line-height: 64px;
    }

    .consulting-page__title-rest {
      font-size: 25px;
      font-weight: 500;
      line-height: 32.24px;
      letter-spacing: 0;
    }

    .bg-top-wrap {
      height: 144px;
      margin-bottom: 20px;
      border-radius: 32px;
    }

    .bg-top-wrap .left-top {
      max-width: 270px;
      padding-left: 20px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .bg-top-wrap .top-right {
      width: 154px;
      border-radius: 32px;
      font-size: 14px;
      font-weight: 400;
      line-height: 20px;
    }

    .bg-top-wrap .top-right .text-top {
      margin-bottom: 10px;
      font-size: 14px;
    }

    .bg-top-wrap .top-right .text-number {
      font-size: 48px;
      line-height: 64px;
    }

    .i-wrap {
      gap: 10px;
      margin-top: 16px;
      padding: 60px 10px 20px;
      border-radius: 32px;
    }

    .i-wrap::before {
      top: 20px;
      height: 30px;
      font-size: 24px;
      font-weight: 500;
      line-height: 29.76px;
    }

    .i-wrap p {
      font-size: 14px;
      line-height: 20px;
    }

    .i-wrap .bg-grey {
      padding: 10px;
      border-radius: 24px;
      font-size: 14px;
      line-height: 24px;
    }
  }

  @media (max-width: 767px) {
    .consulting-page {
      padding: 32px 0 90px;
      border-radius: 24px 24px 0 0;
    }

    .consulting-page__inner {
      padding: 0 16px;
    }

    .consulting-page__title {
      margin: 0 0 20px;
    }

    .bg-top-wrap {
      border-radius: 24px;
    }

    .bg-top-wrap .top-right {
      border-radius: 24px;
    }

    .i-wrap {
      border-radius: 24px;
    }

    .i-wrap .bg-grey {
      border-radius: 24px;
    }
  }
</style>
