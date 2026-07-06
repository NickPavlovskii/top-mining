<template>
  <a
    class="rating-marquee-link"
    target="_blank"
    rel="noopener noreferrer"
    :href="href"
    :aria-label="`${label} (${number})`"
  >
    <span class="rating-marquee-link__number">({{ number }})</span>

    <span class="rating-marquee-link__body">
      <span class="rating-marquee-link__static">
        <span class="rating-marquee-link__text">{{ label }}</span>
        <Icon
          name="mdi:arrow-top-right"
          class="rating-marquee-link__arrow"
          aria-hidden="true"
        />
      </span>

      <span
        class="rating-marquee-link__marquee"
        aria-hidden="true"
      >
        <span
          class="rating-marquee-link__marquee-track"
          :style="marqueeStyle"
        >
          <span
            v-for="chunkIndex in 2"
            :key="chunkIndex"
            class="rating-marquee-link__marquee-chunk"
          >
            <span class="rating-marquee-link__text">{{ label }}</span>
            <Icon
              name="mdi:arrow-top-right"
              class="rating-marquee-link__arrow"
              aria-hidden="true"
            />
            <span class="rating-marquee-link__number-inline">({{ number }})</span>
          </span>
        </span>
      </span>
    </span>
  </a>
</template>

<script setup lang="ts">
  const props = defineProps<{
    number: string
    label: string
    href: string
  }>()

  const marqueeStyle = computed(() => ({
    animationDuration: `${Math.max(10, props.label.length * 0.22)}s`,
  }))
</script>

<style scoped>
  .rating-marquee-link {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: max-content;
    max-width: 100%;
    min-height: 34px;
    margin: 0 auto;
    padding: 0;
    color: inherit;
    font: inherit;
    line-height: inherit;
    text-decoration: none;
    transition: color 0.2s ease;
    box-sizing: border-box;
  }

  .rating-marquee-link__number {
    flex-shrink: 0;
    color: inherit;
    font: inherit;
    line-height: inherit;
    transition:
      opacity 0.2s ease,
      width 0.2s ease;
  }

  .rating-marquee-link__body {
    position: relative;
    flex: 0 1 auto;
    min-width: 0;
  }

  .rating-marquee-link__static {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    transition: opacity 0.2s ease;
  }

  .rating-marquee-link__text {
    white-space: nowrap;
  }

  .rating-marquee-link__arrow {
    flex-shrink: 0;
    width: 14px;
    height: 14px;
  }

  .rating-marquee-link__marquee {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.2s ease;
  }

  .rating-marquee-link__marquee-track {
    display: inline-flex;
    width: max-content;
    animation: rating-marquee-scroll linear infinite;
    animation-play-state: paused;
  }

  .rating-marquee-link__marquee-chunk {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding-right: 48px;
    white-space: nowrap;
  }

  .rating-marquee-link__number-inline {
    flex-shrink: 0;
    color: inherit;
    font: inherit;
    font-weight: 400;
  }

  @keyframes rating-marquee-scroll {
    from {
      transform: translateX(0);
    }

    to {
      transform: translateX(-50%);
    }
  }

  @media (hover: hover) {
    .rating-marquee-link:hover,
    .rating-marquee-link:focus-visible {
      color: #fff;
    }

    .rating-marquee-link:hover .rating-marquee-link__number,
    .rating-marquee-link:focus-visible .rating-marquee-link__number {
      width: 0;
      opacity: 0;
      overflow: hidden;
    }

    .rating-marquee-link:hover .rating-marquee-link__static,
    .rating-marquee-link:focus-visible .rating-marquee-link__static {
      opacity: 0;
    }

    .rating-marquee-link:hover .rating-marquee-link__marquee,
    .rating-marquee-link:focus-visible .rating-marquee-link__marquee {
      opacity: 1;
    }

    .rating-marquee-link:hover .rating-marquee-link__marquee-track,
    .rating-marquee-link:focus-visible .rating-marquee-link__marquee-track {
      animation-play-state: running;
    }
  }
</style>
