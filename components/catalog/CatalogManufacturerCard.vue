<template>
  <a
    :href="manufacturer.href"
    class="catalog-mfr-card"
    target="_blank"
    rel="noopener noreferrer"
  >
    <div class="catalog-mfr-card__logo">
      <img
        v-if="manufacturer.logoUrl"
        loading="lazy"
        :src="manufacturer.logoUrl"
        :alt="manufacturer.name"
      />
      <span
        v-else
        class="catalog-mfr-card__logo-fallback"
      >
        {{ initials }}
      </span>
    </div>

    <div class="catalog-mfr-card__body">
      <h2 class="catalog-mfr-card__name">
        {{ manufacturer.name }}
      </h2>

      <div class="catalog-mfr-card__rating">
        <img
          class="catalog-mfr-card__rating-icon"
          alt=""
          aria-hidden="true"
          :src="catalogQualityIcon"
        />
        <span>{{ ratingLabel }}</span>
      </div>

      <p class="catalog-mfr-card__tag">
        <img
          class="catalog-mfr-card__tag-icon"
          alt=""
          aria-hidden="true"
          :src="catalogModelsGridIcon"
        />
        <span>Количество моделей: {{ modelsCountLabel }}</span>
      </p>

      <p
        v-if="manufacturer.foundedYear"
        class="catalog-mfr-card__founded"
      >
        <Icon
          name="mdi:calendar-month-outline"
          class="catalog-mfr-card__founded-icon"
          aria-hidden="true"
        />
        <span>Год основания: {{ manufacturer.foundedYear }}</span>
      </p>
    </div>
  </a>
</template>

<script setup lang="ts">
  import type { CatalogManufacturer } from '~/types/catalog-manufacturers'
  import catalogQualityIcon from '~/assets/images/catalog/quality.png'
  import catalogModelsGridIcon from '~/assets/images/catalog/models-grid.png'

  const props = defineProps<{
    manufacturer: CatalogManufacturer
  }>()

  const ratingLabel = computed(() => {
    if (props.manufacturer.rating <= 0) {
      return 'Нет рейтинга'
    }

    const value = Number.isInteger(props.manufacturer.rating)
      ? String(props.manufacturer.rating)
      : props.manufacturer.rating.toFixed(1)

    return `Рейтинг: ${value}`
  })

  const modelsCountLabel = computed(() => {
    const count = props.manufacturer.modelsCount

    if (count >= 10) {
      return `${count}+`
    }

    return String(count)
  })

  const initials = computed(() =>
    props.manufacturer.name
      .split(/\s+/)
      .slice(0, 2)
      .map((part) => part[0]?.toUpperCase() ?? '')
      .join(''),
  )
</script>

<style scoped>
  .catalog-mfr-card {
    display: flex;
    align-items: flex-start;
    gap: clamp(16px, 2vw, 24px);
    min-height: 148px;
    padding: clamp(18px, 2vw, 24px);
    border-radius: 32px;
    background: #fff;
    color: inherit;
    text-decoration: none;
    box-sizing: border-box;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  @media (hover: hover) {
    .catalog-mfr-card:hover,
    .catalog-mfr-card:focus-visible {
      transform: translateY(-2px);
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }
  }

  .catalog-mfr-card__logo {
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: clamp(72px, 10vw, 96px);
    height: clamp(72px, 10vw, 96px);
    padding: 10px;
    border-radius: 20px;
    background: #f3f3f3;
    box-sizing: border-box;
    overflow: hidden;
  }

  .catalog-mfr-card__logo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .catalog-mfr-card__logo-fallback {
    font-size: 18px;
    font-weight: 700;
    color: #666;
  }

  .catalog-mfr-card__body {
    display: grid;
    gap: 10px;
    min-width: 0;
    flex: 1 1 auto;
    padding-top: 2px;
  }

  .catalog-mfr-card__name {
    margin: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 2vw, 24px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.02em;
    text-transform: uppercase;
  }

  .catalog-mfr-card__rating {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    width: max-content;
    padding: 4px 10px 4px 8px;
    border-radius: 999px;
    background: #f4f4f4;
    color: #141414;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
  }

  .catalog-mfr-card__rating-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-card__tag {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    width: max-content;
    padding: 6px 12px 6px 10px;
    border-radius: 999px;
    background: #f4f4f4;
    color: #141414;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
  }

  .catalog-mfr-card__tag-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-card__founded {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    color: var(--tm-orange);
    font-size: 13px;
    font-weight: 600;
    line-height: 1.2;
  }

  .catalog-mfr-card__founded-icon {
    width: 16px;
    height: 16px;
  }
</style>
