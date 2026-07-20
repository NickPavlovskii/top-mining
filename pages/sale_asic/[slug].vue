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
  import type { CatalogOrganizationDetailResponse } from '~/common/modules/catalog'
  import {
    HTTP_BAD_REQUEST,
    HTTP_NOT_FOUND,
    HTTP_OK,
    HTTP_SERVICE_UNAVAILABLE,
  } from '~/common/modules/http/status'
  import CatalogOrganizationDetailView from '~/components/catalog/organization-detail/CatalogOrganizationDetailView.vue'

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

  const responseStatus = computed(() => {
    if (error.value?.statusCode) {
      return error.value.statusCode
    }

    if (status.value === 'error') {
      return HTTP_SERVICE_UNAVAILABLE
    }

    if (!pending.value && !organization.value) {
      return HTTP_NOT_FOUND
    }

    return HTTP_OK
  })

  if (import.meta.server && event && responseStatus.value >= HTTP_BAD_REQUEST) {
    setResponseStatus(event, responseStatus.value)
  }

  watch(
    [pending, organization, responseStatus],
    ([isPending, org, code]) => {
      if (isPending || org) {
        return
      }

      if (code === HTTP_SERVICE_UNAVAILABLE) {
        showError({
          statusCode: HTTP_SERVICE_UNAVAILABLE,
          statusMessage: 'Страница временно недоступна',
        })
        return
      }

      showError({
        statusCode: HTTP_NOT_FOUND,
        statusMessage: 'Страница не найдена',
      })
    },
    { immediate: true },
  )

  useSeoMeta({
    title: () =>
      organization.value
        ? `${organization.value.pageTitle || organization.value.name} — ТОП МАЙНИНГ`
        : 'ТОП МАЙНИНГ',
  })
</script>
