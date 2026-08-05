<template>
  <top-mining-select
    v-model="selectedId"
    mode="flat"
    aria-label="Выберите монету"
    :size="size"
    :columns="columns"
    :options="options"
    :placeholder="placeholder"
    :button-label="buttonLabel"
    :show-option-meta="false"
    @select="onSelect"
  />
</template>

<script setup lang="ts">
import {
  formatCoinButtonLabel,
  formatCoinOptionLabel,
  formatGpuCoinOptionLabel,
} from '@/common/modules/top-mining'
import type { CalculatorCoin } from '@/common/modules/top-mining'
import TopMiningSelect from '@/components/global/forms/TopMiningSelect.vue'
import type { TopMiningSelectOption } from '@/components/global/forms/TopMiningSelect.types'

const props = withDefaults(
  defineProps<{
    coins: CalculatorCoin[]
    selected: CalculatorCoin | null
    placeholder?: string
    variant?: 'asic' | 'gpu'
  }>(),
  {
    placeholder: 'Выберите монету',
    variant: 'asic',
  },
)

const emit = defineEmits<{
  select: [coin: CalculatorCoin]
}>()

const selectedId = computed({
  get: () => props.selected?.id ?? null,
  set: () => {
    /* selection goes through @select */
  },
})

const size = computed(() => (props.variant === 'gpu' ? 'sm' : 'md'))

const columns = computed(() => (props.variant === 'asic' ? 2 : 1))

const options = computed<TopMiningSelectOption[]>(() =>
  props.coins.map((coin) => ({
    id: coin.id,
    label:
      props.variant === 'gpu'
        ? formatGpuCoinOptionLabel(coin)
        : formatCoinOptionLabel(coin),
    image: coin.iconUrl,
    data: coin,
  })),
)

const buttonLabel = computed(() => {
  if (!props.selected) {
    return undefined
  }

  return props.variant === 'gpu'
    ? formatGpuCoinOptionLabel(props.selected)
    : formatCoinButtonLabel(props.selected)
})

function onSelect(option: TopMiningSelectOption) {
  emit('select', option.data as CalculatorCoin)
}
</script>
