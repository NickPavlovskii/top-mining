<template>
  <aside class="catalog-cat-filters">
    <div class="catalog-cat-filters__panel">
      <section
        v-for="(group, index) in groups"
        :key="group.id"
        :class="[
          'catalog-cat-filters__section',
          { 'catalog-cat-filters__section--last': index === groups.length - 1 },
        ]"
      >
        <button
          type="button"
          class="catalog-cat-filters__section-head"
          :aria-expanded="sectionOpen[group.id]"
          @click="sectionOpen[group.id] = !sectionOpen[group.id]"
        >
          <span>{{ group.title }}</span>
          <Icon
            name="mdi:chevron-up"
            :class="[
              'catalog-cat-filters__chevron',
              { 'catalog-cat-filters__chevron--collapsed': !sectionOpen[group.id] },
            ]"
            aria-hidden="true"
          />
        </button>

        <div
          v-show="sectionOpen[group.id]"
          class="catalog-cat-filters__section-body"
        >
          <template v-if="group.searchable">
            <label class="catalog-cat-filters__search">
              <img
                alt=""
                aria-hidden="true"
                class="catalog-cat-filters__search-icon"
                :src="catalogSearchIcon"
              />
              <input
                v-model="searchQueries[group.id]"
                type="search"
                class="catalog-cat-filters__search-input"
                placeholder="Поиск..."
                autocomplete="off"
              />
            </label>

            <button
              type="button"
              class="catalog-cat-filters__select-all"
              @click="selectAllInGroup(group)"
            >
              Все
            </button>
          </template>

          <ul class="catalog-cat-filters__list">
            <catalog-category-sidebar-filter-item
              v-for="option in visibleOptions(group)"
              v-model="selectedFilters"
              :key="option.id"
              :option="option"
              :expanded-nodes="expandedNodes"
              :search-query="searchQueries[group.id] ?? ''"
              @toggle-expand="toggleExpand"
            />
          </ul>
        </div>
      </section>
    </div>

    <button
      type="button"
      class="catalog-cat-filters__reset"
      :disabled="!hasActiveFilters"
      @click="resetAll"
    >
      <Icon
        name="mdi:close"
        class="catalog-cat-filters__reset-icon"
        aria-hidden="true"
      />
      <span>Сбросить все фильтры</span>
    </button>
  </aside>
</template>

<script setup lang="ts">
  import type {
    CatalogSidebarFilterGroup,
    CatalogSidebarFilterOption,
  } from '~/types/catalog-category-filters'
  import { flattenSidebarFilterOptions } from '~/common/modules/catalog/category-sidebar-filters'
  import catalogSearchIcon from '~/assets/images/catalog/search.png'
  import CatalogCategorySidebarFilterItem from '~/components/catalog/CatalogCategorySidebarFilterItem.vue'

  const props = defineProps<{
    groups: CatalogSidebarFilterGroup[]
  }>()

  const selectedFilters = defineModel<Record<string, boolean>>('selectedFilters', {
    default: () => ({}),
  })

  const searchQueries = reactive<Record<string, string>>({})
  const sectionOpen = reactive<Record<string, boolean>>({})
  const expandedNodes = reactive<Record<string, boolean>>({})

  watch(
    () => props.groups,
    (groups) => {
      for (const group of groups) {
        if (sectionOpen[group.id] == null) {
          sectionOpen[group.id] = true
        }

        if (group.searchable && searchQueries[group.id] == null) {
          searchQueries[group.id] = ''
        }
      }
    },
    { immediate: true },
  )

  const hasActiveFilters = computed(() =>
    Object.values(selectedFilters.value).some(Boolean),
  )

  function visibleOptions(group: CatalogSidebarFilterGroup) {
    const query = (searchQueries[group.id] ?? '').trim().toLowerCase()

    if (!query) {
      return group.options
    }

    return filterOptionsByQuery(group.options, query)
  }

  function filterOptionsByQuery(
    options: CatalogSidebarFilterOption[],
    query: string,
  ): CatalogSidebarFilterOption[] {
    return options.flatMap((option) => {
      if (option.children?.length) {
        const filteredChildren = filterOptionsByQuery(option.children, query)
        const parentMatches = option.label.toLowerCase().includes(query)

        if (parentMatches) {
          return [option]
        }

        if (filteredChildren.length) {
          return [{ ...option, children: filteredChildren }]
        }

        return []
      }

      return option.label.toLowerCase().includes(query) ? [option] : []
    })
  }

  function toggleExpand(id: string) {
    expandedNodes[id] = !expandedNodes[id]
  }

  function selectAllInGroup(group: CatalogSidebarFilterGroup) {
    const leafOptions = flattenSidebarFilterOptions(group.options)

    for (const option of leafOptions) {
      if (!option.children?.length) {
        selectedFilters.value[option.id] = true
      }
    }
  }

  function resetAll() {
    for (const key of Object.keys(selectedFilters.value)) {
      selectedFilters.value[key] = false
    }

    for (const key of Object.keys(searchQueries)) {
      searchQueries[key] = ''
    }
  }
</script>

<style scoped>
  .catalog-cat-filters {
    display: grid;
    gap: 12px;
  }

  .catalog-cat-filters__panel {
    border-radius: 24px;
    background: #fff;
    overflow: hidden;
  }

  .catalog-cat-filters__section {
    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  }

  .catalog-cat-filters__section--last {
    border-bottom: 0;
  }

  .catalog-cat-filters__section-head {
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

  .catalog-cat-filters__chevron {
    width: 20px;
    height: 20px;
    flex-shrink: 0;
    color: var(--tm-text-muted);
    transition: transform 0.2s ease;
  }

  .catalog-cat-filters__chevron--collapsed {
    transform: rotate(180deg);
  }

  .catalog-cat-filters__section-body {
    padding: 0 18px 16px;
  }

  .catalog-cat-filters__search {
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

  .catalog-cat-filters__search-icon {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-cat-filters__search-input {
    width: 100%;
    border: 0;
    background: transparent;
    color: #141414;
    font-size: 14px;
    line-height: 1.2;
    outline: none;
  }

  .catalog-cat-filters__search-input::placeholder {
    color: var(--tm-text-placeholder);
  }

  .catalog-cat-filters__select-all {
    margin: 0 0 8px;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-orange);
    font-size: 13px;
    font-weight: 600;
    line-height: 1.2;
    cursor: pointer;
  }

  .catalog-cat-filters__list {
    display: grid;
    gap: 6px;
    max-height: 220px;
    margin: 0;
    padding: 0;
    list-style: none;
    overflow: auto;
    scrollbar-width: thin;
  }

  .catalog-cat-filters__reset {
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

  .catalog-cat-filters__reset:disabled {
    opacity: 0.45;
    cursor: not-allowed;
  }

  @media (hover: hover) {
    .catalog-cat-filters__reset:not(:disabled):hover,
    .catalog-cat-filters__reset:not(:disabled):focus-visible {
      background: rgba(255, 100, 24, 0.06);
    }
  }

  .catalog-cat-filters__reset-icon {
    width: 14px;
    height: 14px;
    color: var(--tm-orange);
  }
</style>
