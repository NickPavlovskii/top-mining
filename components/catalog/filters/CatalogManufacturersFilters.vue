<template>
  <aside class="catalog-mfr-filters">
    <div class="catalog-mfr-filters__panel">
      <section class="catalog-mfr-filters__section">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-mfr-filters__section-head"
          :aria-expanded="sections.algorithms"
          @click="sections.algorithms = !sections.algorithms"
        >
          <span class="catalog-mfr-filters__section-title">Алгоритмы ASIC</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-mfr-filters__chevron',
                { 'catalog-mfr-filters__chevron--collapsed': !sections.algorithms },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.algorithms"
          class="catalog-mfr-filters__section-body"
        >
          <label class="catalog-mfr-filters__search">
            <img
              alt=""
              aria-hidden="true"
              class="catalog-mfr-filters__search-icon"
              :src="catalogSearchIcon"
            />
            <input
              v-model="algorithmQuery"
              type="search"
              class="catalog-mfr-filters__search-input"
              placeholder="Поиск..."
              autocomplete="off"
            />
          </label>

          <p class="catalog-mfr-filters__all-label">Все</p>

          <ul class="catalog-mfr-filters__list">
            <li
              v-for="option in visibleAlgorithmFilters"
              :key="option.id"
            >
              <top-mining-checkbox
                v-model="selectedAlgorithms[option.id]"
                size="sm"
                :label="option.label"
              />
            </li>
          </ul>
        </div>
      </section>

      <section class="catalog-mfr-filters__section">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-mfr-filters__section-head"
          :aria-expanded="sections.models"
          @click="sections.models = !sections.models"
        >
          <span class="catalog-mfr-filters__section-title">Кол-во моделей</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-mfr-filters__chevron',
                { 'catalog-mfr-filters__chevron--collapsed': !sections.models },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.models"
          class="catalog-mfr-filters__section-body"
        >
          <label class="catalog-mfr-filters__search">
            <img
              alt=""
              aria-hidden="true"
              class="catalog-mfr-filters__search-icon"
              :src="catalogSearchIcon"
            />
            <input
              v-model="modelCountQuery"
              type="search"
              class="catalog-mfr-filters__search-input"
              placeholder="Поиск..."
              autocomplete="off"
            />
          </label>

          <p class="catalog-mfr-filters__all-label">Все</p>

          <ul class="catalog-mfr-filters__list">
            <li
              v-for="option in visibleModelCountFilters"
              :key="option.id"
            >
              <top-mining-checkbox
                v-model="selectedModelCounts[option.id]"
                size="sm"
                :label="option.label"
              />
            </li>
          </ul>
        </div>
      </section>

      <section class="catalog-mfr-filters__section catalog-mfr-filters__section--last">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-mfr-filters__section-head"
          :aria-expanded="sections.market"
          @click="sections.market = !sections.market"
        >
          <span class="catalog-mfr-filters__section-title">Компании на рынке</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-mfr-filters__chevron',
                { 'catalog-mfr-filters__chevron--collapsed': !sections.market },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.market"
          class="catalog-mfr-filters__section-body"
        >
          <ul class="catalog-mfr-filters__list catalog-mfr-filters__list--plain">
            <li
              v-for="option in marketAgeFilters"
              :key="option.id"
            >
              <top-mining-checkbox
                v-model="selectedMarketAge[option.id]"
                size="sm"
                :label="option.label"
              />
            </li>
          </ul>
        </div>
      </section>
    </div>

    <button
      type="button"
      class="catalog-mfr-filters__reset"
      :disabled="!hasActiveFilters"
      @click="resetAll"
    >
      <Icon
        name="mdi:close"
        class="catalog-mfr-filters__reset-icon"
        aria-hidden="true"
      />
      <span>Сбросить все фильтры</span>
    </button>
  </aside>
</template>

<script setup lang="ts">
  import type { CatalogFilterOption } from '~/common/modules/catalog'
  import catalogSearchIcon from '~/assets/images/catalog/search.png'

  const props = defineProps<{
    algorithmFilters: CatalogFilterOption[]
    modelCountFilters: CatalogFilterOption[]
    marketAgeFilters: CatalogFilterOption[]
  }>()

  const selectedAlgorithms = defineModel<Record<string, boolean>>(
    'selectedAlgorithms',
    { default: () => ({}) },
  )
  const selectedModelCounts = defineModel<Record<string, boolean>>(
    'selectedModelCounts',
    { default: () => ({}) },
  )
  const selectedMarketAge = defineModel<Record<string, boolean>>(
    'selectedMarketAge',
    { default: () => ({}) },
  )

  const algorithmQuery = ref('')
  const modelCountQuery = ref('')

  const sections = reactive({
    algorithms: true,
    models: true,
    market: true,
  })

  const visibleAlgorithmFilters = computed(() => {
    const query = algorithmQuery.value.trim().toLowerCase()

    if (!query) {
      return props.algorithmFilters
    }

    return props.algorithmFilters.filter((option) =>
      option.label.toLowerCase().includes(query),
    )
  })

  const visibleModelCountFilters = computed(() => {
    const query = modelCountQuery.value.trim().toLowerCase()

    if (!query) {
      return props.modelCountFilters
    }

    return props.modelCountFilters.filter((option) =>
      option.label.toLowerCase().includes(query),
    )
  })

  const hasActiveFilters = computed(() =>
    Object.values(selectedAlgorithms.value).some(Boolean)
    || Object.values(selectedModelCounts.value).some(Boolean)
    || Object.values(selectedMarketAge.value).some(Boolean),
  )

  function resetAll() {
    for (const key of Object.keys(selectedAlgorithms.value)) {
      selectedAlgorithms.value[key] = false
    }
    for (const key of Object.keys(selectedModelCounts.value)) {
      selectedModelCounts.value[key] = false
    }
    for (const key of Object.keys(selectedMarketAge.value)) {
      selectedMarketAge.value[key] = false
    }
    algorithmQuery.value = ''
    modelCountQuery.value = ''
  }
</script>

<style scoped>
  .catalog-mfr-filters {
    display: grid;
    gap: 12px;
  }

  .catalog-mfr-filters__panel {
    border-radius: 24px;
    background: #fff;
    overflow: hidden;
  }

  .catalog-mfr-filters__section {
    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  }

  .catalog-mfr-filters__section--last {
    border-bottom: 0;
  }

  .catalog-mfr-filters__section-head {
    display: block;
    width: 100%;
  }

  .catalog-mfr-filters__section-head:deep(.top-mining-button) {
    width: 100%;
    min-height: 0;
    padding: 16px 18px;
    border-radius: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 15px;
    font-weight: 600;
    line-height: 1.2;
    letter-spacing: 0;
    text-transform: none;
    --tm-btn-color: #141414;
    color: #141414;
  }

  .catalog-mfr-filters__section-head:deep(.top-mining-button__inner) {
    width: 100%;
    justify-content: space-between;
    gap: 12px;
  }

  .catalog-mfr-filters__section-title {
    min-width: 0;
    text-align: left;
  }

  .catalog-mfr-filters__chevron {
    width: 20px;
    height: 20px;
    flex-shrink: 0;
    color: var(--tm-text-muted);
    transition: transform 0.2s ease;
  }

  .catalog-mfr-filters__chevron--collapsed {
    transform: rotate(180deg);
  }

  .catalog-mfr-filters__section-body {
    padding: 0 18px 16px;
  }

  .catalog-mfr-filters__search {
    display: flex;
    align-items: center;
    gap: 8px;
    min-height: 40px;
    margin-bottom: 10px;
    padding: 0 14px;
    border-radius: 999px;
    background: #f4f4f4;
    cursor: text;
  }

  .catalog-mfr-filters__search-icon {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-filters__search-input {
    width: 100%;
    border: 0;
    background: transparent;
    color: #141414;
    font-size: 14px;
    line-height: 1.2;
    outline: none;
  }

  .catalog-mfr-filters__search-input::placeholder {
    color: var(--tm-text-placeholder);
  }

  .catalog-mfr-filters__all-label {
    margin: 0 0 8px;
    color: var(--tm-orange);
    font-size: 13px;
    font-weight: 600;
    line-height: 1.2;
  }

  .catalog-mfr-filters__list {
    display: grid;
    gap: 6px;
    max-height: 180px;
    margin: 0;
    padding: 0;
    list-style: none;
    overflow: auto;
    scrollbar-width: thin;
  }

  .catalog-mfr-filters__list--plain {
    max-height: none;
  }

  .catalog-mfr-filters__reset {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    min-height: 48px;
    padding: 0 18px;
    border: 1px solid var(--tm-orange);
    border-radius: 999px;
    background: #fff;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      background-color 0.2s ease,
      opacity 0.2s ease;
  }

  .catalog-mfr-filters__reset:disabled {
    opacity: 0.45;
    cursor: not-allowed;
  }

  @media (hover: hover) {
    .catalog-mfr-filters__reset:not(:disabled):hover,
    .catalog-mfr-filters__reset:not(:disabled):focus-visible {
      background: rgba(255, 100, 24, 0.06);
    }
  }

  .catalog-mfr-filters__reset-icon {
    width: 14px;
    height: 14px;
    color: var(--tm-orange);
  }
</style>
