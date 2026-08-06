<script setup lang="ts">
import {
  CALCULATOR_DEVICE_OPTIONS,
  formatHardwareModelMeta,
  type CalculatorDeviceKind,
  type CalculatorHardwareBrand,
  type CalculatorHardwareModel,
} from '@/common/modules/top-mining'
import TopMiningSelect from '@/components/global/forms/TopMiningSelect.vue'
import type {
  TopMiningSelectGroup,
  TopMiningSelectOption,
} from '@/components/global/forms/TopMiningSelect.types'

const { t } = useT()

const props = defineProps<{
  kind: CalculatorDeviceKind
  brands: CalculatorHardwareBrand[]
  selected: CalculatorHardwareModel | null
  placeholder: string
  buttonIcon: string
  loading?: boolean
}>()

const emit = defineEmits<{
  select: [model: CalculatorHardwareModel]
}>()

const selectedId = computed(() => props.selected?.slug ?? null)

const showSkeletons = computed(
  () => Boolean(props.loading) || props.brands.length === 0,
)

const groups = computed<TopMiningSelectGroup[]>(() =>
  props.brands.map((brand) => ({
    id: brand.name,
    label: brand.name,
    children: brand.models.map(
      (model): TopMiningSelectOption => ({
        id: model.slug,
        label: model.name,
        image: props.buttonIcon,
        meta: formatHardwareModelMeta(model),
        data: model,
      }),
    ),
  })),
)

const deviceLabel = computed(() => {
  const option = CALCULATOR_DEVICE_OPTIONS.find(
    (item) => item.kind === props.kind,
  )
  return option?.label || 'ASIC'
})

const selectModelAria = computed(() =>
  t('calculator.selectModelAria', undefined, { device: deviceLabel.value }),
)

function onSelect(option: TopMiningSelectOption) {
  const model = option.data as CalculatorHardwareModel
  emit('select', model)
}
</script>

<template>
  <top-mining-select
    mode="tree"
    size="lg"
    :model-value="selectedId"
    :groups="groups"
    :placeholder="placeholder"
    :button-image="buttonIcon"
    :loading="showSkeletons"
    :show-option-meta="kind === 'asic'"
    :aria-label="selectModelAria"
    @select="onSelect"
  />
</template>
