
export const CONTACTS_PAGE_PATH = '/contacts/' as const

export const CONTACTS_PAGE = {
  title: 'Контакты',
  breadcrumb: 'Контакты',
  seoTitle: 'Контакты — ТОП-МАЙНИНГ',
  seoDescription:
    'Телефон, Telegram, WhatsApp, email и адрес офиса TOP MINING: Каширское шоссе, 16, Москва.',
  phone: {
    label: 'Телефон:',
    value: '+7 495 492-78-99',
    copyValue: '+7 495 492-78-99',
    href: 'tel:+74954927899',
    icon: 'mdi:phone',
  },
  telegram: {
    label: 'Telegram:',
    value: '@Top_mining_consulting',
    copyValue: '@Top_mining_consulting',
    href: 'https://t.me/Top_mining_consulting',
    icon: 'mdi:telegram',
  },
  whatsapp: {
    label: 'Whatsapp:',
    value: 'ТОП МАЙНИНГ',
    copyValue: '+7 930 036-59-04',
    href: 'https://api.whatsapp.com/send/?phone=79300365904',
    icon: 'mdi:whatsapp',
  },
  email: {
    label: 'Email:',
    value: 'info@top-mining.ru',
    copyValue: 'info@top-mining.ru',
    href: 'mailto:info@top-mining.ru',
    icon: 'mdi:email-outline',
  },
  address: {
    label: 'Адрес офиса:',
    value: 'Каширское шоссе, 16, Москва',
    copyValue: 'Каширское шоссе, 16, Москва',
    icon: 'mdi:map-marker',
  },
  coordinates: {
    label: 'Координаты для навигатора:',
    value: '55.662187, 37.630499',
    copyValue: '55.662187, 37.630499',
    lat: 55.662187,
    lon: 37.630499,
  },
  metro: [
    'Каширская',
    'Варшавская',
    'Нахимовский проспект',
    'Нагатинская',
  ],
  map: {
    embedSrc:
      'https://yandex.ru/map-widget/v1/?ll=37.630499%2C55.662187&z=16&pt=37.630499,55.662187,pm2rdm',
    openHref:
      'https://yandex.ru/maps/?ll=37.630499%2C55.662187&pt=37.630499,55.662187&z=16&l=map',
    openLabel: 'Открыть в Яндекс Картах',
  },
} as const
