<template>
  <section class="org-gallery">
    <h2 class="org-gallery__title">
      Галерея
    </h2>

    <div class="org-gallery__viewport">
      <div
        ref="trackRef"
        class="org-gallery__track"
        @scroll="updateNav"
        @pointerdown="onTrackPointerDown"
        @pointermove="onTrackPointerMove"
        @pointerup="onTrackPointerUp"
        @pointercancel="onTrackPointerUp"
      >
        <figure
          v-for="(image, index) in images"
          :key="`${image.imageUrl}-${index}`"
          class="org-gallery__slide"
        >
          <img
            :src="image.imageUrl"
            :alt="image.imageAlt"
            class="org-gallery__image"
            draggable="false"
            loading="lazy"
          />
        </figure>
      </div>
    </div>

    <div class="org-gallery__nav">
      <button
        type="button"
        class="org-gallery__nav-btn"
        :disabled="!canScrollPrev"
        aria-label="Предыдущее фото"
        @click="scroll(-1)"
      >
        <Icon
          name="mdi:chevron-left"
          aria-hidden="true"
        />
      </button>
      <button
        type="button"
        class="org-gallery__nav-btn"
        :disabled="!canScrollNext"
        aria-label="Следующее фото"
        @click="scroll(1)"
      >
        <Icon
          name="mdi:chevron-right"
          aria-hidden="true"
        />
      </button>
    </div>
  </section>
</template>

<script setup lang="ts">
  import type { CatalogOrganizationGalleryImage } from '~/common/modules/catalog'

  const props = defineProps<{
    /** Список изображений галереи */
    images: CatalogOrganizationGalleryImage[]
  }>()

  const trackRef = ref<HTMLElement | null>(null)
  const canScrollPrev = ref(false)
  const canScrollNext = ref(false)
  const isDragging = ref(false)
  const dragStartX = ref(0)
  const dragStartScrollLeft = ref(0)

  function updateNav() {
    const track = trackRef.value

    if (!track) {
      return
    }

    const scrollLeft = Math.round(track.scrollLeft)
    const maxScrollLeft = Math.round(track.scrollWidth - track.clientWidth)

    canScrollPrev.value = scrollLeft > 0
    canScrollNext.value = scrollLeft < maxScrollLeft
  }

  function scroll(direction: -1 | 1) {
    const track = trackRef.value

    if (!track) {
      return
    }

    const slide = track.querySelector<HTMLElement>('.org-gallery__slide')
    const gap = 16
    const step = slide ? slide.offsetWidth + gap : track.clientWidth * 0.75

    track.scrollBy({
      left: direction * step,
      behavior: 'smooth',
    })
  }

  function onTrackPointerDown(event: PointerEvent) {
    if (event.button !== 0) {
      return
    }

    const track = trackRef.value

    if (!track) {
      return
    }

    isDragging.value = true
    dragStartX.value = event.clientX
    dragStartScrollLeft.value = track.scrollLeft
    track.setPointerCapture(event.pointerId)
    track.classList.add('org-gallery__track--dragging')
  }

  function onTrackPointerMove(event: PointerEvent) {
    if (!isDragging.value) {
      return
    }

    const track = trackRef.value

    if (!track) {
      return
    }

    event.preventDefault()
    track.scrollLeft = dragStartScrollLeft.value - (event.clientX - dragStartX.value)
    updateNav()
  }

  function onTrackPointerUp(event: PointerEvent) {
    if (!isDragging.value) {
      return
    }

    const track = trackRef.value

    isDragging.value = false

    if (track?.hasPointerCapture(event.pointerId)) {
      track.releasePointerCapture(event.pointerId)
      track.classList.remove('org-gallery__track--dragging')
    }
  }

  watch(
    () => props.images.length,
    async () => {
      await nextTick()
      updateNav()
    },
    { immediate: true },
  )

  onMounted(() => {
    updateNav()
  })

  useWindowResize(updateNav)
</script>

<style scoped>
  .org-gallery {
    margin-bottom: 20px;
    padding: clamp(20px, 3vw, 32px);
    border-radius: 32px;
    background: #1a1a1a;
  }

  .org-gallery__title {
    margin: 0 0 24px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.5vw, 32px);
    font-weight: 400;
    line-height: 1.2;
  }

  .org-gallery__viewport {
    overflow: hidden;
  }

  .org-gallery__track {
    display: flex;
    gap: 16px;
    overflow-x: auto;
    scroll-behavior: smooth;
    scrollbar-width: none;
    -ms-overflow-style: none;
    cursor: grab;
    touch-action: none;
  }

  .org-gallery__track--dragging {
    scroll-behavior: auto;
    cursor: grabbing;
    user-select: none;
  }

  .org-gallery__track--dragging .org-gallery__image {
    pointer-events: none;
  }

  .org-gallery__track::-webkit-scrollbar {
    display: none;
  }

  .org-gallery__slide {
    flex: 0 0 min(320px, 78vw);
    margin: 0;
  }

  .org-gallery__image {
    display: block;
    width: 100%;
    aspect-ratio: 4 / 3;
    border-radius: 24px;
    object-fit: cover;
  }

  .org-gallery__nav {
    display: flex;
    gap: 12px;
    margin-top: 20px;
  }

  .org-gallery__nav-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange-accent-light);
    color: #fff;
    font-size: 28px;
    cursor: pointer;
    transition: opacity 0.2s ease;
  }

  .org-gallery__nav-btn:disabled {
    opacity: 0.35;
    cursor: default;
  }

  @media (hover: hover) {
    .org-gallery__nav-btn:not(:disabled):hover {
      background: var(--tm-orange-anim-4);
    }
  }
</style>
