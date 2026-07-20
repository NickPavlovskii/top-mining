<template>
  <svg
    class="sparkline-chart"
    :viewBox="`0 0 ${viewBox.width} ${viewBox.height}`"
    preserveAspectRatio="none"
    aria-hidden="true"
  >
    <g class="sparkline-chart__grid">
      <line
        v-for="x in gridLines"
        :key="x"
        :x1="x"
        y1="0"
        :x2="x"
        :y2="viewBox.height"
      />
    </g>

    <polyline
      stroke-width="2.5"
      vector-effect="non-scaling-stroke"
      fill="none"
      :points="chartPoints"
      :stroke="stroke"
    />
  </svg>
</template>

<script setup lang="ts">
  import {
    SPARKLINE_GRID_LINES,
    SPARKLINE_VIEWBOX,
    buildSparklinePoints,
  } from '~/common/modules/charts'

  const props = withDefaults(
    defineProps<{
      values: number[]
      stroke?: string
    }>(),
    {
      stroke: '#4ade80',
    },
  )

  const viewBox = SPARKLINE_VIEWBOX
  const gridLines = SPARKLINE_GRID_LINES

  const chartPoints = computed(() => buildSparklinePoints(props.values))
</script>

<style scoped>
  .sparkline-chart {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: calc(100% - 44px);
  }

  .sparkline-chart__grid line {
    stroke: rgba(255, 255, 255, 0.06);
    stroke-width: 1;
  }
</style>
