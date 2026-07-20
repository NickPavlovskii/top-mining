<template>
  <div :class="['app-error-page', { 'app-error-page--404': isNotFound }]">
    <top-mining-header :force-compact="isNotFound" />
    <main class="app-error-page__main">
      <app-not-found-cloud
        v-if="isNotFound"
        :title="notFoundTitle"
        @home="goHome"
      />
      <div
        v-else
        class="app-error"
      >
        <div class="app-error__inner">
          <p class="app-error__code">
            {{ error?.statusCode || 500 }}
          </p>
          <h1 class="app-error__title">
            {{ genericTitle }}
          </h1>
          <p class="app-error__text">
            {{ genericDescription }}
          </p>
          <div class="app-error__actions">
            <top-mining-button
              title="На главную"
              href="/"
              v-bind="TOP_MINING_BUTTON_PROPS"
              @click="goHome"
            />
          </div>
        </div>
      </div>
    </main>
    <top-mining-footer v-if="!isNotFound" />
  </div>
</template>

<script setup lang="ts">
  import type { NuxtError } from '#app'
  import AppNotFoundCloud from '~/components/global/AppNotFoundCloud.vue'
  import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining'

  definePageMeta({
    layout: false,
  })

  const props = defineProps<{
    error: NuxtError
  }>()

  const message = computed(() => String(props.error?.statusMessage || ''))
  const statusCode = computed(() => Number(props.error?.statusCode || 500))
  const isNotFound = computed(() => statusCode.value === 404)

  const notFoundTitle = computed(() => {
    if (
      message.value.includes('Организац')
      || message.value.includes('организац')
    ) {
      return message.value
    }

    return 'Страница не найдена'
  })

  const genericTitle = computed(() => {
    if (isNotFound.value) {
      return 'Страница не найдена'
    }

    return 'Что-то пошло не так'
  })

  const genericDescription = computed(() => {
    if (isNotFound.value) {
      return 'Запрошенная страница не существует или была перемещена.'
    }

    return message.value || 'Попробуйте обновить страницу чуть позже.'
  })

  function handleClear() {
    clearError({ redirect: '/' })
  }

  function goHome() {
    clearError({ redirect: '/' })
  }

  useSeoMeta({
    title: () => `${statusCode.value} — ТОП МАЙНИНГ`,
  })
</script>

<style scoped>
  .app-error-page {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    background: var(--tm-surface-light, #f2f2f2);
  }

  .app-error-page--404 {
    background: #fff;
  }

  .app-error-page__main {
    display: flex;
    flex: 1;
    flex-direction: column;
    min-height: 0;
  }

  .app-error {
    flex: 1;
    min-height: 55vh;
    background: var(--tm-surface-light, #f2f2f2);
  }

  .app-error__inner {
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(48px, 8vw, 96px) clamp(16px, 4vw, 60px)
      clamp(80px, 12vw, 140px);
  }

  .app-error__code {
    margin: 0 0 12px;
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(48px, 10vw, 96px);
    font-weight: 500;
    line-height: 1;
  }

  .app-error__title {
    margin: 0 0 16px;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 5vw, 48px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .app-error__text {
    margin: 0 0 36px;
    max-width: 42ch;
    color: #666;
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 20px);
    line-height: 1.45;
  }

  .app-error__actions {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 20px 28px;
  }

  .app-error__retry {
    padding: 0;
    border: 0;
    background: none;
    color: #666;
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 16px;
    cursor: pointer;
    border-bottom: 1px solid transparent;
  }

  .app-error__retry:hover {
    color: #141414;
    border-bottom-color: rgba(20, 20, 20, 0.35);
  }
</style>
