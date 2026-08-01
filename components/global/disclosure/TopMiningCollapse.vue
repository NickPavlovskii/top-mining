<template>
  <div
    :class="[
      'tm-collapse',
      `tm-collapse--${variant}`,
      { 'tm-collapse--open': open },
    ]"
    :aria-hidden="!open"
  >
    <div class="tm-collapse__clip">
      <div
        class="tm-collapse__panel"
        :inert="isInert"
      >
        <slot />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  /**
   * Визуальный вариант коллапса.
   * - `plain` — только анимация высоты
   * - `panel` — тёмная карточка с рамкой
   */
  export type TopMiningCollapseVariant = 'plain' | 'panel'

  /**
   * @property open Открыт ли блок контента.
   * В закрытом состоянии контент скрыт (`aria-hidden`) и недоступен для фокуса (`inert`).
   * @default false
   * @property variant Внешний вид панели.
   * @default 'plain'
   */
  const props = withDefaults(
    defineProps<{
      open?: boolean
      variant?: TopMiningCollapseVariant
    }>(),
    {
      open: false,
      variant: 'plain',
    },
  )

  const isInert = computed(() => !props.open)
</script>

<style scoped>
  .tm-collapse {
    display: grid;
    grid-template-rows: 0fr;
    margin-top: 0;
    transition:
      grid-template-rows 0.5s cubic-bezier(0.22, 1, 0.36, 1),
      margin-top 0.5s cubic-bezier(0.22, 1, 0.36, 1);
  }

  .tm-collapse--open {
    grid-template-rows: 1fr;
    margin-top: 12px;
  }

  .tm-collapse__clip {
    overflow: hidden;
    min-height: 0;
  }

  .tm-collapse__panel {
    opacity: 0;
    transform: translateY(-10px);
    transition:
      opacity 0.35s ease,
      transform 0.5s cubic-bezier(0.22, 1, 0.36, 1);
  }

  .tm-collapse--panel .tm-collapse__panel {
    box-sizing: border-box;
    padding: 28px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 32px;
    background: rgba(247, 247, 247, 0.04);
  }

  .tm-collapse--open .tm-collapse__panel {
    opacity: 1;
    transform: translateY(0);
  }

  .tm-collapse:not(.tm-collapse--open) .tm-collapse__panel {
    transition:
      opacity 0.25s ease,
      transform 0.35s cubic-bezier(0.4, 0, 1, 1);
  }

  @media (prefers-reduced-motion: reduce) {
    .tm-collapse,
    .tm-collapse__panel {
      transition: none;
    }

    .tm-collapse__panel {
      transform: none;
    }
  }

  @media (max-width: 767px) {
    .tm-collapse--panel .tm-collapse__panel {
      padding: 18px 14px;
      border-radius: 24px;
    }
  }
</style>
