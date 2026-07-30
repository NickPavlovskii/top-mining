<template>
  <h1
    v-if="tag === 'h1'"
    class="top-mining-outline-title"
    :id="resolvedTitleId"
  >
    {{ lead }}
    <span
      v-if="accent"
      class="top-mining-outline-title__accent"
    >{{ accent }}</span>
  </h1>
  <h2
    v-else-if="tag === 'h2'"
    class="top-mining-outline-title"
    :id="resolvedTitleId"
  >
    {{ lead }}
    <span
      v-if="accent"
      class="top-mining-outline-title__accent"
    >{{ accent }}</span>
  </h2>
  <h3
    v-else-if="tag === 'h3'"
    class="top-mining-outline-title"
    :id="resolvedTitleId"
  >
    {{ lead }}
    <span
      v-if="accent"
      class="top-mining-outline-title__accent"
    >{{ accent }}</span>
  </h3>
  <p
    v-else-if="tag === 'p'"
    class="top-mining-outline-title"
    :id="resolvedTitleId"
  >
    {{ lead }}
    <span
      v-if="accent"
      class="top-mining-outline-title__accent"
    >{{ accent }}</span>
  </p>
  <div
    v-else
    class="top-mining-outline-title"
    :id="resolvedTitleId"
  >
    {{ lead }}
    <span
      v-if="accent"
      class="top-mining-outline-title__accent"
    >{{ accent }}</span>
  </div>
</template>

<script setup lang="ts">
  const props = withDefaults(
    defineProps<{
      lead: string
      accent?: string
      tag?: 'h1' | 'h2' | 'h3' | 'p' | 'div'
      titleId?: string
    }>(),
    {
      accent: '',
      tag: 'h2',
      titleId: '',
    },
  )

  const resolvedTitleId = computed(() => props.titleId || undefined)
</script>

<style scoped>
  .top-mining-outline-title {
    margin: 0;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-align: center;
    text-transform: uppercase;
    text-shadow:
      1px 0 0 var(--tm-text-soft),
      0 1px 0 var(--tm-text-soft),
      -1px 0 0 var(--tm-text-soft),
      0 -1px 0 var(--tm-text-soft);
  }

  .top-mining-outline-title__accent {
    display: block;
    color: var(--tm-white);
    text-shadow: none;
  }

  @media (max-width: 1439px) {
    .top-mining-outline-title {
      font-size: 24px;
      font-weight: 500;
      line-height: 28px;
    }
  }
</style>
