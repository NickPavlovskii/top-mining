<template>
  <div
    ref="rootRef"
    class="catalog-sort"
  >
    <button
      type="button"
      class="catalog-sort__trigger"
      :aria-expanded="isOpen"
      aria-haspopup="listbox"
      @click="toggle"
    >
      <span class="catalog-sort__label">Сортировка</span>
      <Icon
        name="mdi:chevron-up"
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
        :id="`sort-${option.value}`"
        :key="option.value"
        type="button"
        role="option"
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
          :name="option.icon"
          class="catalog-sort__option-icon"
          aria-hidden="true"
        />
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
  import type { CatalogManufacturersSort } from '~/types/catalog-manufacturers'

  type SortOption = {
    value: CatalogManufacturersSort
    label: string
    icon?: string
  }

  const options: SortOption[] = [
    { value: 'rating-desc', label: 'Высокий рейтинг' },
    { value: 'rating-asc', label: 'Низкий рейтинг' },
    {
      value: 'reviews-desc',
      label: 'По кол-ву отзывов',
      icon: 'mdi:arrow-down',
    },
    {
      value: 'reviews-asc',
      label: 'По кол-ву отзывов',
      icon: 'mdi:arrow-up',
    },
    { value: 'name-asc', label: 'По названию (A-Z)' },
    { value: 'name-desc', label: 'По названию (Z-A)' },
  ]

  const modelValue = defineModel<CatalogManufacturersSort>({
    default: 'name-asc',
  })

  const isOpen = ref(false)
  const rootRef = ref<HTMLElement | null>(null)

  function toggle() {
    isOpen.value = !isOpen.value
  }

  function select(value: CatalogManufacturersSort) {
    modelValue.value = value
    isOpen.value = false
  }

  function onDocumentClick(event: MouseEvent) {
    if (!rootRef.value?.contains(event.target as Node)) {
      isOpen.value = false
    }
  }

  onMounted(() => {
    document.addEventListener('click', onDocumentClick)
  })

  onBeforeUnmount(() => {
    document.removeEventListener('click', onDocumentClick)
  })
</script>

<style scoped>
  .catalog-sort {
    position: relative;
    flex-shrink: 0;
  }

  .catalog-sort__trigger {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    min-height: 56px;
    padding: 0 20px;
    border: 0;
    border-radius: 999px;
    background: #fff;
    color: #141414;
    font-family: inherit;
    font-size: 14px;
    font-weight: 600;
    line-height: 1.2;
    white-space: nowrap;
    cursor: pointer;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.04);
  }

  .catalog-sort__chevron {
    width: 18px;
    height: 18px;
    color: var(--tm-orange);
    transform: rotate(180deg);
    transition: transform 0.2s ease;
  }

  .catalog-sort__chevron--open {
    transform: rotate(0deg);
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
