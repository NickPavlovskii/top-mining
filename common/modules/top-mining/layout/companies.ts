import antpoolLogo from '~/assets/images/top-mining/companies/antpool.png'
import binanceLogo from '~/assets/images/top-mining/companies/binance.png'
import bixclusterLogo from '~/assets/images/top-mining/companies/bixcluster.png'
import gisLogo from '~/assets/images/top-mining/companies/gis.png'
import ibmmLogo from '~/assets/images/top-mining/companies/ibmm.png'
import promminerLogo from '~/assets/images/top-mining/companies/promminer.png'

export interface TopMiningCompany {
  name: string
  logo: string
  rate: string
  reviews: string
}

export const TOP_MINING_COMPANIES: TopMiningCompany[] = [
  { name: 'GIS', logo: gisLogo, rate: '5', reviews: '97' },
  { name: 'promminer', logo: promminerLogo, rate: '4.8', reviews: '189' },
  { name: 'IBMM', logo: ibmmLogo, rate: '5', reviews: '409' },
  { name: 'BINANCE', logo: binanceLogo, rate: '4.8', reviews: '68' },
  { name: 'BixCluster', logo: bixclusterLogo, rate: '4.8', reviews: '68' },
  { name: 'ANTPOOL', logo: antpoolLogo, rate: '4.8', reviews: '68' },
]
