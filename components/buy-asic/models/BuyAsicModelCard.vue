<template>
  <article
    :class="[
      'buy-asic-model-card',
      { 'buy-asic-model-card--grid': layout === 'grid' },
    ]"
    :data-carousel-item="layout === 'carousel' ? '' : undefined"
  >
    <nuxt-link
      class="buy-asic-model-card__media"
      :to="href"
      :aria-label="model.name"
    >
      <span
        class="buy-asic-model-card__media-bg"
        :style="{ backgroundImage: `url(${mountainBg})` }"
        aria-hidden="true"
      />
      <img
        class="buy-asic-model-card__image"
        loading="lazy"
        decoding="async"
        :src="model.image"
        :alt="model.name"
      >
      <span
        class="buy-asic-model-card__badge"
        aria-hidden="true"
        :style="{ backgroundImage: `url(${model.badgeImage})` }"
      />
    </nuxt-link>

    <h3 class="buy-asic-model-card__title">
      <nuxt-link
        class="buy-asic-model-card__title-link"
        :to="href"
      >
        {{ model.name }}
      </nuxt-link>
    </h3>

    <p class="buy-asic-model-card__coins">
      <span class="buy-asic-model-card__coins-label">{{ coinLabel }}</span>
      {{ ' ' }}
      <span class="buy-asic-model-card__coins-value">{{ model.coins }}</span>
    </p>

    <p class="buy-asic-model-card__typing">
      <span class="buy-asic-model-card__typing-label">{{ pricePrefix }}</span>
      {{ ' ' }}
      <span class="buy-asic-model-card__typing-value">
        {{ typedText }}
        <span
          class="buy-asic-model-card__cursor"
          aria-hidden="true"
        >|</span>
      </span>
    </p>

    <button
      type="button"
      class="buy-asic-model-card__cta"
      @click="$emit('cta', model)"
    >
      <span>{{ ctaLabel }}</span>
      <img
        class="buy-asic-model-card__cta-icon"
        alt=""
        aria-hidden="true"
        :src="arrowIcon"
      >
    </button>
  </article>
</template>

<script setup lang="ts">
  import type { BuyAsicModel } from '~/common/modules/top-mining/buy-asic-page'
  import { getBuyAsicModelHref } from '~/common/modules/top-mining/buy-asic-page'
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

  const props = withDefaults(
    defineProps<{
      model: BuyAsicModel
      mountainBg: string
      coinLabel: string
      pricePrefix: string
      ctaLabel: string
      vendors: readonly string[]
      typeDelayMs?: number
      layout?: 'carousel' | 'grid'
    }>(),
    {
      layout: 'carousel',
    },
  )

  defineEmits<{
    cta: [model: BuyAsicModel]
  }>()

  const href = computed(() => getBuyAsicModelHref(props.model))

  const typedText = ref('')
  const prefersReducedMotion = ref(false)

  let cancelled = false
  let timeoutId: ReturnType<typeof setTimeout> | null = null

  function wait(ms: number) {
    return new Promise<void>((resolve) => {
      timeoutId = setTimeout(resolve, ms)
    })
  }

  async function runTypewriter() {
    if (prefersReducedMotion.value || props.vendors.length === 0) {
      typedText.value = props.vendors[0] ?? ''
      return
    }

    await wait(props.typeDelayMs ?? 0)

    let vendorIndex = 0

    while (!cancelled) {
      const word = props.vendors[vendorIndex % props.vendors.length] ?? ''

      for (let i = 1; i <= word.length; i += 1) {
        if (cancelled) {
          return
        }

        typedText.value = word.slice(0, i)
        await wait(70)
      }

      await wait(1400)

      for (let i = word.length; i >= 0; i -= 1) {
        if (cancelled) {
          return
        }

        typedText.value = word.slice(0, i)
        await wait(40)
      }

      await wait(280)
      vendorIndex += 1
    }
  }

  onMounted(() => {
    prefersReducedMotion.value = window.matchMedia(
      '(prefers-reduced-motion: reduce)',
    ).matches
    void runTypewriter()
  })

  onBeforeUnmount(() => {
    cancelled = true

    if (timeoutId) {
      clearTimeout(timeoutId)
    }
  })
</script>

<style scoped>
  .buy-asic-model-card {
    display: flex;
    flex: 0 0 min(300px, 78vw);
    flex-direction: column;
    width: min(300px, 78vw);
    max-width: 300px;
    min-width: 0;
    scroll-snap-align: start;
  }

  .buy-asic-model-card--grid {
    flex: initial;
    width: 100%;
    max-width: none;
  }

  .buy-asic-model-card__media {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    aspect-ratio: 1 / 1;
    margin-bottom: 14px;
    overflow: hidden;
    border-radius: 24px;
    background: #111;
  }

  .buy-asic-model-card__media-bg {
    position: absolute;
    inset: 0;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    filter: grayscale(1) contrast(1.08) brightness(0.82);
  }

  .buy-asic-model-card__image {
    position: relative;
    z-index: 1;
    display: block;
    width: 88%;
    height: 72%;
    object-fit: contain;
    object-position: center;
    mix-blend-mode: lighten;
    pointer-events: none;
  }

  .buy-asic-model-card__badge {
    position: absolute;
    z-index: 2;
    left: 0;
    bottom: 40px;
    width: 190px;
    height: 51px;
    background-position: center left;
    background-repeat: no-repeat;
    background-size: contain;
    pointer-events: none;
  }

  .buy-asic-model-card__title {
    margin: 0 0 8px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .buy-asic-model-card__title-link {
    color: inherit;
    text-decoration: none;
  }

  .buy-asic-model-card__title-link:hover,
  .buy-asic-model-card__title-link:focus-visible {
    color: var(--tm-orange);
  }

  .buy-asic-model-card__coins {
    margin: 0 0 6px;
    font-size: 14px;
    line-height: 1.35;
  }

  .buy-asic-model-card__coins-label {
    color: rgba(255, 255, 255, 0.5);
  }

  .buy-asic-model-card__coins-value {
    color: #fff;
    font-weight: 600;
  }

  .buy-asic-model-card__typing {
    margin: 0 0 14px;
    min-height: 1.4em;
    font-size: 13px;
    line-height: 1.4;
  }

  .buy-asic-model-card__typing-label {
    color: rgba(255, 255, 255, 0.5);
  }

  .buy-asic-model-card__typing-value {
    color: rgba(255, 255, 255, 0.55);
    font-weight: 400;
  }

  .buy-asic-model-card__cursor {
    display: inline-block;
    margin-left: 1px;
    color: rgba(255, 255, 255, 0.55);
    font-weight: 400;
    animation: buy-asic-model-cursor 0.8s step-end infinite;
  }

  .buy-asic-model-card__cta {
    display: inline-flex;
    gap: 8px;
    align-items: center;
    margin-top: auto;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 13px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
  }

  .buy-asic-model-card__cta:hover,
  .buy-asic-model-card__cta:focus-visible {
    filter: brightness(1.1);
  }

  .buy-asic-model-card__cta-icon {
    display: block;
    width: 13px;
    height: 13px;
    object-fit: contain;
    /* белая стрелка → --tm-orange (#ff6418) */
    filter: brightness(0) saturate(100%) invert(48%) sepia(98%) saturate(2478%)
      hue-rotate(360deg) brightness(102%) contrast(104%);
  }

  @keyframes buy-asic-model-cursor {
    50% {
      opacity: 0;
    }
  }

  @media (max-width: 1439px) {
    .buy-asic-model-card__badge {
      bottom: 30px;
      height: 44px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__title {
      font-size: 16px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__media {
      border-radius: 20px;
      margin-bottom: 12px;
    }
  }

  @media (max-width: 900px) {
    .buy-asic-model-card--grid .buy-asic-model-card__title {
      font-size: 15px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__media {
      border-radius: 18px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__badge {
      width: min(190px, 78%);
      height: 40px;
      bottom: 24px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__typing {
      margin-bottom: 10px;
      font-size: 12px;
    }

    .buy-asic-model-card--grid .buy-asic-model-card__cta {
      font-size: 12px;
    }
  }
</style>
