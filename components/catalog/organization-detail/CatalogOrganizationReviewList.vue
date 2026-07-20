<template>
  <div class="org-reviews__list-wrap">
    <div class="org-reviews__footer">
      <div class="org-reviews__footer-head">
        <p class="org-reviews__footer-count">
          {{ reviewCountUpperLabel }}
        </p>
        <label
          v-if="reviews.length"
          class="org-reviews__sort"
        >
          <span class="sr-only">Сортировка отзывов</span>
          <select
            :value="sort"
            class="org-reviews__sort-select"
            @change="onSortChange"
          >
            <option
              v-for="option in ORGANIZATION_REVIEW_SORT_OPTIONS"
              :key="option.value"
              :value="option.value"
            >
              {{ option.label }}
            </option>
          </select>
          <Icon
            name="mdi:chevron-down"
            class="org-reviews__sort-icon"
            aria-hidden="true"
          />
        </label>
      </div>
      <div class="org-reviews__footer-line" />
    </div>

    <ul
      v-if="reviews.length"
      class="org-reviews__list"
    >
      <li
        v-for="review in reviews"
        :key="review.id"
        class="org-reviews__item"
      >
        <div class="org-reviews__item-head">
          <img
            :src="logoMark"
            alt=""
            class="org-reviews__item-avatar"
          />
          <div class="org-reviews__item-meta">
            <p class="org-reviews__item-name">
              {{ review.authorName }}
            </p>
            <p class="org-reviews__item-date">
              <Icon
                name="mdi:clock-outline"
                aria-hidden="true"
              />
              {{ formatDateTime(review.publishedAt) }}
            </p>
          </div>
        </div>

        <div
          class="org-reviews__item-stars"
          :aria-label="`Оценка ${review.rating}`"
        >
          <Icon
            v-for="index in 5"            
            class="org-reviews__item-star"
            aria-hidden="true"
            :key="`${review.id}-${index}`"
            :name="index <= review.rating ? 'mdi:star' : 'mdi:star-outline'"
          />
        </div>

        <p class="org-reviews__item-content">
          {{ review.content }}
        </p>

        <p class="org-reviews__item-source">
          {{ review.source }}
        </p>

        <div class="org-reviews__item-actions">
          <span class="org-reviews__votes">
            <Icon
              name="mdi:thumb-up-outline"
              aria-hidden="true"
            />
            {{ review.likesCount }}
            <span aria-hidden="true">|</span>
            <Icon
              name="mdi:thumb-down-outline"
              aria-hidden="true"
            />
            {{ review.dislikesCount }}
          </span>
          <button
            type="button"
            class="org-reviews__reply"
          >
            <Icon
              name="mdi:reply"
              aria-hidden="true"
            />
            Ответить
          </button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'
  import { ORGANIZATION_REVIEW_SORT_OPTIONS } from '~/common/modules/catalog'
  import { formatDateTime } from '~/common/modules/format/date'
  import type {
    OrganizationReview,
    OrganizationReviewSort,
  } from '~/types/organization-reviews'

  defineProps<{
    reviews: OrganizationReview[]
    reviewCountUpperLabel: string
  }>()

  const sort = defineModel<OrganizationReviewSort>('sort', { required: true })

  function onSortChange(event: Event) {
    sort.value = (event.target as HTMLSelectElement).value as OrganizationReviewSort
  }
</script>

<style scoped>
  .org-reviews__footer {
    display: grid;
    gap: 16px;
    margin-bottom: 24px;
  }

  .org-reviews__footer-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
  }

  .org-reviews__footer-count {
    margin: 0;
    color: #8a8a8a;
    font-size: 14px;
    letter-spacing: 0.04em;
  }

  .org-reviews__footer-line {
    height: 1px;
    background: #3a3a3a;
  }

  .org-reviews__sort {
    position: relative;
    display: inline-flex;
    align-items: center;
  }

  .org-reviews__sort-select {
    appearance: none;
    padding: 8px 32px 8px 12px;
    border: 0;
    border-radius: 12px;
    background: transparent;
    color: #fff;
    font: inherit;
    cursor: pointer;
  }

  .org-reviews__sort-icon {
    position: absolute;
    right: 8px;
    pointer-events: none;
    color: #bdbdbd;
    font-size: 20px;
  }

  .org-reviews__list {
    display: grid;
    gap: 16px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .org-reviews__item {
    padding: 20px 24px;
    border-radius: 24px;
    background: #141414;
  }

  .org-reviews__item-head {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
  }

  .org-reviews__item-avatar {
    width: 56px;
    height: 56px;
    border-radius: 16px;
    object-fit: contain;
    background: #161e35;
    padding: 8px;
    box-sizing: border-box;
  }

  .org-reviews__item-meta {
    min-width: 0;
  }

  .org-reviews__item-name {
    margin: 0 0 4px;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.3;
  }

  .org-reviews__item-date {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    color: #bdbdbd;
    font-size: 14px;
    line-height: 1.3;
  }

  .org-reviews__item-stars {
    display: flex;
    gap: 6px;
    margin-bottom: 12px;
  }

  .org-reviews__item-star {
    color: #ffb400;
    font-size: 22px;
  }

  .org-reviews__item-content {
    margin: 0 0 12px;
    font-size: 16px;
    line-height: 1.6;
  }

  .org-reviews__item-source {
    margin: 0 0 16px;
    color: #757575;
    font-size: 14px;
    line-height: 1.4;
  }

  .org-reviews__item-actions {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
  }

  .org-reviews__votes {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #bdbdbd;
    font-size: 14px;
    line-height: 1.3;
  }

  .org-reviews__reply {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 0;
    border: 0;
    background: none;
    color: #fff;
    font: inherit;
    cursor: pointer;
  }

  .sr-only {
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
</style>
