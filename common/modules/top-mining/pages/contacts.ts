
export const CONTACTS_PAGE_PATH = '/contacts/' as const

export const CONTACTS_PAGE = {
  title: 'Контакты',
  breadcrumb: 'Контакты',
  seoTitle: 'Контакты',
  seoDescription:
    'Телефон, Telegram, WhatsApp, email и адрес офиса TOP MINING: Каширское шоссе, 16, Москва.',
  copyLabel: 'Копировать',
  copiedLabel: 'Скопировано',
  phone: {
    label: 'Телефон:',
    value: '+7 495 492-78-99',
    copyValue: '+74954927899',
    href: 'tel:+74954927899',
    iconClass: 'phone',
    iconSrc: '/images/contacts/c-phone.png',
  },
  telegram: {
    label: 'Telegram:',
    value: '@Top_mining_consulting',
    copyValue: '@Top_mining_consulting',
    href: 'https://t.me/Top_mining_consulting',
    iconClass: 'tg',
    iconSrc: '/images/contacts/c-tg.png',
  },
  whatsapp: {
    label: 'Whatsapp:',
    value: 'ТОП МАЙНИНГ',
    copyValue: '+79300365904',
    href: 'https://api.whatsapp.com/send/?phone=79300365904',
    iconClass: 'wa',
    iconSrc: '/images/contacts/c-wa.png',
  },
  email: {
    label: 'Email:',
    value: 'info@top-mining.ru',
    copyValue: 'info@top-mining.ru',
    href: 'mailto:info@top-mining.ru',
    iconClass: 'email',
    iconSrc: '/images/contacts/c-email.png',
  },
  address: {
    label: 'Адрес офиса:',
    value: 'Каширское шоссе, 16, Москва',
    copyValue: 'Каширское шоссе, 16, Москва',
    iconClass: 'address',
    iconSrc: '/images/contacts/c-address.png',
  },
  coordinates: {
    label: 'Координаты для навигатора:',
    value: '55.662187, 37.630499',
    copyValue: '55.662187, 37.630499',
  },
  metroRows: [
    ['Каширская', 'Варшавская'],
    ['Нахимовский проспект', 'Нагатинская'],
  ],
  metroIconSrc: '/images/contacts/metro.png',
  map: {
    constructorSrc:
      'https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A99673f08d12b44da243abab0cc9cd8b4e9ca130b9c2c3cc807138fc0c5f15bfa&width=100%25&height=424&lang=ru_RU&scroll=true',
    height: 424,
  },
} as const
