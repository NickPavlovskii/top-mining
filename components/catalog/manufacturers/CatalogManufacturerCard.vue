<template>
  <button
    type="button"
    class="catalog-mfr-card"
    @click="openManufacturer"
  >
    <div class="catalog-mfr-card__logo">
      <top-mining-lazy-image
        class="catalog-mfr-card__lazy-logo"
        tone="light"
        aspect-ratio="1 / 1"
        object-fit="contain"
        :src="manufacturer.logoUrl"
        :rounded="false"
        :alt="manufacturer.name"
        :show-brand-fallback="true"
        @error="onLogoError"
      />
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

      <p
        v-if="manufacturer.modelsCount > 0"
        class="catalog-mfr-card__tag"
      >
        <img
          class="catalog-mfr-card__tag-icon"
          alt=""
          aria-hidden="true"
          :src="catalogModelsGridIcon"
        />
        <span class="catalog-mfr-card__tag-text">
          <span class="catalog-mfr-card__tag-label">{{ t('catalog.modelsCount') }}</span>
          <span class="catalog-mfr-card__tag-value">{{ modelsCountLabel }}</span>
        </span>
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
        <span>{{ t('catalog.founded') }} {{ manufacturer.foundedYear }}</span>
      </p>
    </div>
  </button>
</template>

<script setup lang="ts">
  import type { CatalogManufacturer } from '~/common/modules/catalog'
  import TopMiningLazyImage from '~/components/global/media/TopMiningLazyImage.vue'
  import catalogQualityIcon from '~/assets/images/catalog/quality.png'
  import catalogModelsGridIcon from '~/assets/images/catalog/models-grid.png'

  const { t } = useT()

  const props = defineProps<{
    manufacturer: CatalogManufacturer
  }>()

  const logoFailed = ref(false)

  const showLogoImage = computed(
    () => Boolean(props.manufacturer.logoUrl) && !logoFailed.value,
  )

  watch(
    () => props.manufacturer.logoUrl,
    () => {
      logoFailed.value = false
    },
  )

  const ratingLabel = computed(() => {
    if (props.manufacturer.rating <= 0) {
      return t('catalog.noRating')
    }

    const value = Number.isInteger(props.manufacturer.rating)
      ? String(props.manufacturer.rating)
      : props.manufacturer.rating.toFixed(1)

    return `${t('catalog.ratingLabel')} ${value}`
  })

  const modelsCountLabel = computed(() => {
    const count = props.manufacturer.modelsCount

    if (count >= 10) {
      return `${count}+`
    }

    return String(count)
  })

  function onLogoError() {
    logoFailed.value = true
  }

  /** Детальной страницы ещё нет — открываем заготовку со скелетонами. */
  function openManufacturer() {
    return navigateTo(`/asic-manufacturers/${props.manufacturer.slug}/`)
  }
</script>

<style scoped>
  .catalog-mfr-card {
    display: flex;
    align-items: flex-start;
    gap: clamp(12px, 2vw, 24px);
    width: 100%;
    min-width: 0;
    min-height: 148px;
    padding: clamp(16px, 2vw, 24px);
    border: 0;
    border-radius: 32px;
    background: #fff;
    color: inherit;
    text-align: left;
    text-decoration: none;
    box-sizing: border-box;
    overflow: hidden;
    cursor: pointer;
    font: inherit;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  @media (hover: hover) {
    .catalog-mfr-card:hover,
    .catalog-mfr-card:focus-visible {
      transform: translateY(-2px);
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }
  }

  .catalog-mfr-card:focus-visible {
    outline: 2px solid var(--tm-orange, #ff5c00);
    outline-offset: 2px;
  }

  .catalog-mfr-card__logo {
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: clamp(64px, 10vw, 96px);
    height: clamp(64px, 10vw, 96px);
    padding: 0;
    border-radius: 20px;
    background: #f3f3f3;
    box-sizing: border-box;
    overflow: hidden;
  }

  .catalog-mfr-card__lazy-logo {
    width: 100%;
    height: 100%;
  }

  .catalog-mfr-card__lazy-logo :deep(.tm-lazy-image) {
    aspect-ratio: auto;
    height: 100%;
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
    min-width: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 24px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.02em;
    text-transform: uppercase;
    overflow-wrap: anywhere;
  }

  .catalog-mfr-card__rating {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    max-width: 100%;
    padding: 4px 10px 4px 8px;
    border-radius: 999px;
    background: #f4f4f4;
    color: #141414;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
    box-sizing: border-box;
  }

  .catalog-mfr-card__rating-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-card__tag {
    display: inline-flex;
    align-items: flex-start;
    gap: 6px;
    margin: 0;
    max-width: 100%;
    padding: 6px 12px 6px 10px;
    border-radius: 999px;
    background: #f4f4f4;
    color: #141414;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.25;
    box-sizing: border-box;
  }

  .catalog-mfr-card__tag-icon {
    width: 16px;
    height: 16px;
    margin-top: 1px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-card__tag-text {
    display: inline;
    min-width: 0;
    overflow-wrap: anywhere;
  }

  .catalog-mfr-card__tag-label,
  .catalog-mfr-card__tag-value {
    white-space: normal;
  }

  .catalog-mfr-card__founded {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    max-width: 100%;
    min-width: 0;
    color: var(--tm-orange);
    font-size: 13px;
    font-weight: 600;
    line-height: 1.2;
  }

  .catalog-mfr-card__founded span {
    min-width: 0;
    overflow-wrap: anywhere;
  }

  .catalog-mfr-card__founded-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
  }

  @media (max-width: 900px) {
    .catalog-mfr-card {
      flex-direction: column;
      align-items: stretch;
      gap: 14px;
    }

    .catalog-mfr-card__logo {
      width: 72px;
      height: 72px;
    }
  }
</style>
