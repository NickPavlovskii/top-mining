/**
 * Папка calculator — майнинг-калькулятор.
 * Типы устройств/моделей и хелперы; каталог моделей приходит из API/БД.
 */
export type CalculatorDeviceKind = 'asic' | 'gpu' | 'cpu'

export type CalculatorHardwareModel = {
  id: string
  name: string
  brand: string
  algorithm: string
  hashrate: number
  hashrateUnit: string
  powerW: number
  slug: string
}

export type CalculatorHardwareBrand = {
  name: string
  models: CalculatorHardwareModel[]
}

export type CalculatorDeviceOption = {
  kind: CalculatorDeviceKind
  label: string
  placeholder: string
}

export type CalculatorHardwareByKind = Record<
  CalculatorDeviceKind,
  CalculatorHardwareBrand[]
>

export const CALCULATOR_DEVICE_OPTIONS: CalculatorDeviceOption[] = [
  {
    kind: 'asic',
    label: 'ASIC',
    placeholder: 'Модель ASIC-майнера',
  },
  {
    kind: 'gpu',
    label: 'GPU',
    placeholder: 'Выберите Модель GPU',
  },
  {
    kind: 'cpu',
    label: 'CPU',
    placeholder: 'Выберите Модель CPU',
  },
]

export function emptyCalculatorHardwareByKind(): CalculatorHardwareByKind {
  return {
    asic: [],
    gpu: [],
    cpu: [],
  }
}

export function formatHardwareModelMeta(
  item: CalculatorHardwareModel,
): string {
  return `${item.algorithm} | ${item.hashrate} ${item.hashrateUnit} | ${item.powerW} Вт`
}

export function filterHardwareBrands(
  brands: CalculatorHardwareBrand[],
  query: string,
): CalculatorHardwareBrand[] {
  const normalized = query.trim().toLowerCase()
  if (!normalized) {
    return brands
  }

  return brands
    .map((brand) => {
      const brandMatches = brand.name.toLowerCase().includes(normalized)
      const models = brandMatches
        ? brand.models
        : brand.models.filter(
            (item) =>
              item.name.toLowerCase().includes(normalized) ||
              item.algorithm.toLowerCase().includes(normalized),
          )

      return models.length ? { ...brand, models } : null
    })
    .filter((brand): brand is CalculatorHardwareBrand => Boolean(brand))
}
