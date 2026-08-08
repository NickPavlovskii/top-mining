/**
 * Папка calculator — майнинг-калькулятор.
 * Query-параметры для deep-link: модель / хешрейт / потребление.
 */
import {
  CALCULATOR_HASHRATE_UNITS,
  type CalculatorHashrateUnit,
} from './coins'
import type {
  CalculatorDeviceKind,
  CalculatorHardwareByKind,
  CalculatorHardwareModel,
} from './hardware'
import { CALCULATOR_PAGE_PATH } from './path'

export type CalculatorPrefillQuery = {
  model?: string
  hashrate?: number
  power?: number
  unit?: CalculatorHashrateUnit
  kind?: CalculatorDeviceKind
}

export function getCalculatorModelHref(modelSlug: string): string {
  const params = new URLSearchParams({ model: modelSlug })
  return `${CALCULATOR_PAGE_PATH}?${params.toString()}`
}

export function getCalculatorPrefillHref(prefill: {
  hashrate: number
  power: number
  unit?: CalculatorHashrateUnit
  kind?: CalculatorDeviceKind
}): string {
  const params = new URLSearchParams()
  params.set('hashrate', String(prefill.hashrate))
  params.set('power', String(prefill.power))
  if (prefill.unit) {
    params.set('unit', prefill.unit)
  }
  if (prefill.kind && prefill.kind !== 'asic') {
    params.set('kind', prefill.kind)
  }
  return `${CALCULATOR_PAGE_PATH}?${params.toString()}`
}

export function parseCalculatorPrefillQuery(
  query: Record<string, unknown> | undefined | null,
): CalculatorPrefillQuery {
  if (!query) {
    return {}
  }

  const modelRaw = query.model
  const model =
    typeof modelRaw === 'string' && modelRaw.trim() ? modelRaw.trim() : undefined

  const hashrate = parsePositiveNumber(query.hashrate)
  const power = parsePositiveNumber(query.power)

  const unitRaw = typeof query.unit === 'string' ? query.unit : ''
  const unit = CALCULATOR_HASHRATE_UNITS.includes(
    unitRaw as CalculatorHashrateUnit,
  )
    ? (unitRaw as CalculatorHashrateUnit)
    : undefined

  const kindRaw = typeof query.kind === 'string' ? query.kind.toLowerCase() : ''
  const kind =
    kindRaw === 'asic' || kindRaw === 'gpu' || kindRaw === 'cpu'
      ? kindRaw
      : undefined

  return { model, hashrate, power, unit, kind }
}

export function findHardwareModelBySlug(
  hardware: CalculatorHardwareByKind | null | undefined,
  slug: string,
): { kind: CalculatorDeviceKind; model: CalculatorHardwareModel } | null {
  if (!hardware || !slug) {
    return null
  }

  const normalized = slug.trim().toLowerCase()
  const kinds: CalculatorDeviceKind[] = ['asic', 'gpu', 'cpu']

  for (const kind of kinds) {
    for (const brand of hardware[kind] ?? []) {
      const model = brand.models.find(
        (item) =>
          item.slug.toLowerCase() === normalized ||
          item.id.toLowerCase() === normalized,
      )
      if (model) {
        return { kind, model }
      }
    }
  }

  return null
}

function parsePositiveNumber(value: unknown): number | undefined {
  if (typeof value === 'number' && Number.isFinite(value) && value > 0) {
    return value
  }

  if (typeof value === 'string' && value.trim()) {
    const parsed = Number(value.replace(',', '.'))
    if (Number.isFinite(parsed) && parsed > 0) {
      return parsed
    }
  }

  return undefined
}
