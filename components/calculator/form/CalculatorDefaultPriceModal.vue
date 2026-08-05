<template>
  <Teleport to="body">
    <div
      v-if="open"
      class="calculator-def-price-modal"
      role="dialog"
      aria-modal="true"
      aria-labelledby="calculator-def-price-title"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="calculator-def-price-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div class="calculator-def-price-modal__panel" tabindex="-1">
        <button
          type="button"
          class="calculator-def-price-modal__close"
          aria-label="Закрыть"
          @click="close"
        >
          <img
            class="calculator-def-price-modal__close-icon"
            :src="closeIcon"
            alt=""
            aria-hidden="true"
          />
        </button>

        <p
          id="calculator-def-price-title"
          class="calculator-def-price-modal__text"
        >
          По умолчанию стоимость вашего {{ deviceLabel }} —
          {{ defaultPriceLabel }}.
          <br />
          Вы можете изменить цену устройства.
        </p>

        <div class="calculator-def-price-modal__actions">
          <button
            type="button"
            class="calculator-def-price-modal__confirm"
            @click="confirm"
          >
            Рассчитать
          </button>
          <button
            type="button"
            class="calculator-def-price-modal__cancel"
            @click="close"
          >
            Отмена
          </button>
        </div>
      </div>
    </div>
  </Teleport>
</template>
<script setup lang="ts">
import closeIcon from '~/assets/images/top-mining/icons/close-icon.png'

const open = defineModel<boolean>('open', { default: false })

withDefaults(
  defineProps<{
    deviceLabel?: string
    defaultPriceLabel?: string
  }>(),
  {
    deviceLabel: 'ASIC-майнера',
    defaultPriceLabel: '120 000 ₽',
  },
)

const emit = defineEmits<{
  confirm: []
}>()

function close() {
  open.value = false
}

function confirm() {
  emit('confirm')
  open.value = false
}
</script>

<style scoped lang="scss">
@use './calculator-modal' as *;

.calculator-def-price-modal {
  @include calculator-modal-theme;

  position: fixed;
  inset: 0;
  z-index: 1000;
  display: grid;
  place-items: center;
  padding: 24px;
}

.calculator-def-price-modal__backdrop {
  position: absolute;
  inset: 0;
  border: 0;
  background: rgba(0, 0, 0, 0.55);
  backdrop-filter: blur(4px);
  cursor: pointer;
}

.calculator-def-price-modal__panel {
  position: relative;
  z-index: 1;
  width: min(100%, 520px);
  padding: 48px 40px 40px;
  border-radius: 28px;
  background: var(--tm-panel);
  box-shadow: 0 24px 64px rgba(0, 0, 0, 0.45);
  text-align: center;
}

.calculator-def-price-modal__close {
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

.calculator-def-price-modal__close-icon {
  width: 18px;
  height: 18px;
  object-fit: contain;
  opacity: 0.7;
}

.calculator-def-price-modal__text {
  margin: 0 0 28px;
  color: var(--tm-white);
  font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
  font-size: clamp(18px, 2.2vw, 22px);
  font-weight: 600;
  line-height: 1.45;
}

.calculator-def-price-modal__actions {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 12px;
}

.calculator-def-price-modal__confirm {
  min-width: 200px;
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

.calculator-def-price-modal__cancel {
  min-width: 140px;
  height: 52px;
  padding: 0 28px;
  border: 1px solid rgba(255, 255, 255, 0.22);
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
    border-color: rgba(255, 255, 255, 0.4);
    background: rgba(255, 255, 255, 0.06);
  }
}
</style>
