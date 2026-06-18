<template>
  <q-btn
    :class="buttonClasses"
    :unelevated="true"
    :flat="false"
    :dense="true"
    align="center"
    :href="href || undefined"
    :target="target || undefined"
    :type="href ? undefined : type"
    :style="buttonStyle"
    no-caps
    @click="onClick"
  >
    <template v-if="$slots.prepend" #prepend>
      <slot name="prepend" />
    </template>
    <template v-else-if="prependIcon" #prepend>
      <img
        alt=""
        class="top-mining-button__icon top-mining-button__icon--prepend"
        :src="prependIcon"
      />
    </template>

    <slot>
      <span class="top-mining-button__label">{{ title }}</span>
    </slot>

    <template v-if="$slots.append" #append>
      <slot name="append" />
    </template>
    <template v-else-if="appendIcon" #append>
      <img
        alt=""
        class="top-mining-button__icon top-mining-button__icon--append"
        :src="appendIcon"
      />
    </template>
  </q-btn>
</template>

<script setup lang="ts">
  import type {
    TopMiningButtonSize,
    TopMiningButtonSurface,
    TopMiningButtonVariant,
  } from '~/constants/top-mining/button'

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
      style.background = props.bgColor
    }

    if (props.color) {
      style.color = props.color
    }

    if (props.borderColor) {
      style.borderColor = props.borderColor
    }

    return style
  })

  function onClick(event: MouseEvent) {
    emit('click', event)
  }
</script>

<style scoped lang="scss">
  .top-mining-button {
    --tm-btn-orange: #ff6418;
    --tm-btn-text: #303030;
    --tm-btn-icon: #c8c8c8;

    display: inline-flex !important;
    flex-direction: row !important;
    align-items: center !important;
    justify-content: center !important;
    min-height: 0 !important;
    border: 1px solid transparent;
    border-radius: 999px;
    font-weight: 800;
    line-height: 1 !important;
    letter-spacing: 0.02em;
    text-align: center;
    text-transform: uppercase;
    box-shadow: none;
    transition:
      background-color 0.2s ease,
      color 0.2s ease,
      border-color 0.2s ease;

    :deep(.q-btn__content) {
      display: inline-flex !important;
      flex: 0 1 auto !important;
      align-items: center !important;
      align-self: center !important;
      justify-content: center !important;
      gap: 8px;
      min-height: 0 !important;
      padding: 0 !important;
      margin: 0 !important;
      color: inherit !important;
      line-height: 1 !important;
      text-align: center;
    }

    :deep(.q-btn__content .block) {
      display: inline-flex !important;
      align-items: center;
      justify-content: center;
      line-height: 1 !important;
    }

    :deep(.q-btn__content *) {
      color: inherit !important;
      line-height: 1 !important;
    }

    :deep(.q-icon) {
      color: var(--tm-btn-icon) !important;
    }

    &.q-btn--unelevated::before {
      display: none;
    }

    &--big {
      min-height: 48px;
      padding: 0 28px !important;
      font-size: 13px;
    }

    &--small {
      min-height: 40px;
      padding: 0 18px !important;
      font-size: 11px;
    }

    &--primary.top-mining-button--surface-light {
      background: var(--tm-btn-orange) !important;
      border-color: var(--tm-btn-orange);
      color: #ffffff !important;

      .top-mining-button__icon {
        filter: brightness(0) invert(1);
      }

      &:hover,
      &:focus-visible {
        background: #ffffff !important;
        border-color: var(--tm-btn-orange);
        color: var(--tm-btn-text) !important;

        .top-mining-button__icon {
          filter: none;
          opacity: 0.55;
        }

        :deep(.q-icon) {
          color: var(--tm-btn-icon) !important;
        }
      }
    }

    &--primary.top-mining-button--surface-dark {
      background: var(--tm-btn-orange) !important;
      border-color: var(--tm-btn-orange);
      color: #ffffff !important;

      .top-mining-button__icon {
        filter: brightness(0) invert(1);
        opacity: 1;
      }

      &:hover,
      &:focus-visible {
        background: transparent !important;
        border-color: var(--tm-btn-orange) !important;
        color: #ffffff !important;
        box-shadow: none;

        .top-mining-button__icon {
          filter: brightness(0) invert(1);
          opacity: 1;
        }

        :deep(.q-focus-helper) {
          background: transparent !important;
          opacity: 0 !important;
        }

        :deep(.q-icon) {
          color: #ffffff !important;
        }
      }
    }

    &--secondary.top-mining-button--surface-light {
      background: #ffffff !important;
      border-color: var(--tm-btn-orange);
      color: var(--tm-btn-text) !important;

      .top-mining-button__icon {
        opacity: 0.55;
      }

      &:hover,
      &:focus-visible {
        background: var(--tm-btn-orange) !important;
        border-color: var(--tm-btn-orange);
        color: #ffffff !important;

        .top-mining-button__icon {
          filter: brightness(0) invert(1);
          opacity: 1;
        }

        :deep(.q-icon) {
          color: #ffffff !important;
        }
      }
    }

    &--secondary.top-mining-button--surface-dark {
      background: transparent !important;
      border-color: var(--tm-btn-orange);
      color: #ffffff !important;

      .top-mining-button__icon {
        filter: brightness(0) invert(1);
        opacity: 1;
      }

      &:hover,
      &:focus-visible {
        background: var(--tm-btn-orange) !important;
        border-color: var(--tm-btn-orange);
        color: #ffffff !important;

        .top-mining-button__icon {
          filter: brightness(0) invert(1);
          opacity: 1;
        }

        :deep(.q-icon) {
          color: #ffffff !important;
        }
      }
    }

    &--tertiary {
      background: transparent !important;
      border-color: transparent;
      color: var(--tm-btn-text) !important;

      .top-mining-button__icon {
        opacity: 0.55;
      }

      &:hover,
      &:focus-visible {
        background: transparent !important;
        border-color: transparent;
        color: var(--tm-btn-orange) !important;

        :deep(.q-icon) {
          color: var(--tm-btn-icon) !important;
        }
      }
    }

    &.top-mining-button--contact:hover,
    &.top-mining-button--contact:focus-visible {
      background: transparent !important;
      border-color: var(--tm-btn-orange) !important;
      color: var(--tm-btn-text) !important;
      box-shadow: none;

      :deep(.q-focus-helper) {
        background: transparent !important;
        opacity: 0 !important;
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
