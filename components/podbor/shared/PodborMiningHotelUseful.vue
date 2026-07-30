<template>
  <section
    ref="rootRef"
    :class="[
      'podbor-useful',
      { 'podbor-useful--visible': isVisible },
      { 'podbor-useful--reduced-motion': prefersReducedMotion },
    ]"
    aria-labelledby="podbor-useful-title"
  >
    <div class="podbor-useful__inner">
      <img
        class="podbor-useful__logo"
        alt=""
        aria-hidden="true"
        :src="logoMark"
      >

      <h2
        id="podbor-useful-title"
        class="podbor-useful__title"
      >
        <span class="podbor-useful__title-lead">
          {{ useful.titleLead }}
        </span>
        {{ ' ' }}
        <span class="podbor-useful__title-accent">
          {{ useful.titleAccent }}
        </span>
      </h2>

      <div class="podbor-useful__text polezen-text">
        <p>
          <template
            v-for="(segment, index) in useful.segments"
            :key="index"
          >
            <i
              v-if="'type' in segment && segment.type === 'spacer'"
              class="podbor-useful__spacer"
              aria-hidden="true"
            />
            <br v-else-if="'type' in segment && segment.type === 'br'">
            <template v-else-if="'text' in segment">
              <span
                class="podbor-useful__phrase"
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
  .podbor-useful {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 48px 0 96px;
  }

  .podbor-useful__inner {
    max-width: 920px;
    margin: 0 auto;
    padding: 0 24px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .podbor-useful__logo {
    display: block;
    width: 42px;
    height: auto;
    margin-bottom: 28px;
    object-fit: contain;
  }

  .podbor-useful__title {
    margin: 0 0 36px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 4vw, 44px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .podbor-useful__title-accent {
    color: var(--tm-orange);
  }

  .podbor-useful__text {
    max-width: 760px;
  }

  .podbor-useful__text p {
    margin: 0;
    font-size: clamp(15px, 1.35vw, 18px);
    line-height: 1.65;
  }

  .podbor-useful__phrase {
    display: inline-block;
    opacity: 0.8;
    color: var(--tm-text-soft);
    filter: blur(3px);
  }

  .podbor-useful__spacer {
    display: block;
    height: 1.35em;
    font-style: normal;
  }

  .podbor-useful--visible .podbor-useful__phrase {
    animation: podbor-useful-fade-in 0.8s forwards
      cubic-bezier(0.11, 0, 0.5, 0);
    animation-delay: calc(var(--phrase-index) * 0.12s);
  }

  .podbor-useful--reduced-motion .podbor-useful__phrase {
    opacity: 1;
    color: #fff;
    filter: none;
    animation: none;
  }

  @keyframes podbor-useful-fade-in {
    to {
      opacity: 1;
      color: #fff;
      filter: blur(0);
    }
  }

  @media (max-width: 767px) {
    .podbor-useful {
      padding: 32px 0 72px;
    }

    .podbor-useful__logo {
      width: 36px;
      margin-bottom: 20px;
    }

    .podbor-useful__title {
      margin-bottom: 28px;
      font-size: 26px;
    }

    .podbor-useful__text p {
      font-size: 15px;
    }
  }
</style>
