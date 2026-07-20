<template>
  <div
    ref="rootRef"
    :class="['catalog-sort', { 'catalog-sort--block': props.block }]"
  >
    <button
      type="button"
      class="catalog-sort__trigger"
      aria-haspopup="listbox"
      :aria-expanded="isOpen"
      @click="toggle"
    >
      <span class="catalog-sort__label">Сортировка</span>
      <Icon
        name="mdi:chevron-down"
        :class="[
          'catalog-sort__chevron',
          { 'catalog-sort__chevron--open': isOpen },
        ]"
        aria-hidden="true"
      />
    </button>

    <div
      v-show="isOpen"
      class="catalog-sort__menu"
      role="listbox"
      :aria-activedescendant="`sort-${modelValue}`"
    >
      <button
        v-for="option in options"
        type="button"
        role="option"
        :id="`sort-${option.value}`"
        :key="option.value"
        :aria-selected="modelValue === option.value"
        :class="[
          'catalog-sort__option',
          { 'catalog-sort__option--active': modelValue === option.value },
        ]"
        @click="select(option.value)"
      >
        <span>{{ option.label }}</span>
        <Icon
          v-if="option.icon"
          class="catalog-sort__option-icon"
          aria-hidden="true"
          :name="option.icon"
        />
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { onClickOutside } from '@vueuse/core'
  import {
    CATALOG_MANUFACTURERS_SORT_OPTIONS,
    type CatalogManufacturersSort,
  } from '~/common/modules/catalog'

  const options = CATALOG_MANUFACTURERS_SORT_OPTIONS

  const props = withDefaults(
    defineProps<{
      /** Растянуть триггер на всю ширину контейнера */
      block?: boolean
    }>(),
    {
      block: false,
    },
  )

  const modelValue = defineModel<CatalogManufacturersSort>({
    default: 'name-asc',
  })

  const isOpen = ref(false)
  const rootRef = useTemplateRef<HTMLElement>('rootRef')

  onClickOutside(rootRef, () => {
    isOpen.value = false
  })

  function toggle() {
    isOpen.value = !isOpen.value
  }

  function select(value: CatalogManufacturersSort) {
    modelValue.value = value
    isOpen.value = false
  }
</script>

<style scoped>
  .catalog-sort {
    position: relative;
    flex-shrink: 0;
    min-width: 0;
  }

  .catalog-sort--block {
    width: 100%;
    flex-shrink: 1;
  }

  .catalog-sort__trigger {
    display: inline-flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    min-height: 48px;
    padding: 0 16px;
    border: 1px solid #e5e7eb;
    border-radius: 16px;
    background: #fff;
    color: #374151;
    font-family: inherit;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.2;
    letter-spacing: 0;
    text-transform: none;
    white-space: nowrap;
    cursor: pointer;
    box-sizing: border-box;
    transition: border-color 0.15s ease;
  }

  @media (hover: hover) {
    .catalog-sort__trigger:hover,
    .catalog-sort__trigger:focus-visible {
      border-color: #d1d5db;
      outline: none;
    }
  }

  .catalog-sort__chevron {
    width: 18px;
    height: 18px;
    flex-shrink: 0;
    color: #6b7280;
    transition: transform 0.2s ease;
  }

  .catalog-sort__chevron--open {
    transform: rotate(180deg);
  }

  .catalog-sort__menu {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    z-index: 20;
    min-width: 240px;
    padding: 8px 0;
    border-radius: 16px;
    background: #fff;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
  }

  .catalog-sort__option {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    padding: 10px 18px;
    border: 0;
    background: transparent;
    color: var(--tm-text-muted);
    font-family: inherit;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.3;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.15s ease, color 0.15s ease;
  }

  @media (hover: hover) {
    .catalog-sort__option:hover,
    .catalog-sort__option:focus-visible {
      background: rgba(0, 120, 255, 0.08);
      color: #141414;
    }
  }

  .catalog-sort__option--active {
    background: rgba(0, 120, 255, 0.1);
    color: #141414;
  }

  .catalog-sort__option-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    color: #5b9bd5;
  }

  .catalog-sort__option--active .catalog-sort__option-icon {
    color: #5b9bd5;
  }
</style>
