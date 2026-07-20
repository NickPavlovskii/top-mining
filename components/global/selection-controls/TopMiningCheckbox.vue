<template>
  <label
    :class="[
      'top-mining-checkbox',
      `top-mining-checkbox--${size}`,
      {
        'top-mining-checkbox--checked': isChecked,
        'top-mining-checkbox--indeterminate': indeterminate,
        'top-mining-checkbox--disabled': disabled,
      },
    ]"
  >
    <input
      ref="inputRef"
      v-model="model"
      type="checkbox"
      class="top-mining-checkbox__input"
      :disabled="disabled"
      :name="name"
      :value="value"
      :aria-checked="indeterminate ? 'mixed' : model"
      @change="onChange"
    />
    <span class="top-mining-checkbox__control" aria-hidden="true" />
    <span
      v-if="label || $slots.default"
      class="top-mining-checkbox__label"
    >
      <slot>{{ label }}</slot>
    </span>
  </label>
</template>

<script setup lang="ts">
  /**
   * Чекбокс Top Mining с поддержкой indeterminate-состояния.
   *
   * @param {String} [label = ''] - подпись рядом с чекбоксом
   * @param {Boolean} [indeterminate = false] - неопределённое (частично выбранное) состояние
   * @param {Boolean} [disabled = false] - блокировка взаимодействия
   * @param {String} [size = 'md'] - размер: md или sm
   * @param {String} [name] - имя поля формы
   * @param {String | Number | Boolean} [value] - значение чекбокса при отправке формы
   */
  const props = withDefaults(
    defineProps<{
      label?: string
      indeterminate?: boolean
      disabled?: boolean
      size?: 'md' | 'sm'
      name?: string
      value?: string | number | boolean
    }>(),
    {
      label: '',
      indeterminate: false,
      disabled: false,
      size: 'md',
      name: undefined,
      value: undefined,
    },
  )

  const model = defineModel<boolean>({ default: false })

  const inputRef = ref<HTMLInputElement | null>(null)

  const isChecked = computed(() => model.value && !props.indeterminate)

  function syncIndeterminate() {
    if (inputRef.value) {
      inputRef.value.indeterminate = props.indeterminate
    }
  }

  const emit = defineEmits<{
    'update:indeterminate': [value: boolean]
  }>()

  function onChange() {
    if (props.indeterminate) {
      model.value = true
      emit('update:indeterminate', false)
    }
  }

  watch(
    () => props.indeterminate,
    () => syncIndeterminate(),
    { immediate: true },
  )

  onMounted(syncIndeterminate)
</script>

<style scoped>
  .top-mining-checkbox {
    --tm-checkbox-size: 24px;
    --tm-checkbox-radius: 6px;
    --tm-checkbox-border: var(--tm-border-dark);
    --tm-checkbox-bg: transparent;

    display: inline-flex;
    align-items: flex-start;
    gap: 10px;
    max-width: 100%;
    color: var(--tm-text-secondary);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.35;
    cursor: pointer;
    user-select: none;
  }

  .top-mining-checkbox--sm {
    --tm-checkbox-size: 18px;
    --tm-checkbox-radius: 4px;
    gap: 8px;
    font-size: 13px;
  }

  .top-mining-checkbox--disabled {
    cursor: not-allowed;
    opacity: 0.5;
  }

  .top-mining-checkbox__input {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  .top-mining-checkbox__control {
    position: relative;
    flex: 0 0 auto;
    width: var(--tm-checkbox-size);
    height: var(--tm-checkbox-size);
    margin-top: 1px;
    border: 1.5px solid var(--tm-checkbox-border);
    border-radius: var(--tm-checkbox-radius);
    background: var(--tm-checkbox-bg);
    box-sizing: border-box;
    transition:
      border-color 0.18s ease,
      background 0.18s ease,
      box-shadow 0.18s ease;
  }

  .top-mining-checkbox__control::before,
  .top-mining-checkbox__control::after {
    content: '';
    position: absolute;
    opacity: 0;
    transition: opacity 0.15s ease;
  }

  /* Галочка */
  .top-mining-checkbox__control::before {
    top: 50%;
    left: 50%;
    width: calc(var(--tm-checkbox-size) * 0.28);
    height: calc(var(--tm-checkbox-size) * 0.5);
    border-right: 2px solid var(--tm-white);
    border-bottom: 2px solid var(--tm-white);
    transform: translate(-58%, -62%) rotate(45deg);
  }

  /* Черта indeterminate */
  .top-mining-checkbox__control::after {
    top: 50%;
    left: 50%;
    width: calc(var(--tm-checkbox-size) * 0.46);
    height: 2px;
    border-radius: 1px;
    background: var(--tm-white);
    transform: translate(-50%, -50%);
  }

  .top-mining-checkbox--checked .top-mining-checkbox__control {
    border-color: transparent;
    background: var(--tm-orange-accent-gradient-vertical);
    box-shadow: 0 2px 8px color-mix(in srgb, var(--tm-orange) 28%, transparent);
  }

  .top-mining-checkbox--checked .top-mining-checkbox__control::before {
    opacity: 1;
  }

  .top-mining-checkbox--indeterminate .top-mining-checkbox__control {
    border-color: transparent;
    background: var(--tm-surface-light);
    box-shadow: inset 0 0 0 1px color-mix(in srgb, var(--tm-border) 70%, transparent);
  }

  .top-mining-checkbox--indeterminate .top-mining-checkbox__control::after {
    opacity: 1;
  }

  @media (hover: hover) {
    .top-mining-checkbox:not(.top-mining-checkbox--disabled):not(
        .top-mining-checkbox--checked
      ):not(.top-mining-checkbox--indeterminate):hover
      .top-mining-checkbox__control,
    .top-mining-checkbox:not(.top-mining-checkbox--disabled):not(
        .top-mining-checkbox--checked
      ):not(.top-mining-checkbox--indeterminate):has(
        .top-mining-checkbox__input:focus-visible
      )
      .top-mining-checkbox__control {
      border-color: var(--tm-orange);
    }
  }

  .top-mining-checkbox__input:focus-visible + .top-mining-checkbox__control {
    outline: 2px solid color-mix(in srgb, var(--tm-orange) 45%, transparent);
    outline-offset: 2px;
  }

  .top-mining-checkbox__label {
    min-width: 0;
    padding-top: 2px;
  }

  .top-mining-checkbox--sm .top-mining-checkbox__label {
    padding-top: 0;
  }
</style>
