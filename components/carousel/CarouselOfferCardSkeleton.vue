<template>
  <article
    class="carousel-offer-card-skeleton"
    data-carousel-item
    aria-hidden="true"
  >
    <div class="carousel-offer-card-skeleton__media" />
    <div class="carousel-offer-card-skeleton__line carousel-offer-card-skeleton__line--title" />
    <div class="carousel-offer-card-skeleton__line carousel-offer-card-skeleton__line--meta" />
    <div class="carousel-offer-card-skeleton__line carousel-offer-card-skeleton__line--location" />
    <div class="carousel-offer-card-skeleton__line carousel-offer-card-skeleton__line--cta" />
  </article>
</template>

<style scoped>
  .carousel-offer-card-skeleton {
    flex: 0 0 min(360px, 78vw);
    width: min(360px, 78vw);
    max-width: 360px;
    scroll-snap-align: start;
    display: flex;
    flex-direction: column;
    gap: 14px;
    min-width: 0;
  }

  .carousel-offer-card-skeleton__media {
    width: 100%;
    aspect-ratio: 3 / 4;
    border-radius: 28px;
    background: linear-gradient(
      110deg,
      #1a1a1a 0%,
      #1a1a1a 35%,
      #2a2a2a 50%,
      #1a1a1a 65%,
      #1a1a1a 100%
    );
    background-size: 200% 100%;
    animation: carousel-offer-shimmer 1.35s ease-in-out infinite;
  }

  .carousel-offer-card-skeleton__line {
    border-radius: 999px;
    background: linear-gradient(
      110deg,
      #222 0%,
      #222 35%,
      #333 50%,
      #222 65%,
      #222 100%
    );
    background-size: 200% 100%;
    animation: carousel-offer-shimmer 1.35s ease-in-out infinite;
  }

  .carousel-offer-card-skeleton__line--title {
    width: 92%;
    height: 22px;
    border-radius: 10px;
  }

  .carousel-offer-card-skeleton__line--meta {
    width: 68%;
    height: 14px;
  }

  .carousel-offer-card-skeleton__line--location {
    width: 42%;
    height: 14px;
  }

  .carousel-offer-card-skeleton__line--cta {
    width: 46%;
    height: 16px;
    margin-top: 4px;
  }

  @keyframes carousel-offer-shimmer {
    0% {
      background-position: 100% 0;
    }

    100% {
      background-position: -100% 0;
    }
  }
</style>
