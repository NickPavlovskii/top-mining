<template>
  <ul class="top-mining-icon-list">
    <li
      v-for="(item, index) in items"
      :key="index"
      class="top-mining-icon-list__item"
    >
      <img
        class="top-mining-icon-list__icon"
        alt=""
        aria-hidden="true"
        :src="resolvedIconSrc"
      >
      <span class="top-mining-icon-list__text">{{ item }}</span>
    </li>
  </ul>
</template>

<script setup lang="ts">
  import okOrBig from '~/assets/images/consulting/ok-or-big.png'

  const props = defineProps<{
    items: readonly string[]
    iconSrc?: string
  }>()

  const resolvedIconSrc = computed(() => props.iconSrc ?? okOrBig)
</script>

<style scoped>
  .top-mining-icon-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .top-mining-icon-list__item {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .top-mining-icon-list__icon {
    flex-shrink: 0;
    width: 32px;
    height: 32px;
    object-fit: contain;
  }

  .top-mining-icon-list__text {
    min-width: 0;
  }

  @media (max-width: 1439px) {
    .top-mining-icon-list__item {
      font-size: 14px;
      line-height: 20px;
    }

    .top-mining-icon-list__icon {
      width: 24px;
      height: 24px;
    }
  }

  @media (min-width: 768px) and (max-width: 1439px) {
    .top-mining-icon-list {
      gap: 10px;
    }

    .top-mining-icon-list__item {
      gap: 10px;
      font-size: 12px;
      line-height: 16px;
    }

    .top-mining-icon-list__icon {
      width: 20px;
      height: 20px;
    }
  }
</style>
