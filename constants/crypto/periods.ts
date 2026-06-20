export const CRYPTO_PRICE_PERIODS = [
  { label: '24 ч', value: '24h' },
  { label: '7 д', value: '7d' },
] as const

export type CryptoPricePeriodValue =
  (typeof CRYPTO_PRICE_PERIODS)[number]['value']

export const DEFAULT_CRYPTO_PRICE_PERIOD: CryptoPricePeriodValue = '24h'
