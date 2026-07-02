<template>
  <component
    :is="tag"
    :href="href || undefined"
    :type="href ? undefined : type"
    :target="target || undefined"
    :rel="linkRel"
    :aria-label="ariaLabel"
    :aria-disabled="disabled || undefined"
    :tabindex="disabled && href ? -1 : undefined"
    :disabled="!href && disabled ? true : undefined"
    class="top-mining-round-icon-button"
    :class="[
      `top-mining-round-icon-button--${variant}`,
      `top-mining-round-icon-button--${size}`,
      { 'top-mining-round-icon-button--disabled': disabled },
    ]"
    :style="cssVars"
    @click="onClick"
  >
    <Icon
      :name="icon"
      class="top-mining-round-icon-button__icon"
    />
  </component>
</template>

<script setup lang="ts">
  type Variant = 'primary' | 'outline'
  type Size = 'small' | 'medium'

  const props = withDefaults(
    defineProps<{
      icon?: string
      ariaLabel: string
      variant?: Variant
      size?: Size
      href?: string
      target?: string
      type?: 'button' | 'submit' | 'reset'
      disabled?: boolean
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
      disabled: false,
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

  const SIZE_PRESETS: Record<Size, { box: string; icon: string }> = {
    small: { box: '38px', icon: '18px' },
    medium: { box: '42px', icon: '18px' },
  }

  const tag = computed(() => (props.href ? 'a' : 'button'))
  const linkRel = computed(() =>
    props.href && props.target === '_blank' ? 'noopener noreferrer' : undefined,
  )
  const isOutline = computed(() => props.variant === 'outline')
  const accent = computed(
    () => props.borderColor || props.backgroundColor || 'var(--orange-color)',
  )

  const cssVars = computed(() => {
    const preset = SIZE_PRESETS[props.size]

    return {
      '--tm-icon-btn-w': props.width || preset.box,
      '--tm-icon-btn-h': props.height || preset.box,
      '--tm-icon-btn-icon-size': props.iconSize || preset.icon,
      '--tm-icon-btn-border-w': props.borderWidth,
      '--tm-icon-btn-rotate': props.iconRotate,
      '--tm-icon-btn-bg':
        props.backgroundColor || (isOutline.value ? 'transparent' : 'var(--orange-color)'),
      '--tm-icon-btn-border': props.borderColor || accent.value,
      '--tm-icon-btn-color':
        props.color || (isOutline.value ? 'var(--jet-color)' : 'var(--white-color)'),
      '--tm-icon-btn-hover-bg':
        props.hoverBackgroundColor || (isOutline.value ? accent.value : 'transparent'),
      '--tm-icon-btn-hover-border': props.hoverBorderColor || accent.value,
      '--tm-icon-btn-hover-color':
        props.hoverColor || (isOutline.value ? 'var(--white-color)' : 'var(--jet-color)'),
    }
  })

  function onClick(event: MouseEvent) {
    if (props.disabled) {
      event.preventDefault()
      return
    }
    emit('click', event)
  }
</script>

<style scoped>
  .top-mining-round-icon-button {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: var(--tm-icon-btn-w);
    height: var(--tm-icon-btn-h);
    border: var(--tm-icon-btn-border-w) solid var(--tm-icon-btn-border);
    border-radius: 999px;
    background: var(--tm-icon-btn-bg);
    color: var(--tm-icon-btn-color);
    line-height: 1;
    text-decoration: none;
    cursor: pointer;
    transition:
      background-color 0.18s ease,
      color 0.18s ease,
      border-color 0.18s ease,
      transform 0.12s ease;
  }

  .top-mining-round-icon-button:hover,
  .top-mining-round-icon-button:focus-visible {
    background: var(--tm-icon-btn-hover-bg);
    border-color: var(--tm-icon-btn-hover-border);
    color: var(--tm-icon-btn-hover-color);
  }

  .top-mining-round-icon-button:active {
    transform: scale(0.94);
  }

  .top-mining-round-icon-button:focus-visible {
    outline: 2px solid var(--tm-icon-btn-border);
    outline-offset: 2px;
  }

  .top-mining-round-icon-button--disabled,
  .top-mining-round-icon-button:disabled {
    cursor: not-allowed;
    opacity: 0.45;
    pointer-events: none;
  }

  .top-mining-round-icon-button:hover:not(:disabled):not(.top-mining-round-icon-button--disabled)
    .top-mining-round-icon-button__icon,
  .top-mining-round-icon-button:focus-visible:not(:disabled):not(
      .top-mining-round-icon-button--disabled
    )
    .top-mining-round-icon-button__icon {
    transform: rotate(var(--tm-icon-btn-rotate)) translateX(3px);
  }

  .top-mining-round-icon-button__icon {
    width: var(--tm-icon-btn-icon-size);
    height: var(--tm-icon-btn-icon-size);
    transform: rotate(var(--tm-icon-btn-rotate));
    transition: transform 0.18s ease;
  }

  @media (prefers-reduced-motion: reduce) {
    .top-mining-round-icon-button:hover .top-mining-round-icon-button__icon,
    .top-mining-round-icon-button:focus-visible .top-mining-round-icon-button__icon {
      transform: rotate(var(--tm-icon-btn-rotate));
    }
  }
</style>
