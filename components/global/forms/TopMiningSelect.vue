<script setup lang="ts">
import { onClickOutside } from '@vueuse/core'
import dropdownArrow from '@/assets/images/calculator/tabs/dropdown-arrow.svg'
import type {
  TopMiningSelectGroup,
  TopMiningSelectMode,
  TopMiningSelectOption,
  TopMiningSelectSize,
} from '@/components/global/forms/TopMiningSelect.types'

/**
 * селект Top Mining.
 *
 * @prop {TopMiningSelectMode} [mode='flat'] — режим списка:
 *   `flat` — плоский список (`options`),
 *   `tree` — группы с вложенными опциями (`groups`, например бренды → модели).
 * @prop {TopMiningSelectOption[]} [options=[]] — опции для режима `flat`.
 * @prop {TopMiningSelectGroup[]} [groups=[]] — группы для режима `tree`.
 * @prop {string} [placeholder='Выберите'] — текст кнопки, пока ничего не выбрано
 * @prop {string} [buttonLabel] — фиксированная подпись на кнопке
 * @prop {string} [buttonImage=''] — картинка на кнопке, пока у выбранной опции
 *   нет своего `image` (fallback-иконка).
 * @prop {boolean} [searchable=true] — показывать поле поиска в выпадающем списке.
 * @prop {string} [searchPlaceholder='Поиск...'] — placeholder поля поиска.
 * @prop {string} [emptyText='Ничего не найдено'] — текст, если поиск ничего не нашёл.
 * @prop {TopMiningSelectSize} [size='md'] — размер кнопки/выпадашки: `lg` | `md` | `sm`.
 * @prop {1|2} [columns=1] — число колонок в списке опций (например, 2 для монет).
 * @prop {boolean} [showOptionMeta=true] — показывать `meta` у опции (алгоритм и т.п.).
 * @prop {string} [ariaLabel] — accessible name кнопки селекта; по умолчанию
 *   берётся из `placeholder`.
 */
const props = withDefaults(
  defineProps<{
    mode?: TopMiningSelectMode
    options?: TopMiningSelectOption[]
    groups?: TopMiningSelectGroup[]
    placeholder?: string
    buttonLabel?: string
    buttonImage?: string
    searchable?: boolean
    searchPlaceholder?: string
    emptyText?: string
    size?: TopMiningSelectSize
    columns?: 1 | 2
    showOptionMeta?: boolean
    ariaLabel?: string
  }>(),
  {
    mode: 'flat',
    options: () => [],
    groups: () => [],
    placeholder: 'Выберите',
    buttonLabel: undefined,
    buttonImage: '',
    searchable: true,
    searchPlaceholder: 'Поиск...',
    emptyText: 'Ничего не найдено',
    size: 'md',
    columns: 1,
    showOptionMeta: true,
    ariaLabel: undefined,
  },
)

const model = defineModel<string | null>({ default: null })

const emit = defineEmits<{
  select: [option: TopMiningSelectOption]
}>()

const rootRef = ref<HTMLElement | null>(null)
const isOpen = ref(false)
const searchQuery = ref('')
const expandedGroups = ref<string[]>([])

const allFlatOptions = computed(() => {
  if (props.mode === 'flat') {
    return props.options
  }

  return props.groups.flatMap((group) => group.children)
})

const selectedOption = computed(
  () => allFlatOptions.value.find((item) => item.id === model.value) ?? null,
)

const resolvedButtonLabel = computed(() => {
  if (props.buttonLabel) {
    return props.buttonLabel
  }

  return selectedOption.value?.label || props.placeholder
})

const resolvedButtonImage = computed(
  () => selectedOption.value?.image || props.buttonImage || '',
)

const filteredOptions = computed(() => {
  const query = searchQuery.value.trim().toLowerCase()
  if (!query) {
    return props.options
  }

  return props.options.filter((option) =>
    matchesQuery(option, query),
  )
})

const filteredGroups = computed(() => {
  const query = searchQuery.value.trim().toLowerCase()
  if (!query) {
    return props.groups
  }

  return props.groups
    .map((group) => {
      const children = group.children.filter((child) =>
        matchesQuery(child, query),
      )
      const groupMatches = group.label.toLowerCase().includes(query)

      if (!groupMatches && children.length === 0) {
        return null
      }

      return {
        ...group,
        children: groupMatches && children.length === 0
          ? group.children
          : children,
      }
    })
    .filter((group): group is TopMiningSelectGroup => group !== null)
})

const hasResults = computed(() =>
  props.mode === 'tree'
    ? filteredGroups.value.length > 0
    : filteredOptions.value.length > 0,
)

const rootClass = computed(() => [
  'tm-select',
  `tm-select--${props.size}`,
  `tm-select--${props.mode}`,
  {
    'tm-select--open': isOpen.value,
    'tm-select--cols-2': props.mode === 'flat' && props.columns === 2,
    'tm-select--hide-meta': !props.showOptionMeta,
  },
])

watch(
  () => props.mode,
  () => {
    isOpen.value = false
    searchQuery.value = ''
    expandedGroups.value = []
  },
)

watch(searchQuery, (query) => {
  if (!query.trim() || props.mode !== 'tree') {
    return
  }

  expandedGroups.value = filteredGroups.value.map((group) => group.id)
})

onClickOutside(rootRef, () => {
  isOpen.value = false
})

function matchesQuery(option: TopMiningSelectOption, query: string): boolean {
  return (
    option.label.toLowerCase().includes(query) ||
    (option.meta?.toLowerCase().includes(query) ?? false)
  )
}

function toggleOpen() {
  isOpen.value = !isOpen.value
  if (!isOpen.value) {
    searchQuery.value = ''
  }
}

function isGroupExpanded(groupId: string): boolean {
  if (searchQuery.value.trim()) {
    return true
  }

  return expandedGroups.value.includes(groupId)
}

function toggleGroup(groupId: string) {
  if (searchQuery.value.trim()) {
    return
  }

  if (expandedGroups.value.includes(groupId)) {
    expandedGroups.value = expandedGroups.value.filter((id) => id !== groupId)
    return
  }

  expandedGroups.value = [...expandedGroups.value, groupId]
}

function selectOption(option: TopMiningSelectOption) {
  model.value = option.id
  emit('select', option)
  isOpen.value = false
  searchQuery.value = ''
}
</script>

<template>
  <div
    ref="rootRef"
    :class="rootClass"
  >
    <button
      type="button"
      class="tm-select__button"
      :aria-expanded="isOpen"
      aria-haspopup="listbox"
      :aria-label="ariaLabel"
      @click="toggleOpen"
    >
      <span class="tm-select__button-content">
        <img
          v-if="resolvedButtonImage"
          :src="resolvedButtonImage"
          :alt="resolvedButtonLabel"
          class="tm-select__button-img"
          width="48"
          height="48"
        />
        <span
          class="tm-select__button-text"
          :class="{ 'tm-select__button-text--placeholder': !selectedOption }"
        >
          {{ resolvedButtonLabel }}
        </span>
      </span>
      <span class="tm-select__button-arrow" aria-hidden="true">
        <img
          :src="dropdownArrow"
          alt=""
          class="tm-select__button-arrow-icon"
        />
      </span>
    </button>

    <div v-show="isOpen" class="tm-select__panel" role="listbox">
      <div v-if="searchable" class="tm-select__search">
        <input
          v-model="searchQuery"
          type="search"
          class="tm-select__search-input"
          :placeholder="searchPlaceholder"
          autocomplete="off"
          :aria-label="searchPlaceholder"
        />
        <span class="tm-select__search-icon" aria-hidden="true">
          <svg
            width="16"
            height="16"
            viewBox="0 0 16 16"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <circle
              cx="6.63"
              cy="6.63"
              r="5.96"
              stroke="#757575"
              stroke-linejoin="round"
            />
            <path
              d="M15.69 14.98L11.1 10.4l-.71.71 4.58 4.58a.5.5 0 0 0 .71-.71Z"
              fill="#757575"
            />
          </svg>
        </span>
      </div>

      <div class="tm-select__scroll">
        <template v-if="mode === 'tree' && hasResults">
          <div
            v-for="group in filteredGroups"
            :key="group.id"
            class="tm-select__group"
          >
            <button
              type="button"
              :class="[
                'tm-select__group-toggle',
                {
                  'tm-select__group-toggle--open': isGroupExpanded(group.id),
                },
              ]"
              @click="toggleGroup(group.id)"
            >
              <span>{{ group.label }}</span>
              <img
                alt=""
                class="tm-select__group-arrow"
                :src="dropdownArrow"
              />
            </button>

            <div
              v-show="isGroupExpanded(group.id)"
              class="tm-select__group-children"
            >
              <button
                v-for="option in group.children"
                :key="option.id"
                type="button"
                class="tm-select__option"
                :class="{
                  'tm-select__option--selected': option.id === model,
                }"
                role="option"
                :aria-selected="option.id === model"
                @click="selectOption(option)"
              >
                <img
                  v-if="option.image || buttonImage"
                  :src="option.image || buttonImage"
                  :alt="option.label"
                  class="tm-select__option-img"
                  width="40"
                  height="40"
                />
                <span class="tm-select__option-info">
                  <span class="tm-select__option-label">{{ option.label }}</span>
                  <span
                    v-if="showOptionMeta && option.meta"
                    class="tm-select__option-meta"
                  >
                    {{ option.meta }}
                  </span>
                </span>
              </button>
            </div>
          </div>
        </template>

        <template v-else-if="mode === 'flat' && hasResults">
          <button
            v-for="option in filteredOptions"
            :key="option.id"
            type="button"
            class="tm-select__option"
            :class="{
              'tm-select__option--selected': option.id === model,
            }"
            role="option"
            :aria-selected="option.id === model"
            @click="selectOption(option)"
          >
            <img
              v-if="option.image"
              :src="option.image"
              :alt="option.label"
              class="tm-select__option-img"
              width="28"
              height="28"
            />
            <span class="tm-select__option-info">
              <span class="tm-select__option-label">{{ option.label }}</span>
              <span
                v-if="showOptionMeta && option.meta"
                class="tm-select__option-meta"
              >
                {{ option.meta }}
              </span>
            </span>
          </button>
        </template>

        <p v-else class="tm-select__empty">{{ emptyText }}</p>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.tm-select {
  --tm-orange: #ec5100;
  --tm-orange-soft: #ff741f;
  --tm-panel: #262626;
  --tm-muted: #757575;
  --tm-white: #fff;

  position: relative;
  z-index: 20;
  width: 100%;
}

.tm-select__button {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
  width: 100%;
  border: 1px solid rgba(255, 255, 255, 0.18);
  background: rgba(38, 38, 38, 0.92);
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  text-align: left;
  overflow: hidden;
  transition:
    border-color 0.2s ease,
    border-radius 0.2s ease,
    background 0.2s ease;

  &:hover {
    border-color: rgba(255, 116, 31, 0.45);
  }
}

.tm-select--open .tm-select__button {
  border-color: var(--tm-orange-soft);
  border-bottom-color: transparent;
  background: var(--tm-panel);
}

.tm-select--open .tm-select__button-arrow {
  transform: rotate(180deg);
}

.tm-select__button-content {
  display: flex;
  align-items: center;
  gap: 14px;
  min-width: 0;
}

.tm-select__button-img {
  object-fit: contain;
  flex-shrink: 0;
}

.tm-select__button-text {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-weight: 600;

  &--placeholder {
    color: #a0a0a0;
    font-weight: 500;
  }
}

.tm-select__button-arrow {
  display: inline-flex;
  flex-shrink: 0;
  transition: transform 0.2s ease;

  img,
  .tm-select__button-arrow-icon {
    display: block;
    width: 20px;
    height: 20px;
  }
}

.tm-select__panel {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 30;
  overflow: hidden;
  border: 1px solid var(--tm-orange-soft);
  border-top: 0;
  background: var(--tm-panel);
  box-shadow: 0 16px 32px rgba(0, 0, 0, 0.35);
}

.tm-select__search {
  position: relative;
  padding: 12px 14px 8px;
}

.tm-select__search-input {
  width: 100%;
  height: 42px;
  padding: 0 40px 0 14px;
  border: 1px solid rgba(255, 255, 255, 0.16);
  border-radius: 12px;
  background: #1d1d1d;
  color: var(--tm-white);
  font: inherit;
  font-size: 14px;
  outline: none;

  &::placeholder {
    color: var(--tm-muted);
  }

  &:focus {
    border-color: var(--tm-orange-soft);
  }

  &::-webkit-search-cancel-button {
    appearance: none;
  }
}

.tm-select__search-icon {
  position: absolute;
  top: 50%;
  right: 28px;
  display: inline-flex;
  transform: translateY(-35%);
  pointer-events: none;
}

.tm-select__scroll {
  max-height: 320px;
  overflow-y: auto;
  overflow-x: hidden;
  overscroll-behavior: contain;
  padding: 0 8px 12px;
  scrollbar-width: thin;
  scrollbar-color: rgba(255, 116, 31, 0.7) transparent;

  &::-webkit-scrollbar {
    width: 6px;
  }

  &::-webkit-scrollbar-track {
    background: transparent;
    margin: 4px 0;
  }

  &::-webkit-scrollbar-thumb {
    background: rgba(255, 116, 31, 0.55);
    border-radius: 999px;

    &:hover {
      background: var(--tm-orange-soft);
    }
  }

  &::-webkit-scrollbar-button {
    display: none;
    width: 0;
    height: 0;
  }
}

.tm-select--flat .tm-select__scroll {
  display: grid;
  gap: 2px;
}

.tm-select--cols-2 .tm-select__scroll {
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 2px 8px;
}

.tm-select__group + .tm-select__group {
  margin-top: 4px;
}

.tm-select__group-toggle {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  width: 100%;
  padding: 10px;
  border: 0;
  background: transparent;
  color: var(--tm-orange);
  font-size: 15px;
  font-weight: 600;
  cursor: pointer;
  text-align: left;

  &--open .tm-select__group-arrow {
    transform: rotate(180deg);
  }
}

.tm-select__group-arrow {
  display: block;
  flex-shrink: 0;
  width: 18px;
  height: 18px;
  transition: transform 0.2s ease;
}

.tm-select__group-children {
  display: grid;
  gap: 2px;
  padding: 0 4px 8px;
}

.tm-select__option {
  display: flex;
  align-items: center;
  gap: 12px;
  width: 100%;
  min-width: 0;
  padding: 10px;
  border: 0;
  border-radius: 12px;
  background: transparent;
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  text-align: left;
  transition: background-color 0.15s ease;

  &:hover,
  &--selected {
    background: rgba(255, 116, 31, 0.12);
  }
}

.tm-select__option-img {
  object-fit: contain;
  flex-shrink: 0;
}

.tm-select--flat .tm-select__option-img {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  object-fit: cover;
}

.tm-select__option-info {
  display: grid;
  gap: 4px;
  min-width: 0;
}

.tm-select__option-label {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-size: 14px;
  font-weight: 600;
}

.tm-select__option-meta {
  color: rgba(255, 255, 255, 0.55);
  font-size: 12px;
}

.tm-select--hide-meta .tm-select__option-meta {
  display: none;
}

.tm-select__empty {
  grid-column: 1 / -1;
  margin: 0;
  padding: 18px 12px;
  color: var(--tm-muted);
  font-size: 14px;
  text-align: center;
}

/* Sizes */
.tm-select--lg .tm-select__button {
  height: 140px;
  padding: 20px 24px;
  border-radius: 32px;
  background: var(--tm-panel);
}

.tm-select--lg.tm-select--open .tm-select__button {
  border-radius: 32px 32px 0 0;
}

.tm-select--lg .tm-select__panel {
  border-radius: 0 0 32px 32px;
}

.tm-select--lg .tm-select__button-img {
  width: 64px;
  height: 64px;
}

.tm-select--lg .tm-select__button-arrow img,
.tm-select--lg .tm-select__button-arrow-icon {
  width: 28px;
  height: 28px;
}

.tm-select--lg .tm-select__button-text {
  font-size: 18px;
  font-weight: 700;
}

.tm-select--lg .tm-select__option-img {
  width: 40px;
  height: 40px;
}

.tm-select--md .tm-select__button {
  min-height: 56px;
  padding: 10px 16px;
  border-radius: 24px;
  background: rgba(0, 0, 0, 0.28);
}

.tm-select--md.tm-select--open .tm-select__button {
  border-radius: 24px 24px 0 0;
}

.tm-select--md .tm-select__panel {
  border-radius: 0 0 24px 24px;
}

.tm-select--md .tm-select__button-img {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  object-fit: cover;
}

.tm-select--md .tm-select__button-arrow img,
.tm-select--md .tm-select__button-arrow-icon {
  width: 22px;
  height: 22px;
}

.tm-select--md .tm-select__button-text {
  font-size: 16px;
}

.tm-select--md .tm-select__option-label {
  font-size: 12px;
  font-weight: 500;
}

.tm-select--sm .tm-select__button {
  min-height: 48px;
  padding: 10px 16px;
  border-radius: 16px;
  background: rgba(0, 0, 0, 0.28);
}

.tm-select--sm.tm-select--open .tm-select__button {
  border-radius: 16px 16px 0 0;
}

.tm-select--sm .tm-select__panel {
  border-radius: 0 0 16px 16px;
}

.tm-select--sm .tm-select__button-img {
  width: 28px;
  height: 28px;
}

.tm-select--sm .tm-select__button-arrow img,
.tm-select--sm .tm-select__button-arrow-icon {
  width: 18px;
  height: 18px;
}

.tm-select--sm .tm-select__button-text {
  font-size: 15px;
}

.tm-select--sm .tm-select__scroll {
  max-height: 240px;
}

@media (max-width: 767px) {
  .tm-select--lg .tm-select__button {
    height: 72px;
    padding: 12px 16px;
    border-radius: 18px;
  }

  .tm-select--lg.tm-select--open .tm-select__button {
    border-radius: 18px 18px 0 0;
  }

  .tm-select--lg .tm-select__panel {
    border-radius: 0 0 18px 18px;
  }

  .tm-select--lg .tm-select__button-img {
    width: 44px;
    height: 44px;
  }

  .tm-select--lg .tm-select__button-text {
    font-size: 15px;
  }

  .tm-select--lg .tm-select__scroll {
    max-height: 280px;
  }

  .tm-select--cols-2 .tm-select__scroll {
    grid-template-columns: 1fr;
  }
}
</style>
