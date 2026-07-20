import type { ProjectedSphereTag, SphereTag } from './types'

export const NOT_FOUND_PHRASES = [
  '404',
  'Страница не найдена',
  'На главную',
] as const

/** Угол золотого сечения для равномерного распределения точек на сфере. */
const GOLDEN_ANGLE = Math.PI * (3 - Math.sqrt(5))

export const SPHERE_TAG_COUNT = 54
export const SPHERE_RADIUS_RATIO = 0.34

/**
 * Строит набор меток на сфере (Fibonacci sphere).
 * Каждая метка получает текст из `phrases` по кругу и координаты x/y/z.
 */
export function buildSphereTags(
  phrases: readonly string[],
  count: number,
  radius: number,
): SphereTag[] {
  const tags: SphereTag[] = []
  const lastIndex = Math.max(count - 1, 1)
  const phraseCount = phrases.length

  for (let index = 0; index < count; index += 1) {
    const y = 1 - (index / lastIndex) * 2
    const ringRadius = Math.sqrt(Math.max(0, 1 - y * y))
    const theta = GOLDEN_ANGLE * index

    tags.push({
      text: phrases[index % phraseCount]!,
      x: Math.cos(theta) * ringRadius * radius,
      y: y * radius,
      z: Math.sin(theta) * ringRadius * radius,
    })
  }

  return tags
}

/** Считает радиус сферы по размеру canvas (доля от меньшей стороны). */
export function getSphereRadius(width: number, height: number): number {
  return Math.min(width, height) * SPHERE_RADIUS_RATIO
}

/**
 * Поворачивает метки вокруг осей Y и X и проецирует их в 2D.
 * Сортирует по глубине (z), чтобы дальние рисовались раньше ближних.
 */
export function projectSphereTags(
  tags: readonly SphereTag[],
  centerX: number,
  centerY: number,
  rotateY: number,
  rotateX: number,
): ProjectedSphereTag[] {
  const sinY = Math.sin(rotateY)
  const cosY = Math.cos(rotateY)
  const sinX = Math.sin(rotateX)
  const cosX = Math.cos(rotateX)

  const projected: ProjectedSphereTag[] = tags.map((tag) => {
    const x1 = tag.x * cosY - tag.z * sinY
    const z1 = tag.x * sinY + tag.z * cosY
    const y2 = tag.y * cosX - z1 * sinX
    const z2 = tag.y * sinX + z1 * cosX

    return {
      text: tag.text,
      x: centerX + x1,
      y: centerY + y2,
      z: z2,
    }
  })

  projected.sort((left, right) => left.z - right.z)
  return projected
}

/**
 * По глубине z считает прозрачность и размер шрифта метки:
 * ближе к камере — ярче и крупнее.
 */
export function depthStyle(z: number, radius: number) {
  const depth = (z + radius) / (radius * 2)
  const scale = 0.55 + depth * 0.65
  const opacity = 0.12 + depth * 0.88
  const fontSize = Math.max(11, Math.round(14 * scale))

  return { opacity, fontSize }
}
