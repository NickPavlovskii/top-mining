/** Смещение строки от центра блока: отрицательное — влево, положительное — вправо */
const RATING_ITEM_OFFSETS = [
  -88, 124, 196, -148, 168, 72, -212, 118, -44, 156, -96, 132, 48, 224, -172, 96, -64, 148, -156, 136, 64,
]

export function getRatingItemIndent(index: number): number {
  return RATING_ITEM_OFFSETS[index % RATING_ITEM_OFFSETS.length] ?? 0
}
