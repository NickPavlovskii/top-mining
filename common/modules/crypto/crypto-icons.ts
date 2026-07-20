import bnbIcon from '~/assets/images/crypto/bnb.png'
import btcIcon from '~/assets/images/crypto/btc.png'
import ethIcon from '~/assets/images/crypto/eth.png'

const localIcons: Record<string, string> = {
  binancecoin: bnbIcon,
  bitcoin: btcIcon,
  ethereum: ethIcon,
}

export function getCryptoIcon(coinId: string, fallback = '') {
  return localIcons[coinId] ?? fallback
}

export const bitcoinIcon = btcIcon
