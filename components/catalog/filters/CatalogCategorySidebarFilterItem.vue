<template>
  <li
    :class="[
      'catalog-cat-filter-item',
      { 'catalog-cat-filter-item--nested': depth > 0 },
    ]"
  >
    <div class="catalog-cat-filter-item__row">
      <top-mining-checkbox
        v-if="!hasChildren"
        v-model="selectedFilters[option.id]"
        size="sm"
        :label="option.label"
      />

      <button
        v-else
        type="button"
        class="catalog-cat-filter-item__parent"
        @click="emit('toggleExpand', option.id)"
      >
        <top-mining-checkbox
          v-model="selectedFilters[option.id]"
          size="sm"
          :label="option.label"
          @click.stop
        />
        <Icon
          name="mdi:chevron-down"
          :class="[
            'catalog-cat-filter-item__arrow',
            { 'catalog-cat-filter-item__arrow--open': isExpanded },
          ]"
          aria-hidden="true"
        />
      </button>
    </div>

    <ul
      v-if="hasChildren && isExpanded"
      class="catalog-cat-filter-item__children"
    >
      <catalog-category-sidebar-filter-item
        v-for="child in option.children"
        v-model="selectedFilters"
        :key="child.id"
        :option="child"
        :expanded-nodes="expandedNodes"
        :search-query="searchQuery"
        :depth="depth + 1"
        @toggle-expand="emit('toggleExpand', $event)"
      />
    </ul>
  </li>
</template>

<script setup lang="ts">
  import type { CatalogSidebarFilterOption } from '~/common/modules/catalog'

  const props = withDefaults(defineProps<{
    option: CatalogSidebarFilterOption
    expandedNodes: Record<string, boolean>
    searchQuery?: string
    depth?: number
  }>(), {
    searchQuery: '',
    depth: 0,
  })

  const emit = defineEmits<{
    toggleExpand: [id: string]
  }>()

  const selectedFilters = defineModel<Record<string, boolean>>({ required: true })

  const hasChildren = computed(() => Boolean(props.option.children?.length))

  const isExpanded = computed(() => {
    if (props.searchQuery.trim()) {
      return true
    }

    return props.expandedNodes[props.option.id] ?? false
  })
</script>

<style scoped>
  .catalog-cat-filter-item {
    list-style: none;
  }

  .catalog-cat-filter-item__row {
    display: flex;
    align-items: center;
  }

  .catalog-cat-filter-item__parent {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    width: 100%;
    padding: 0;
    border: 0;
    background: transparent;
    cursor: pointer;
    text-align: left;
  }

  .catalog-cat-filter-item__arrow {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    color: var(--tm-text-muted);
    transition: transform 0.2s ease;
  }

  .catalog-cat-filter-item__arrow--open {
    transform: rotate(180deg);
  }

  .catalog-cat-filter-item__children {
    display: grid;
    gap: 6px;
    margin: 6px 0 0;
    padding: 0 0 0 14px;
    list-style: none;
  }

  .catalog-cat-filter-item--nested .catalog-cat-filter-item__children {
    padding-left: 10px;
  }
</style>
