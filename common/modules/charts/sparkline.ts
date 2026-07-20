export const SPARKLINE_VIEWBOX = {
  width: 500,
  height: 180,
  paddingTop: 28,
  paddingBottom: 8,
} as const

export const SPARKLINE_GRID_LINES = [0, 100, 200, 300, 400, 500] as const

export function buildSparklinePoints(
  values: readonly number[],
  {
    width = SPARKLINE_VIEWBOX.width,
    height = SPARKLINE_VIEWBOX.height,
    paddingTop = SPARKLINE_VIEWBOX.paddingTop,
    paddingBottom = SPARKLINE_VIEWBOX.paddingBottom,
  }: {
    width?: number
    height?: number
    paddingTop?: number
    paddingBottom?: number
  } = {},
): string {
  if (values.length < 2) {
    return ''
  }

  const min = Math.min(...values)
  const max = Math.max(...values)
  const range = max - min || 1
  const usableHeight = height - paddingTop - paddingBottom
  const lastIndex = values.length - 1

  return values
    .map((value, index) => {
      const x = (index / lastIndex) * width
      const y = height - paddingBottom - ((value - min) / range) * usableHeight

      return `${x.toFixed(1)},${y.toFixed(1)}`
    })
    .join(' ')
}
