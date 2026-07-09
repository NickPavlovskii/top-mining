<template>
  <section
    class="rating-section"
    aria-labelledby="rating-section-title"
  >
    <video
      class="rating-section__video"
      autoplay
      loop
      muted
      playsinline
      disablePictureInPicture
      preload="auto"
      aria-hidden="true"
      :src="TOP_MINING_RATING_VIDEO"
    />

    <h2 id="rating-section-title" class="rating-section__title-sr">
      Рейтинг в майнинге
    </h2>

    <top-mining-rating-cards-grid
      class="rating-section__grid"
      :cards="homeCards"
    />
  </section>
</template>

<script setup lang="ts">
  import TopMiningRatingCardsGrid from '~/components/rating/TopMiningRatingCardsGrid.vue'
  import { RATINGS_FALLBACK_HOME_CARDS } from '~/common/modules/ratings/fallback'
  import { TOP_MINING_RATING_VIDEO } from '~/common/modules/ratings/content'
  import type { RatingsResponse } from '~/types/ratings'

  const { data } = await useFetch<RatingsResponse>('/api/ratings/home')

  const homeCards = computed(
    () => data.value?.cards ?? RATINGS_FALLBACK_HOME_CARDS,
  )
</script>
<style scoped>
  .rating-section {
    background: #1f1f1f;
    padding: 114px 96px 267px;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
  }

  .rating-section__title-sr {
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

  .rating-section__video {
    display: flex;
    width: 100%;
    max-width: 721px;
    max-height: 225px;
    margin: -50px auto 0;
    pointer-events: none;
    user-select: none;
  }

  .rating-section__grid {
    margin-top: 144px;
  }

  @media (max-width: 1439px) {
    .rating-section {
      padding: 114px 60px 267px;
    }

    .rating-section__grid {
      margin-top: 137px;
    }
  }

  @media (max-width: 1050px) {
    .rating-section {
      padding: 88px 34px 172px;
      border-radius: 32px;
    }

    .rating-section__grid {
      margin-top: 88px;
    }

    .rating-section__video {
      width: 57%;
      margin: -20px auto 0;
    }
  }

  @media (max-width: 767px) {
    .rating-section {
      padding: 56px 10px 100px;
    }

    .rating-section__grid {
      margin-top: 56px;
    }
  }
</style>
