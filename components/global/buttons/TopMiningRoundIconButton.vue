<template>
  <div class="top-mining-round-icon-button-wrap">
    <q-btn
      round
      :class="[
        'top-mining-round-icon-button',
        `top-mining-round-icon-button--${variant}`,
        `top-mining-round-icon-button--${size}`,
        {
          'top-mining-round-icon-button--disabled': disabled,
          'top-mining-round-icon-button--has-border': hasBorder,
        },
      ]"
      :style="buttonStyle"
      :href="href || undefined"
      :target="href ? target || undefined : undefined"
      :rel="linkRel"
      :type="href ? undefined : type"
      :disable="disabled"
      :ripple="!disabled"
      :aria-label="ariaLabel"
      unelevated
      @click="onClick"
    >
      <img
        v-if="useSvgIcon && svgDataUrl"
        :src="svgDataUrl"
        :alt="altText"
        aria-hidden="true"
        class="top-mining-round-icon-button__icon top-mining-round-icon-button__icon--image"
      />
      <Icon
        v-else
        :name="icon"
        class="top-mining-round-icon-button__icon"
      />

      <q-tooltip v-if="tooltip">
        {{ tooltip }}
      </q-tooltip>
    </q-btn>
  </div>
</template>

<script setup lang="ts">
  type Variant = 'primary' | 'outline'
  type Size = 'small' | 'medium'

  /**
   * Круглая кнопка с иконкой на базе Quasar q-btn.
   * Рендерится как ссылка при указании href.
   *
   * @param {String} [icon = 'mdi:arrow-up'] - имя Iconify или URL SVG-файла
   * @param {String} ariaLabel - ARIA-метка для доступности
   * @param {String} [altInfo = ''] - alt-текст SVG-иконки
   * @param {String} [tooltip = ''] - текст подсказки
   * @param {String} [variant = 'primary'] - вариант: primary или outline
   * @param {String} [size = 'medium'] - размер: small или medium
   * @param {String} [href = ''] - ссылка; при указании рендерится как <a>
   * @param {String} [target = ''] - атрибут target для ссылки
   * @param {String} [type = 'button'] - тип кнопки: button, submit или reset
   * @param {Boolean} [disabled = false] - блокировка взаимодействия
   * @param {String} [backgroundColor = ''] - цвет фона
   * @param {String} [borderColor = ''] - цвет рамки
   * @param {String} [color = ''] - цвет иконки
   * @param {String} [hoverBackgroundColor = ''] - цвет фона при наведении
   * @param {String} [hoverBorderColor = ''] - цвет рамки при наведении
   * @param {String} [hoverColor = ''] - цвет иконки при наведении
   * @param {String | Number} [width = ''] - ширина кнопки
   * @param {String | Number} [height = ''] - высота кнопки
   * @param {String | Number} [minWidth] - минимальная ширина кнопки
   * @param {String} [iconSize = ''] - размер иконки
   * @param {String} [iconRotate = '45deg'] - поворот иконки
   * @param {String | Number} [borderWidth = '1px'] - толщина рамки
   * @param {String | Number} [borderRadius = '999px'] - радиус скругления
   */
  const props = withDefaults(
    defineProps<{
      icon?: string
      ariaLabel: string
      altInfo?: string
      tooltip?: string
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
      width?: string | number
      height?: string | number
      minWidth?: string | number
      iconSize?: string
      iconRotate?: string
      borderWidth?: string | number
      borderRadius?: string | number
    }>(),
    {
      icon: 'mdi:arrow-up',
      altInfo: '',
      tooltip: '',
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
      borderRadius: '999px',
    },
  )

  const emit = defineEmits<{
    click: [event: MouseEvent]
  }>()

  const SIZE_PRESETS: Record<Size, { box: string; icon: string }> = {
    small: { box: '38px', icon: '18px' },
    medium: { box: '42px', icon: '18px' },
  }

  const svgDataUrl = ref<string>()

  const linkRel = computed(() =>
    props.href && props.target === '_blank' ? 'noopener noreferrer' : undefined,
  )
  const isOutline = computed(() => props.variant === 'outline')
  const accent = computed(
    () => props.borderColor || props.backgroundColor || 'var(--orange-color)',
  )
  const hasBorder = computed(() => Boolean(props.borderColor))
  const altText = computed(() => props.altInfo || props.ariaLabel)
  const resolvedIconColor = computed(
    () => props.color || (isOutline.value ? 'var(--jet-color)' : 'var(--white-color)'),
  )

  const useSvgIcon = computed(
    () =>
      props.icon.includes('.svg')
      || props.icon.startsWith('/')
      || props.icon.startsWith('http'),
  )

  const buttonStyle = computed(() => {
    const preset = SIZE_PRESETS[props.size]
    const width = formatSize(props.width || preset.box)
    const height = formatSize(props.height || preset.box)
    const minWidth = formatSize(props.minWidth || props.width || preset.box)

    return {
      width,
      minWidth,
      height,
      '--tm-icon-btn-w': width,
      '--tm-icon-btn-h': height,
      '--tm-icon-btn-icon-size': props.iconSize || preset.icon,
      '--tm-icon-btn-border-w': formatSize(props.borderWidth),
      '--tm-icon-btn-border-radius': formatSize(props.borderRadius),
      '--tm-icon-btn-rotate': props.iconRotate,
      '--tm-icon-btn-bg':
        props.backgroundColor || (isOutline.value ? 'transparent' : 'var(--orange-color)'),
      '--tm-icon-btn-border': props.borderColor || accent.value,
      '--tm-icon-btn-color': resolvedIconColor.value,
      '--tm-icon-btn-hover-bg':
        props.hoverBackgroundColor || (isOutline.value ? accent.value : 'transparent'),
      '--tm-icon-btn-hover-border': props.hoverBorderColor || accent.value,
      '--tm-icon-btn-hover-color':
        props.hoverColor || (isOutline.value ? 'var(--white-color)' : 'var(--jet-color)'),
    }
  })

  async function loadSvg() {
    if (!useSvgIcon.value || import.meta.server) {
      svgDataUrl.value = undefined
      return
    }

    try {
      const response = await fetch(props.icon)
      const svgText = await response.text()
      const updatedSvg = svgText.replace(
        /fill="(?!none")[^"]*"/g,
        `fill="${resolvedIconColor.value}"`,
      )
      svgDataUrl.value = `data:image/svg+xml,${encodeURIComponent(updatedSvg)}`
    } catch (error) {
      console.error('Ошибка загрузки SVG:', error)
      svgDataUrl.value = undefined
    }
  }

  watch(
    () => [props.icon, resolvedIconColor.value] as const,
    () => {
      loadSvg()
    },
    { immediate: true },
  )

  function formatSize(value: string | number) {
    return typeof value === 'number' ? `${value}px` : value
  }

  function onClick(event: MouseEvent) {
    if (props.disabled) {
      event.preventDefault()
      return
    }
    emit('click', event)
  }
</script>

<style scoped lang="scss">
  .top-mining-round-icon-button-wrap {
    display: inline-flex;
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button.q-btn) {
    min-width: var(--tm-icon-btn-w);
    min-height: var(--tm-icon-btn-h);
    padding: 0;
    border: none;
    box-shadow: none !important;
  }

  .top-mining-round-icon-button-wrap
    :deep(.top-mining-round-icon-button.q-btn.top-mining-round-icon-button--has-border) {
    border-style: solid;
    border-width: var(--tm-icon-btn-border-w);
    border-color: var(--tm-icon-btn-border);
    border-radius: var(--tm-icon-btn-border-radius);
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button.q-btn .q-btn__content) {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    line-height: 1;
    color: inherit;
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button) {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: var(--tm-icon-btn-w);
    height: var(--tm-icon-btn-h);
    border-radius: var(--tm-icon-btn-border-radius, 999px);
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

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button:hover),
  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button:focus-visible) {
    background: var(--tm-icon-btn-hover-bg);
    border-color: var(--tm-icon-btn-hover-border);
    color: var(--tm-icon-btn-hover-color);
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button:active) {
    transform: scale(0.94);
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button:focus-visible) {
    outline: 2px solid var(--tm-icon-btn-border);
    outline-offset: 2px;
  }

  .top-mining-round-icon-button-wrap
    :deep(.top-mining-round-icon-button--disabled),
  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button:disabled) {
    cursor: not-allowed;
    opacity: 0.45;
    pointer-events: none;
  }

  .top-mining-round-icon-button-wrap
    :deep(.top-mining-round-icon-button:hover:not(:disabled):not(.top-mining-round-icon-button--disabled))
    .top-mining-round-icon-button__icon,
  .top-mining-round-icon-button-wrap
    :deep(.top-mining-round-icon-button:focus-visible:not(:disabled):not(.top-mining-round-icon-button--disabled))
    .top-mining-round-icon-button__icon {
    transform: rotate(var(--tm-icon-btn-rotate)) translateX(3px);
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button__icon) {
    width: var(--tm-icon-btn-icon-size);
    height: var(--tm-icon-btn-icon-size);
    transform: rotate(var(--tm-icon-btn-rotate));
    transition: transform 0.18s ease;
  }

  .top-mining-round-icon-button-wrap :deep(.top-mining-round-icon-button__icon--image) {
    display: block;
    object-fit: contain;
  }

  @media (prefers-reduced-motion: reduce) {
    .top-mining-round-icon-button-wrap
      :deep(.top-mining-round-icon-button:hover .top-mining-round-icon-button__icon),
    .top-mining-round-icon-button-wrap
      :deep(.top-mining-round-icon-button:focus-visible .top-mining-round-icon-button__icon) {
      transform: rotate(var(--tm-icon-btn-rotate));
    }
  }
</style>
