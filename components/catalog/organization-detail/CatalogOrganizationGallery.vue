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
  import type { CatalogOrganizationGalleryImage } from '~/types/catalog-organization-detail'

  const props = defineProps<{
    images: CatalogOrganizationGalleryImage[]
  }>()

  const trackRef = ref<HTMLElement | null>(null)
  const canScrollPrev = ref(false)
  const canScrollNext = ref(false)

  function updateNav() {
    const track = trackRef.value

    if (!track) {
      return
    }

    canScrollPrev.value = track.scrollLeft > 4
    canScrollNext.value = track.scrollLeft + track.clientWidth < track.scrollWidth - 4
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
    window.addEventListener('resize', updateNav)
  })

  onBeforeUnmount(() => {
    window.removeEventListener('resize', updateNav)
  })
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
    background: #ff741f;
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
      background: #ff853b;
    }
  }
</style>
