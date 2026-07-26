<template>
  <article
    class="carousel-offer-card"
    data-carousel-item
  >
    <div class="carousel-offer-card__media">
      <img
        class="carousel-offer-card__image"
        loading="lazy"
        decoding="async"
        :src="image"
        :alt="title"
      >
    </div>

    <h3 class="carousel-offer-card__title">
      {{ title }}
    </h3>

    <p class="carousel-offer-card__meta">
      <span class="carousel-offer-card__meta-label">
        {{ metaLabel }}
      </span>
      {{ ' ' }}
      <span class="carousel-offer-card__meta-value">
        {{ metaValue }}
      </span>
    </p>

    <p class="carousel-offer-card__location">
      <Icon
        name="mdi:map-marker"
        class="carousel-offer-card__pin"
        aria-hidden="true"
      />
      <span>{{ location }}</span>
    </p>

    <button
      type="button"
      class="carousel-offer-card__cta"
      @click="$emit('cta')"
    >
      <span>{{ ctaLabel }}</span>
      <img
        class="carousel-offer-card__cta-icon"
        alt=""
        aria-hidden="true"
        :src="arrowIcon"
      >
    </button>
  </article>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

  defineProps<{
    title: string
    metaLabel: string
    metaValue: string
    location: string
    image: string
    ctaLabel: string
  }>()

  defineEmits<{
    cta: []
  }>()
</script>

<style scoped>
  .carousel-offer-card {
    flex: 0 0 min(360px, 78vw);
    width: min(360px, 78vw);
    max-width: 360px;
    scroll-snap-align: start;
    display: flex;
    flex-direction: column;
    min-width: 0;
  }

  .carousel-offer-card__media {
    margin-bottom: 16px;
    border-radius: 24px;
    overflow: hidden;
    aspect-ratio: 1 / 1;
    background: #1f1f1f;
  }

  .carousel-offer-card__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    pointer-events: none;
  }

  .carousel-offer-card__title {
    margin: 0 0 10px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .carousel-offer-card__meta {
    margin: 0 0 8px;
    font-size: 15px;
    line-height: 1.35;
  }

  .carousel-offer-card__meta-label {
    color: rgba(255, 255, 255, 0.55);
    margin-right: 0.35em;
  }

  .carousel-offer-card__meta-value {
    color: #f6f6f6;
    font-weight: 600;
  }

  .carousel-offer-card__location {
    margin: 0 0 16px;
    display: flex;
    align-items: center;
    gap: 6px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    line-height: 1.3;
  }

  .carousel-offer-card__pin {
    flex-shrink: 0;
    width: 14px;
    height: 14px;
  }

  .carousel-offer-card__cta {
    margin-top: auto;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
  }

  .carousel-offer-card__cta:hover,
  .carousel-offer-card__cta:focus-visible {
    filter: brightness(1.1);
  }

  .carousel-offer-card__cta-icon {
    width: 12px;
    height: 12px;
    object-fit: contain;
    filter: brightness(0) saturate(100%) invert(48%) sepia(93%) saturate(1800%)
      hue-rotate(1deg) brightness(102%) contrast(104%);
  }

  @media (max-width: 1299px) {
    .carousel-offer-card {
      flex-basis: min(300px, 72vw);
      width: min(300px, 72vw);
      max-width: 300px;
    }
  }

  @media (max-width: 767px) {
    .carousel-offer-card__title {
      font-size: 16px;
    }
  }
</style>
