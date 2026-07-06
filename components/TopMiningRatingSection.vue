<template>
  <section
    class="rating-section"
    :style="{ '--rating-surface': TOP_MINING_RATING_SURFACE }"
    aria-labelledby="rating-section-title"
  >
    <div class="rating-section__inner">
      <header class="rating-section__hero">
        <h2 id="rating-section-title" class="rating-section__title-sr">
          Рейтинг в майнинге
        </h2>
        <video
          class="rating-section__hero-video"
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

      <div class="rating-section__grid">
        <article
          v-for="card in TOP_MINING_RATING_CARDS"
          :key="card.id"
          class="rating-card"
        >
          <h3 class="rating-card__title">{{ card.title }}</h3>

          <ul class="rating-card__list">
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
  </section>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_RATING_CARDS,
    TOP_MINING_RATING_SURFACE,
    TOP_MINING_RATING_VIDEO,
  } from '~/constants/top-mining/ratings'
  import TopMiningRatingMarqueeLink from '~/components/rating/TopMiningRatingMarqueeLink.vue'
</script>

<style scoped>
  .rating-section {
    --rating-surface: var(--tm-rating-surface);
    --rating-card-bg: var(--tm-card-bg);

    padding: clamp(24px, 3vw, 40px) clamp(20px, 4vw, 60px)
      clamp(72px, 8vw, 120px);
    background: var(--rating-surface);
    color: var(--tm-white);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .rating-section__inner {
    width: 100%;
    max-width: 1720px;
    margin: 0 auto;
  }

  .rating-section__hero {
    display: flex;
    justify-content: center;
    margin: 0 0 clamp(40px, 5vw, 72px);
    background: transparent;
    overflow: hidden;
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

  .rating-section__hero-video {
    display: block;
    width: min(100%, 720px);
    max-width: 72%;
    height: auto;
    margin: 0 auto;
    background: transparent;
    pointer-events: none;
    user-select: none;
  }

  .rating-section__grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: clamp(20px, 2.5vw, 32px);
    align-items: stretch;
  }

  .rating-card {
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
    box-sizing: border-box;
  }

  .rating-card__title {
    margin: 0;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.2vw, 30px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.03em;
    text-align: center;
  }

  .rating-card__list {
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

  .rating-card__list > li {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    min-height: 48px;
    text-align: center;
    cursor: pointer;
  }

  @media (max-width: 900px) {
    .rating-card__list {
      gap: 16px;
      font-size: 18px;
      line-height: 30px;
    }

    .rating-card__list > li {
      min-height: 44px;
    }
  }

  @media (max-width: 560px) {
    .rating-card__list {
      gap: 14px;
      font-size: 16px;
      line-height: 26px;
    }

    .rating-card__list > li {
      min-height: 40px;
    }
  }

  @media (max-width: 900px) {
    .rating-section {
      padding-top: clamp(36px, 8vw, 56px);
      padding-bottom: clamp(48px, 10vw, 72px);
    }

    .rating-card {
      border-radius: 20px;
    }
  }

  @media (max-width: 560px) {
    .rating-section {
      padding-inline: 16px;
    }

    .rating-section__hero-video {
      width: min(100%, 420px);
      max-width: 100%;
    }

    .rating-card {
      padding: 20px 18px;
    }

    .rating-card__title {
      font-size: 20px;
    }
  }
</style>
