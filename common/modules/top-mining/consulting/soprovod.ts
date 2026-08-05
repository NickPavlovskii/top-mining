import buyAsicBottom from '~/assets/images/consulting/soprovod-asic-bottom.png'
import buyAsicMobile from '~/assets/images/consulting/soprovod-asic-mobile.png'
import hotelBottom from '~/assets/images/consulting/soprovod-hotel-bottom.png'
import hotelBottomCompact from '~/assets/images/consulting/soprovod-hotel-bottom-compact.png'

export type ConsultingSoprovodBenefit =
  | { type: 'lead'; text: string }
  | { type: 'item'; text: string; layout?: 'inline' | 'cont' }

export type ConsultingSoprovodCard = {
  id: string
  titleLines: [string, string]
  titleMobile: string
  subtitle: string
  mobileImage?: string
  mobileImageAlt?: string
  bottomImage: string
  bottomImageCompact?: string
  bottomImageVariant: 'asic' | 'hotel'
  benefits: ConsultingSoprovodBenefit[]
  footnote: string
  priceLabel: string
  priceValue: string
  ctaLabel: string
  ctaHref: string
  detailsLabel: string
  detailsHref: string
  variant?: 'hotel'
}

export const CONSULTING_SOPROVOD = {
  sectionTitle: 'Сопровождение / Тендер',
  cards: [
    {
      id: 'buy-asic',
      titleLines: ['Нужны', 'ASIC-МАЙНЕРЫ?'],
      titleMobile: 'Нужны ASIC-МАЙНЕРЫ?',
      subtitle:
        'Подберем вам майнинг-компанию, где вы сможете купить асики дешевле рынка',
      mobileImage: buyAsicMobile,
      mobileImageAlt: 'Нужны ASIC-МАЙНЕРЫ?',
      bottomImage: buyAsicBottom,
      bottomImageVariant: 'asic',
      benefits: [
        {
          type: 'lead',
          text: '46 компаний по продаже майнинг-оборудования, которые конкурируют за вас, предлагая самую низкую цену',
        },
        { type: 'item', text: 'Собьем цены поставщиков на 7%', layout: 'inline' },
        {
          type: 'item',
          text: 'Договоримся о минимальном тарифе на размещение',
          layout: 'cont',
        },
        {
          type: 'item',
          text: 'Сэкономим вам 100+ часов времени на подборе, договорах, поломках',
          layout: 'cont',
        },
        {
          type: 'item',
          text: 'Сбережем 5% от вложений, обезопасив вас от рисков',
          layout: 'cont',
        },
        {
          type: 'item',
          text: 'С нами ваши асики и вложения в безопасности',
          layout: 'cont',
        },
      ],
      footnote:
        'А, возможно, даже отговорим вас входить в сферу майнинга, в зависимости от рынка или ваших личных обстоятельств, сэкономив вам миллионы рублей',
      priceLabel: 'Общая стоимость:',
      priceValue: 'от 50 000 ₽',
      ctaLabel: 'Оставить заявку',
      ctaHref: '#home_contact_form',
      detailsLabel: 'Подробнее',
      detailsHref: '/asic-majnery-po-czenam-nizhe-rynka/',
    },
    {
      id: 'mining-hotel',
      variant: 'hotel',
      titleLines: ['Нужен', 'МАЙНИНГ-ОТЕЛЬ?'],
      titleMobile: 'Нужен МАЙНИНГ-ОТЕЛЬ?',
      subtitle:
        'Подберем вам майнинг-отель, где вы сможете разместить асики дешевле рыночных цен',
      bottomImage: hotelBottom,
      bottomImageCompact: hotelBottomCompact,
      bottomImageVariant: 'hotel',
      benefits: [
        {
          type: 'lead',
          text: '39 компаний по размещению майнинг-оборудования, которые конкурируют за вас, предлагая самый выгодный тариф',
        },
        { type: 'item', text: 'Мы № 1  по агрегатору майнинг-отелей', layout: 'inline' },
        { type: 'item', text: 'Разместим от 1 МВт ваших ASIC-майнеров', layout: 'cont' },
        {
          type: 'item',
          text: 'Предложим вам лучшие условия на майнинг-отель',
          layout: 'cont',
        },
      ],
      footnote:
        'А, возможно, даже отговорим вас входить в сферу майнинга, в зависимости от рынка или ваших личных обстоятельств, сэкономив вам миллионы рублей',
      priceLabel: 'Общая стоимость:',
      priceValue: 'от 50 000 ₽',
      ctaLabel: 'Оставить заявку',
      ctaHref: '#home_contact_form',
      detailsLabel: 'Подробнее',
      detailsHref: '/podbor-majning-otelya/',
    },
  ],
} as const satisfies {
  sectionTitle: string
  cards: ConsultingSoprovodCard[]
}
