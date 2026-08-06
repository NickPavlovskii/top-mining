<template>
  <main class="asic-manufacturer-detail-page">
    <catalog-detail-page-skeleton
      catalog-href="/asic-manufacturers/"
      catalog-label="Производители ASIC"
      :current-label="displayName"
    />
  </main>
</template>

<script setup lang="ts">
  import CatalogDetailPageSkeleton from '~/components/catalog/organization-detail/CatalogDetailPageSkeleton.vue'

  const route = useRoute()
  const slug = computed(() => String(route.params.slug || ''))

  const displayName = computed(() => {
    const raw = slug.value.replace(/[-_]+/g, ' ').trim()
    if (!raw) {
      return 'Производитель'
    }

    return raw.replace(/\b\w/g, (char) => char.toUpperCase())
  })

  useSeoMeta({
    title: () => `${displayName.value} — ТОП МАЙНИНГ`,
    description: () =>
      `Страница производителя ${displayName.value}. Контент готовится.`,
  })
</script>

<style scoped>
  .asic-manufacturer-detail-page {
    padding: 0;
  }
</style>
