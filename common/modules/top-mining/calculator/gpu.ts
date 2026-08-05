/**
 * Папка calculator — майнинг-калькулятор.
 * Алгоритмы и монеты для GPU/CPU.
 */
import type { CalculatorCoin } from './coins'

export const CALCULATOR_GPU_ALGORITHMS: string[] = [
  'Ethash',
  'Ethash4G',
  'Etchash',
  'Zhash',
  'SHA512256d',
  'DynexSolve',
  'PyrinHash',
  'Skydoge',
  'Cuckatoo32',
  'Blake3',
  'blake3Ironfish',
  'Karlsenhash',
  'Autolykos',
  'IronFish',
  'FishHash',
  'PoUW',
  'KawPow',
  'NexaPow',
]

/** Seed coins for GPU/CPU mining (filtered by algorithm in the UI). */
export const CALCULATOR_GPU_COINS: CalculatorCoin[] = [
  {
    id: 'ETHW',
    symbol: 'ETHW',
    name: 'EthereumPoW',
    algorithm: 'Ethash',
    difficulty: 21_208_649_620_792,
    blockReward: 2.0014685815562,
    exchangeRateUsdt: 3.7898752245477e-6,
    netHash: 1_634_023_885_602,
    stepen: '0',
    dualCoin: false,
    iconUrl:
      'https://images.hashrate.no/bd437e654dece32c3f46ce947e51032f.png',
    sort: 1,
  },
  {
    id: 'BTG',
    symbol: 'BTG',
    name: 'Bitcoin GOLD',
    algorithm: 'Zhash',
    difficulty: 5992.28711575,
    blockReward: 3.125,
    exchangeRateUsdt: 0,
    netHash: 82_780,
    stepen: '2v13',
    dualCoin: false,
    iconUrl:
      'https://images.hashrate.no/970e82821bf661ab55418f98b4f90e45.png',
    sort: 2,
  },
  {
    id: 'BTCZ',
    symbol: 'BTCZ',
    name: 'BitcoinZ',
    algorithm: 'Zhash',
    difficulty: 224.94535813108,
    blockReward: 3125,
    exchangeRateUsdt: 3.3169343464425e-10,
    netHash: 12_123,
    stepen: '2v13',
    dualCoin: false,
    iconUrl:
      'https://images-production.whattomine.com/h3vmafnfvas3cse5qjpq0x0tel3n',
    sort: 3,
  },
  {
    id: 'DNX',
    symbol: 'DNX',
    name: 'Dynex',
    algorithm: 'DynexSolve',
    difficulty: 281_453_536,
    blockReward: 8.599820622,
    exchangeRateUsdt: 6.4116817031712e-8,
    netHash: 2_345_446,
    stepen: '0',
    dualCoin: false,
    iconUrl:
      'https://images.hashrate.no/b9e17f458614ad0054aa325dd6ca3c21.png',
    sort: 4,
  },
  {
    id: 'ALPH-GPU',
    symbol: 'ALPH',
    name: 'Alephium',
    algorithm: 'Blake3',
    difficulty: 2.271259533966e15,
    blockReward: 0.14331780723755,
    exchangeRateUsdt: 5.8133638808703e-7,
    netHash: 4_235_843_964_875_106,
    stepen: '0',
    dualCoin: false,
    iconUrl:
      'https://images.hashrate.no/39dbc7fc965544f827acd358c8f682f6.png',
    sort: 5,
  },
  {
    id: 'ERG',
    symbol: 'ERG',
    name: 'Ergo',
    algorithm: 'Autolykos',
    difficulty: 58_660_394_893_312,
    blockReward: 3,
    exchangeRateUsdt: 3.3089990968099e-6,
    netHash: 476_913_779_620,
    stepen: '0',
    dualCoin: false,
    iconUrl:
      'https://images.hashrate.no/8e8384376f97e7bbc868b1a017c4ecd2.png',
    sort: 6,
  },
]

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
