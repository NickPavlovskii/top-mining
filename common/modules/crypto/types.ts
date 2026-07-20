export interface CryptoCoin {
  id: string
  symbol: string
  name: string
  image: string
  price: number
  volume: number
  change24h: number
  change7d: number
  sparkline: number[]
}

export interface BitcoinUsd {
  price: number
  change7d: number
  sparkline: number[]
  image: string
}

export interface CryptoResponse {
  source: 'coingecko' | 'fallback'
  currency: 'rub'
  updatedAt: string
  coins: CryptoCoin[]
  bitcoinUsd: BitcoinUsd
}
