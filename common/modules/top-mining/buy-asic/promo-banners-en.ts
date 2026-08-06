import { INCREASE_INCOME_PAGE_PATH } from '../pages/increase-income'
import {
  PODBOR_MINING_HOTEL_PATH,
  type PodborPromoBanner,
} from '../podbor/mining-hotel'
import hotelDecorDesktop from '~/assets/images/buy-asic/mining-hotel-bg-1.png'
import hotelDecorMobile from '~/assets/images/buy-asic/mining-hotel-bg-1-m.png'
import youMinerVisual from '~/assets/images/buy-asic/you-miner-bg.jpg'

export const BUY_ASIC_PROMO_BANNERS_EN = {
  items: [
    {
      id: 'need-hotel',
      variant: 'hotel',
      title: 'NEED A MINING HOTEL?',
      subtitle: 'We will find a mining hotel where you can host your ASIC miners 5% below market rates',
      buttonLabel: 'LEARN MORE',
      href: PODBOR_MINING_HOTEL_PATH,
      imageAlt: 'Mining hotel equipment',
      image: hotelDecorDesktop,
      imageMobile: hotelDecorMobile,
    },
    {
      id: 'you-miner',
      variant: 'you-miner',
      title: 'ARE YOU A MINER?',
      subtitle: 'Increase your income by 10%',
      buttonLabel: 'LEARN MORE',
      href: INCREASE_INCOME_PAGE_PATH,
      imageAlt: 'Miner at monitors with charts and data',
      image: youMinerVisual,
    },
  ] satisfies readonly PodborPromoBanner[],
} as const
