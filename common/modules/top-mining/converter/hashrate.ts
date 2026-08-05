export type HashrateConverterUnitId =
  | 'hash'
  | 'kilohash'
  | 'megahash'
  | 'gigahash'
  | 'terahash'
  | 'petahash'
  | 'exahash'
  | 'zetahash'

export type HashrateConverterUnit = {
  id: HashrateConverterUnitId
  shortLabel: string
  name: string
  exponent: number
  multiplierLabel: string | null
}

export const HASHRATE_CONVERTER_UNITS: readonly HashrateConverterUnit[] = [
  { id: 'hash', shortLabel: 'H/s', name: 'Хеш', exponent: 0, multiplierLabel: null },
  {
    id: 'kilohash',
    shortLabel: 'kH/s',
    name: 'Килохеш',
    exponent: 3,
    multiplierLabel: '×10³',
  },
  {
    id: 'megahash',
    shortLabel: 'MH/s',
    name: 'Мегахеш',
    exponent: 6,
    multiplierLabel: '×10⁶',
  },
  {
    id: 'gigahash',
    shortLabel: 'GH/s',
    name: 'Гигахеш',
    exponent: 9,
    multiplierLabel: '×10⁹',
  },
  {
    id: 'terahash',
    shortLabel: 'TH/s',
    name: 'Терахеш',
    exponent: 12,
    multiplierLabel: '×10¹²',
  },
  {
    id: 'petahash',
    shortLabel: 'PH/s',
    name: 'Петахеш',
    exponent: 15,
    multiplierLabel: '×10¹⁵',
  },
  {
    id: 'exahash',
    shortLabel: 'EH/s',
    name: 'Эксахеш',
    exponent: 18,
    multiplierLabel: '×10¹⁸',
  },
  {
    id: 'zetahash',
    shortLabel: 'ZH/s',
    name: 'Зеттахеш',
    exponent: 21,
    multiplierLabel: '×10²¹',
  },
] as const

export const HASHRATE_CONVERTER_DEFAULT_UNIT_ID: HashrateConverterUnitId = 'megahash'

export const HASHRATE_CONVERTER_DEFAULT_VALUE = 1

export function hashrateToBaseHs(value: number, exponent: number): number {
  return value * 10 ** exponent
}

export function hashrateFromBaseHs(baseHs: number, exponent: number): number {
  return baseHs / 10 ** exponent
}

export function convertHashrateValues(
  sourceId: HashrateConverterUnitId,
  rawValue: string,
): Record<HashrateConverterUnitId, string> {
  const parsed = parseConverterInput(rawValue)
  const sourceUnit = HASHRATE_CONVERTER_UNITS.find((unit) => unit.id === sourceId)

  if (!sourceUnit) {
    return createEmptyValues()
  }

  if (parsed === null) {
    return createEmptyValues()
  }

  const baseHs = hashrateToBaseHs(parsed, sourceUnit.exponent)
  const values = {} as Record<HashrateConverterUnitId, string>

  for (const unit of HASHRATE_CONVERTER_UNITS) {
    values[unit.id] = formatConverterValue(hashrateFromBaseHs(baseHs, unit.exponent))
  }

  return values
}

export function createDefaultHashrateValues(): Record<HashrateConverterUnitId, string> {
  return convertHashrateValues(
    HASHRATE_CONVERTER_DEFAULT_UNIT_ID,
    String(HASHRATE_CONVERTER_DEFAULT_VALUE),
  )
}

export function parseConverterInput(rawValue: string): number | null {
  const trimmed = rawValue.trim().replace(',', '.')

  if (!trimmed) {
    return null
  }

  const parsed = Number(trimmed)

  if (!Number.isFinite(parsed)) {
    return null
  }

  return parsed
}

export function formatConverterValue(value: number): string {
  if (!Number.isFinite(value)) {
    return ''
  }

  if (value === 0) {
    return '0'
  }

  const abs = Math.abs(value)

  if (abs >= 1) {
    return trimTrailingZeros(Number(value.toPrecision(12)).toString())
  }

  const decimals = Math.min(21, Math.max(0, -Math.floor(Math.log10(abs)) + 6))

  return trimTrailingZeros(value.toFixed(decimals))
}

function trimTrailingZeros(value: string): string {
  if (!value.includes('.')) {
    return value
  }

  return value.replace(/\.?0+$/, '')
}

function createEmptyValues(): Record<HashrateConverterUnitId, string> {
  const values = {} as Record<HashrateConverterUnitId, string>

  for (const unit of HASHRATE_CONVERTER_UNITS) {
    values[unit.id] = ''
  }

  return values
}
