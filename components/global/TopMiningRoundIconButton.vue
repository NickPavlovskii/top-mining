<template>
  <component
    :is="href ? 'a' : 'button'"
    :href="href || undefined"
    :type="href ? undefined : type"
    :target="target || undefined"
    :aria-label="ariaLabel"
    :class="[
      'top-mining-round-icon-button',
      `top-mining-round-icon-button--${variant}`,
      `top-mining-round-icon-button--${size}`,
    ]"
    @click="onClick"
  >
    <Icon
      :name="icon"
      class="top-mining-round-icon-button__icon"
    />
  </component>
</template>

<script setup lang="ts">
  const props = withDefaults(
    defineProps<{
      icon?: string
      ariaLabel: string
      variant?: 'primary' | 'outline'
      size?: 'small' | 'medium'
      href?: string
      target?: string
      type?: 'button' | 'submit' | 'reset'
      backgroundColor?: string
      borderColor?: string
      color?: string
      hoverBackgroundColor?: string
      hoverBorderColor?: string
      hoverColor?: string
      width?: string
      height?: string
      iconSize?: string
      iconRotate?: string
      borderWidth?: string
    }>(),
    {
      icon: 'mdi:arrow-up',
      variant: 'primary',
      size: 'medium',
      href: '',
      target: '',
      type: 'button',
      backgroundColor: '',
      borderColor: '',
      color: '',
      hoverBackgroundColor: '',
      hoverBorderColor: '',
      hoverColor: '',
      width: '',
      height: '',
      iconSize: '',
      iconRotate: '45deg',
      borderWidth: '1px',
    },
  )

  const emit = defineEmits<{
    click: [event: MouseEvent]
  }>()

  const accentColor = computed(() => {
    if (props.borderColor) {
      return props.borderColor
    }

    if (props.backgroundColor) {
      return props.backgroundColor
    }

    return 'var(--orange-color)'
  })

  const resolvedBackground = computed(() => {
    if (props.backgroundColor) {
      return props.backgroundColor
    }

    if (props.variant === 'outline') {
      return 'transparent'
    }

    return 'var(--orange-color)'
  })

  const resolvedBorderColor = computed(() => {
    if (props.borderColor) {
      return props.borderColor
    }

    return accentColor.value
  })

  const resolvedColor = computed(() => {
    if (props.color) {
      return props.color
    }

    if (props.variant === 'outline') {
      return 'var(--jet-color)'
    }

    return 'var(--white-color)'
  })

  const resolvedHoverBackground = computed(() => {
    if (props.hoverBackgroundColor) {
      return props.hoverBackgroundColor
    }

    if (props.variant === 'outline') {
      return accentColor.value
    }

    return 'transparent'
  })

  const resolvedHoverBorderColor = computed(() => {
    if (props.hoverBorderColor) {
      return props.hoverBorderColor
    }

    return accentColor.value
  })

  const resolvedHoverColor = computed(() => {
    if (props.hoverColor) {
      return props.hoverColor
    }

    if (props.variant === 'outline') {
      return 'var(--white-color)'
    }

    return 'var(--jet-color)'
  })

  const resolvedWidth = computed(() => {
    if (props.width) {
      return props.width
    }

    if (props.size === 'small') {
      return '38px'
    }

    return '42px'
  })

  const resolvedHeight = computed(() => {
    if (props.height) {
      return props.height
    }

    if (props.size === 'small') {
      return '38px'
    }

    return '42px'
  })

  const resolvedIconSize = computed(() => {
    if (props.iconSize) {
      return props.iconSize
    }

    return '18px'
  })

  function onClick(event: MouseEvent) {
    emit('click', event)
  }
</script>

<style scoped>
  .top-mining-round-icon-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: v-bind(resolvedWidth);
    height: v-bind(resolvedHeight);
    border: v-bind(borderWidth) solid v-bind(resolvedBorderColor);
    border-radius: 999px;
    background: v-bind(resolvedBackground);
    color: v-bind(resolvedColor);
    line-height: 1;
    text-decoration: none;
    cursor: pointer;
    transition:
      background-color 0.18s ease,
      color 0.18s ease,
      border-color 0.18s ease;
  }

  .top-mining-round-icon-button:hover,
  .top-mining-round-icon-button:focus-visible {
    background: v-bind(resolvedHoverBackground);
    border-color: v-bind(resolvedHoverBorderColor);
    color: v-bind(resolvedHoverColor);
    outline: none;
  }

  .top-mining-round-icon-button__icon {
    width: v-bind(resolvedIconSize);
    height: v-bind(resolvedIconSize);
    transform: rotate(v-bind(iconRotate));
  }
</style>
