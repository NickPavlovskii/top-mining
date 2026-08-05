export type CalculatorHashrateUnit = 'Th/s' | 'Gh/s' | 'Mh/s' | 'Kh/s' | 'H/s'
export type CalculatorFiat = '₽' | '$'

export type CalculatorCoin = {
  id: string
  symbol: string
  name: string
  algorithm: string
  difficulty: number
  blockReward: number
  exchangeRateUsdt: number
  netHash: number
  stepen: string
  dualCoin: boolean
  iconUrl: string
  sort: number
}

export const CALCULATOR_HASHRATE_UNITS: CalculatorHashrateUnit[] = [
  'Th/s',
  'Gh/s',
  'Mh/s',
  'Kh/s',
  'H/s',
]

export const CALCULATOR_FIAT_OPTIONS: CalculatorFiat[] = ['₽', '$']

export const CALCULATOR_DEFAULT_USDT_RUB = 79.2

export const CALCULATOR_COINS: CalculatorCoin[] = [
  {
    id: 'ALEO',
    symbol: 'ALEO',
    name: 'Aleo',
    algorithm: 'zkSNARK',
    difficulty: 25_630_703_827_877,
    blockReward: 28.115906225,
    exchangeRateUsdt: 2.6697951677342e-7,
    netHash: 258_742_390_456,
    stepen: '0',
    dualCoin: false,
    iconUrl:
      'https://images-production.whattomine.com/r31menin7v1kiw3rgtko958m1rb9',
    sort: 1,
  },
  {
    id: 'ALPH',
    symbol: 'ALPH',
    name: 'Alephium',
    algorithm: 'Blake3',
    difficulty: 2.5622667417872e15,
    blockReward: 0.14331780723755,
    exchangeRateUsdt: 5.7422791553047e-7,
    netHash: 4_813_855_571_808_531,
    stepen: '0',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/aleo.svg',
    sort: 2,
  },
  {
    id: 'BCH',
    symbol: 'BCH',
    name: 'BitcoinCash',
    algorithm: 'SHA-256',
    difficulty: 442_096_961_003.08,
    blockReward: 3.125,
    exchangeRateUsdt: 0.0033007800114148,
    netHash: 3_068_714_292_056_135_399,
    stepen: '2v32',
    dualCoin: false,
    iconUrl:
      'https://images-production.whattomine.com/rk8fx8bo7fyo77vlgwp5wdrebpj3',
    sort: 3,
  },
  {
    id: 'BTC',
    symbol: 'BTC',
    name: 'Bitcoin',
    algorithm: 'SHA-256',
    difficulty: 1.2623150712187e14,
    blockReward: 3.1421529371429,
    exchangeRateUsdt: 63_076,
    netHash: 1.0152812636952e21,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Bitcoin(BTC).png',
    sort: 4,
  },
  {
    id: 'CKB',
    symbol: 'CKB',
    name: 'Nervos',
    algorithm: 'Eaglesong',
    difficulty: 6.7195019787871e17,
    blockReward: 559.97516482276,
    exchangeRateUsdt: 1.2951043185998e-8,
    netHash: 64_406_732_763_528_918,
    stepen: '0',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Nervos(CKB).png',
    sort: 5,
  },
  {
    id: 'DASH',
    symbol: 'DASH',
    name: 'Dash',
    algorithm: 'x11',
    difficulty: 98_206_158.278425,
    blockReward: 0.44255625454861,
    exchangeRateUsdt: 0.00049575115733401,
    netHash: 3_616_151_875_246_601,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Dash(DASH).png',
    sort: 6,
  },
  {
    id: 'DOGE',
    symbol: 'DOGE',
    name: 'DogeCoin',
    algorithm: 'Scrypt',
    difficulty: 37_871_611.312445,
    blockReward: 10_000,
    exchangeRateUsdt: 1.107597184349e-6,
    netHash: 3_325_867_668_080_319,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Dogecoin(DOGE).png',
    sort: 7,
  },
  {
    id: 'ETC',
    symbol: 'ETC',
    name: 'Ethereum Classic',
    algorithm: 'Etchash',
    difficulty: 2.3140224238096e15,
    blockReward: 1.589248,
    exchangeRateUsdt: 0.00010504787874945,
    netHash: 161_343_569_513_473,
    stepen: '0',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/ETC.png',
    sort: 8,
  },
  {
    id: 'GRS',
    symbol: 'GRS',
    name: 'GroestlCoin',
    algorithm: 'Groestl',
    difficulty: 67_895.990930448,
    blockReward: 5,
    exchangeRateUsdt: 0,
    netHash: 4_071_649_746_854,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/GroestlCoin(GRS).png',
    sort: 9,
  },
  {
    id: 'HNS',
    symbol: 'HNS',
    name: 'Handshake',
    algorithm: 'Handshake',
    difficulty: 102_546_975.62992,
    blockReward: 500,
    exchangeRateUsdt: 2.6895e-8,
    netHash: 715_004_815_040_444,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Handshake(HNS).png',
    sort: 10,
  },
  {
    id: 'KAS',
    symbol: 'KAS',
    name: 'Kaspa',
    algorithm: 'kHeavyHash',
    difficulty: 7_778_404.9250726,
    blockReward: 2.4125906864,
    exchangeRateUsdt: 4.2913310926501e-7,
    netHash: 342_317_281_824_745_345,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Kaspa(KAS).png',
    sort: 11,
  },
  {
    id: 'KDA',
    symbol: 'KDA',
    name: 'Kadena',
    algorithm: 'Blake2S',
    difficulty: 2.0994723206662e16,
    blockReward: 0.9119135,
    exchangeRateUsdt: 6.6253408586467e-8,
    netHash: 13_977_536_855_422_530,
    stepen: '0',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Kadena(KDA).png',
    sort: 12,
  },
  {
    id: 'LTC',
    symbol: 'LTC',
    name: 'LiteCoin',
    algorithm: 'Scrypt',
    difficulty: 86_797_210.649434,
    blockReward: 6.25,
    exchangeRateUsdt: 0.00070264442894286,
    netHash: 2_329_944_882_020_890,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Litecoin(LTC).png',
    sort: 13,
  },
  {
    id: 'LTC+DOG',
    symbol: 'LTC+DOG',
    name: 'LTC + DOGE',
    algorithm: 'Scrypt',
    difficulty: 0,
    blockReward: 0,
    exchangeRateUsdt: 0,
    netHash: 0,
    stepen: '2v32',
    dualCoin: true,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/ltc_doge.png',
    sort: 14,
  },
  {
    id: 'MONA',
    symbol: 'MONA',
    name: 'Monacoin',
    algorithm: 'Lyra2REv2',
    difficulty: 281_028.72278596,
    blockReward: 6.25,
    exchangeRateUsdt: 0,
    netHash: 9_901_838_316_784,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/mona.png',
    sort: 15,
  },
  {
    id: 'ZEC',
    symbol: 'ZEC',
    name: 'Zcash',
    algorithm: 'Equihash',
    difficulty: 208_551_075.536,
    blockReward: 1.25,
    exchangeRateUsdt: 0.0073733274145475,
    netHash: 23_881_238_049,
    stepen: '2v13',
    dualCoin: false,
    iconUrl: 'https://top-mining.ru/wp-content/api/coin/Zcash(ZEC).png',
    sort: 16,
  },
]

export function getDefaultCalculatorCoin(): CalculatorCoin {
  return (
    CALCULATOR_COINS.find((coin) => coin.id === 'BTC') || CALCULATOR_COINS[0]!
  )
}

export function formatCoinButtonLabel(coin: CalculatorCoin): string {
  if (coin.dualCoin) {
    return coin.name
  }

  return `${coin.symbol} (${coin.name})`
}

export function formatCoinOptionLabel(coin: CalculatorCoin): string {
  if (coin.dualCoin) {
    return `${coin.name} | ${coin.algorithm}`
  }

  return `${coin.symbol} (${coin.name}) | ${coin.algorithm}`
}

export function filterCalculatorCoins(
  coins: CalculatorCoin[],
  query: string,
): CalculatorCoin[] {
  const normalized = query.trim().toLowerCase()

  if (!normalized) {
    return coins
  }

  return coins.filter((coin) => {
    const haystack = [
      coin.symbol,
      coin.name,
      coin.algorithm,
      formatCoinOptionLabel(coin),
    ]
      .join(' ')
      .toLowerCase()

    return haystack.includes(normalized)
  })
}

export function formatMoneyAmount(value: number): string {
  return value.toLocaleString('ru-RU', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })
}
