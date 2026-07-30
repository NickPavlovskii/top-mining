<template>
  <section
    class="buy-asic-problems"
    aria-labelledby="buy-asic-problems-title"
  >
    <div class="buy-asic-problems__inner">
      <top-mining-outline-title
        class="buy-asic-problems__title"
        title-id="buy-asic-problems-title"
        :lead="copy.titleLead"
        :accent="copy.titleAccent"
      />
      <top-mining-pill-tabs
        v-model="activeTabId"
        class="buy-asic-problems__tabs"
        aria-label="Категории проблем"
        tab-id-prefix="buy-asic-problems-tab"
        controls-id-prefix="buy-asic-problems-panel"
        :tabs="tabItems"
      />

      <div
        v-for="tab in copy.tabs"
        :id="`buy-asic-problems-panel-${tab.id}`"
        :key="tab.id"
        class="buy-asic-problems__panel"
        role="tabpanel"
        :hidden="tab.id !== activeTabId"
        :aria-labelledby="`buy-asic-problems-tab-${tab.id}`"
      >
        <div
          v-if="tab.id === activeTabId"
          class="buy-asic-problems__carousel"
        >
          <article class="buy-asic-problems__card">
            <img
              class="buy-asic-problems__icon"
              alt=""
              aria-hidden="true"
              :src="copy.iconSrc"
            >

            <div class="buy-asic-problems__content">
              <div class="buy-asic-problems__top">
                <div
                  class="buy-asic-problems__name"
                  aria-hidden="true"
                >
                  <span
                    v-for="n in activeReview.nameBars"
                    :key="n"
                    class="buy-asic-problems__name-bar"
                  />
                </div>
                <Icon
                  name="mdi:clock-outline"
                  class="buy-asic-problems__clock"
                  aria-hidden="true"
                />
                <span class="buy-asic-problems__time">{{ activeReview.timeAgo }}</span>
              </div>

              <div
                class="buy-asic-problems__stars"
                :aria-label="`Оценка ${activeReview.rating} из 5`"
              >
                <Icon
                  v-for="index in 5"
                  :key="index"
                  :class="[
                    'buy-asic-problems__star',
                    {
                      'buy-asic-problems__star--active':
                        index <= activeReview.rating,
                    },
                  ]"
                  aria-hidden="true"
                  :name="
                    index <= activeReview.rating ? 'mdi:star' : 'mdi:star-outline'
                  "
                />
              </div>

              <p class="buy-asic-problems__text">
                <template
                  v-for="(part, partIndex) in activeReview.parts"
                  :key="partIndex"
                >
                  <span
                    v-if="part.highlight"
                    class="buy-asic-problems__highlight"
                  >{{ part.text }}</span>
                  <template v-else>{{ part.text }}</template>
                </template>
              </p>

              <p
                v-if="activeReview.source"
                class="buy-asic-problems__source"
              >
                {{ activeReview.source }}
              </p>

              <div class="buy-asic-problems__footer">
                <div
                  class="buy-asic-problems__votes"
                  aria-hidden="true"
                >
                  <span class="buy-asic-problems__vote">
                    <Icon name="mdi:thumb-up-outline" />
                    <span>0</span>
                  </span>
                  <span class="buy-asic-problems__vote-sep" />
                  <span class="buy-asic-problems__vote">
                    <span>0</span>
                    <Icon name="mdi:thumb-down-outline" />
                  </span>
                </div>
                <span
                  class="buy-asic-problems__reply"
                  aria-hidden="true"
                >
                  <Icon name="mdi:reply" />
                  <span>{{ copy.replyLabel }}</span>
                </span>
              </div>
            </div>
          </article>

          <button
            type="button"
            class="buy-asic-problems__nav buy-asic-problems__nav--prev"
            aria-label="Предыдущий отзыв"
            @click="prevReview"
          >
            <Icon
              name="mdi:chevron-left"
              aria-hidden="true"
            />
          </button>
          <button
            type="button"
            class="buy-asic-problems__nav buy-asic-problems__nav--next"
            aria-label="Следующий отзыв"
            @click="nextReview"
          >
            <Icon
              name="mdi:chevron-right"
              aria-hidden="true"
            />
          </button>

          <div
            class="buy-asic-problems__dots"
            role="tablist"
            aria-label="Слайды отзывов"
          >
            <button
              v-for="(review, index) in activeTab.reviews"
              :key="review.id"
              type="button"
              :class="[
                'buy-asic-problems__dot',
                {
                  'buy-asic-problems__dot--active':
                    index === activeReviewIndex,
                },
              ]"
              :aria-label="`Отзыв ${index + 1}`"
              :aria-current="index === activeReviewIndex ? 'true' : undefined"
              @click="activeReviewIndex = index"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { BUY_ASIC_CLIENT_PROBLEMS } from '~/common/modules/top-mining/buy-asic-client-problems'

  const copy = BUY_ASIC_CLIENT_PROBLEMS
  const activeTabId = ref(copy.tabs[0]?.id ?? '')
  const activeReviewIndex = ref(0)

  const tabItems = computed(() =>
    copy.tabs.map(({ id, label }) => ({ id, label })),
  )

  const activeTab = computed(
    () => copy.tabs.find((tab) => tab.id === activeTabId.value) ?? copy.tabs[0],
  )

  const activeReview = computed(
    () =>
      activeTab.value.reviews[activeReviewIndex.value]
      ?? activeTab.value.reviews[0],
  )

  watch(activeTabId, () => {
    activeReviewIndex.value = 0
  })

  function prevReview() {
    const total = activeTab.value.reviews.length
    if (!total) {
      return
    }
    activeReviewIndex.value = (activeReviewIndex.value - 1 + total) % total
  }

  function nextReview() {
    const total = activeTab.value.reviews.length
    if (!total) {
      return
    }
    activeReviewIndex.value = (activeReviewIndex.value + 1) % total
  }
</script>

<style scoped>
  .buy-asic-problems {
    background: var(--tm-ink);
    color: #fff;
    padding: 24px 0 88px;
  }

  .buy-asic-problems__inner {
    box-sizing: border-box;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .buy-asic-problems__tabs {
    margin-bottom: 40px;
  }

  .buy-asic-problems__title {
    margin-bottom: 40px;
  }

  .buy-asic-problems__carousel {
    position: relative;
    padding-bottom: 28px;
  }

  .buy-asic-problems__card {
    display: flex;
    gap: 24px;
    box-sizing: border-box;
    width: calc(100% - 136px);
    margin: 0 68px;
    padding: 20px;
    border-radius: 40px;
    background: #262626;
    color: var(--tm-text-soft);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .buy-asic-problems__icon {
    flex-shrink: 0;
    width: 56px;
    height: 56px;
    object-fit: contain;
    border-radius: 50%;
    background: #fff;
  }

  .buy-asic-problems__content {
    min-width: 0;
    flex: 1;
  }

  .buy-asic-problems__top {
    display: flex;
    flex-wrap: wrap;
    gap: 8px 10px;
    align-items: center;
    margin-bottom: 10px;
  }

  .buy-asic-problems__name {
    display: inline-flex;
    gap: 3px;
    align-items: center;
  }

  .buy-asic-problems__name-bar {
    display: block;
    width: 8px;
    height: 10px;
    border-radius: 2px;
    background: rgba(255, 255, 255, 0.28);
  }

  .buy-asic-problems__clock {
    width: 14px;
    height: 14px;
    color: rgba(255, 255, 255, 0.45);
  }

  .buy-asic-problems__time {
    color: rgba(255, 255, 255, 0.45);
    font-size: 13px;
  }

  .buy-asic-problems__stars {
    display: flex;
    gap: 2px;
    margin-bottom: 12px;
  }

  .buy-asic-problems__star {
    width: 16px;
    height: 16px;
    color: rgba(255, 255, 255, 0.22);
  }

  .buy-asic-problems__star--active {
    color: #f5c518;
  }

  .buy-asic-problems__text {
    margin: 0 0 12px;
    color: #fff;
  }

  .buy-asic-problems__highlight {
    text-decoration: underline;
    text-decoration-color: var(--tm-orange);
    text-decoration-thickness: 1px;
    text-underline-offset: 3px;
  }

  .buy-asic-problems__source {
    margin: 0 0 16px;
    color: rgba(255, 255, 255, 0.4);
    font-size: 13px;
  }

  .buy-asic-problems__footer {
    display: flex;
    flex-wrap: wrap;
    gap: 16px 24px;
    align-items: center;
  }

  .buy-asic-problems__votes {
    display: inline-flex;
    gap: 8px;
    align-items: center;
    color: rgba(255, 255, 255, 0.45);
  }

  .buy-asic-problems__vote {
    display: inline-flex;
    gap: 6px;
    align-items: center;
  }

  .buy-asic-problems__vote :deep(svg) {
    width: 16px;
    height: 16px;
  }

  .buy-asic-problems__vote-sep {
    width: 1px;
    height: 14px;
    background: rgba(255, 255, 255, 0.2);
  }

  .buy-asic-problems__reply {
    display: inline-flex;
    gap: 6px;
    align-items: center;
    color: rgba(255, 255, 255, 0.45);
  }

  .buy-asic-problems__reply :deep(svg) {
    width: 16px;
    height: 16px;
  }

  .buy-asic-problems__nav {
    position: absolute;
    top: 50%;
    z-index: 2;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    margin-top: -34px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: rgba(38, 38, 38, 0.95);
    color: #fff;
    cursor: pointer;
  }

  .buy-asic-problems__nav:hover,
  .buy-asic-problems__nav:focus-visible {
    background: #333;
  }

  .buy-asic-problems__nav :deep(svg) {
    width: 22px;
    height: 22px;
  }

  .buy-asic-problems__nav--prev {
    left: 8px;
  }

  .buy-asic-problems__nav--next {
    right: 8px;
  }

  .buy-asic-problems__dots {
    position: absolute;
    right: 0;
    bottom: -14px;
    left: 0;
    display: flex;
    gap: 5px;
    justify-content: center;
  }

  .buy-asic-problems__dot {
    width: 8px;
    height: 8px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.28);
    cursor: pointer;
    transition:
      width 0.2s ease,
      background 0.2s ease;
  }

  .buy-asic-problems__dot--active {
    width: 24px;
    background: rgba(255, 255, 255, 0.75);
  }

  @media (max-width: 1439px) {
    .buy-asic-problems__title {
      margin-bottom: 20px;
    }

    .buy-asic-problems__tabs {
      margin-bottom: 20px;
    }

    .buy-asic-problems__card {
      width: calc(100% - 96px);
      margin: 0 48px;
      padding: 15px;
      border-radius: 20px;
      font-size: 12px;
      line-height: 16px;
    }

    .buy-asic-problems__dot {
      width: 6px;
      height: 6px;
    }

    .buy-asic-problems__dot--active {
      width: 24px;
    }
  }

  @media (max-width: 760px) {
    .buy-asic-problems {
      padding: 16px 0 64px;
    }

    .buy-asic-problems__inner {
      padding: 0 16px;
    }

    .buy-asic-problems__card {
      width: 100%;
      margin: 0;
      gap: 14px;
    }

    .buy-asic-problems__icon {
      width: 44px;
      height: 44px;
    }

    .buy-asic-problems__nav {
      width: 34px;
      height: 34px;
    }

    .buy-asic-problems__nav--prev {
      left: -4px;
    }

    .buy-asic-problems__nav--next {
      right: -4px;
    }
  }
</style>
