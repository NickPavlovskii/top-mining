<template>
  <Teleport to="body">
    <div
      v-if="open"
      class="calculator-alert-modal"
      role="dialog"
      aria-modal="true"
      aria-labelledby="calculator-alert-title"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="calculator-alert-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div class="calculator-alert-modal__panel" tabindex="-1">
        <button
          type="button"
          class="calculator-alert-modal__close"
          aria-label="Закрыть"
          @click="close"
        >
          <img
            class="calculator-alert-modal__close-icon"
            :src="closeIcon"
            alt=""
            aria-hidden="true"
          />
        </button>

        <p
          id="calculator-alert-title"
          class="calculator-alert-modal__text"
        >
          <slot />
        </p>

        <button
          type="button"
          class="calculator-alert-modal__confirm"
          @click="close"
        >
          {{ confirmLabel }}
        </button>
      </div>
    </div>
  </Teleport>
</template>

<script setup lang="ts">
import closeIcon from '~/assets/images/top-mining/icons/close-icon.png'

const open = defineModel<boolean>('open', { default: false })

withDefaults(
  defineProps<{
    title?: string
    confirmLabel?: string
  }>(),
  {
    title: '',
    confirmLabel: 'Хорошо',
  },
)

function close() {
  open.value = false
}
</script>

<style scoped lang="scss">
@use './calculator-modal' as *;

.calculator-alert-modal {
  @include calculator-modal-theme;

  position: fixed;
  inset: 0;
  z-index: 1000;
  display: grid;
  place-items: center;
  padding: 24px;
}

.calculator-alert-modal__backdrop {
  position: absolute;
  inset: 0;
  border: 0;
  background: rgba(0, 0, 0, 0.55);
  backdrop-filter: blur(4px);
  cursor: pointer;
}

.calculator-alert-modal__panel {
  position: relative;
  z-index: 1;
  width: min(100%, 480px);
  padding: 48px 40px 40px;
  border-radius: 28px;
  background: var(--tm-panel);
  box-shadow: 0 24px 64px rgba(0, 0, 0, 0.45);
  text-align: center;
}

.calculator-alert-modal__close {
  position: absolute;
  top: 18px;
  right: 18px;
  display: grid;
  place-items: center;
  width: 36px;
  height: 36px;
  padding: 0;
  border: 0;
  border-radius: 50%;
  background: transparent;
  cursor: pointer;
}

.calculator-alert-modal__close-icon {
  width: 18px;
  height: 18px;
  object-fit: contain;
  opacity: 0.7;
}

.calculator-alert-modal__text {
  margin: 0 0 28px;
  color: var(--tm-white);
  font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
  font-size: clamp(18px, 2.2vw, 22px);
  font-weight: 600;
  line-height: 1.45;
}

.calculator-alert-modal__confirm {
  min-width: 160px;
  height: 52px;
  padding: 0 32px;
  border: 1px solid var(--tm-orange);
  border-radius: 999px;
  background: transparent;
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  font-size: 15px;
  font-weight: 700;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  transition:
    background 0.2s ease,
    border-color 0.2s ease;

  &:hover {
    background: rgba(236, 81, 0, 0.12);
    border-color: var(--tm-orange-soft);
  }
}
</style>
