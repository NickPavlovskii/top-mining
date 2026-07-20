import type { BitcoinUsd, CryptoCoin } from './types'

export const CRYPTO_COIN_IDS = [
  'binancecoin',
  'bitcoin',
  'ethereum',
  'pax-gold',
  'binaryx',
  'as-roma-fan-token',
  'solana',
] as const

export const FALLBACK_BITCOIN_USD: BitcoinUsd = {
  price: 26159,
  change7d: -1.59,
  sparkline: [
    24800, 25100, 24900, 25300, 25000, 25500, 25400, 25700, 26000, 25800,
    26200, 26500, 26300, 26600, 26400, 26550, 26800, 26650, 26900, 26159,
  ],
  image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
}

export const FALLBACK_COINS: CryptoCoin[] = [
  {
    id: 'binancecoin',
    symbol: 'bnb',
    name: 'BNB',
    image: 'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png',
    price: 48810,
    volume: 83500000000,
    change24h: -6.9,
    change7d: -4.2,
    sparkline: [],
  },
  {
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    price: 5710000,
    volume: 2540000000000,
    change24h: 4.43,
    change7d: -1.59,
    sparkline: [],
  },
  {
    id: 'ethereum',
    symbol: 'eth',
    name: 'Ethereum',
    image: 'https://assets.coingecko.com/coins/images/279/large/ethereum.png',
    price: 269440,
    volume: 1390000000000,
    change24h: -7.17,
    change7d: -7.17,
    sparkline: [],
  },
  {
    id: 'pax-gold',
    symbol: 'paxg',
    name: 'PAX Gold',
    image: 'https://assets.coingecko.com/coins/images/9519/large/paxgold.png',
    price: 248690,
    volume: 18000000000,
    change24h: 15.98,
    change7d: 12.2,
    sparkline: [],
  },
  {
    id: 'binaryx',
    symbol: 'bnx',
    name: 'BinaryX',
    image:
      'https://assets.coingecko.com/coins/images/18095/large/BinaryX-RGB-01_%282%29.png',
    price: 58.71,
    volume: 7400000000,
    change24h: 6.71,
    change7d: 8.4,
    sparkline: [],
  },
  {
    id: 'as-roma-fan-token',
    symbol: 'asr',
    name: 'AS Roma Fan Token',
    image:
      'https://assets.coingecko.com/coins/images/11688/large/as-roma-fan-token.png',
    price: 394.88,
    volume: 1300000000,
    change24h: 2.63,
    change7d: 1.8,
    sparkline: [],
  },
  {
    id: 'solana',
    symbol: 'sol',
    name: 'Solana',
    image: 'https://assets.coingecko.com/coins/images/4128/large/solana.png',
    price: 11790,
    volume: 610000000000,
    change24h: -15.74,
    change7d: -9.5,
    sparkline: [],
  },
]
