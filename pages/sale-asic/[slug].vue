<template>
  <main class="sale-asic-page">
    <catalog-organization-detail-view
      v-if="organization"
      :organization="organization"
    />

    <catalog-detail-page-skeleton
      v-else
      catalog-label="Каталог организаций"
      :current-label="skeletonLabel"
    />
  </main>
</template>

<script setup lang="ts">
  import type { CatalogOrganizationDetailResponse } from '~/common/modules/catalog'
  import {
    HTTP_BAD_REQUEST,
    HTTP_NOT_FOUND,
    HTTP_OK,
    HTTP_SERVICE_UNAVAILABLE,
  } from '~/common/modules/http/status'
  import CatalogDetailPageSkeleton from '~/components/catalog/organization-detail/CatalogDetailPageSkeleton.vue'
  import CatalogOrganizationDetailView from '~/components/catalog/organization-detail/CatalogOrganizationDetailView.vue'

  definePageMeta({
    path: '/sale_asic/:slug',
  })

  const route = useRoute()
  const event = useRequestEvent()
  const slug = computed(() => String(route.params.slug || ''))

  const { data, pending, error, status } = await useFetch<CatalogOrganizationDetailResponse>(
    () => `/api/catalog/organizations/${slug.value}`,
    {
      watch: [slug],
      ignoreResponseError: true,
    },
  )

  const organization = computed(() => data.value?.organization ?? null)

  const skeletonLabel = computed(() => {
    if (pending.value) {
      return '…'
    }

    const raw = slug.value.replace(/[-_]+/g, ' ').trim()
    if (!raw) {
      return 'Организация'
    }

    return raw.replace(/\b\w/g, (char) => char.toUpperCase())
  })

  const responseStatus = computed(() => {
    if (pending.value) {
      return HTTP_OK
    }

    if (error.value?.statusCode) {
      return error.value.statusCode
    }

    if (status.value === 'error') {
      return HTTP_SERVICE_UNAVAILABLE
    }

    if (!organization.value) {
      return HTTP_NOT_FOUND
    }

    return HTTP_OK
  })

  if (import.meta.server && event && responseStatus.value >= HTTP_BAD_REQUEST) {
    setResponseStatus(event, responseStatus.value)
  }

  useSeoMeta({
    title: () =>
      organization.value
        ? `${organization.value.pageTitle || organization.value.name} — ТОП МАЙНИНГ`
        : `${skeletonLabel.value} — ТОП МАЙНИНГ`,
  })
</script>

<style scoped>
  .sale-asic-page {
    padding: 0;
    min-height: 60vh;
  }
</style>
