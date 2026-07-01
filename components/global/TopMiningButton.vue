<template>
  <component
    :is="tag"
    :class="buttonClasses"
    :href="href || undefined"
    :target="href ? target || undefined : undefined"
    :rel="linkRel"
    :type="href ? undefined : type"
    :style="buttonStyle"
    @click="onClick"
  >
    <span class="top-mining-button__inner">
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
      bgColor?: string
      color?: string
      borderColor?: string
      width?: string | number
      href?: string
      target?: string
      type?: 'button' | 'submit' | 'reset'
    }>(),
    {
      title: '',
      prependIcon: '',
      appendIcon: '',
      variant: 'primary',
      size: 'big',
      surface: 'light',
      bgColor: '',
      color: '',
      borderColor: '',
      width: '',
      href: '',
      target: '',
      type: 'button',
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
  ])

  const buttonStyle = computed(() => {
    const style: Record<string, string> = {}

    if (props.width) {
      style.width =
        typeof props.width === 'number' ? `${props.width}px` : props.width
    }

    if (props.bgColor) {
      style['--tm-btn-bg'] = props.bgColor
    }

    if (props.color) {
      style['--tm-btn-color'] = props.color
    }

    if (props.borderColor) {
      style['--tm-btn-border'] = props.borderColor
    }

    return style
  })

  function onClick(event: MouseEvent) {
    emit('click', event)
  }
</script>

<style scoped lang="css">
  .top-mining-button {
    --tm-btn-orange: var(--tm-orange);
    --tm-btn-text: var(--tm-text-secondary);
    --tm-btn-icon: var(--tm-icon);

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
      background 0.2s ease;

    &:focus-visible {
      outline: 2px solid var(--tm-btn-orange);
      outline-offset: 2px;
    }

    .top-mining-button__inner {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      line-height: 1;
      color: inherit;
    }

    &--big {
      min-height: 48px;
      padding: 0 28px;
      font-size: 13px;
    }

    &--badge-prepend {
      justify-content: flex-start;

      .top-mining-button__inner {
        gap: 10px;
        justify-content: flex-start;
      }

      .top-mining-button__icon-badge {
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

      .top-mining-button__icon--prepend {
        flex: 0 0 auto;
        width: 20px;
        height: 20px;
        margin: 0;
        padding: 0;
        border-radius: 0;
        background: transparent;
        box-sizing: border-box;
        filter: none;
        opacity: 1;
        object-fit: contain;
      }

      &.top-mining-button--primary.top-mining-button--surface-light,
      &.top-mining-button--primary.top-mining-button--surface-dark,
      &.top-mining-button--secondary.top-mining-button--surface-light,
      &.top-mining-button--secondary.top-mining-button--surface-dark {
        .top-mining-button__icon--prepend,
        &:hover .top-mining-button__icon--prepend,
        &:focus-visible .top-mining-button__icon--prepend {
          filter: none;
          opacity: 1;
        }
      }
    }

    &--consulting {
      width: max-content;
      min-width: max-content;
      max-width: none;
      height: 42px;
      min-height: 42px;
      padding: 0 22px;
      border: 0;
      --tm-btn-bg: var(--tm-orange);
      --tm-btn-border: var(--tm-orange);
      box-shadow: none;
      font-size: 11px;
      font-weight: 800;
      letter-spacing: 0.02em;
      white-space: nowrap;
      justify-content: center;

      .top-mining-button__inner {
        flex: 0 0 auto;
        justify-content: center;
        white-space: nowrap;
      }

      .top-mining-button__consulting-label {
        display: inline-block;
        line-height: 1;
        text-align: center;
        text-transform: uppercase;
        white-space: nowrap;
      }
    }

    &--consulting.top-mining-button--primary.top-mining-button--surface-dark {
      --tm-btn-bg: var(--tm-orange);
      --tm-btn-border: var(--tm-orange);

      &:hover,
      &:focus-visible {
        --tm-btn-bg: var(--tm-orange-dark);
        --tm-btn-border: var(--tm-orange-dark);
        --tm-btn-color: var(--tm-white);
        box-shadow: none;
      }
    }

    &--small {
      min-height: 40px;
      padding: 0 18px;
      font-size: 11px;
    }

    &--primary.top-mining-button--surface-light {
      --tm-btn-bg: var(--tm-btn-orange);
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-white);

      .top-mining-button__icon {
        filter: brightness(0) invert(1);
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: var(--tm-white);
        --tm-btn-border: var(--tm-btn-orange);
        --tm-btn-color: var(--tm-btn-text);

        .top-mining-button__icon {
          filter: none;
          opacity: 0.55;
        }
      }
    }

    &--primary.top-mining-button--surface-dark {
      --tm-btn-bg: var(--tm-btn-orange);
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-white);

      .top-mining-button__icon:not(.top-mining-button__icon--prepend) {
        filter: brightness(0) invert(1);
        opacity: 1;
      }

      &.top-mining-button--badge-prepend .top-mining-button__icon--prepend,
      &.top-mining-button--badge-prepend:hover .top-mining-button__icon--prepend,
      &.top-mining-button--badge-prepend:focus-visible
        .top-mining-button__icon--prepend {
        filter: none;
        opacity: 1;
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: transparent;
        --tm-btn-border: var(--tm-btn-orange);
        --tm-btn-color: var(--tm-white);
        box-shadow: none;

        .top-mining-button__icon:not(.top-mining-button__icon--prepend) {
          filter: brightness(0) invert(1);
          opacity: 1;
        }
      }
    }

    &--secondary.top-mining-button--surface-light {
      --tm-btn-bg: var(--tm-white);
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-btn-text);

      .top-mining-button__icon {
        opacity: 0.55;
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: var(--tm-btn-orange);
        --tm-btn-border: var(--tm-btn-orange);
        --tm-btn-color: var(--tm-white);

        .top-mining-button__icon {
          filter: brightness(0) invert(1);
          opacity: 1;
        }
      }
    }

    &--secondary.top-mining-button--surface-dark {
      --tm-btn-bg: transparent;
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-white);

      .top-mining-button__icon {
        filter: brightness(0) invert(1);
        opacity: 1;
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: var(--tm-btn-orange);
        --tm-btn-border: var(--tm-btn-orange);
        --tm-btn-color: var(--tm-white);

        .top-mining-button__icon {
          filter: brightness(0) invert(1);
          opacity: 1;
        }
      }
    }

    &--tertiary {
      --tm-btn-bg: transparent;
      --tm-btn-border: transparent;
      --tm-btn-color: var(--tm-btn-text);

      .top-mining-button__icon {
        opacity: 0.55;
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: transparent;
        --tm-btn-border: transparent;
        --tm-btn-color: var(--tm-btn-orange);
      }
    }

    &.top-mining-button--contact:hover,
    &.top-mining-button--contact:focus-visible {
      --tm-btn-bg: transparent;
      --tm-btn-border: var(--tm-btn-orange);
      --tm-btn-color: var(--tm-btn-text);
      box-shadow: none;
    }

    &--contact-section-telegram.top-mining-button--primary.top-mining-button--surface-dark {
      font-weight: 400;
      letter-spacing: 0.02em;
      text-transform: none;
      --tm-btn-bg: var(--tm-orange-accent-gradient-horizontal);
      --tm-btn-border: transparent;
      --tm-btn-color: var(--jet-color);

      &.top-mining-button--big {
        padding-inline: 20px;
      }

      &.top-mining-button--contact-section-telegram--compact.top-mining-button--big {
        padding-inline: 12px;
      }

      .top-mining-button__icon--append,
      &:hover .top-mining-button__icon--append,
      &:focus-visible .top-mining-button__icon--append {
        filter: brightness(0);
        opacity: 1;
      }

      &:hover,
      &:focus-visible {
        --tm-btn-bg: var(--tm-orange-accent-gradient-horizontal);
        --tm-btn-border: transparent;
        --tm-btn-color: var(--jet-color);
        box-shadow: none;
      }
    }

    .top-mining-button__label {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      line-height: 1;
    }

    .top-mining-button__icon {
      flex: 0 0 auto;
      width: 1.15em;
      height: 1.15em;
      object-fit: contain;

      &--prepend {
        margin-right: 2px;
      }

      &--append {
        margin-left: 2px;
      }
    }
  }
</style>
