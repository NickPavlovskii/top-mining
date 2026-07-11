<template>
  <span
    :class="[
      'verification-status-badge',
      verified
        ? 'verification-status-badge--ok'
        : 'verification-status-badge--fail',
    ]"
  >
    <span
      class="verification-status-badge__icon"
      aria-hidden="true"
    >
      <Icon :name="verified ? 'mdi:check' : 'mdi:close'" />
    </span>
    <span>{{ verified ? 'Проверены' : 'Не проверены' }}</span>
  </span>
</template>

<script setup lang="ts">
  defineProps<{
    verified: boolean
  }>()
</script>

<style scoped>
  .verification-status-badge {
    position: relative;
    z-index: 2;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 8px 12px;
    border-radius: 12px;
    background: rgba(20, 20, 20, 0.92);
    color: #bdbdbd;
    font-size: 16px;
    line-height: 1;
    white-space: nowrap;
  }

  .verification-status-badge--ok {
    color: #fff;
    background: rgba(10, 10, 10, 0.95);
  }

  .verification-status-badge__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    flex-shrink: 0;
    font-size: 14px;
  }

  .verification-status-badge--ok .verification-status-badge__icon {
    background: #4caf50;
    color: #fff;
  }

  .verification-status-badge--fail .verification-status-badge__icon {
    background: #ef4444;
    color: #fff;
  }

  .verification-status-badge__icon :deep(svg) {
    display: block;
    width: 14px;
    height: 14px;
  }
</style>
