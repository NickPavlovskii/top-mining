<template>
  <section
    class="horizontal-carousel"
    :aria-labelledby="titleId"
  >
    <div class="horizontal-carousel__inner">
      <div class="horizontal-carousel__header">
        <h2
          :id="titleId"
          class="horizontal-carousel__title"
        >
          {{ title }}
        </h2>

        <div class="horizontal-carousel__nav">
          <button
            type="button"
            :class="[
              'horizontal-carousel__nav-btn',
              { 'horizontal-carousel__nav-btn--inactive': !canScrollLeft },
            ]"
            aria-label="Прокрутить влево"
            @click="scroll(-1)"
          >
            <Icon
              name="mdi:chevron-left"
              class="horizontal-carousel__nav-icon"
              aria-hidden="true"
            />
          </button>
          <button
            type="button"
            :class="[
              'horizontal-carousel__nav-btn',
              { 'horizontal-carousel__nav-btn--inactive': !canScrollRight },
            ]"
            aria-label="Прокрутить вправо"
            @click="scroll(1)"
          >
            <Icon
              name="mdi:chevron-right"
              class="horizontal-carousel__nav-icon"
              aria-hidden="true"
            />
          </button>
        </div>
      </div>

      <div
        ref="trackRef"
        :class="[
          'horizontal-carousel__track',
          { 'horizontal-carousel__track--dragging': isDragging },
        ]"
        @scroll="updateScrollState"
        @pointerdown="onTrackPointerDown"
        @pointermove="onTrackPointerMove"
        @pointerup="onTrackPointerUp"
        @pointercancel="onTrackPointerUp"
      >
        <slot />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  const props = withDefaults(
    defineProps<{
      title: string
      titleId: string
      itemSelector?: string
      gap?: number
    }>(),
    {
      itemSelector: '[data-carousel-item]',
      gap: 24,
    },
  )

  const trackRef = ref<HTMLElement | null>(null)
  const canScrollLeft = ref(false)
  const canScrollRight = ref(true)
  const isPointerDown = ref(false)
  const isDragging = ref(false)
  const dragStartX = ref(0)
  const dragStartScrollLeft = ref(0)

  function isInteractiveTarget(target: EventTarget | null) {
    if (!(target instanceof Element)) {
      return false
    }

    return Boolean(target.closest('button, a, input, textarea, select, label'))
  }

  function onTrackPointerDown(event: PointerEvent) {
    if (event.button !== 0 || isInteractiveTarget(event.target)) {
      return
    }

    const track = trackRef.value

    if (!track) {
      return
    }

    isPointerDown.value = true
    isDragging.value = false
    dragStartX.value = event.clientX
    dragStartScrollLeft.value = track.scrollLeft
    track.setPointerCapture(event.pointerId)
  }

  function onTrackPointerMove(event: PointerEvent) {
    if (!isPointerDown.value) {
      return
    }

    const track = trackRef.value

    if (!track) {
      return
    }

    const delta = event.clientX - dragStartX.value

    if (!isDragging.value && Math.abs(delta) < 10) {
      return
    }

    isDragging.value = true
    event.preventDefault()
    track.scrollLeft = dragStartScrollLeft.value - delta
    updateScrollState()
  }

  function onTrackPointerUp(event: PointerEvent) {
    if (!isPointerDown.value) {
      return
    }

    const track = trackRef.value

    isPointerDown.value = false
    isDragging.value = false

    if (track?.hasPointerCapture(event.pointerId)) {
      track.releasePointerCapture(event.pointerId)
    }
  }

  function updateScrollState() {
    const track = trackRef.value

    if (!track) {
      canScrollLeft.value = false
      canScrollRight.value = false
      return
    }

    const maxScroll = track.scrollWidth - track.clientWidth
    const overflow = maxScroll > 4

    canScrollLeft.value = overflow && track.scrollLeft > 4
    canScrollRight.value = overflow && track.scrollLeft < maxScroll - 4
  }

  function scroll(direction: -1 | 1) {
    const track = trackRef.value

    if (!track) {
      return
    }

    if (direction < 0 && !canScrollLeft.value) {
      return
    }

    if (direction > 0 && !canScrollRight.value) {
      return
    }

    const item = track.querySelector<HTMLElement>(props.itemSelector)
    const step = item
      ? item.offsetWidth + props.gap
      : Math.max(track.clientWidth * 0.7, 280)

    track.scrollBy({
      left: direction * step,
      behavior: 'smooth',
    })
  }

  onMounted(() => {
    updateScrollState()
    window.addEventListener('resize', updateScrollState)
  })

  onBeforeUnmount(() => {
    window.removeEventListener('resize', updateScrollState)
  })
</script>

<style scoped>
  .horizontal-carousel {
    background: #141414;
    color: var(--tm-white);
    padding: 48px 0 64px;
  }

  .horizontal-carousel__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .horizontal-carousel__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    margin-bottom: 32px;
  }

  .horizontal-carousel__title {
    margin: 0;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3vw, 44px);
    font-weight: 500;
    line-height: 1.1;
    text-transform: uppercase;
  }

  .horizontal-carousel__nav {
    display: flex;
    gap: 12px;
    flex-shrink: 0;
  }

  .horizontal-carousel__nav-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    padding: 0;
    border: 0;
    border-radius: 50%;
    background: var(--tm-orange);
    color: #fff;
    cursor: pointer;
    transition: opacity 0.2s ease, filter 0.2s ease;
  }

  .horizontal-carousel__nav-icon {
    display: block;
    width: 28px;
    height: 28px;
    flex-shrink: 0;
  }

  .horizontal-carousel__nav-btn--inactive {
    opacity: 0.4;
    cursor: default;
  }

  .horizontal-carousel__nav-btn:not(.horizontal-carousel__nav-btn--inactive):hover {
    filter: brightness(1.08);
  }

  .horizontal-carousel__track {
    display: flex;
    align-items: stretch;
    gap: 24px;
    overflow-x: auto;
    overflow-y: hidden;
    scroll-snap-type: x proximity;
    scrollbar-width: none;
    -webkit-overflow-scrolling: touch;
    padding-bottom: 4px;
    cursor: grab;
    touch-action: pan-y;
  }

  .horizontal-carousel__track--dragging {
    cursor: grabbing;
    scroll-snap-type: none;
    user-select: none;
  }

  .horizontal-carousel__track::-webkit-scrollbar {
    display: none;
  }

  @media (max-width: 1600px) {
    .horizontal-carousel__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .horizontal-carousel {
      padding: 40px 0 56px;
    }

    .horizontal-carousel__inner {
      padding: 0 24px;
    }

    .horizontal-carousel__header {
      margin-bottom: 24px;
    }
  }

  @media (max-width: 767px) {
    .horizontal-carousel {
      padding: 32px 0 48px;
    }

    .horizontal-carousel__inner {
      padding: 0 16px;
    }

    .horizontal-carousel__title {
      font-size: 24px;
    }

    .horizontal-carousel__nav-btn {
      width: 40px;
      height: 40px;
    }

    .horizontal-carousel__nav-icon {
      width: 24px;
      height: 24px;
    }

    .horizontal-carousel__track {
      gap: 16px;
    }
  }
</style>
