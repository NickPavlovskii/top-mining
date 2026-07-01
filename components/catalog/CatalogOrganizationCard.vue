<template>
  <a
    :href="organization.href || '#'"
    class="catalog-org-card"
    target="_blank"
    rel="noopener noreferrer"
  >
    <div class="catalog-org-card__inner">
      <div class="catalog-org-card__logo">
        <img
          v-if="organization.logoUrl"
          loading="lazy"
          :src="organization.logoUrl"
          :alt="organization.name"
          @load="onLogoLoad"
        />
        <span
          v-else
          class="catalog-org-card__logo-fallback"
        >
          {{ initials }}
        </span>
      </div>

      <div class="catalog-org-card__title-wrap">
        <div class="catalog-org-card__name">
          {{ organization.name }}
        </div>
      </div>

      <div class="catalog-org-card__rating">
        <span
          class="catalog-org-card__star"
          aria-hidden="true"
        >
          ★
        </span>
        <span class="catalog-org-card__rating-value">
          {{ ratingLabel }}
        </span>
        <span class="catalog-org-card__reviews">
          Отзывов: {{ organization.reviewCount }}
        </span>
      </div>
    </div>
  </a>
</template>

<script setup lang="ts">
  import type { CatalogOrganization } from '~/types/catalog'

  const props = defineProps<{
    organization: CatalogOrganization
  }>()

  const emit = defineEmits<{
    logoLoad: []
  }>()

  const ratingLabel = computed(() => formatRating(props.organization.rating))

  const initials = computed(() => getInitials(props.organization.name))

  function formatRating(value: number) {
    if (value <= 0) {
      return '0'
    }

    return Number.isInteger(value) ? String(value) : value.toFixed(1)
  }

  function getInitials(name: string) {
    return name
      .split(/\s+/)
      .slice(0, 2)
      .map((part) => part[0]?.toUpperCase() ?? '')
      .join('')
  }

  function onLogoLoad() {
    emit('logoLoad')
  }
</script>

<style scoped>
  .catalog-org-card {
    flex: 0 0 clamp(220px, 17vw, 260px);
    display: flex;
    align-self: stretch;
    color: inherit;
    text-decoration: none;
    scroll-snap-align: start;
  }

  .catalog-org-card__inner {
    display: flex;
    flex: 1;
    flex-direction: column;
    align-items: flex-start;
    width: 100%;
    min-height: 168px;
    padding: 24px;
    border-radius: 32px;
    background: #fff;
    box-sizing: border-box;
    transition: transform 0.2s ease;
  }

  .catalog-org-card:hover .catalog-org-card__inner {
    transform: translateY(-2px);
  }

  .catalog-org-card__logo {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 56px;
    height: 56px;
    margin-bottom: 16px;
    padding: 6px;
    border-radius: 14px;
    background: #f3f3f3;
    overflow: hidden;
    box-sizing: border-box;
  }

  .catalog-org-card__logo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
    object-position: center;
  }

  .catalog-org-card__logo-fallback {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    border-radius: 12px;
    background: #ececec;
    color: #666;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.04em;
  }

  .catalog-org-card__title-wrap {
    flex: 1;
    width: 100%;
    min-height: calc(16px * 1.25 * 2);
    margin-bottom: 20px;
  }

  .catalog-org-card__name {
    margin: 0;
    color: #141414;
    font-size: 16px;
    font-weight: 600;
    line-height: 1.25;
    text-align: left;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
  }

  .catalog-org-card__rating {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 6px 8px;
    margin-top: auto;
    flex-shrink: 0;
    width: 100%;
    color: #141414;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.2;
  }

  .catalog-org-card__star {
    color: #f5b301;
    font-size: 15px;
    line-height: 1;
  }

  .catalog-org-card__rating-value {
    font-weight: 600;
  }

  .catalog-org-card__reviews {
    font-weight: 500;
  }
</style>
