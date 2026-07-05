<template>
  <nav
    class="catalog-page-breadcrumbs"
    aria-label="Хлебные крошки"
  >
    <NuxtLink
      to="/"
      class="catalog-page-breadcrumbs__link"
    >
      Главная
    </NuxtLink>
    <span
      class="catalog-page-breadcrumbs__sep"
      aria-hidden="true"
    >
      /
    </span>
    <NuxtLink
      v-if="!isCatalogCurrent && !currentLabel"
      :to="catalogHref"
      class="catalog-page-breadcrumbs__link"
    >
      Каталог организаций
    </NuxtLink>
    <template v-else-if="currentLabel">
      <NuxtLink
        :to="catalogHref"
        class="catalog-page-breadcrumbs__link"
      >
        Каталог организаций
      </NuxtLink>
      <span
        class="catalog-page-breadcrumbs__sep"
        aria-hidden="true"
      >
        /
      </span>
      <span class="catalog-page-breadcrumbs__current">
        {{ currentLabel }}
      </span>
    </template>
    <span
      v-else
      class="catalog-page-breadcrumbs__current"
    >
      Каталог организаций
    </span>
  </nav>
</template>

<script setup lang="ts">
  import { CATALOG_PAGE_HREF } from '~/common/modules/catalog/nav-links'

  withDefaults(
    defineProps<{
      catalogHref?: string
      isCatalogCurrent?: boolean
      currentLabel?: string
    }>(),
    {
      catalogHref: CATALOG_PAGE_HREF,
      isCatalogCurrent: false,
      currentLabel: undefined,
    },
  )
</script>

<style scoped>
  .catalog-page-breadcrumbs {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 0;
    margin: 0 0 clamp(20px, 3vw, 32px);
    color: var(--tm-text-muted);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.4;
  }

  .catalog-page-breadcrumbs__link {
    color: var(--tm-text-muted);
    text-decoration: none;
    transition: color 0.2s ease;
  }

  @media (hover: hover) {
    .catalog-page-breadcrumbs__link:hover,
    .catalog-page-breadcrumbs__link:focus-visible {
      color: var(--tm-orange);
    }
  }

  .catalog-page-breadcrumbs__sep {
    margin: 0 8px;
    color: var(--tm-text-placeholder);
  }

  .catalog-page-breadcrumbs__current {
    color: #141414;
    font-weight: 500;
  }
</style>
