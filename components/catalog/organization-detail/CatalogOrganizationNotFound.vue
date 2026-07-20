<template>
  <div class="org-not-found">
    <div class="org-not-found__inner">
      <nav
        class="org-not-found__breadcrumbs"
        aria-label="Хлебные крошки"
      >
        <nuxt-link to="/">
          Главная
        </nuxt-link>
        <span aria-hidden="true">/</span>
        <nuxt-link :to="catalogHref">
          Каталог организаций
        </nuxt-link>
        <span aria-hidden="true">/</span>
        <span>Не найдено</span>
      </nav>

      <p class="org-not-found__code">
        404
      </p>
      <h1 class="org-not-found__title">
        {{ title }}
      </h1>
      <p class="org-not-found__text">
        {{ description }}
      </p>

      <div class="org-not-found__actions">
        <top-mining-button
          title="В каталог организаций"
          :href="catalogButtonHref"
          v-bind="TOP_MINING_BUTTON_PROPS"
          @click="onCatalogClick"
        />
        <nuxt-link
          v-if="!recoverError"
          to="/"
          class="org-not-found__home-link"
        >
          На главную
        </nuxt-link>
        <button
          v-else
          type="button"
          class="org-not-found__home-link"
          @click="onHomeClick"
        >
          На главную
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CATALOG_PAGE_HREF } from '~/common/modules/catalog/nav-links'
  import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining'

  const props = withDefaults(
    defineProps<{
      title?: string
      description?: string
      catalogHref?: string
      recoverError?: boolean
    }>(),
    {
      title: 'Организация не найдена',
      description:
        'Такой страницы в каталоге нет. Проверьте адрес или выберите компанию из каталога.',
      catalogHref: CATALOG_PAGE_HREF,
      recoverError: false,
    },
  )

  const catalogButtonHref = computed(() =>
    props.recoverError ? undefined : props.catalogHref,
  )

  function onCatalogClick() {
    if (props.recoverError) {
      clearError({ redirect: props.catalogHref })
    }
  }

  function onHomeClick() {
    clearError({ redirect: '/' })
  }
</script>

<style scoped>
  .org-not-found {
    min-height: 55vh;
    background: #0a0a0a;
  }

  .org-not-found__inner {
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(48px, 8vw, 96px) clamp(16px, 4vw, 60px)
      clamp(80px, 12vw, 140px);
  }

  .org-not-found__breadcrumbs {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 8px;
    margin: 0 0 clamp(28px, 4vw, 48px);
    color: rgba(255, 255, 255, 0.45);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.4;
  }

  .org-not-found__breadcrumbs a {
    color: rgba(255, 255, 255, 0.55);
    text-decoration: none;
  }

  .org-not-found__breadcrumbs a:hover {
    color: #fff;
  }

  .org-not-found__code {
    margin: 0 0 12px;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(48px, 10vw, 96px);
    font-weight: 500;
    line-height: 1;
    letter-spacing: 0.02em;
  }

  .org-not-found__title {
    margin: 0 0 16px;
    max-width: 16ch;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 5vw, 48px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .org-not-found__text {
    margin: 0 0 36px;
    max-width: 42ch;
    color: rgba(255, 255, 255, 0.6);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 20px);
    line-height: 1.45;
  }

  .org-not-found__actions {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 20px 28px;
  }

  .org-not-found__home-link {
    padding: 0;
    border: 0;
    background: none;
    color: rgba(255, 255, 255, 0.7);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 16px;
    text-decoration: none;
    border-bottom: 1px solid transparent;
    cursor: pointer;
    transition: color 0.2s ease, border-color 0.2s ease;
  }

  .org-not-found__home-link:hover {
    color: #fff;
    border-bottom-color: rgba(255, 255, 255, 0.4);
  }
</style>
