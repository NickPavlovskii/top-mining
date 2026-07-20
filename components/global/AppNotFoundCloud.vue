<template>
  <div class="app-not-found">
    <div class="app-not-found__inner">
      <nav
        class="app-not-found__breadcrumbs"
        aria-label="Хлебные крошки"
      >
        <nuxt-link to="/">
          Главная
        </nuxt-link>
        <span aria-hidden="true">›</span>
        <span>404</span>
      </nav>

      <div class="app-not-found__stage">
        <ClientOnly>
          <canvas
            ref="canvasRef"
            class="app-not-found__canvas"
            aria-hidden="true"
          />
          <template #fallback>
            <div
              class="app-not-found__fallback"
              aria-hidden="true"
            >
              <span
                v-for="(text, index) in fallbackTexts"
                :key="`${text}-${index}`"
                class="app-not-found__fallback-item"
              >
                {{ text }}
              </span>
            </div>
          </template>
        </ClientOnly>
      </div>

      <h1 class="app-not-found__sr-only">
        {{ title }}
      </h1>

      <div class="app-not-found__actions">
        <top-mining-button
          title="На главную"
          href="/"
          v-bind="TOP_MINING_BUTTON_PROPS"
          @click="emit('home')"
        >
          <template #append>
            <Icon
              name="mdi:arrow-top-right"
              class="app-not-found__cta-icon"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import {
    NOT_FOUND_PHRASES,
    SPHERE_TAG_COUNT,
    buildSphereTags,
    depthStyle,
    getSphereRadius,
    projectSphereTags,
    type SphereTag,
  } from '~/common/modules/not-found'
  import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining'

  withDefaults(
    defineProps<{
      title?: string
    }>(),
    {
      title: 'Страница не найдена',
    },
  )

  const emit = defineEmits<{
    home: []
  }>()

  const canvasRef = ref<HTMLCanvasElement | null>(null)
  const fallbackTexts = [
    ...NOT_FOUND_PHRASES,
    ...NOT_FOUND_PHRASES,
    ...NOT_FOUND_PHRASES,
  ]

  let animationFrame = 0
  let resizeObserver: ResizeObserver | null = null
  let prefersReducedMotion = false
  let cachedRadius = 0
  let cachedTags: SphereTag[] = []

  function ensureSphereTags(radius: number): SphereTag[] {
    if (radius === cachedRadius && cachedTags.length > 0) {
      return cachedTags
    }

    cachedRadius = radius
    cachedTags = buildSphereTags(NOT_FOUND_PHRASES, SPHERE_TAG_COUNT, radius)
    return cachedTags
  }

  function drawSphere(canvas: HTMLCanvasElement) {
    const context = canvas.getContext('2d')
    if (!context) {
      return
    }

    const dpr = Math.min(window.devicePixelRatio || 1, 2)
    const width = canvas.clientWidth
    const height = canvas.clientHeight

    if (width <= 0 || height <= 0) {
      return
    }

    canvas.width = Math.floor(width * dpr)
    canvas.height = Math.floor(height * dpr)
    context.setTransform(dpr, 0, 0, dpr, 0, 0)

    const radius = getSphereRadius(width, height)
    const tags = ensureSphereTags(radius)
    const time = performance.now() * 0.001
    const rotateY = prefersReducedMotion ? 0.4 : time * 0.42
    const projected = projectSphereTags(
      tags,
      width / 2,
      height / 2,
      rotateY,
      -0.22,
    )

    context.clearRect(0, 0, width, height)

    for (const item of projected) {
      const { opacity, fontSize } = depthStyle(item.z, radius)

      context.font = `${fontSize}px Roboto, 'Segoe UI', system-ui, sans-serif`
      context.textAlign = 'center'
      context.textBaseline = 'middle'
      context.fillStyle = `rgba(255, 255, 255, ${opacity.toFixed(3)})`
      context.fillText(item.text, item.x, item.y)
    }
  }

  function tick() {
    const canvas = canvasRef.value
    if (!canvas) {
      return
    }

    drawSphere(canvas)
    animationFrame = window.requestAnimationFrame(tick)
  }

  function startAnimation() {
    prefersReducedMotion = window.matchMedia(
      '(prefers-reduced-motion: reduce)',
    ).matches
    animationFrame = window.requestAnimationFrame(tick)

    const canvas = canvasRef.value
    if (!canvas || typeof ResizeObserver === 'undefined') {
      return
    }

    resizeObserver = new ResizeObserver(() => {
      drawSphere(canvas)
    })
    resizeObserver.observe(canvas)
  }

  function stopAnimation() {
    window.cancelAnimationFrame(animationFrame)
    resizeObserver?.disconnect()
    resizeObserver = null
    cachedRadius = 0
    cachedTags = []
  }

  onMounted(() => {
    startAnimation()
  })

  onBeforeUnmount(() => {
    stopAnimation()
  })
</script>

<style scoped>
  .app-not-found {
    flex: 1;
    min-height: calc(100vh - 120px);
    margin-top: 8px;
    border-radius: clamp(28px, 5vw, 60px) clamp(28px, 5vw, 60px) 0 0;
    background: #121212;
    color: #fff;
    overflow: hidden;
  }

  .app-not-found__inner {
    display: flex;
    flex-direction: column;
    max-width: 1770px;
    min-height: inherit;
    margin: 0 auto;
    padding: clamp(24px, 4vw, 40px) clamp(16px, 4vw, 60px)
      clamp(40px, 6vw, 72px);
  }

  .app-not-found__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin: 0 0 clamp(16px, 3vw, 28px);
    color: rgba(255, 255, 255, 0.45);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.3;
  }

  .app-not-found__breadcrumbs a {
    color: rgba(255, 255, 255, 0.55);
    text-decoration: none;
  }

  .app-not-found__breadcrumbs a:hover {
    color: #fff;
  }

  .app-not-found__stage {
    position: relative;
    flex: 1;
    width: 100%;
    min-height: clamp(320px, 58vh, 520px);
    margin: 0 auto;
    max-width: 980px;
  }

  .app-not-found__canvas {
    display: block;
    width: 100%;
    height: 100%;
    min-height: inherit;
  }

  .app-not-found__fallback {
    position: absolute;
    inset: 0;
    display: grid;
    place-content: center;
    gap: 12px;
    text-align: center;
    color: rgba(255, 255, 255, 0.75);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 18px;
  }

  .app-not-found__fallback-item:nth-child(3n + 2) {
    opacity: 0.55;
    font-size: 16px;
  }

  .app-not-found__fallback-item:nth-child(3n) {
    opacity: 0.35;
    font-size: 14px;
  }

  .app-not-found__sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  .app-not-found__actions {
    display: flex;
    justify-content: center;
    margin-top: clamp(12px, 3vw, 28px);
  }

  .app-not-found__cta-icon {
    width: 20px;
    height: 20px;
  }

  @media (max-width: 640px) {
    .app-not-found {
      min-height: calc(100vh - 96px);
    }

    .app-not-found__stage {
      min-height: 280px;
    }
  }
</style>
