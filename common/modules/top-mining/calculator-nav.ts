import type { CalculatorDeviceKind } from './calculator-hardware'
import { CALCULATOR_PAGE_PATH } from './calculator-path'
import { TOP_MINING_HASHRATE_CONVERTER_URL } from './epic-blocks'
import { RATINGS_PAGE_HREF } from '../ratings/nav-links'

export const CALCULATOR_TELEGRAM_BOT_URL = 'https://t.me/miningcalculator_bot'

export const CALCULATOR_DEVICE_HASHES: Record<CalculatorDeviceKind, string> = {
  asic: 'asic',
  gpu: 'gpu',
  cpu: 'cpu',
}

export function parseCalculatorDeviceHash(
  hash: string,
): CalculatorDeviceKind | null {
  const normalized = hash.replace(/^#/, '').toLowerCase()

  if (normalized === CALCULATOR_DEVICE_HASHES.asic) {
    return 'asic'
  }

  if (normalized === CALCULATOR_DEVICE_HASHES.gpu) {
    return 'gpu'
  }

  if (normalized === CALCULATOR_DEVICE_HASHES.cpu) {
    return 'cpu'
  }

  return null
}

export function getCalculatorDeviceHash(kind: CalculatorDeviceKind): string {
  return `#${CALCULATOR_DEVICE_HASHES[kind]}`
}

export function isCalculatorExternalNavItem(item: string): boolean {
  return item === 'Калькулятор в Telegram'
}

export function getCalculatorNavItemHref(item: string): string {
  switch (item) {
    case 'ASIC-майнеры':
      return `${CALCULATOR_PAGE_PATH}#asic`
    case 'GPU':
      return `${CALCULATOR_PAGE_PATH}#gpu`
    case 'CPU':
      return `${CALCULATOR_PAGE_PATH}#cpu`
    case 'Конвертер хешрейта':
      return TOP_MINING_HASHRATE_CONVERTER_URL
    case 'Калькулятор в Telegram':
      return CALCULATOR_TELEGRAM_BOT_URL
    case 'Рейтинги':
      return RATINGS_PAGE_HREF
    default:
      return CALCULATOR_PAGE_PATH
  }
}
