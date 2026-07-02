<template>
  <component
    :is="tag"
    :class="buttonClasses"
    :href="href || undefined"
    :target="href ? target || undefined : undefined"
    :rel="linkRel"
    :type="href ? undefined : type"
    :style="buttonStyle"
    :disabled="!href && disabled ? true : undefined"
    :aria-disabled="disabled || undefined"
    :aria-busy="loading || undefined"
    :tabindex="disabled && href ? -1 : undefined"
    @click="onClick"
  >
    <span class="top-mining-button__inner">
      <span
        v-if="loading"
        class="top-mining-button__spinner"
        aria-hidden="true"
      />
      <template v-else>
        <span
          v-if="$slots.prepend"
          class="top-mining-button__prepend"
        >
          <slot name="prepend" />
        </span>
        <span
          v-else-if="prependIcon"
          class="top-mining-button__icon-badge"
        >
          <img
            alt=""
            class="top-mining-button__icon top-mining-button__icon--prepend"
            :src="prependIcon"
          />
        </span>
        <slot>
          <span
            v-if="title"
            class="top-mining-button__label"
          >
            {{ title }}
          </span>
        </slot>
        <slot
          v-if="$slots.append"
          name="append"
        />
        <img
          v-else-if="appendIcon"
          alt=""
          class="top-mining-button__icon top-mining-button__icon--append"
          :src="appendIcon"
        />
      </template>
    </span>
  </component>
</template>

<script setup lang="ts">
  import type {
    TopMiningButtonSize,
    TopMiningButtonSurface,
    TopMiningButtonVariant,
  } from '~/common/modules/top-mining/button'

  const props = withDefaults(
    defineProps<{
      title?: string
      prependIcon?: string
      appendIcon?: string
      variant?: TopMiningButtonVariant
      size?: TopMiningButtonSize
      surface?: TopMiningButtonSurface
      preset?: string
      bgColor?: string
      color?: string
      borderColor?: string
      width?: string | number
      href?: string
      target?: string
      type?: 'button' | 'submit' | 'reset'
      disabled?: boolean
      loading?: boolean
    }>(),
    {
      title: '',
      prependIcon: '',
      appendIcon: '',
      variant: 'primary',
      size: 'big',
      surface: 'light',
      preset: '',
      bgColor: '',
      color: '',
      borderColor: '',
      width: '',
      href: '',
      target: '',
      type: 'button',
      disabled: false,
      loading: false,
    },
  )

  const emit = defineEmits<{
    click: [ev: MouseEvent]
  }>()

  const tag = computed(() => (props.href ? 'a' : 'button'))

  const linkRel = computed(() => {
    if (!props.href || props.target !== '_blank') {
      return undefined
    }
    return 'noopener noreferrer'
  })

  const buttonClasses = computed(() => [
    'top-mining-button',
    `top-mining-button--${props.variant}`,
    `top-mining-button--${props.size}`,
    `top-mining-button--surface-${props.surface}`,
    {
      [`top-mining-button--${props.preset}`]: !!props.preset,
      'top-mining-button--disabled': props.disabled,
      'top-mining-button--loading': props.loading,
    },
  ])

  const buttonStyle = computed(() => {
    const style: Record<string, string> = {}

    if (props.width) {
      style.width = typeof props.width === 'number' ? `${props.width}px` : props.width
    }
    if (props.bgColor) style['--tm-btn-bg'] = props.bgColor
    if (props.color) style['--tm-btn-color'] = props.color
    if (props.borderColor) style['--tm-btn-border'] = props.borderColor

    return style
  })

  function onClick(event: MouseEvent) {
    if (props.disabled || props.loading) {
      event.preventDefault()
      return
    }
    emit('click', event)
  }
</script>

<style scoped lang="css">
  .top-mining-button {
    --tm-btn-orange: var(--tm-orange);
    --tm-btn-text: var(--tm-text-secondary);
    --tm-btn-icon: var(--tm-icon);
    --tm-btn-icon-filter: none;
    --tm-btn-icon-opacity: 1;

    display: inline-flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    min-height: 0;
    margin: 0;
    padding: 0;
    border: 1px solid var(--tm-btn-border, transparent);
    border-radius: 999px;
    background: var(--tm-btn-bg, transparent);
    color: var(--tm-btn-color, inherit);
    font: inherit;
    font-weight: 800;
    line-height: 1;
    letter-spacing: 0.02em;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
    box-shadow: none;
    cursor: pointer;
    appearance: none;
    transition:
      background-color 0.2s ease,
      color 0.2s ease,
      border-color 0.2s ease,
      transform 0.12s ease;

    &:focus-visible {
      outline: 2px solid var(--tm-btn-orange);
      outline-offset: 2px;
    }

    &:active:not(&--disabled):not(&--loading) {
      transform: scale(0.97);
    }

    &--disabled,
    &:disabled,
    &--loading {
      cursor: not-allowed;
      opacity: 0.5;
      pointer-events: none;
    }

    .top-mining-button__inner {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      line-height: 1;
      color: inherit;
    }

    .top-mining-button__spinner {
      width: 1.15em;
      height: 1.15em;
      border: 2px solid currentColor;
      border-right-color: transparent;
      border-radius: 50%;
      animation: top-mining-button-spin 0.7s linear infinite;
    }

    .top-mining-button__label {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      line-height: 1;
      color: currentColor;
    }

    .top-mining-button__icon {
      flex: 0 0 auto;
      width: 1.15em;
      height: 1.15em;
      object-fit: contain;
      filter: var(--tm-btn-icon-filter);
      opacity: var(--tm-btn-icon-opacity);
      transition:
        filter 0.2s ease,
        opacity 0.2s ease,
        transform 0.2s ease;

      &--append {
        margin-left: 2px;
      }
    }

    &:hover:not(&--disabled):not(&--loading) .top-mining-button__icon--append,
    &:focus-visible:not(&--disabled):not(&--loading) .top-mining-button__icon--append {
      transform: translateX(3px);
    }
  }

  .top-mining-button .top-mining-button__icon--prepend {
    flex: 0 0 auto;
    width: 20px;
    height: 20px;
    margin: 0 2px 0 0;
    padding: 0;
    border-radius: 0;
    background: transparent;
    box-sizing: border-box;
    filter: none;
    opacity: 1;
    object-fit: contain;
  }


  .top-mining-button.top-mining-button--primary.top-mining-button--surface-light {
    --tm-btn-bg: var(--tm-btn-orange);
    --tm-btn-border: var(--tm-btn-orange);
    --tm-btn-color: var(--tm-white);
    --tm-btn-icon-filter: brightness(0) invert(1);
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  .top-mining-button.top-mining-button--primary.top-mining-button--surface-light
    .top-mining-button__inner,
  .top-mining-button.top-mining-button--primary.top-mining-button--surface-light
    .top-mining-button__label {
    color: var(--tm-white);
  }

  .top-mining-button.top-mining-button--primary.top-mining-button--surface-light:focus-visible:not(
      :hover
    ):not(.top-mining-button--disabled):not(.top-mining-button--loading) {
    --tm-btn-bg: var(--tm-btn-orange);
    --tm-btn-border: var(--tm-btn-orange);
    --tm-btn-color: var(--tm-white);
    --tm-btn-icon-filter: brightness(0) invert(1);
    --tm-btn-icon-opacity: 1;
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--primary.top-mining-button--surface-light:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading) {
      --tm-btn-bg: var(--tm-white);
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-btn-text);
      --tm-btn-icon-filter: none;
      --tm-btn-icon-opacity: 0.55;
      background-color: var(--tm-btn-bg);
      border-color: var(--tm-btn-border);
      color: var(--tm-btn-color);
    }

    .top-mining-button.top-mining-button--primary.top-mining-button--surface-light:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading)
      .top-mining-button__inner,
    .top-mining-button.top-mining-button--primary.top-mining-button--surface-light:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading)
      .top-mining-button__label {
      color: var(--tm-btn-text);
    }
  }

  .top-mining-button.top-mining-button--primary.top-mining-button--surface-dark {
    --tm-btn-bg: var(--tm-orange);
    --tm-btn-border: var(--tm-orange);
    --tm-btn-color: #ffffff;
    --tm-btn-icon-filter: brightness(0) invert(1);
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--primary.top-mining-button--surface-dark:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading) {
      --tm-btn-bg: transparent;
      --tm-btn-border: var(--tm-orange);
      --tm-btn-color: #ffffff;
      background-color: var(--tm-btn-bg);
      border-color: var(--tm-btn-border);
      color: var(--tm-btn-color);
      box-shadow: none;
    }
  }

  .top-mining-button.top-mining-button--secondary.top-mining-button--surface-light {
    --tm-btn-bg: #ffffff;
    --tm-btn-border: var(--tm-orange);
    --tm-btn-color: #303030;
    --tm-btn-icon-opacity: 0.55;
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--secondary.top-mining-button--surface-light:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading) {
      --tm-btn-bg: var(--tm-orange);
      --tm-btn-border: var(--tm-orange);
      --tm-btn-color: #ffffff;
      --tm-btn-icon-filter: brightness(0) invert(1);
      --tm-btn-icon-opacity: 1;
      background-color: var(--tm-btn-bg);
      border-color: var(--tm-btn-border);
      color: var(--tm-btn-color);
    }
  }

  .top-mining-button.top-mining-button--secondary.top-mining-button--surface-dark {
    --tm-btn-bg: transparent;
    --tm-btn-border: var(--tm-orange);
    --tm-btn-color: #ffffff;
    --tm-btn-icon-filter: brightness(0) invert(1);
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--secondary.top-mining-button--surface-dark:hover:not(
        .top-mining-button--disabled
      ):not(.top-mining-button--loading) {
      --tm-btn-bg: var(--tm-orange);
      --tm-btn-border: var(--tm-orange);
      --tm-btn-color: #ffffff;
      background-color: var(--tm-btn-bg);
      border-color: var(--tm-btn-border);
      color: var(--tm-btn-color);
    }
  }

  .top-mining-button.top-mining-button--tertiary {
    --tm-btn-bg: transparent;
    --tm-btn-border: transparent;
    --tm-btn-color: #303030;
    --tm-btn-icon-opacity: 0.55;
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--tertiary:hover:not(.top-mining-button--disabled):not(
        .top-mining-button--loading
      ) {
      --tm-btn-color: var(--tm-orange);
      color: var(--tm-btn-color);
    }
  }

  .top-mining-button.top-mining-button--contact:hover,
  .top-mining-button.top-mining-button--contact:focus-visible {
    --tm-btn-bg: transparent;
    --tm-btn-border: var(--tm-orange);
    --tm-btn-color: #303030;
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
    box-shadow: none;
  }

  .top-mining-button.top-mining-button--consulting {
    width: max-content;
    min-width: max-content;
    max-width: none;
    height: 42px;
    min-height: 42px;
    padding: 0 22px;
    border: 0;
    --tm-btn-bg: var(--tm-orange);
    --tm-btn-border: var(--tm-orange);
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    box-shadow: none;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.02em;
    white-space: nowrap;
    justify-content: center;
  }

  .top-mining-button.top-mining-button--consulting .top-mining-button__inner {
    flex: 0 0 auto;
    justify-content: center;
    white-space: nowrap;
  }

  .top-mining-button.top-mining-button--consulting.top-mining-button--primary.top-mining-button--surface-dark {
    --tm-btn-bg: var(--tm-orange);
    --tm-btn-border: var(--tm-orange);
    background-color: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
  }

  @media (hover: hover) {
    .top-mining-button.top-mining-button--consulting.top-mining-button--primary.top-mining-button--surface-dark:hover {
      --tm-btn-bg: var(--tm-orange-dark);
      --tm-btn-border: var(--tm-orange-dark);
      --tm-btn-color: #ffffff;
      background-color: var(--tm-btn-bg);
      border-color: var(--tm-btn-border);
      color: var(--tm-btn-color);
      box-shadow: none;
    }
  }

  .top-mining-button.top-mining-button--contact-section-telegram.top-mining-button--primary.top-mining-button--surface-dark {
    font-weight: 400;
    letter-spacing: 0.02em;
    text-transform: none;
    --tm-btn-bg: var(--tm-orange-accent-gradient-horizontal);
    --tm-btn-border: transparent;
    --tm-btn-color: var(--jet-color);
    --tm-btn-icon-filter: brightness(0);
    background: var(--tm-btn-bg);
    border-color: var(--tm-btn-border);
    color: var(--tm-btn-color);
  }

  .top-mining-button.top-mining-button--contact-section-telegram.top-mining-button--primary.top-mining-button--surface-dark.top-mining-button--big {
    padding-inline: 20px;
  }

  .top-mining-button.top-mining-button--contact-section-telegram.top-mining-button--contact-section-telegram--compact.top-mining-button--primary.top-mining-button--surface-dark.top-mining-button--big {
    padding-inline: 12px;
  }

  .top-mining-button.top-mining-button--big {
    min-width: 200px;
    width: max-content;
    max-width: 100%;
    min-height: 48px;
    padding: 0 28px;
    font-size: 13px;
  }

  .top-mining-button.top-mining-button--small {
    min-height: 40px;
    padding: 0 18px;
    font-size: 11px;
  }

  .top-mining-button.top-mining-button--badge-prepend {
    justify-content: flex-start;
  }

  .top-mining-button.top-mining-button--badge-prepend .top-mining-button__inner {
    gap: 10px;
    justify-content: flex-start;
  }

  .top-mining-button.top-mining-button--badge-prepend .top-mining-button__icon-badge {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    width: 34px;
    height: 34px;
    border-radius: 50%;
    background: var(--tm-white);
    box-sizing: border-box;
  }

  @media (prefers-reduced-motion: reduce) {
    .top-mining-button:hover .top-mining-button__icon--append,
    .top-mining-button:focus-visible .top-mining-button__icon--append {
      transform: none;
    }
  }

  @keyframes top-mining-button-spin {
    to {
      transform: rotate(360deg);
    }
  }
</style>
