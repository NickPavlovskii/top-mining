<template>
  <div
    class="top-mining-pill-tabs"
    role="tablist"
    :aria-label="ariaLabel"
  >
    <button
      v-for="tab in resolvedTabs"
      type="button"
      role="tab"
      :id="tab.domId"
      :key="tab.id"
      :class="[
        'top-mining-pill-tabs__tab',
        { 'top-mining-pill-tabs__tab--active': tab.id === modelValue },
      ]"
      :aria-selected="tab.id === modelValue"
      :aria-controls="tab.controlsId"
      :tabindex="tab.id === modelValue ? 0 : -1"
      @click="modelValue = tab.id"
    >
      {{ tab.label }}
    </button>
  </div>
</template>

<script setup lang="ts">
  export type TopMiningPillTab = {
    id: string
    label: string
  }

  const props = withDefaults(
    defineProps<{
      tabs: readonly TopMiningPillTab[]
      ariaLabel?: string
      tabIdPrefix?: string
      controlsIdPrefix?: string
    }>(),
    {
      ariaLabel: 'Вкладки',
      tabIdPrefix: '',
      controlsIdPrefix: '',
    },
  )

  const modelValue = defineModel<string>({ required: true })

  const resolvedTabs = computed(() =>
    props.tabs.map((tab) => ({
      ...tab,
      domId: props.tabIdPrefix
        ? `${props.tabIdPrefix}-${tab.id}`
        : undefined,
      controlsId: props.controlsIdPrefix
        ? `${props.controlsIdPrefix}-${tab.id}`
        : undefined,
    })),
  )
</script>

<style scoped>
  .top-mining-pill-tabs {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    margin: 0;
    padding: 0;
  }

  .top-mining-pill-tabs__tab {
    padding: 10px 18px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.55);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.3;
    cursor: pointer;
    transition:
      color 0.2s ease,
      border-color 0.2s ease,
      background 0.2s ease;
  }

  .top-mining-pill-tabs__tab:hover,
  .top-mining-pill-tabs__tab:focus-visible {
    color: #fff;
    border-color: rgba(255, 255, 255, 0.4);
  }

  .top-mining-pill-tabs__tab--active {
    color: #fff;
    border-color: var(--tm-orange);
  }

  @media (max-width: 1439px) {
    .top-mining-pill-tabs {
      max-width: 446px;
      gap: 10px;
      margin-inline: auto;
    }
  }
</style>
