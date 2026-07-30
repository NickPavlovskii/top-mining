<template>
  <section
    ref="rootRef"
    :class="[
      'buy-asic-useful',
      { 'buy-asic-useful--visible': isVisible },
      { 'buy-asic-useful--reduced-motion': prefersReducedMotion },
    ]"
    aria-labelledby="buy-asic-useful-title"
  >
    <div class="buy-asic-useful__inner">
      <img
        class="buy-asic-useful__logo"
        alt=""
        aria-hidden="true"
        :src="logoMark"
      >

      <h2
        id="buy-asic-useful-title"
        class="buy-asic-useful__title"
      >
        <span class="buy-asic-useful__title-lead">
          {{ useful.titleLead }}
        </span>
        {{ ' ' }}
        <span class="buy-asic-useful__title-accent">
          {{ useful.titleAccent }}
        </span>
      </h2>

      <div class="buy-asic-useful__text">
        <p>
          <template
            v-for="(segment, index) in useful.segments"
            :key="index"
          >
            <i
              v-if="'type' in segment && segment.type === 'spacer'"
              class="buy-asic-useful__spacer"
              aria-hidden="true"
            />
            <br v-else-if="'type' in segment && segment.type === 'br'">
            <template v-else-if="'text' in segment">
              <span
                class="buy-asic-useful__phrase"
                :style="{ '--phrase-index': phraseIndexBySegment[index] }"
              >
                {{ segment.text }}
              </span>
              {{ ' ' }}
            </template>
          </template>
        </p>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_USEFUL } from '~/common/modules/top-mining/podbor-mining-hotel'
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

  const useful = PODBOR_MINING_HOTEL_USEFUL
  const rootRef = ref<HTMLElement | null>(null)
  const isVisible = ref(false)
  const prefersReducedMotion = ref(false)

  const phraseIndexBySegment: Record<number, number> = {}
  let phraseCount = 0

  for (const [index, segment] of useful.segments.entries()) {
    if ('text' in segment) {
      phraseIndexBySegment[index] = phraseCount
      phraseCount += 1
    }
  }

  let observer: IntersectionObserver | null = null

  onMounted(() => {
    prefersReducedMotion.value = window.matchMedia(
      '(prefers-reduced-motion: reduce)',
    ).matches

    if (prefersReducedMotion.value) {
      isVisible.value = true
      return
    }

    const root = rootRef.value

    if (!root || typeof IntersectionObserver === 'undefined') {
      isVisible.value = true
      return
    }

    observer = new IntersectionObserver(
      ([entry]) => {
        if (!entry?.isIntersecting) {
          return
        }

        isVisible.value = true
        observer?.disconnect()
        observer = null
      },
      {
        threshold: 0.2,
        rootMargin: '0px 0px -10% 0px',
      },
    )

    observer.observe(root)
  })

  onBeforeUnmount(() => {
    observer?.disconnect()
    observer = null
  })
</script>

<style scoped>
  .buy-asic-useful {
    background: var(--tm-ink);
    color: #fff;
    padding: 48px 0 96px;
  }

  .buy-asic-useful__inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 24px;
    text-align: center;
  }

  .buy-asic-useful__logo {
    display: block;
    width: 42px;
    height: auto;
    margin-bottom: 28px;
    object-fit: contain;
  }

  .buy-asic-useful__title {
    margin: 0 0 40px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 44px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .buy-asic-useful__title-accent {
    color: var(--tm-orange);
  }

  .buy-asic-useful__text {
    max-width: 920px;
  }

  .buy-asic-useful__text p {
    display: block;
    margin: 0 0 40px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
    transform: scale(0.94);
  }

  .buy-asic-useful--visible .buy-asic-useful__text p {
    animation: buy-asic-useful-scale 3s forwards cubic-bezier(0.5, 1, 0.89, 1);
  }

  .buy-asic-useful__phrase {
    display: inline-block;
    color: var(--tm-text-soft);
    opacity: 0.8;
    filter: blur(3px);
  }

  .buy-asic-useful__spacer {
    display: block;
    height: 1.35em;
    font-style: normal;
  }

  .buy-asic-useful--visible .buy-asic-useful__phrase {
    animation: buy-asic-useful-fade-in 0.8s forwards
      cubic-bezier(0.11, 0, 0.5, 0);
    animation-delay: calc(var(--phrase-index) * 0.12s);
  }

  .buy-asic-useful--reduced-motion .buy-asic-useful__text p {
    transform: scale(1);
    animation: none;
  }

  .buy-asic-useful--reduced-motion .buy-asic-useful__phrase {
    color: #fff;
    opacity: 1;
    filter: none;
    animation: none;
  }

  @keyframes buy-asic-useful-scale {
    to {
      transform: scale(1);
    }
  }

  @keyframes buy-asic-useful-fade-in {
    to {
      color: #fff;
      opacity: 1;
      filter: blur(0);
    }
  }

  @media (max-width: 1730px) {
    .buy-asic-useful__text p {
      font-size: 22px;
      line-height: 30px;
    }
  }

  @media (max-width: 767px) {
    .buy-asic-useful {
      padding: 32px 0 72px;
    }

    .buy-asic-useful__logo {
      width: 36px;
      margin-bottom: 20px;
    }

    .buy-asic-useful__title {
      margin-bottom: 28px;
      font-size: 26px;
    }

    .buy-asic-useful__text p {
      margin-bottom: 28px;
      font-size: 15px;
      line-height: 22px;
    }
  }
</style>
