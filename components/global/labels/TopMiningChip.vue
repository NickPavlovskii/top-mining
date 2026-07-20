<template>
  <q-chip
    v-bind="attrsRest"
    :class="rootClasses"
    :style="rootStyle"
    :clickable="clickable"
    :disable="disabled"
    :outline="isOutlined"
    :square="shape === 'square'"
    :dense="size === 'xs' || size === 'sm'"
    :ripple="clickable && !disabled"
    :tabindex="clickable ? 0 : undefined"
    @click="handleClick"
  >
    <template v-if="isInfoLayout">
      <div class="top-mining-chip__content top-mining-chip__content--info">
        <div class="top-mining-chip__info-body">
          <span
            v-if="hasContent"
            class="top-mining-chip__info-title"
          >
            <slot>{{ labelText }}</slot>
          </span>
          <span
            v-if="subtitle"
            class="top-mining-chip__info-subtitle"
          >
            {{ subtitle }}
          </span>
        </div>
        <img
          v-if="appendImageUrl"
          class="top-mining-chip__info-image"
          :src="appendImageUrl"
          :alt="appendImageAlt"
        />
      </div>
    </template>
    <div
      v-else
      :class="[
        'top-mining-chip__content',
        { 'top-mining-chip__content--closable': isRemovable },
      ]"
    >
      <span
        v-if="showPrepend"
        aria-hidden="true"
        :class="[
          'top-mining-chip__icon',
          'top-mining-chip__icon--prepend',
          `top-mining-chip__icon--${iconVariant}`,
        ]"
        :style="prependIconStyle"
      >
        <Icon
          :name="icons.prepend"
          :size="resolvedIconSize"
        />
      </span>

      <span
        v-if="hasContent"
        :class="[
          'top-mining-chip__title',
          { 'top-mining-chip__title--dot': dot },
        ]"
        :style="chipTitleStyle"
      >
        <slot>{{ labelText }}</slot>
      </span>

      <span
        v-if="showCounter"
        class="top-mining-chip__counter"
      >
        {{ counter }}
      </span>

      <span
        v-if="showAppend"
        aria-hidden="true"
        :class="[
          'top-mining-chip__icon',
          'top-mining-chip__icon--append',
          `top-mining-chip__icon--${iconVariant}`,
        ]"
        :style="appendIconStyle"
      >
        <Icon
          :name="icons.append"
          :size="resolvedIconSize"
        />
      </span>

      <button
        v-if="isRemovable && !disabled"
        type="button"
        class="top-mining-chip__close-icon"
        aria-label="Закрыть"
        :style="closeIconStyle"
        @click.stop="removeChip"
      >
        <Icon
          name="mdi:close"
          :size="closeIconSize"
        />
      </button>
    </div>
  </q-chip>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_CHIP_DEFAULTS,
    TOP_MINING_CHIP_SIZE,
    type TopMiningChipIconPosition,
    type TopMiningChipIconVariant,
    type TopMiningChipLayout,
    type TopMiningChipPreset,
    type TopMiningChipShape,
    type TopMiningChipSize,
  } from '~/common/modules/top-mining/chip'

  defineOptions({
    name: 'TopMiningChip',
    inheritAttrs: false,
  })

  /**
   * Универсальный чип Top Mining на базе Quasar q-chip.
   *
   * @param {String} [label = ''] - текст внутри чипа
   * @param {String} [title = ''] - алиас для label
   * @param {String} [subtitle = ''] - подзаголовок в layout info
   * @param {String} [layout = 'inline'] - раскладка: inline или info
   * @param {String} [icon = ''] - основная иконка (слева или справа по iconPosition)
   * @param {String} [iconPosition = 'left'] - позиция иконки: left, right или none
   * @param {String} [prependIcon = ''] - иконка слева
   * @param {String} [appendIcon = ''] - иконка справа
   * @param {String} [leftIcon = ''] - алиас prependIcon
   * @param {String} [rightIcon = ''] - алиас appendIcon
   * @param {String} [appendImageUrl = ''] - URL изображения справа в layout info
   * @param {String} [appendImageAlt = ''] - alt-текст изображения справа
   * @param {String} [iconVariant = 'badge'] - вариант иконки: badge (в круге) или plain
   * @param {String | Number} [iconSize] - размер иконки в px
   * @param {String} [prependIconColor] - цвет иконки слева
   * @param {String} [appendIconColor] - цвет иконки справа
   * @param {String} [prependIconBackground] - фон бейджа иконки слева
   * @param {String} [appendIconBackground] - фон бейджа иконки справа
   * @param {String} [leftIconColor] - алиас prependIconColor
   * @param {String} [rightIconColor] - алиас appendIconColor
   * @param {String} [leftIconBackground] - алиас prependIconBackground
   * @param {String} [rightIconBackground] - алиас appendIconBackground
   * @param {String} [preset = ''] - готовая цветовая схема (blue, green, dark-success и др.)
   * @param {String} [size = 'sm'] - размер: xs, sm, md или lg
   * @param {String} [shape = 'rounded'] - форма: pill, rounded или square
   * @param {String | Number} [counter] - числовой счётчик внутри чипа
   * @param {Boolean} [closable = false] - показывать иконку закрытия
   * @param {Boolean} [removable = false] - алиас closable
   * @param {Boolean} [disabled = false] - блокировка взаимодействия
   * @param {Boolean} [clickable = false] - кликабельный чип
   * @param {Boolean} [dot = false] - цветная точка перед текстом
   * @param {String} [dotColor] - цвет точки
   * @param {Boolean} [outlined = false] - контурный стиль без заливки
   * @param {Boolean} [flat = true] - чип с заполненным фоном (false = outlined)
   * @param {String} [bgColor] - цвет фона
   * @param {String} [color] - алиас bgColor
   * @param {String} [textColor] - цвет текста
   * @param {String} [borderColor] - цвет рамки
   * @param {String} [borderRadius] - радиус скругления
   * @param {String} [borderWidth = '1px'] - толщина рамки
   * @param {String} [minWidth = 'auto'] - минимальная ширина
   */
  const props = withDefaults(
    defineProps<{
      label?: string
      title?: string
      subtitle?: string
      layout?: TopMiningChipLayout
      icon?: string
      iconPosition?: TopMiningChipIconPosition
      prependIcon?: string
      appendIcon?: string
      appendImageUrl?: string
      appendImageAlt?: string
      leftIcon?: string
      rightIcon?: string
      iconVariant?: TopMiningChipIconVariant
      iconSize?: string | number
      prependIconColor?: string
      appendIconColor?: string
      prependIconBackground?: string
      appendIconBackground?: string
      leftIconColor?: string
      rightIconColor?: string
      leftIconBackground?: string
      rightIconBackground?: string
      preset?: TopMiningChipPreset | ''
      size?: TopMiningChipSize
      shape?: TopMiningChipShape
      counter?: number | string
      closable?: boolean
      removable?: boolean
      disabled?: boolean
      clickable?: boolean
      dot?: boolean
      dotColor?: string
      outlined?: boolean
      flat?: boolean
      bgColor?: string
      color?: string
      textColor?: string
      borderColor?: string
      borderRadius?: string
      borderWidth?: string
      minWidth?: string
    }>(),
    {
      label: TOP_MINING_CHIP_DEFAULTS.label,
      title: '',
      subtitle: TOP_MINING_CHIP_DEFAULTS.subtitle,
      layout: TOP_MINING_CHIP_DEFAULTS.layout,
      icon: TOP_MINING_CHIP_DEFAULTS.icon,
      iconPosition: TOP_MINING_CHIP_DEFAULTS.iconPosition,
      prependIcon: TOP_MINING_CHIP_DEFAULTS.prependIcon,
      appendIcon: TOP_MINING_CHIP_DEFAULTS.appendIcon,
      appendImageUrl: TOP_MINING_CHIP_DEFAULTS.appendImageUrl,
      appendImageAlt: TOP_MINING_CHIP_DEFAULTS.appendImageAlt,
      iconVariant: TOP_MINING_CHIP_DEFAULTS.iconVariant,
      preset: TOP_MINING_CHIP_DEFAULTS.preset,
      size: TOP_MINING_CHIP_DEFAULTS.size,
      shape: TOP_MINING_CHIP_DEFAULTS.shape,
      closable: TOP_MINING_CHIP_DEFAULTS.closable,
      removable: false,
      disabled: TOP_MINING_CHIP_DEFAULTS.disabled,
      clickable: TOP_MINING_CHIP_DEFAULTS.clickable,
      dot: false,
      outlined: TOP_MINING_CHIP_DEFAULTS.outlined,
      flat: true,
      minWidth: TOP_MINING_CHIP_DEFAULTS.minWidth,
      borderWidth: TOP_MINING_CHIP_DEFAULTS.borderWidth,
    },
  )

  const emit = defineEmits<{
    click: [event: MouseEvent | KeyboardEvent]
    close: [event: MouseEvent]
    remove: [event: MouseEvent]
  }>()

  const attrs = useAttrs()
  const slots = useSlots()

  const attrsRest = computed(() => {
    const { class: _class, style: _style, ...rest } = attrs as Record<string, unknown>
    return rest
  })

  const isInfoLayout = computed(() => props.layout === 'info')
  const labelText = computed(() => props.label || props.title || '')
  const isRemovable = computed(() => props.closable || props.removable)
  const isOutlined = computed(() => props.outlined || props.flat === false)
  const resolvedBgColor = computed(() => props.bgColor || props.color)

  const icons = computed(() => {
    const prependSource = props.prependIcon || props.leftIcon
    const appendSource = props.appendIcon || props.rightIcon
    const { iconPosition, icon } = props

    if (iconPosition === 'none') {
      return {
        prepend: '',
        append: appendSource || '',
      }
    }

    if (iconPosition === 'right') {
      return {
        prepend: prependSource || '',
        append: appendSource || icon || '',
      }
    }

    return {
      prepend: prependSource || icon || '',
      append: appendSource || '',
    }
  })

  const showPrepend = computed(() => Boolean(icons.value.prepend.trim()))
  const showAppend = computed(() => Boolean(icons.value.append.trim()))

  const resolvedIconSize = computed(
    () => props.iconSize ?? TOP_MINING_CHIP_SIZE[props.size].icon,
  )
  const closeIconSize = computed(() => TOP_MINING_CHIP_SIZE[props.size].close)

  const hasContent = computed(
    () => Boolean(slots.default) || Boolean(labelText.value.trim()),
  )

  const showCounter = computed(
    () => props.counter != null && props.counter !== '',
  )

  function buildIconStyle(color?: string, background?: string) {
    const style: Record<string, string> = {}

    if (color) {
      style.color = color
    }

    if (props.iconVariant === 'badge' && background) {
      style['--tm-chip-icon-bg'] = background
    }

    return Object.keys(style).length ? style : undefined
  }

  const prependIconStyle = computed(() =>
    buildIconStyle(
      props.prependIconColor || props.leftIconColor,
      props.prependIconBackground || props.leftIconBackground,
    ),
  )

  const appendIconStyle = computed(() =>
    buildIconStyle(
      props.appendIconColor || props.rightIconColor,
      props.appendIconBackground || props.rightIconBackground,
    ),
  )

  const rootClasses = computed(() => [
    'top-mining-chip',
    `top-mining-chip--size-${props.size}`,
    `top-mining-chip--shape-${props.shape}`,
    isInfoLayout.value ? 'top-mining-chip--layout-info' : undefined,
    props.preset ? `top-mining-chip--preset-${props.preset}` : undefined,
    isOutlined.value ? 'top-mining-chip--outlined' : undefined,
    props.disabled ? 'top-mining-chip--disabled' : undefined,
    props.clickable ? 'top-mining-chip--clickable' : undefined,
    isRemovable.value ? 'top-mining-chip--has-close-icon' : undefined,
    props.dot ? 'top-mining-chip--dot' : undefined,
    attrs.class,
  ])

  const mergedStyle = computed(() => {
    const style: Record<string, string> = {
      '--tm-chip-min-width': props.minWidth,
      '--tm-chip-border-width': props.borderWidth,
    }

    if (resolvedBgColor.value) {
      if (isOutlined.value) {
        style['--tm-chip-border-color'] = resolvedBgColor.value
        style['--tm-chip-bg'] = 'transparent'
      } else {
        style['--tm-chip-bg'] = resolvedBgColor.value
      }
    }

    if (props.textColor) {
      style['--tm-chip-color'] = props.textColor
    }

    if (props.borderColor) {
      style['--tm-chip-border-color'] = props.borderColor
    }

    if (props.borderRadius) {
      style['--tm-chip-radius'] = props.borderRadius
    }

    if (props.dot && props.dotColor) {
      style['--tm-chip-dot'] = props.dotColor
    }

    return style
  })

  const rootStyle = computed(() => mergedStyle.value)

  const chipTitleStyle = computed(() => {
    const style: Record<string, string> = {
      overflow: 'hidden',
      textOverflow: 'ellipsis',
      whiteSpace: 'nowrap',
    }

    if (props.textColor) {
      style.color = props.textColor
    }

    return style
  })

  const closeIconStyle = computed(() => ({
    color: resolvedBgColor.value || props.textColor || 'currentColor',
  }))

  function handleClick(event: MouseEvent | KeyboardEvent) {
    if (!props.disabled && props.clickable) {
      emit('click', event)
    }
  }

  function removeChip(event: MouseEvent) {
    emit('close', event)
    emit('remove', event)
  }
</script>

<style scoped lang="scss">
  .top-mining-chip.q-chip {
    --tm-chip-dot: currentColor;
    --tm-chip-transition: 150ms cubic-bezier(0.4, 0, 0.2, 1);
    --tm-chip-min-width: auto;
    --tm-chip-border-width: 1px;

    position: relative;
    z-index: 2;
    display: inline-flex;
    align-items: center;
    min-width: var(--tm-chip-min-width);
    min-height: var(--_tm-chip-min-h);
    height: auto;
    max-height: none;
    padding: var(--_tm-chip-pad-y) var(--_tm-chip-pad-x);
    border: var(--tm-chip-border-width) solid var(--tm-chip-border-color, transparent);
    border-radius: var(--tm-chip-radius, 12px);
    background: var(--tm-chip-bg) !important;
    color: var(--tm-chip-color, inherit) !important;
    font-family: var(--font-family-base, inherit);
    font-size: var(--_tm-chip-font);
    font-weight: 600;
    line-height: 1.25;
    letter-spacing: 0.01em;
    box-sizing: border-box;
    vertical-align: middle;
    cursor: default;
    outline: none;
    transition:
      background-color var(--tm-chip-transition),
      color var(--tm-chip-transition),
      box-shadow var(--tm-chip-transition),
      opacity var(--tm-chip-transition);
  }

  .top-mining-chip.q-chip :deep(.q-chip__content) {
    display: flex;
    align-items: center;
    min-width: 0;
    width: 100%;
    padding: 0;
    color: inherit;
  }

  .top-mining-chip__content {
    position: relative;
    display: flex;
    align-items: center;
    gap: var(--_tm-chip-gap);
    width: 100%;
    overflow: hidden;
    white-space: nowrap;
  }

  .top-mining-chip__content--closable {
    padding-right: 10px;
  }

  .top-mining-chip__content--info {
    justify-content: space-between;
    gap: 16px;
    white-space: normal;
    overflow: visible;
  }

  .top-mining-chip--layout-info {
    width: 100%;
    padding: 20px 24px;
    white-space: normal;
  }

  .top-mining-chip__info-body {
    display: flex;
    flex-direction: column;
    gap: 8px;
    min-width: 0;
  }

  .top-mining-chip__info-title {
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3vw, 40px);
    font-weight: 400;
    line-height: 1.1;
  }

  .top-mining-chip__info-subtitle {
    color: #bdbdbd;
    font-size: 15px;
    font-weight: 600;
    line-height: 1.4;
  }

  .top-mining-chip__info-image {
    flex: 0 0 auto;
    width: clamp(56px, 8vw, 72px);
    height: clamp(56px, 8vw, 72px);
    object-fit: contain;
  }

  .top-mining-chip--size-xs {
    --_tm-chip-font: 10px;
    --_tm-chip-pad-y: 2px;
    --_tm-chip-pad-x: 6px;
    --_tm-chip-gap: 3px;
    --_tm-chip-min-h: 18px;
    --_tm-chip-badge-size: 16px;
  }

  .top-mining-chip--size-sm {
    --_tm-chip-font: 12px;
    --_tm-chip-pad-y: 4px;
    --_tm-chip-pad-x: 10px;
    --_tm-chip-gap: 5px;
    --_tm-chip-min-h: 24px;
    --_tm-chip-badge-size: 18px;
  }

  .top-mining-chip--size-md {
    --_tm-chip-font: 16px;
    --_tm-chip-pad-y: 8px;
    --_tm-chip-pad-x: 12px;
    --_tm-chip-gap: 8px;
    --_tm-chip-min-h: 36px;
    --_tm-chip-badge-size: 20px;
  }

  .top-mining-chip--size-lg {
    --_tm-chip-font: 18px;
    --_tm-chip-pad-y: 10px;
    --_tm-chip-pad-x: 16px;
    --_tm-chip-gap: 8px;
    --_tm-chip-min-h: 40px;
    --_tm-chip-badge-size: 24px;
  }

  .top-mining-chip__title {
    display: inline-flex;
    align-items: center;
    min-width: 0;
    line-height: 1.3;
  }

  .top-mining-chip__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    opacity: 0.95;
    transition: opacity var(--tm-chip-transition);
  }

  .top-mining-chip__icon--badge {
    width: var(--_tm-chip-badge-size);
    height: var(--_tm-chip-badge-size);
    border-radius: 50%;
    background: var(--tm-chip-icon-bg);
  }

  .top-mining-chip__icon.top-mining-chip__icon--plain {
    width: auto;
    height: auto;
    background: none;
  }

  .top-mining-chip__counter {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    min-width: 1.25em;
    padding: 0 0.4em;
    border-radius: 999px;
    font-size: 0.85em;
    font-weight: 700;
    line-height: 1.35;
    background: rgba(0, 0, 0, 0.12);
    color: inherit;
  }

  .top-mining-chip__close-icon {
    position: absolute;
    top: 50%;
    right: 4px;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    transform: translateY(-50%);
    padding: 2px;
    border: none;
    background-color: #fff;
    border-radius: 50%;
    font-size: 12px;
    color: inherit;
    cursor: pointer;
    outline: none;
    transition:
      opacity var(--tm-chip-transition),
      box-shadow var(--tm-chip-transition);
  }

  .top-mining-chip__close-icon:hover {
    opacity: 0.9;
  }

  .top-mining-chip__close-icon:focus-visible {
    box-shadow: 0 0 0 2px currentColor;
  }

  .top-mining-chip--dot .top-mining-chip__title--dot::before {
    content: '';
    display: inline-block;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: var(--tm-chip-dot);
    margin-right: var(--_tm-chip-gap);
    vertical-align: middle;
    flex-shrink: 0;
  }

  .top-mining-chip--size-lg.top-mining-chip--dot .top-mining-chip__title--dot::before {
    width: 8px;
    height: 8px;
  }

  .top-mining-chip--clickable {
    cursor: pointer;
    user-select: none;
  }

  .top-mining-chip--clickable:hover {
    filter: brightness(0.96);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
  }

  .top-mining-chip--clickable:active {
    filter: brightness(0.92);
    transform: scale(0.97);
  }

  .top-mining-chip--clickable:focus-visible {
    outline: 2px solid currentColor;
    outline-offset: 2px;
  }

  .top-mining-chip--disabled {
    opacity: 0.45;
    pointer-events: none;
    cursor: not-allowed;
  }

  .top-mining-chip.top-mining-chip--outlined {
    --tm-chip-bg: transparent;
    --tm-chip-border-color: currentColor;
    box-shadow: none;
  }

  .top-mining-chip.top-mining-chip--preset-blue {
    --tm-chip-bg: #eff6ff;
    --tm-chip-color: #1e40af;
    --tm-chip-border-color: rgba(37, 99, 235, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-green {
    --tm-chip-bg: #f0fdf4;
    --tm-chip-color: #166534;
    --tm-chip-border-color: rgba(22, 101, 52, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-orange {
    --tm-chip-bg: #fff7ed;
    --tm-chip-color: #9a3412;
    --tm-chip-border-color: rgba(154, 52, 18, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-red {
    --tm-chip-bg: #fef2f2;
    --tm-chip-color: #991b1b;
    --tm-chip-border-color: rgba(153, 27, 27, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-purple {
    --tm-chip-bg: #faf5ff;
    --tm-chip-color: #5b21b6;
    --tm-chip-border-color: rgba(91, 33, 182, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-gray {
    --tm-chip-bg: #f9fafb;
    --tm-chip-color: #374151;
    --tm-chip-border-color: rgba(55, 65, 81, 0.15);
  }

  .top-mining-chip.top-mining-chip--preset-teal {
    --tm-chip-bg: #f0fdfa;
    --tm-chip-color: #115e59;
    --tm-chip-border-color: rgba(17, 94, 89, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-pink {
    --tm-chip-bg: #fdf2f8;
    --tm-chip-color: #9d174d;
    --tm-chip-border-color: rgba(157, 23, 77, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-yellow {
    --tm-chip-bg: #fefce8;
    --tm-chip-color: #854d0e;
    --tm-chip-border-color: rgba(133, 77, 14, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-indigo {
    --tm-chip-bg: #eef2ff;
    --tm-chip-color: #3730a3;
    --tm-chip-border-color: rgba(55, 48, 163, 0.22);
  }

  .top-mining-chip.top-mining-chip--preset-dark {
    --tm-chip-bg: rgba(20, 20, 20, 0.92);
    --tm-chip-color: #bdbdbd;
    --tm-chip-border-color: transparent;
  }

  .top-mining-chip.top-mining-chip--preset-dark-success {
    --tm-chip-bg: rgba(10, 10, 10, 0.95);
    --tm-chip-color: #fff;
    --tm-chip-border-color: transparent;
  }

  .top-mining-chip.top-mining-chip--preset-dark-danger {
    --tm-chip-bg: rgba(20, 20, 20, 0.92);
    --tm-chip-color: #bdbdbd;
    --tm-chip-border-color: transparent;
  }

  .top-mining-chip.top-mining-chip--shape-pill {
    --tm-chip-radius: 25px;
  }

  .top-mining-chip.top-mining-chip--shape-rounded {
    --tm-chip-radius: 12px;
  }

  .top-mining-chip.top-mining-chip--shape-square {
    --tm-chip-radius: 2px;
  }
</style>
