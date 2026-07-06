<template>
  <div class="catalog-mfr-page">
    <div class="catalog-mfr-page__inner">
      <catalog-page-breadcrumbs
        :is-catalog-current="isAllOrganizationsMode"
        :current-label="breadcrumbLabel"
      />

      <header class="catalog-mfr-page__header">
        <h1 class="catalog-mfr-page__title">
          {{ pageTitle }}
        </h1>
        <p class="catalog-mfr-page__subtitle">
          {{ pageSubtitle }}
        </p>

        <p class="catalog-mfr-page__utp">
          <img
            class="catalog-mfr-page__utp-star"
            alt=""
            aria-hidden="true"
            :src="utpStar"
          />
          <span>
            Более
            <span class="catalog-mfr-page__utp-accent">
              {{ formattedReviews }} отзывов
            </span>
            от клиентов в майнинге
          </span>
        </p>
      </header>

      <catalog-category-tabs :active-category-id="activeCategoryId" />

      <div class="catalog-mfr-page__layout catalog-mfr-page__layout--with-sidebar">
        <catalog-manufacturers-filters
          v-if="isManufacturersMode"
          v-model:selected-algorithms="selectedAlgorithms"
          v-model:selected-model-counts="selectedModelCounts"
          v-model:selected-market-age="selectedMarketAge"
          :algorithm-filters="algorithmFilters"
          :model-count-filters="modelCountFilters"
          :market-age-filters="marketAgeFilters"
        />

        <catalog-category-sidebar-filters
          v-else-if="isCategorySidebarMode"
          v-model:selected-filters="selectedCategoryFilters"
          :groups="categorySidebarGroups"
        />

        <catalog-organizations-filters
          v-else
          v-model:selected-services="selectedServices"
          v-model:selected-market-age="selectedOrgMarketAge"
          v-model:selected-min-asic="selectedMinAsic"
          :service-filters="organizationServiceFilters"
          :market-age-filters="organizationMarketAgeFilters"
          :min-asic-filters="organizationMinAsicFilters"
        />

        <div class="catalog-mfr-page__content">
          <div class="catalog-mfr-page__toolbar">
            <label class="catalog-mfr-page__search">
              <img
                alt=""
                aria-hidden="true"
                class="catalog-mfr-page__search-icon"
                :src="catalogSearchIcon"
              />
              <input
                v-model="searchQuery"
                type="search"
                class="catalog-mfr-page__search-input"
                placeholder="Поиск по названию"
                autocomplete="off"
              />
            </label>

            <catalog-sort-dropdown v-model="sortBy" />
          </div>

          <p class="catalog-mfr-page__count">
            Найдено организаций: {{ resultCount }}
          </p>

          <div
            v-if="isManufacturersMode && filteredManufacturers.length"
            class="catalog-mfr-page__grid"
          >
            <catalog-manufacturer-card
              v-for="manufacturer in filteredManufacturers"
              :key="manufacturer.id"
              :manufacturer="manufacturer"
            />
          </div>

          <div
            v-else-if="!isManufacturersMode && filteredOrganizations.length"
            class="catalog-mfr-page__grid"
          >
            <template
              v-for="item in organizationGridItems"
              :key="item.key"
            >
              <catalog-organization-card
                v-if="item.type === 'card'"
                layout="grid"
                :organization="item.data"
              />
              <catalog-mid-block-banner
                v-else
                class="catalog-mfr-page__grid-banner"
                :variant="item.variant"
              />
            </template>
          </div>

          <p
            v-else
            class="catalog-mfr-page__empty"
          >
            По вашему запросу ничего не найдено. Попробуйте изменить фильтры.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CATALOG_FALLBACK } from '~/common/modules/catalog'
  import {
    buildCatalogGridWithBanners,
    getCatalogMidBlockBannerVariant,
  } from '~/common/modules/catalog/mid-block-banner'
  import {
    buildCatalogManufacturersResponse,
    getManufacturerMarketAge,
  } from '~/common/modules/catalog/manufacturers-page'
  import {
    getCatalogCategoryFromRoute,
    isAllOrganizationsCatalogCategory,
    isManufacturersCatalogCategory,
  } from '~/common/modules/catalog/nav-links'
  import {
    getCategorySidebarFilters,
    matchesCategorySidebarFilters,
  } from '~/common/modules/catalog/category-sidebar-filters'
  import {
    getCatalogOrganizationServiceFilters,
    CATALOG_ORGANIZATION_MARKET_AGE_FILTERS,
    CATALOG_ORGANIZATION_MIN_ASIC_FILTERS,
    getOrganizationMarketAge,
    matchesMinAsicFilter,
  } from '~/common/modules/catalog/organization-filters'
  import {
    CATALOG_ORGANIZATIONS_PAGE_META,
    compareCatalogOrganizations,
    findCatalogCategoryName,
    flattenCatalogOrganizations,
  } from '~/common/modules/catalog/organizations-page'
  import type { CatalogResponse } from '~/types/catalog'
  import type {
    CatalogManufacturer,
    CatalogManufacturersResponse,
    CatalogManufacturersSort,
  } from '~/types/catalog-manufacturers'
  import utpStar from '~/assets/images/catalog/star-24.png'
  import catalogSearchIcon from '~/assets/images/catalog/search.png'
  import CatalogManufacturerCard from '~/components/catalog/CatalogManufacturerCard.vue'
  import CatalogCategoryTabs from '~/components/catalog/CatalogCategoryTabs.vue'
  import CatalogCategorySidebarFilters from '~/components/catalog/CatalogCategorySidebarFilters.vue'
  import CatalogManufacturersFilters from '~/components/catalog/CatalogManufacturersFilters.vue'
  import CatalogOrganizationsFilters from '~/components/catalog/CatalogOrganizationsFilters.vue'
  import CatalogMidBlockBanner from '~/components/catalog/CatalogMidBlockBanner.vue'
  import CatalogOrganizationCard from '~/components/catalog/CatalogOrganizationCard.vue'
  import CatalogPageBreadcrumbs from '~/components/catalog/CatalogPageBreadcrumbs.vue'
  import CatalogSortDropdown from '~/components/catalog/CatalogSortDropdown.vue'

  const route = useRoute()

  const selectedCategorySlug = computed(() =>
    getCatalogCategoryFromRoute(route.query.category),
  )

  const activeCategoryId = computed(() => selectedCategorySlug.value)

  const isAllOrganizationsMode = computed(() =>
    isAllOrganizationsCatalogCategory(selectedCategorySlug.value),
  )

  const isManufacturersMode = computed(() =>
    isManufacturersCatalogCategory(selectedCategorySlug.value),
  )

  const { visibleCategories } = useVisibleCatalogCategories()

  const categorySidebarGroups = computed(() =>
    getCategorySidebarFilters(selectedCategorySlug.value),
  )

  const isCategorySidebarMode = computed(() =>
    categorySidebarGroups.value.length > 0,
  )

  const organizationServiceFilters = computed(() => {
    const visibleIds = new Set(visibleCategories.value.map((category) => category.id))

    return getCatalogOrganizationServiceFilters().filter((option) =>
      visibleIds.has(option.id),
    )
  })

  const organizationMarketAgeFilters = CATALOG_ORGANIZATION_MARKET_AGE_FILTERS
  const organizationMinAsicFilters = CATALOG_ORGANIZATION_MIN_ASIC_FILTERS

  const { data: manufacturersData } = await useFetch<CatalogManufacturersResponse>(
    '/api/catalog/manufacturers',
    {
      default: () => buildCatalogManufacturersResponse(),
    },
  )

  const { data: catalogData } = await useFetch<CatalogResponse>('/api/catalog', {
    default: () => ({
      ...CATALOG_FALLBACK,
      updatedAt: new Date().toISOString(),
    }),
  })

  const meta = computed(() => manufacturersData.value!.meta)
  const algorithmFilters = computed(() => manufacturersData.value!.algorithmFilters)
  const modelCountFilters = computed(() => manufacturersData.value!.modelCountFilters)
  const marketAgeFilters = computed(() => manufacturersData.value!.marketAgeFilters)
  const manufacturers = computed(() => manufacturersData.value!.manufacturers)
  const categories = computed(() => catalogData.value!.categories)

  const activeCategoryName = computed(() =>
    findCatalogCategoryName(categories.value, selectedCategorySlug.value),
  )

  const pageTitle = computed(() => {
    if (isAllOrganizationsMode.value) {
      return CATALOG_ORGANIZATIONS_PAGE_META.title
    }

    if (isManufacturersMode.value) {
      return meta.value.title
    }

    return activeCategoryName.value ?? CATALOG_ORGANIZATIONS_PAGE_META.title
  })

  const pageSubtitle = computed(() => {
    if (isManufacturersMode.value) {
      return meta.value.subtitle
    }

    return catalogData.value!.meta.subtitle
  })

  const breadcrumbLabel = computed(() => {
    if (isAllOrganizationsMode.value) {
      return undefined
    }

    if (isManufacturersMode.value) {
      return meta.value.title
    }

    return activeCategoryName.value ?? undefined
  })

  const searchQuery = ref('')
  const sortBy = ref<CatalogManufacturersSort>('name-asc')

  const selectedAlgorithms = reactive<Record<string, boolean>>({})
  const selectedModelCounts = reactive<Record<string, boolean>>({})
  const selectedMarketAge = reactive<Record<string, boolean>>({})
  const selectedServices = reactive<Record<string, boolean>>({})
  const selectedOrgMarketAge = reactive<Record<string, boolean>>({})
  const selectedMinAsic = reactive<Record<string, boolean>>({})

  const selectedCategoryFilters = reactive<Record<string, boolean>>({})

  const activeCategoryFilterIds = computed(() =>
    Object.entries(selectedCategoryFilters)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const formattedReviews = computed(() =>
    new Intl.NumberFormat('ru-RU').format(
      isManufacturersMode.value
        ? meta.value.totalReviews
        : catalogData.value!.meta.totalReviews,
    ),
  )

  const activeAlgorithmIds = computed(() =>
    Object.entries(selectedAlgorithms)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const activeModelCountIds = computed(() =>
    Object.entries(selectedModelCounts)
      .filter(([, checked]) => checked)
      .map(([id]) => Number(id)),
  )

  const activeMarketAgeIds = computed(() =>
    Object.entries(selectedMarketAge)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const activeServiceIds = computed(() =>
    Object.entries(selectedServices)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const activeOrgMarketAgeIds = computed(() =>
    Object.entries(selectedOrgMarketAge)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const activeMinAsicIds = computed(() =>
    Object.entries(selectedMinAsic)
      .filter(([, checked]) => checked)
      .map(([id]) => id),
  )

  const filteredManufacturers = computed(() => {
    const query = searchQuery.value.trim().toLowerCase()
    let list = manufacturers.value.slice()

    if (query) {
      list = list.filter((item) =>
        item.name.toLowerCase().includes(query),
      )
    }

    if (activeAlgorithmIds.value.length) {
      list = list.filter((item) =>
        item.algorithms.some((algorithm) =>
          activeAlgorithmIds.value.includes(algorithm),
        ),
      )
    }

    if (activeModelCountIds.value.length) {
      list = list.filter((item) =>
        activeModelCountIds.value.includes(item.modelsCount),
      )
    }

    if (activeMarketAgeIds.value.length) {
      list = list.filter((item) => {
        const age = getManufacturerMarketAge(item.foundedYear)

        return age != null && activeMarketAgeIds.value.includes(age)
      })
    }

    list.sort((left, right) => compareManufacturers(left, right, sortBy.value))

    return list
  })

  const filteredOrganizations = computed(() => {
    if (isManufacturersMode.value) {
      return []
    }

    const query = searchQuery.value.trim().toLowerCase()
    let list: ReturnType<typeof flattenCatalogOrganizations>

    if (activeServiceIds.value.length) {
      list = flattenCatalogOrganizations(
        categories.value.filter((category) =>
          activeServiceIds.value.includes(category.slug),
        ),
      )
    } else if (isAllOrganizationsMode.value) {
      list = flattenCatalogOrganizations(categories.value)
    } else {
      const category = categories.value.find(
        (item) => item.slug === selectedCategorySlug.value,
      )

      if (!category) {
        return []
      }

      list = category.organizations.map((organization) => ({
        ...organization,
        categorySlug: category.slug,
        categoryName: category.name,
      }))
    }

    if (query) {
      list = list.filter((item) =>
        item.name.toLowerCase().includes(query),
      )
    }

    if (activeOrgMarketAgeIds.value.length) {
      list = list.filter((item) => {
        const age = getOrganizationMarketAge(item.foundedYear)

        return age != null && activeOrgMarketAgeIds.value.includes(age)
      })
    }

    if (activeMinAsicIds.value.length) {
      list = list.filter((item) =>
        matchesMinAsicFilter(item.minAsicPlacement, activeMinAsicIds.value),
      )
    }

    if (activeCategoryFilterIds.value.length) {
      list = list.filter((item) =>
        matchesCategorySidebarFilters(item, activeCategoryFilterIds.value),
      )
    }

    list.sort((left, right) =>
      compareCatalogOrganizations(left, right, sortBy.value),
    )

    return list
  })

  const resultCount = computed(() =>
    isManufacturersMode.value
      ? filteredManufacturers.value.length
      : filteredOrganizations.value.length,
  )

  const catalogMidBlockBannerVariant = computed(() =>
    getCatalogMidBlockBannerVariant(selectedCategorySlug.value),
  )

  const organizationGridItems = computed(() =>
    buildCatalogGridWithBanners(
      filteredOrganizations.value,
      (organization) => `${organization.categorySlug}-${organization.id}`,
      { variant: catalogMidBlockBannerVariant.value },
    ),
  )

  watch(selectedCategorySlug, (categorySlug) => {
    searchQuery.value = ''
    sortBy.value = 'name-asc'
    Object.keys(selectedAlgorithms).forEach((key) => {
      selectedAlgorithms[key] = false
    })
    Object.keys(selectedModelCounts).forEach((key) => {
      selectedModelCounts[key] = false
    })
    Object.keys(selectedMarketAge).forEach((key) => {
      selectedMarketAge[key] = false
    })
    Object.keys(selectedServices).forEach((key) => {
      selectedServices[key] = false
    })
    Object.keys(selectedOrgMarketAge).forEach((key) => {
      selectedOrgMarketAge[key] = false
    })
    Object.keys(selectedMinAsic).forEach((key) => {
      selectedMinAsic[key] = false
    })
    Object.keys(selectedCategoryFilters).forEach((key) => {
      selectedCategoryFilters[key] = false
    })

    if (
      !isAllOrganizationsCatalogCategory(categorySlug)
      && !isManufacturersCatalogCategory(categorySlug)
    ) {
      selectedServices[categorySlug] = true
    }
  }, { immediate: true })

  function compareManufacturers(
    left: CatalogManufacturer,
    right: CatalogManufacturer,
    sort: CatalogManufacturersSort,
  ) {
    switch (sort) {
      case 'rating-desc':
        return right.rating - left.rating
          || right.reviewCount - left.reviewCount
      case 'rating-asc':
        return left.rating - right.rating
          || left.reviewCount - right.reviewCount
      case 'reviews-desc':
        return right.reviewCount - left.reviewCount
          || right.rating - left.rating
      case 'reviews-asc':
        return left.reviewCount - right.reviewCount
          || left.rating - right.rating
      case 'name-desc':
        return right.name.localeCompare(left.name, 'ru')
      case 'name-asc':
      default:
        return left.name.localeCompare(right.name, 'ru')
    }
  }
</script>

<style scoped>
  .catalog-mfr-page {
    width: 100%;
    background: #f2f2f2;
  }

  .catalog-mfr-page__inner {
    width: 100%;
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(40px, 5vw, 72px) clamp(16px, 4vw, 60px) clamp(56px, 7vw, 96px);
    box-sizing: border-box;
  }

  .catalog-mfr-page__header {
    text-align: center;
    margin-bottom: clamp(24px, 3vw, 36px);
  }

  .catalog-mfr-page__title {
    margin: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(36px, 6vw, 72px);
    font-weight: 500;
    line-height: 1.05;
    letter-spacing: -0.02em;
    text-transform: uppercase;
  }

  .catalog-mfr-page__subtitle {
    max-width: 760px;
    margin: clamp(16px, 2vw, 24px) auto 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 24px);
    font-weight: 400;
    line-height: 1.25;
  }

  .catalog-mfr-page__utp {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    margin: clamp(18px, 2.5vw, 28px) 0 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(14px, 1.4vw, 18px);
    font-weight: 400;
    line-height: 1.35;
  }

  .catalog-mfr-page__utp-star {
    width: 18px;
    height: 18px;
    object-fit: contain;
  }

  .catalog-mfr-page__utp-accent {
    color: var(--tm-orange);
    font-weight: 600;
  }

  .catalog-mfr-page__layout {
    display: grid;
    grid-template-columns: minmax(260px, 300px) minmax(0, 1fr);
    gap: clamp(20px, 3vw, 32px);
    align-items: start;
  }

  .catalog-mfr-page__layout--with-sidebar {
    grid-template-columns: minmax(260px, 300px) minmax(0, 1fr);
  }

  .catalog-mfr-page__content {
    min-width: 0;
  }

  .catalog-mfr-page__toolbar {
    display: grid;
    grid-template-columns: minmax(0, 1fr) auto;
    gap: 16px;
    align-items: center;
    margin-bottom: 12px;
  }

  .catalog-mfr-page__search {
    display: flex;
    align-items: center;
    gap: 12px;
    min-height: 56px;
    padding: 0 20px;
    border-radius: 999px;
    background: #fff;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.04);
  }

  .catalog-mfr-page__search-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-mfr-page__search-input {
    width: 100%;
    border: 0;
    background: transparent;
    color: #141414;
    font-size: 16px;
    line-height: 1.2;
    outline: none;
  }

  .catalog-mfr-page__search-input::placeholder {
    color: var(--tm-text-placeholder);
  }

  .catalog-mfr-page__count {
    margin: 0 0 20px;
    color: #141414;
    font-size: 15px;
    font-weight: 500;
    line-height: 1.3;
  }

  .catalog-mfr-page__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 16px;
  }

  .catalog-mfr-page__grid-banner {
    grid-column: 1 / -1;
  }

  .catalog-mfr-page__empty {
    margin: 0;
    padding: 32px 20px;
    border-radius: 24px;
    background: #fff;
    color: var(--tm-text-muted);
    font-size: 16px;
    line-height: 1.5;
    text-align: center;
  }

  @media (max-width: 760px) {
    .catalog-mfr-page__layout,
    .catalog-mfr-page__layout--with-sidebar {
      grid-template-columns: 1fr;
    }

    .catalog-mfr-page__toolbar {
      grid-template-columns: 1fr;
    }

    .catalog-mfr-page__grid {
      grid-template-columns: 1fr;
    }
  }
</style>
