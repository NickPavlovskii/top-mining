<template>
  <nav
    v-if="tabs.length"
    class="catalog-category-tabs"
    aria-label="Категории каталога"
  >
    <nuxt-link
      v-for="tab in tabs"
      :key="tab.id"
      :to="tab.href"
      :class="[
        'catalog-category-tabs__tab',
        { 'catalog-category-tabs__tab--active': tab.active },
      ]"
    >
      {{ tab.label }}
    </nuxt-link>
  </nav>
</template>

<script setup lang="ts">
  import { getCatalogCategoryTabs } from '~/common/modules/catalog'

  const props = defineProps<{
    activeCategoryId: string
  }>()

  const { visibleCategories } = useVisibleCatalogCategories()

  const tabs = computed(() =>
    getCatalogCategoryTabs(props.activeCategoryId, visibleCategories.value),
  )
</script>

<style scoped>
  .catalog-category-tabs {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: clamp(28px, 4vw, 40px);
  }

  .catalog-category-tabs__tab {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    padding: 0 18px;
    border-radius: 999px;
    background: #fff;
    color: #141414;
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 1.2;
    text-decoration: none;
    transition:
      background-color 0.2s ease,
      color 0.2s ease;
  }

  @media (hover: hover) {
    .catalog-category-tabs__tab:hover,
    .catalog-category-tabs__tab:focus-visible {
      color: var(--tm-orange);
    }

    .catalog-category-tabs__tab--active:hover,
    .catalog-category-tabs__tab--active:focus-visible {
      color: #fff;
    }
  }

  .catalog-category-tabs__tab--active {
    background: var(--tm-orange);
    color: #fff;
  }

  @media (max-width: 760px) {
    .catalog-category-tabs {
      gap: 8px;
    }

    .catalog-category-tabs__tab {
      min-height: 40px;
      padding-inline: 14px;
      font-size: 13px;
    }
  }
</style>
