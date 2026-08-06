<template>
  <top-mining-select
    :aria-label="resolvedPlaceholder"
    mode="flat"
    size="sm"
    :model-value="selected"
    :options="options"
    :placeholder="resolvedPlaceholder"
    :loading="loading || algorithms.length === 0"
    :show-option-meta="false"
    @select="onSelect"
  />
</template>

<script setup lang="ts">
import TopMiningSelect from '@/components/global/forms/TopMiningSelect.vue'
import type { TopMiningSelectOption } from '@/components/global/forms/TopMiningSelect.types'

const { t } = useT()

const props = withDefaults(
  defineProps<{
    algorithms: string[]
    selected: string | null
    placeholder?: string
    loading?: boolean
  }>(),
  {
    placeholder: undefined,
    loading: false,
  },
)

const emit = defineEmits<{
  select: [algorithm: string]
}>()

const resolvedPlaceholder = computed(
  () => props.placeholder ?? t('calculator.selectAlgorithm'),
)

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
