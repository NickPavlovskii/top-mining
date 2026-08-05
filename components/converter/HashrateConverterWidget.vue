<template>
  <section
    class="hashrate-converter"
    aria-label="Конвертер хешрейта"
  >
    <div class="hashrate-converter__inner">
      <div class="hashrate-converter__panel">
        <div
          v-for="unit in units"
          :key="unit.id"
          class="hashrate-converter__row"
        >
          <div class="hashrate-converter__field-wrap">
            <input
              :id="`hashrate-${unit.id}`"
              v-model="values[unit.id]"
              class="hashrate-converter__input"
              type="text"
              inputmode="decimal"
              autocomplete="off"
              :aria-label="`Значение в ${unit.shortLabel}`"
              @input="onInput(unit.id, $event)"
              @focus="activeUnitId = unit.id"
            >

            <div class="hashrate-converter__field-meta">
              <button
                type="button"
                class="hashrate-converter__copy"
                :aria-label="`Скопировать значение ${unit.shortLabel}`"
                @click="copyValue(unit.id)"
              >
                <Icon
                  name="mdi:content-copy"
                  class="hashrate-converter__copy-icon"
                />
              </button>

              <label
                class="hashrate-converter__unit-short"
                :for="`hashrate-${unit.id}`"
              >
                {{ unit.shortLabel }}
              </label>
            </div>
          </div>

          <p class="hashrate-converter__unit-name">
            {{ unit.name }}
            <span
              v-if="unit.multiplierLabel"
              class="hashrate-converter__unit-multiplier"
            >
              ({{ unit.multiplierLabel }})
            </span>
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    HASHRATE_CONVERTER_UNITS,
    convertHashrateValues,
    createDefaultHashrateValues,
    type HashrateConverterUnitId,
  } from '~/common/modules/top-mining/hashrate-converter'

  const units = HASHRATE_CONVERTER_UNITS
  const values = ref(createDefaultHashrateValues())
  const activeUnitId = ref<HashrateConverterUnitId | null>(null)
  const copiedUnitId = ref<HashrateConverterUnitId | null>(null)

  let copiedTimeout: ReturnType<typeof setTimeout> | undefined

  function onInput(unitId: HashrateConverterUnitId, event: Event) {
    const target = event.target as HTMLInputElement
    values.value = convertHashrateValues(unitId, target.value)
  }

  async function copyValue(unitId: HashrateConverterUnitId) {
    const text = values.value[unitId]

    if (!text) {
      return
    }

    try {
      await navigator.clipboard.writeText(text)
      copiedUnitId.value = unitId

      if (copiedTimeout) {
        clearTimeout(copiedTimeout)
      }

      copiedTimeout = setTimeout(() => {
        copiedUnitId.value = null
      }, 1500)
    } catch {
      // Clipboard may be unavailable in insecure contexts.
    }
  }

  onBeforeUnmount(() => {
    if (copiedTimeout) {
      clearTimeout(copiedTimeout)
    }
  })
</script>

<style scoped>
  .hashrate-converter {
    background: #1f1f1f;
    color: var(--tm-white);
    padding: 0 0 clamp(48px, 6vw, 80px);
  }

  .hashrate-converter__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .hashrate-converter__panel {
    display: flex;
    flex-direction: column;
    gap: 12px;
    padding: clamp(20px, 3vw, 32px);
    border-radius: clamp(24px, 4vw, 40px);
    background: #2a2a2a;
  }

  .hashrate-converter__row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(140px, 280px);
    gap: clamp(12px, 2vw, 24px);
    align-items: center;
  }

  .hashrate-converter__field-wrap {
    display: flex;
    align-items: stretch;
    min-height: 64px;
    border-radius: 20px;
    background: #1f1f1f;
    overflow: hidden;
  }

  .hashrate-converter__input {
    flex: 1 1 auto;
    min-width: 0;
    padding: 16px 20px;
    border: 0;
    background: transparent;
    color: var(--tm-white);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.6vw, 20px);
    font-weight: 600;
    line-height: 1.2;
    outline: none;
  }

  .hashrate-converter__input::-webkit-outer-spin-button,
  .hashrate-converter__input::-webkit-inner-spin-button {
    appearance: none;
    margin: 0;
  }

  .hashrate-converter__field-meta {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 16px 0 0;
    flex-shrink: 0;
  }

  .hashrate-converter__copy {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    padding: 0;
    border: 1px dashed rgba(246, 246, 246, 0.35);
    border-radius: 8px;
    background: transparent;
    color: rgba(246, 246, 246, 0.75);
    cursor: pointer;
    transition:
      border-color 0.2s ease,
      color 0.2s ease,
      background-color 0.2s ease;
  }

  .hashrate-converter__copy:hover,
  .hashrate-converter__copy:focus-visible {
    border-color: var(--tm-orange, #ff5c00);
    color: var(--tm-white);
    background: rgba(255, 92, 0, 0.08);
    outline: none;
  }

  .hashrate-converter__copy-icon {
    width: 16px;
    height: 16px;
  }

  .hashrate-converter__unit-short {
    min-width: 52px;
    color: rgba(246, 246, 246, 0.72);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 1;
    text-align: right;
    white-space: nowrap;
  }

  .hashrate-converter__unit-name {
    margin: 0;
    color: rgba(246, 246, 246, 0.72);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(14px, 1.4vw, 16px);
    font-weight: 400;
    line-height: 1.35;
  }

  .hashrate-converter__unit-multiplier {
    white-space: nowrap;
  }

  @media (max-width: 899px) {
    .hashrate-converter__inner {
      padding: 0 16px;
    }

    .hashrate-converter__row {
      grid-template-columns: 1fr;
      gap: 8px;
    }

    .hashrate-converter__field-wrap {
      min-height: 56px;
    }

    .hashrate-converter__input {
      padding: 14px 16px;
    }

    .hashrate-converter__unit-name {
      padding-left: 4px;
    }
  }
</style>
