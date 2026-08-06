<template>
  <span
    :class="[
      'tm-brand-avatar',
      `tm-brand-avatar--${size}`,
    ]"
    v-bind="ariaAttrs"
    role="img"
  >
    <img
      class="tm-brand-avatar__mark"
      :src="logoMark"
      alt=""
    >
  </span>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

  const { t } = useT()

  const props = withDefaults(
    defineProps<{
      size?: 'sm' | 'md' | 'lg'
      label?: string
      ariaHidden?: boolean
    }>(),
    {
      size: 'md',
      label: undefined,
      ariaHidden: true,
    },
  )

  const resolvedLabel = computed(() => props.label ?? t('header.brandAria'))

  const ariaAttrs = computed(() =>
    props.ariaHidden
      ? { 'aria-hidden': 'true' as const }
      : { 'aria-label': resolvedLabel.value },
  )
</script>

<style scoped>
  .tm-brand-avatar {
    display: inline-grid;
    place-items: center;
    flex-shrink: 0;
    overflow: hidden;
    border-radius: 999px;
    background: rgba(20, 20, 20, 0.72);
    border: 1px solid rgba(255, 255, 255, 0.16);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.28);
  }

  .tm-brand-avatar--sm {
    width: 28px;
    height: 28px;
  }

  .tm-brand-avatar--md {
    width: 36px;
    height: 36px;
  }

  .tm-brand-avatar--lg {
    width: 48px;
    height: 48px;
  }

  .tm-brand-avatar__mark {
    display: block;
    width: 62%;
    height: 62%;
    object-fit: contain;
  }
</style>
