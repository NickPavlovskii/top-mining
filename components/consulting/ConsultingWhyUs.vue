<template>
  <section
    ref="rootRef"
    :class="[
      'consulting-why',
      { 'consulting-why--visible': isVisible },
      { 'consulting-why--reduced-motion': prefersReducedMotion },
    ]"
    aria-labelledby="consulting-why-title"
  >
    <div class="consulting-why__inner">
      <img
        class="consulting-why__logo"
        alt=""
        aria-hidden="true"
        :src="logoMark"
      >

      <h2
        id="consulting-why-title"
        class="consulting-why__title"
      >
        {{ copy.title }}
      </h2>

      <div class="consulting-why__text polezen-text-w-bg">
        <p>
          <template
            v-for="(segment, index) in copy.segments"
            :key="index"
          >
            <i
              v-if="'type' in segment && segment.type === 'spacer'"
              class="consulting-why__spacer"
              aria-hidden="true"
            />
            <br v-else-if="'type' in segment && segment.type === 'br'">
            <template v-else-if="'text' in segment">
              <span
                class="consulting-why__phrase"
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
  import { CONSULTING_WHY_US } from '~/common/modules/top-mining/consulting/why-us'
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

  const copy = CONSULTING_WHY_US
  const rootRef = ref<HTMLElement | null>(null)
  const isVisible = ref(false)
  const prefersReducedMotion = ref(false)

  const phraseIndexBySegment: Record<number, number> = {}
  let phraseCount = 0

  for (const [index, segment] of copy.segments.entries()) {
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
  .consulting-why {
    padding: 40px 0 40px;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
  }

  .consulting-why__inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 920px;
    margin: 0 auto;
    padding: 0 24px;
    text-align: center;
  }

  .consulting-why__logo {
    display: block;
    width: 56px;
    height: auto;
    margin: 0 auto 28px;
    object-fit: contain;
  }

  .consulting-why__title {
    margin: 0 0 36px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-transform: uppercase;
    background: linear-gradient(
      90deg,
      #d8480d 0%,
      #cb3a08 33.9%,
      #fe731e 73.9%,
      #ed5f17 100%
    );
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
  }

  .consulting-why__text {
    max-width: 760px;
  }

  .consulting-why__text p {
    margin: 0;
    font-size: clamp(15px, 1.35vw, 18px);
    line-height: 1.65;
  }

  .consulting-why__phrase {
    display: inline-block;
    color: var(--tm-text-soft);
    opacity: 0.8;
    filter: blur(3px);
  }

  .consulting-why__spacer {
    display: block;
    height: 1.35em;
    font-style: normal;
  }

  .consulting-why--visible .consulting-why__phrase {
    animation: fade-in-w-bg 0.8s forwards cubic-bezier(0.11, 0, 0.5, 0);
    animation-delay: calc(0.1s + var(--phrase-index) * 0.1s);
  }

  .consulting-why--reduced-motion .consulting-why__phrase {
    opacity: 1;
    color: var(--tm-page-bg);
    filter: none;
    animation: none;
  }

  @keyframes fade-in-w-bg {
    to {
      opacity: 1;
      color: var(--tm-page-bg);
      filter: blur(0);
    }
  }

  @media (max-width: 1299px) {
    .consulting-why {
      padding: 40px 0 72px;
    }

    .consulting-why__title {
      margin-bottom: 24px;
      font-size: 26px;
      line-height: 28px;
    }
  }

  @media (max-width: 767px) {
    .consulting-why {
      padding: 32px 0 56px;
    }

    .consulting-why__logo {
      width: 40px;
      margin-bottom: 20px;
    }

    .consulting-why__title {
      margin: 10px 0 20px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .consulting-why__text p {
      font-size: 15px;
    }
  }
</style>
