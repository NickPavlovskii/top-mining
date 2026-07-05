<template>
  <main class="sale-asic-page">
    <div
      v-if="pending"
      class="sale-asic-page__state"
    >
      Загрузка…
    </div>

    <catalog-organization-detail-view
      v-else-if="organization"
      :organization="organization"
    />
  </main>
</template>

<script setup lang="ts">
  import type { CatalogOrganizationDetailResponse } from '~/types/catalog-organization-detail'
  import CatalogOrganizationDetailView from '~/components/catalog/organization-detail/CatalogOrganizationDetailView.vue'

  const route = useRoute()
  const slug = computed(() => String(route.params.slug || ''))

  const { data, pending, error } = await useFetch<CatalogOrganizationDetailResponse>(
    () => `/api/catalog/organizations/${slug.value}`,
    { watch: [slug] },
  )

  const organization = computed(() => data.value?.organization)

  watchEffect(() => {
    if (!pending.value && error.value) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Organization not found',
      })
    }
  })

  useSeoMeta({
    title: () =>
      organization.value
        ? `${organization.value.pageTitle} — ТОП МАЙНИНГ`
        : 'Каталог организаций — ТОП МАЙНИНГ',
    description: () => organization.value?.tagline ?? '',
  })
</script>

<style scoped>
  .sale-asic-page {
    min-height: 40vh;
  }

  .sale-asic-page__state {
    max-width: 1770px;
    margin: 0 auto;
    padding: 72px 16px;
    color: var(--tm-text-muted);
    font-size: 16px;
  }
</style>
