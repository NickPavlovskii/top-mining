/**
 * Папка calculator — майнинг-калькулятор.
 * Хелперы GPU/CPU; список алгоритмов и монет — из API/БД.
 */
import type { CalculatorCoin } from './coins'

export function filterGpuCoinsByAlgorithm(
  coins: CalculatorCoin[],
  algorithm: string | null,
): CalculatorCoin[] {
  if (!algorithm) {
    return coins
  }

  const normalized = algorithm.toLowerCase()

  return coins.filter(
    (coin) => coin.algorithm.toLowerCase() === normalized,
  )
}

export function filterGpuAlgorithms(
  algorithms: string[],
  query: string,
): string[] {
  const normalized = query.trim().toLowerCase()

  if (!normalized) {
    return algorithms
  }

  return algorithms.filter((algo) =>
    algo.toLowerCase().includes(normalized),
  )
}

export function formatGpuCoinOptionLabel(coin: CalculatorCoin): string {
  return `${coin.name} | ${coin.algorithm}`
}
