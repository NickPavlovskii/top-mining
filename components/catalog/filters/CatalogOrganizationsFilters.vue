<template>
  <aside class="catalog-org-filters">
    <div class="catalog-org-filters__panel">
      <section class="catalog-org-filters__section">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-org-filters__section-head"
          :aria-expanded="sections.services"
          @click="sections.services = !sections.services"
        >
          <span class="catalog-org-filters__section-title">Услуга</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-org-filters__chevron',
                { 'catalog-org-filters__chevron--collapsed': !sections.services },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.services"
          class="catalog-org-filters__section-body"
        >
          <ul class="catalog-org-filters__list catalog-org-filters__list--plain">
            <li
              v-for="option in serviceFilters"
              :key="option.id"
            >
              <top-mining-checkbox
                v-model="selectedServices[option.id]"
                size="sm"
                :label="option.label"
              />
            </li>
          </ul>
        </div>
      </section>

      <section class="catalog-org-filters__section">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-org-filters__section-head"
          :aria-expanded="sections.market"
          @click="sections.market = !sections.market"
        >
          <span class="catalog-org-filters__section-title">Компания на рынке</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-org-filters__chevron',
                { 'catalog-org-filters__chevron--collapsed': !sections.market },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.market"
          class="catalog-org-filters__section-body"
        >
          <ul class="catalog-org-filters__list catalog-org-filters__list--plain">
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

      <section class="catalog-org-filters__section catalog-org-filters__section--last">
        <top-mining-button
          type="button"
          variant="tertiary"
          size="small"
          surface="light"
          width="100%"
          class="catalog-org-filters__section-head"
          :aria-expanded="sections.minAsic"
          @click="sections.minAsic = !sections.minAsic"
        >
          <span class="catalog-org-filters__section-title">Мин. кол-во ASIC для размещения</span>
          <template #append>
            <Icon
              name="mdi:chevron-up"
              :class="[
                'catalog-org-filters__chevron',
                { 'catalog-org-filters__chevron--collapsed': !sections.minAsic },
              ]"
              aria-hidden="true"
            />
          </template>
        </top-mining-button>

        <div
          v-show="sections.minAsic"
          class="catalog-org-filters__section-body"
        >
          <ul class="catalog-org-filters__list catalog-org-filters__list--plain">
            <li
              v-for="option in minAsicFilters"
              :key="option.id"
            >
              <top-mining-checkbox
                v-model="selectedMinAsic[option.id]"
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
      class="catalog-org-filters__reset"
      :disabled="!hasActiveFilters"
      @click="resetAll"
    >
      <Icon
        name="mdi:close"
        class="catalog-org-filters__reset-icon"
        aria-hidden="true"
      />
      <span>Сбросить все фильтры</span>
    </button>
  </aside>
</template>

<script setup lang="ts">
  import type { CatalogFilterOption } from '~/common/modules/catalog'

  const props = defineProps<{
    /** Опции фильтра по услугам */
    serviceFilters: CatalogFilterOption[]
    /** Опции фильтра по стажу на рынке */
    marketAgeFilters: CatalogFilterOption[]
    /** Опции фильтра по минимальному количеству ASIC */
    minAsicFilters: CatalogFilterOption[]
  }>()

  const selectedServices = defineModel<Record<string, boolean>>(
    'selectedServices',
    { default: () => ({}) },
  )
  const selectedMarketAge = defineModel<Record<string, boolean>>(
    'selectedMarketAge',
    { default: () => ({}) },
  )
  const selectedMinAsic = defineModel<Record<string, boolean>>(
    'selectedMinAsic',
    { default: () => ({}) },
  )

  const sections = reactive({
    services: true,
    market: true,
    minAsic: true,
  })

  const hasActiveFilters = computed(() =>
    Object.values(selectedServices.value).some(Boolean)
    || Object.values(selectedMarketAge.value).some(Boolean)
    || Object.values(selectedMinAsic.value).some(Boolean),
  )

  function resetAll() {
    for (const key of Object.keys(selectedServices.value)) {
      selectedServices.value[key] = false
    }
    for (const key of Object.keys(selectedMarketAge.value)) {
      selectedMarketAge.value[key] = false
    }
    for (const key of Object.keys(selectedMinAsic.value)) {
      selectedMinAsic.value[key] = false
    }
  }
</script>

<style scoped>
  .catalog-org-filters {
    display: grid;
    gap: 12px;
  }

  .catalog-org-filters__panel {
    border-radius: 24px;
    background: #fff;
    overflow: hidden;
  }

  .catalog-org-filters__section {
    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  }

  .catalog-org-filters__section--last {
    border-bottom: 0;
  }

  .catalog-org-filters__section-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    padding: 16px 18px;
    border: 0;
    background: transparent;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 15px;
    font-weight: 600;
    line-height: 1.2;
    text-align: left;
    cursor: pointer;
  }

  .catalog-org-filters__chevron {
    width: 20px;
    height: 20px;
    flex-shrink: 0;
    color: var(--tm-text-muted);
    transition: transform 0.2s ease;
  }

  .catalog-org-filters__chevron--collapsed {
    transform: rotate(180deg);
  }

  .catalog-org-filters__section-body {
    padding: 0 18px 16px;
  }

  .catalog-org-filters__list {
    display: grid;
    gap: 6px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .catalog-org-filters__list--plain {
    max-height: none;
  }

  .catalog-org-filters__reset {
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

  .catalog-org-filters__reset:disabled {
    opacity: 0.45;
    cursor: not-allowed;
  }

  @media (hover: hover) {
    .catalog-org-filters__reset:not(:disabled):hover,
    .catalog-org-filters__reset:not(:disabled):focus-visible {
      background: rgba(255, 100, 24, 0.06);
    }
  }

  .catalog-org-filters__reset-icon {
    width: 14px;
    height: 14px;
    color: var(--tm-orange);
  }
</style>
