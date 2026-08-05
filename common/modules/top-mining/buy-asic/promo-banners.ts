import { INCREASE_INCOME_PAGE_PATH } from '../pages/increase-income'
import {
  PODBOR_MINING_HOTEL_PATH,
  type PodborPromoBanner,
} from '../podbor/mining-hotel'
import hotelDecorDesktop from '~/assets/images/buy-asic/mining-hotel-bg-1.png'
import hotelDecorMobile from '~/assets/images/buy-asic/mining-hotel-bg-1-m.png'
import youMinerVisual from '~/assets/images/buy-asic/you-miner-bg.jpg'

export const BUY_ASIC_PROMO_BANNERS = {
  items: [
    {
      id: 'need-hotel',
      variant: 'hotel',
      title: 'НУЖЕН МАЙНИНГ-ОТЕЛЬ?',
      subtitle:
        'Подберем вам майнинг-отель, где вы сможете разместить асики на 5% дешевле рыночных цен',
      buttonLabel: 'ПОДРОБНЕЕ',
      href: PODBOR_MINING_HOTEL_PATH,
      imageAlt: 'Оборудование майнинг-отеля',
      image: hotelDecorDesktop,
      imageMobile: hotelDecorMobile,
    },
    {
      id: 'you-miner',
      variant: 'you-miner',
      title: 'ВЫ МАЙНЕР?',
      subtitle: 'Увеличим ваш доход на 10%',
      buttonLabel: 'ПОДРОБНЕЕ',
      href: INCREASE_INCOME_PAGE_PATH,
      imageAlt: 'Майнер за мониторами с графиками и данными',
      image: youMinerVisual,
    },
  ] satisfies readonly PodborPromoBanner[],
} as const
