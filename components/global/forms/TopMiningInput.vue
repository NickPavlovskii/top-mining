<template>
  <label class="top-mining-input">
    <span
      v-if="label"
      class="top-mining-input__label"
    >
      {{ label }}
    </span>
    <span
      v-else-if="hideLabelVisually && accessibleLabel"
      class="top-mining-input__visually-hidden"
    >
      {{ accessibleLabel }}
    </span>
    <input
      v-model="model"
      class="top-mining-input__control"
      :type="type"
      :name="name"
      :placeholder="placeholder"
      :autocomplete="autocomplete"
      :inputmode="inputmode"
      :required="required"
      :disabled="disabled"
    >
  </label>
</template>

<script setup lang="ts">
  withDefaults(
    defineProps<{
      type?: string
      name?: string
      placeholder?: string
      label?: string
      accessibleLabel?: string
      hideLabelVisually?: boolean
      autocomplete?: string
      inputmode?:
        | 'none'
        | 'text'
        | 'tel'
        | 'url'
        | 'email'
        | 'numeric'
        | 'decimal'
        | 'search'
      required?: boolean
      disabled?: boolean
    }>(),
    {
      type: 'text',
      name: undefined,
      placeholder: '',
      label: '',
      accessibleLabel: '',
      hideLabelVisually: true,
      autocomplete: undefined,
      inputmode: undefined,
      required: false,
      disabled: false,
    },
  )

  const model = defineModel<string>({ default: '' })
</script>

<style scoped>
  .top-mining-input {
    display: block;
    width: 100%;
    min-width: 0;
  }

  .top-mining-input__label {
    display: block;
    margin-bottom: 8px;
    color: rgba(255, 255, 255, 0.85);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 1.3;
  }

  .top-mining-input__control {
    box-sizing: border-box;
    width: 100%;
    height: 56px;
    padding: 0 24px;
    border: 1px solid #5c5c5c;
    border-radius: 999px;
    background: transparent;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    line-height: 24px;
    outline: none;
  }

  .top-mining-input__control::placeholder {
    color: rgba(255, 255, 255, 0.45);
  }

  .top-mining-input__control:focus-visible {
    border-color: rgba(255, 255, 255, 0.7);
  }

  .top-mining-input__control:disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }

  .top-mining-input__visually-hidden {
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

  @media (max-width: 767px) {
    .top-mining-input__control {
      height: 46px;
      font-size: 14px;
    }
  }
</style>
