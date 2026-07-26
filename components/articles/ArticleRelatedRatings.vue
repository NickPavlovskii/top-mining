<template>
  <section
    class="article-related-ratings"
    aria-labelledby="article-related-ratings-title"
  >
    <h2
      id="article-related-ratings-title"
      class="article-related-ratings__title"
    >
      Читайте также
    </h2>

    <top-mining-rating-cards-grid
      class="article-related-ratings__grid"
      :cards="cards"
      show-more
    />

    <div class="article-related-ratings__cta-wrap">
      <nuxt-link
        class="article-related-ratings__cta"
        :to="RATINGS_PAGE_HREF"
      >
        Еще рейтинги
        <img
          :src="arrowIcon"
          alt=""
          class="article-related-ratings__cta-icon"
          aria-hidden="true"
        >
      </nuxt-link>
    </div>
  </section>
</template>

<script setup lang="ts">
  import TopMiningRatingCardsGrid from '~/components/rating/TopMiningRatingCardsGrid.vue'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import {
    RATINGS_FALLBACK_HOME_CARDS,
    RATINGS_PAGE_HREF,
    type RatingsResponse,
  } from '~/common/modules/ratings'

  const { data } = await useFetch<RatingsResponse>('/api/ratings/home')

  const cards = computed(
    () => data.value?.cards ?? RATINGS_FALLBACK_HOME_CARDS,
  )
</script>

<style scoped>
  .article-related-ratings {
    max-width: 1770px;
    margin: 28px auto 0;
    padding: clamp(40px, 5vw, 72px) clamp(20px, 4vw, 48px)
      clamp(40px, 5vw, 64px);
    border-radius: clamp(28px, 4vw, 40px);
    background: #1f1f1f;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
  }

  .article-related-ratings__title {
    margin: 0 0 clamp(28px, 4vw, 48px);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4.2vw, 48px);
    font-weight: 500;
    line-height: 1.15;
    letter-spacing: -0.02em;
    text-align: center;
    text-transform: uppercase;
  }

  .article-related-ratings__grid {
    margin: 0 auto;
  }

  .article-related-ratings__cta-wrap {
    display: flex;
    justify-content: center;
    margin-top: clamp(28px, 4vw, 48px);
  }

  .article-related-ratings__cta {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    min-height: 56px;
    padding: 14px 32px;
    border-radius: 999px;
    background: var(--tm-orange);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 15px;
    font-weight: 500;
    line-height: 1.2;
    letter-spacing: 0.02em;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background 0.15s ease,
      transform 0.15s ease;
  }

  .article-related-ratings__cta:hover,
  .article-related-ratings__cta:focus-visible {
    background: var(--tm-orange-hover);
    transform: translateY(-1px);
  }

  .article-related-ratings__cta-icon {
    width: 18px;
    height: 18px;
    object-fit: contain;
    filter: brightness(0) invert(1);
  }

  @media (max-width: 640px) {
    .article-related-ratings {
      margin-top: 20px;
      padding: 28px 14px 32px;
      border-radius: 24px;
    }

    .article-related-ratings__cta {
      width: 100%;
      min-height: 48px;
      font-size: 14px;
    }
  }
</style>
