export interface CoinGeckoMarketCoin {
  id: string
  symbol: string
  name: string
  image: string
  current_price: number
  total_volume: number
  price_change_percentage_24h_in_currency?: number
  price_change_percentage_7d_in_currency?: number
  sparkline_in_7d?: {
    price: number[]
  }
}
