<template>
  <section
    class="podbor-placement"
    aria-labelledby="podbor-placement-title"
  >
    <div class="podbor-placement__inner">
      <div class="podbor-placement__header">
        <h2
          id="podbor-placement-title"
          class="podbor-placement__title"
        >
          {{ placement.title }}
        </h2>

        <div class="podbor-placement__nav">
          <button
            type="button"
            :class="[
              'podbor-placement__nav-btn',
              { 'podbor-placement__nav-btn--inactive': !canScrollLeft },
            ]"
            aria-label="Прокрутить влево"
            @click="scroll(-1)"
          >
            <Icon
              name="mdi:chevron-left"
              class="podbor-placement__nav-icon"
              aria-hidden="true"
            />
          </button>
          <button
            type="button"
            :class="[
              'podbor-placement__nav-btn',
              { 'podbor-placement__nav-btn--inactive': !canScrollRight },
            ]"
            aria-label="Прокрутить вправо"
            @click="scroll(1)"
          >
            <Icon
              name="mdi:chevron-right"
              class="podbor-placement__nav-icon"
              aria-hidden="true"
            />
          </button>
        </div>
      </div>

      <div
        ref="trackRef"
        :class="[
          'podbor-placement__track',
          { 'podbor-placement__track--dragging': isDragging },
        ]"
        @scroll="updateScrollState"
        @pointerdown="onTrackPointerDown"
        @pointermove="onTrackPointerMove"
        @pointerup="onTrackPointerUp"
        @pointercancel="onTrackPointerUp"
      >
        <article
          v-for="offer in placement.offers"
          :key="offer.id"
          class="podbor-placement-card"
        >
          <div class="podbor-placement-card__media">
            <img
              class="podbor-placement-card__image"
              loading="lazy"
              decoding="async"
              :src="offer.image"
              :alt="offer.title"
            >
          </div>

          <h3 class="podbor-placement-card__title">
            {{ offer.title }}
          </h3>

          <p class="podbor-placement-card__price">
            <span class="podbor-placement-card__price-label">
              {{ offer.priceLabel }}
            </span>
            {{ ' ' }}
            <span class="podbor-placement-card__price-value">
              {{ offer.priceValue }}
            </span>
          </p>

          <p class="podbor-placement-card__location">
            <svg
              class="podbor-placement-card__pin"
              viewBox="0 0 24 24"
              aria-hidden="true"
              focusable="false"
            >
              <path
                fill="currentColor"
                d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"
              />
            </svg>
            <span>{{ offer.location }}</span>
          </p>

          <button
            type="button"
            class="podbor-placement-card__cta"
            @click="openTariffModal(offer)"
          >
            <span>{{ placement.ctaLabel }}</span>
            <img
              class="podbor-placement-card__cta-icon"
              alt=""
              aria-hidden="true"
              :src="arrowIcon"
            >
          </button>
        </article>

        <button
          type="button"
          class="podbor-placement-add"
          @click="isAddModalOpen = true"
        >
          <span
            class="podbor-placement-add__icon"
            aria-hidden="true"
          >+</span>
          <span class="podbor-placement-add__label">
            {{ placement.addCardLabel }}
          </span>
        </button>
      </div>
    </div>

    <podbor-mining-hotel-add-card-modal v-model:open="isAddModalOpen" />
    <podbor-mining-hotel-tariff-modal
      v-model:open="isTariffModalOpen"
      :offer="selectedOffer"
    />
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor-mining-hotel'
  import { PODBOR_MINING_HOTEL_PLACEMENT } from '~/common/modules/top-mining/podbor-mining-hotel'
  import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'
  import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

  const placement = PODBOR_MINING_HOTEL_PLACEMENT
  const isAddModalOpen = ref(false)
  const isTariffModalOpen = ref(false)
  const selectedOffer = ref<PodborPlacementOffer | null>(null)
  const trackRef = ref<HTMLElement | null>(null)
  const canScrollLeft = ref(false)
  const canScrollRight = ref(true)
  const isPointerDown = ref(false)
  const isDragging = ref(false)
  const dragStartX = ref(0)
  const dragStartScrollLeft = ref(0)

  function openTariffModal(offer: PodborPlacementOffer) {
    selectedOffer.value = offer
    isTariffModalOpen.value = true
  }

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

    // тяга только после заметного сдвига — клики по карточке не ломаем
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

    const card = track.querySelector<HTMLElement>('.podbor-placement-card')
    const gap = 24
    const step = card ? card.offsetWidth + gap : Math.max(track.clientWidth * 0.7, 280)

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
  .podbor-placement {
    background: #141414;
    color: var(--tm-white);
    padding: 48px 0 64px;
  }

  .podbor-placement__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-placement__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    margin-bottom: 32px;
  }

  .podbor-placement__title {
    margin: 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3vw, 44px);
    font-weight: 500;
    line-height: 1.1;
    text-transform: uppercase;
  }

  .podbor-placement__nav {
    display: flex;
    gap: 12px;
    flex-shrink: 0;
  }

  .podbor-placement__nav-btn {
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

  .podbor-placement__nav-icon {
    display: block;
    width: 28px;
    height: 28px;
    flex-shrink: 0;
  }

  .podbor-placement__nav-btn--inactive {
    opacity: 0.4;
    cursor: default;
  }

  .podbor-placement__nav-btn:not(.podbor-placement__nav-btn--inactive):hover {
    filter: brightness(1.08);
  }

  .podbor-placement__track {
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

  .podbor-placement__track--dragging {
    cursor: grabbing;
    scroll-snap-type: none;
    user-select: none;
  }

  .podbor-placement__track::-webkit-scrollbar {
    display: none;
  }

  .podbor-placement-card {
    flex: 0 0 min(360px, 78vw);
    width: min(360px, 78vw);
    max-width: 360px;
    scroll-snap-align: start;
    display: flex;
    flex-direction: column;
    min-width: 0;
  }

  .podbor-placement-card__media {
    margin-bottom: 16px;
    border-radius: 24px;
    overflow: hidden;
    aspect-ratio: 1 / 1;
    background: #1f1f1f;
  }

  .podbor-placement-card__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    pointer-events: none;
  }

  .podbor-placement-card__title {
    margin: 0 0 10px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .podbor-placement-card__price {
    margin: 0 0 8px;
    font-size: 15px;
    line-height: 1.35;
  }

  .podbor-placement-card__price-label {
    color: rgba(255, 255, 255, 0.55);
    margin-right: 0.35em;
  }

  .podbor-placement-card__price-value {
    color: #f6f6f6;
    font-weight: 600;
  }

  .podbor-placement-card__location {
    margin: 0 0 16px;
    display: flex;
    align-items: center;
    gap: 6px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    line-height: 1.3;
  }

  .podbor-placement-card__pin {
    flex-shrink: 0;
    width: 14px;
    height: 14px;
  }

  .podbor-placement-card__cta {
    margin-top: auto;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
  }

  .podbor-placement-card__cta:hover,
  .podbor-placement-card__cta:focus-visible {
    filter: brightness(1.1);
  }

  .podbor-placement-card__cta-icon {
    width: 12px;
    height: 12px;
    object-fit: contain;
    filter: brightness(0) saturate(100%) invert(48%) sepia(93%) saturate(1800%)
      hue-rotate(1deg) brightness(102%) contrast(104%);
  }

  .podbor-placement-add {
    flex: 0 0 min(360px, 78vw);
    width: min(360px, 78vw);
    max-width: 360px;
    aspect-ratio: 1 / 1;
    align-self: flex-start;
    scroll-snap-align: start;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 16px;
    padding: 24px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 24px;
    background: transparent;
    cursor: pointer;
    text-align: center;
    transition: border-color 0.2s ease;
  }

  .podbor-placement-add:hover,
  .podbor-placement-add:focus-visible {
    border-color: var(--tm-orange);
  }

  .podbor-placement-add__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: var(--tm-orange);
    color: #fff;
    font-size: 32px;
    line-height: 1;
  }

  .podbor-placement-add__label {
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.03em;
    text-transform: uppercase;
    line-height: 1.35;
  }

  @media (max-width: 1600px) {
    .podbor-placement__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-placement {
      padding: 40px 0 56px;
    }

    .podbor-placement__inner {
      padding: 0 24px;
    }

    .podbor-placement__header {
      margin-bottom: 24px;
    }

    .podbor-placement-card {
      flex-basis: min(300px, 72vw);
      width: min(300px, 72vw);
      max-width: 300px;
    }

    .podbor-placement-add {
      flex-basis: min(300px, 72vw);
      width: min(300px, 72vw);
      max-width: 300px;
    }
  }

  @media (max-width: 767px) {
    .podbor-placement {
      padding: 32px 0 48px;
    }

    .podbor-placement__inner {
      padding: 0 16px;
    }

    .podbor-placement__title {
      font-size: 24px;
    }

    .podbor-placement__nav-btn {
      width: 40px;
      height: 40px;
    }

    .podbor-placement__nav-icon {
      width: 24px;
      height: 24px;
    }

    .podbor-placement__track {
      gap: 16px;
    }

    .podbor-placement-card__title {
      font-size: 16px;
    }
  }
</style>
