import {
  CRYPTO_COIN_IDS,
  FALLBACK_BITCOIN_USD,
  FALLBACK_COINS,
} from '~/common/modules/crypto/fallback'
import type { CoinGeckoMarketCoin } from '~/common/modules/crypto/coingecko-types'
import type { BitcoinUsd, CryptoCoin } from '~/common/modules/crypto/types'

function normalizeCoin(coin: CoinGeckoMarketCoin): CryptoCoin {
  return {
    id: coin.id,
    symbol: coin.symbol,
    name: coin.name,
    image: coin.image,
    price: coin.current_price,
    volume: coin.total_volume,
    change24h: coin.price_change_percentage_24h_in_currency ?? 0,
    change7d: coin.price_change_percentage_7d_in_currency ?? 0,
    sparkline: coin.sparkline_in_7d?.price ?? [],
  }
}

function normalizeBitcoinUsd(coin: CoinGeckoMarketCoin): BitcoinUsd {
  return {
    price: coin.current_price,
    change7d: coin.price_change_percentage_7d_in_currency ?? 0,
    sparkline: coin.sparkline_in_7d?.price ?? [],
    image: coin.image,
  }
}

async function fetchRubCoins() {
  return $fetch<CoinGeckoMarketCoin[]>(
    'https://api.coingecko.com/api/v3/coins/markets',
    {
      query: {
        vs_currency: 'rub',
        ids: CRYPTO_COIN_IDS.join(','),
        order: 'market_cap_desc',
        per_page: CRYPTO_COIN_IDS.length,
        page: 1,
        sparkline: true,
        price_change_percentage: '24h,7d',
        locale: 'ru',
      },
      headers: { accept: 'application/json' },
    },
  )
}

async function fetchBitcoinUsd() {
  const coins = await $fetch<CoinGeckoMarketCoin[]>(
    'https://api.coingecko.com/api/v3/coins/markets',
    {
      query: {
        vs_currency: 'usd',
        ids: 'bitcoin',
        sparkline: true,
        price_change_percentage: '7d',
      },
      headers: { accept: 'application/json' },
    },
  )

  const coin = coins[0]

  if (!coin) {
    return FALLBACK_BITCOIN_USD
  }

  return normalizeBitcoinUsd(coin)
}

export default defineEventHandler(async () => {
  try {
    const [rubCoins, bitcoinUsd] = await Promise.all([
      fetchRubCoins(),
      fetchBitcoinUsd(),
    ])

    return {
      source: 'coingecko',
      currency: 'rub',
      updatedAt: new Date().toISOString(),
      coins: rubCoins.map(normalizeCoin),
      bitcoinUsd,
    }
  } catch {
    return {
      source: 'fallback',
      currency: 'rub',
      updatedAt: new Date().toISOString(),
      coins: FALLBACK_COINS,
      bitcoinUsd: FALLBACK_BITCOIN_USD,
    }
  }
})
