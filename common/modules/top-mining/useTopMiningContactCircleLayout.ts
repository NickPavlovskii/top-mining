import {
  getTopMiningContactBlockStyle,
  getTopMiningContactBlockStyleForCircleWidth,
  isTopMiningContactCompactCircle,
  type TopMiningContactBlockKey,
} from './contact-section'

export function useTopMiningContactCircleLayout(block: TopMiningContactBlockKey) {
  const circleRef = ref<HTMLElement | null>(null)
  const circleWidth = ref(0)
  const layoutStyle = ref(getTopMiningContactBlockStyle(block))

  const isCompact = computed(() => isTopMiningContactCompactCircle(circleWidth.value))

  let observer: ResizeObserver | null = null

  onMounted(() => {
    const element = circleRef.value
    if (!element) {
      return
    }

    const updateLayout = (width: number) => {
      circleWidth.value = width
      layoutStyle.value = getTopMiningContactBlockStyleForCircleWidth(block, width)
    }

    updateLayout(element.getBoundingClientRect().width)

    if (typeof ResizeObserver === 'undefined') {
      return
    }

    observer = new ResizeObserver(([entry]) => {
      updateLayout(entry.contentRect.width)
    })

    observer.observe(element)
  })

  onUnmounted(() => {
    observer?.disconnect()
  })

  return {
    circleRef,
    layoutStyle,
    isCompact,
  }
}
