<template>
  <main class="asic-manufacturers-page">
    <catalog-manufacturers-view />
  </main>
</template>

<script setup lang="ts">
  import { CATALOG_MANUFACTURERS_PAGE_META } from '~/common/modules/catalog/manufacturers-page'
  import CatalogManufacturersView from '~/components/catalog/CatalogManufacturersView.vue'

  useSeoMeta({
    title: `${CATALOG_MANUFACTURERS_PAGE_META.title} — ТОП МАЙНИНГ`,
    description: CATALOG_MANUFACTURERS_PAGE_META.subtitle,
  })
</script>

<style scoped>
  .asic-manufacturers-page {
    padding: 0;
  }
</style>
