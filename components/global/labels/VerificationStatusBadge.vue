<template>
  <top-mining-chip
    min-width="192px"
    size="md"
    icon-position="left"
    :prepend-icon-color="TOP_MINING_VERIFICATION_STATUS_COLORS.icon"
    :label="label"
    :icon="icon"
    :prepend-icon-background="prependIconBackground"
    :preset="preset"
  />
</template>

<script setup lang="ts">
  import {
    TOP_MINING_VERIFICATION_STATUS_COLORS,
    type TopMiningChipPreset,
  } from '~/common/modules/top-mining/chip'

  const props = defineProps<{
    /** Организация прошла проверку */
    verified: boolean
  }>()

  const label = computed(() =>
    props.verified ? 'Проверены' : 'Не проверены',
  )

  const icon = computed(() =>
    props.verified ? 'mdi:check' : 'mdi:close',
  )

  const prependIconBackground = computed(() =>
    props.verified
      ? TOP_MINING_VERIFICATION_STATUS_COLORS.success
      : TOP_MINING_VERIFICATION_STATUS_COLORS.danger,
  )

  const preset = computed<TopMiningChipPreset>(() =>
    props.verified ? 'dark-success' : 'dark-danger',
  )
</script>
