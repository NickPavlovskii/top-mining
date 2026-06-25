<template>
  <section class="rating-section" aria-labelledby="rating-section-title">
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

          <ul
            :class="[
              'rating-card__list',
              { 'rating-card__list--two-cols': card.columns === 2 },
            ]"
          >
            <li v-for="item in card.items" :key="item.number">
              <a
                class="rating-card__item"
                target="_blank"
                rel="noopener noreferrer"
                :href="item.href"
              >
                <span class="rating-card__item-number">({{ item.number }})</span>
                <span class="rating-card__item-label">{{ item.label }}</span>
              </a>
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
    TOP_MINING_RATING_VIDEO,
  } from '~/constants/top-mining/ratings'
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
    background: var(--rating-surface);
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
    width: 100%;
    max-width: min(100%, 1100px);
    height: auto;
    vertical-align: middle;
    background: var(--rating-surface);
    pointer-events: none;
    user-select: none;
  }

  .rating-section__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: clamp(20px, 2.5vw, 32px);
    align-items: stretch;
  }

  .rating-card {
    display: flex;
    flex-direction: column;
    min-height: 100%;
    padding: clamp(24px, 3vw, 36px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    background: var(--rating-card-bg);
  }

  .rating-card__title {
    margin: 0 0 clamp(20px, 2.5vw, 28px);
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.2vw, 30px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.03em;
  }

  .rating-card__list {
    display: grid;
    gap: 0;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .rating-card__list--two-cols {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    column-gap: clamp(16px, 2vw, 32px);
  }

  .rating-card__item {
    display: flex;
    gap: 10px;
    align-items: flex-start;
    padding: clamp(8px, 1vw, 12px) 0;
    color: rgba(255, 255, 255, 0.88);
    font-size: clamp(13px, 1.2vw, 15px);
    font-weight: 500;
    line-height: 1.38;
    text-decoration: none;
    transition: color 0.2s ease;
  }

  .rating-card__item:hover,
  .rating-card__item:focus-visible {
    color: var(--tm-orange);
  }

  .rating-card__item-number {
    flex-shrink: 0;
    color: rgba(255, 255, 255, 0.42);
    font-size: clamp(12px, 1.1vw, 14px);
    font-weight: 600;
    line-height: 1.38;
  }

  .rating-card__item-label {
    min-width: 0;
  }

  @media (max-width: 1100px) {
    .rating-card__list--two-cols {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 900px) {
    .rating-section {
      padding-top: clamp(36px, 8vw, 56px);
      padding-bottom: clamp(48px, 10vw, 72px);
    }

    .rating-section__grid {
      grid-template-columns: 1fr;
      gap: 20px;
    }

    .rating-section__hero-video {
      max-width: 100%;
    }

    .rating-card {
      border-radius: 20px;
    }
  }

  @media (max-width: 560px) {
    .rating-section {
      padding-inline: 16px;
    }

    .rating-card {
      padding: 20px 18px;
    }

    .rating-card__title {
      font-size: 20px;
    }
  }
</style>
