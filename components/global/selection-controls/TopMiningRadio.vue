<template>
  <label
    :class="[
      'top-mining-radio',
      `top-mining-radio--${size}`,
      {
        'top-mining-radio--checked': isChecked,
        'top-mining-radio--indeterminate': indeterminate,
        'top-mining-radio--disabled': disabled,
      },
    ]"
  >
    <input
      v-model="model"
      type="radio"
      class="top-mining-radio__input"
      :disabled="disabled"
      :name="name"
      :value="value"
      :aria-checked="indeterminate ? 'mixed' : isChecked"
    />
    <span class="top-mining-radio__control" aria-hidden="true" />
    <span
      v-if="label || $slots.default"
      class="top-mining-radio__label"
    >
      <slot>{{ label }}</slot>
    </span>
  </label>
</template>

<script setup lang="ts">
  /**
   * Радиокнопка Top Mining для выбора одного значения из группы.
   *
   * @param {String} [label = ''] - подпись рядом с радиокнопкой
   * @param {Boolean} [indeterminate = false] - неопределённое (частично выбранное) состояние
   * @param {Boolean} [disabled = false] - блокировка взаимодействия
   * @param {String} [size = 'md'] - размер: md или sm
   * @param {String} [name] - имя группы радиокнопок
   * @param {String | Number | Boolean} value - значение этой радиокнопки
   */
  const props = withDefaults(
    defineProps<{
      label?: string
      indeterminate?: boolean
      disabled?: boolean
      size?: 'md' | 'sm'
      name?: string
      value: string | number | boolean
    }>(),
    {
      label: '',
      indeterminate: false,
      disabled: false,
      size: 'md',
      name: undefined,
    },
  )

  const model = defineModel<string | number | boolean>()

  const isChecked = computed(
    () => model.value === props.value && !props.indeterminate,
  )
</script>

<style scoped>
  .top-mining-radio {
    --tm-radio-size: 24px;
    --tm-radio-border: var(--tm-border-dark);

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

  .top-mining-radio--sm {
    --tm-radio-size: 18px;
    gap: 8px;
    font-size: 13px;
  }

  .top-mining-radio--disabled {
    cursor: not-allowed;
    opacity: 0.5;
  }

  .top-mining-radio__input {
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

  .top-mining-radio__control {
    position: relative;
    flex: 0 0 auto;
    width: var(--tm-radio-size);
    height: var(--tm-radio-size);
    margin-top: 1px;
    border: 1.5px solid var(--tm-radio-border);
    border-radius: 50%;
    background: transparent;
    box-sizing: border-box;
    transition:
      border-color 0.18s ease,
      background 0.18s ease;
  }

  .top-mining-radio__control::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: calc(var(--tm-radio-size) * 0.42);
    height: calc(var(--tm-radio-size) * 0.42);
    border-radius: 50%;
    background: var(--tm-orange);
    opacity: 0;
    transform: translate(-50%, -50%) scale(0.6);
    transition:
      opacity 0.15s ease,
      transform 0.15s ease;
  }

  .top-mining-radio--checked .top-mining-radio__control {
    border-color: var(--tm-orange);
    background: var(--tm-orange);
    box-shadow: 0 2px 8px color-mix(in srgb, var(--tm-orange) 28%, transparent);
  }

  .top-mining-radio--checked .top-mining-radio__control::after {
    opacity: 0;
  }

  .top-mining-radio--indeterminate .top-mining-radio__control {
    border-color: var(--tm-orange);
    background: transparent;
  }

  .top-mining-radio--indeterminate .top-mining-radio__control::after {
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
  }

  @media (hover: hover) {
    .top-mining-radio:not(.top-mining-radio--disabled):not(.top-mining-radio--checked):not(
        .top-mining-radio--indeterminate
      ):hover
      .top-mining-radio__control,
    .top-mining-radio:not(.top-mining-radio--disabled):not(.top-mining-radio--checked):not(
        .top-mining-radio--indeterminate
      ):has(.top-mining-radio__input:focus-visible)
      .top-mining-radio__control {
      border-color: var(--tm-orange);
    }
  }

  .top-mining-radio__input:focus-visible + .top-mining-radio__control {
    outline: 2px solid color-mix(in srgb, var(--tm-orange) 45%, transparent);
    outline-offset: 2px;
  }

  .top-mining-radio__label {
    min-width: 0;
    padding-top: 2px;
  }

  .top-mining-radio--sm .top-mining-radio__label {
    padding-top: 0;
  }
</style>
