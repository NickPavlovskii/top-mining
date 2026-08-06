<template>
  <div
    :class="[
      'tm-lazy-image',
      `tm-lazy-image--${tone}`,
      {
        'tm-lazy-image--loaded': status === 'loaded',
        'tm-lazy-image--error': status === 'error' || status === 'empty',
        'tm-lazy-image--rounded': rounded,
      },
    ]"
    :style="rootStyle"
  >
    <div
      v-if="status === 'loading'"
      class="tm-lazy-image__skeleton"
      aria-hidden="true"
    />

    <img
      v-if="resolvedSrc"
      ref="imgRef"
      v-show="status === 'loaded'"
      class="tm-lazy-image__img"
      :class="imgClass"
      :src="resolvedSrc"
      :alt="alt"
      :loading="loading"
      decoding="async"
      draggable="false"
      @load="onLoad"
      @error="onError"
    >

    <div
      v-if="(status === 'error' || status === 'empty') && showBrandFallback"
      class="tm-lazy-image__fallback"
      aria-hidden="true"
    >
      <img
        class="tm-lazy-image__fallback-icon"
        :src="fallbackSrc"
        alt=""
      >
    </div>
  </div>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

  /**
   * Ленивая картинка со скелетоном.
   * Нет src / ошибка загрузки → скелетон + иконка бренда.
   * Уже закэшированные img часто не шлют @load — проверяем complete.
   */
  const props = withDefaults(
    defineProps<{
      src?: string | null
      alt?: string
      aspectRatio?: string
      objectFit?: 'cover' | 'contain'
      loading?: 'lazy' | 'eager'
      rounded?: boolean
      imgClass?: string
      fallbackSrc?: string
      showBrandFallback?: boolean
      tone?: 'dark' | 'light'
    }>(),
    {
      src: '',
      alt: '',
      aspectRatio: '16 / 10',
      objectFit: 'cover',
      loading: 'lazy',
      rounded: true,
      imgClass: '',
      fallbackSrc: undefined,
      showBrandFallback: true,
      tone: 'dark',
    },
  )

  const emit = defineEmits<{
    load: []
    error: []
  }>()

  const status = ref<'loading' | 'loaded' | 'error' | 'empty'>('loading')
  const imgRef = ref<HTMLImageElement | null>(null)

  const resolvedSrc = computed(() => String(props.src || '').trim())

  const fallbackSrc = computed(() => props.fallbackSrc || logoMark)

  const rootStyle = computed(() => ({
    '--tm-lazy-aspect': props.aspectRatio,
    '--tm-lazy-fit': props.objectFit,
  }))

  function syncFromSrc() {
    if (!resolvedSrc.value) {
      status.value = 'empty'
      return
    }

    status.value = 'loading'
  }

  function syncFromElement() {
    const img = imgRef.value
    if (!img || !resolvedSrc.value || status.value !== 'loading') {
      return
    }

    // Cached / already-decoded images may skip the load event.
    if (img.complete) {
      if (img.naturalWidth > 0) {
        onLoad()
      } else {
        onError()
      }
    }
  }

  watch(
    () => props.src,
    () => {
      syncFromSrc()
    },
    { immediate: true },
  )

  watch(imgRef, () => {
    nextTick(syncFromElement)
  })

  onMounted(() => {
    nextTick(syncFromElement)
  })

  function onLoad() {
    if (status.value === 'loaded') {
      return
    }

    status.value = 'loaded'
    emit('load')
  }

  function onError() {
    status.value = 'error'
    emit('error')
  }
</script>

<style scoped>
  .tm-lazy-image {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 100%;
    aspect-ratio: var(--tm-lazy-aspect);
    background: #1c1c1c;
  }

  .tm-lazy-image--light {
    background: #ececec;
  }

  .tm-lazy-image--rounded {
    border-radius: inherit;
  }

  .tm-lazy-image__skeleton {
    position: absolute;
    inset: 0;
    background: linear-gradient(
      110deg,
      #1a1a1a 0%,
      #1a1a1a 35%,
      #2a2a2a 50%,
      #1a1a1a 65%,
      #1a1a1a 100%
    );
    background-size: 200% 100%;
    animation: tm-lazy-shimmer 1.35s ease-in-out infinite;
  }

  .tm-lazy-image--light .tm-lazy-image__skeleton {
    background: linear-gradient(
      110deg,
      #e8e8e8 0%,
      #e8e8e8 35%,
      #f5f5f5 50%,
      #e8e8e8 65%,
      #e8e8e8 100%
    );
    background-size: 200% 100%;
  }

  .tm-lazy-image__img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: var(--tm-lazy-fit);
  }

  .tm-lazy-image__fallback {
    position: absolute;
    inset: 0;
    z-index: 1;
    display: grid;
    place-items: center;
    background: transparent;
  }

  .tm-lazy-image--dark .tm-lazy-image__fallback {
    background: rgba(24, 24, 24, 0.35);
  }

  .tm-lazy-image--light .tm-lazy-image__fallback {
    background: rgba(255, 255, 255, 0.28);
  }

  .tm-lazy-image__fallback-icon {
    width: min(48%, 56px);
    height: auto;
    opacity: 0.78;
    object-fit: contain;
  }

  @keyframes tm-lazy-shimmer {
    0% {
      background-position: 100% 0;
    }

    100% {
      background-position: -100% 0;
    }
  }
</style>
