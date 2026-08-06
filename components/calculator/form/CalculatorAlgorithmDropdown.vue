<template>
  <top-mining-select
    aria-label="Выберите алгоритм"
    mode="flat"
    size="sm"
    :model-value="selected"
    :options="options"
    :placeholder="placeholder"
    :loading="loading || algorithms.length === 0"
    :show-option-meta="false"
    @select="onSelect"
  />
</template>

<script setup lang="ts">
import TopMiningSelect from '@/components/global/forms/TopMiningSelect.vue'
import type { TopMiningSelectOption } from '@/components/global/forms/TopMiningSelect.types'

const props = withDefaults(
  defineProps<{
    algorithms: string[]
    selected: string | null
    placeholder?: string
    loading?: boolean
  }>(),
  {
    placeholder: 'Выберите алгоритм',
    loading: false,
  },
)

const emit = defineEmits<{
  select: [algorithm: string]
}>()

const options = computed<TopMiningSelectOption[]>(() =>
  props.algorithms.map((algorithm) => ({
    id: algorithm,
    label: algorithm,
    data: algorithm,
  })),
)

function onSelect(option: TopMiningSelectOption) {
  emit('select', String(option.data ?? option.id))
}
</script>
