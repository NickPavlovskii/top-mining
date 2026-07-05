import type { CatalogOrganizationDetail } from '~/types/catalog-organization-detail'

export const GEOMETRIA_ORGANIZATION: CatalogOrganizationDetail = {
  id: 2,
  slug: 'geometria',
  name: 'Geometria',
  categorySlug: 'asic-sales',
  categoryName: 'Продажа ASIC',
  tagline: 'Продажа ASIC, хостинг, сервисный центр',
  pageTitle:
    'GEOMETRIA (ГЕОМЕТРИЯ): продажа асиков, хостинг, сервисный центр, услуги, отзывы',
  logoUrl: '/images/catalog/geometria.png',
  aboutHtml: `
<p>Компания Geometria – технологическая компания белого майнинга в РФ, а также ведущий эксперт в области промышленного майнинга криптовалют с фокусом на аналитику, точные данные и глубокое понимание рынка.</p>
<p>Geometria предоставляет полный цикл майнинг-услуг: оборудование, финансовые модели, строительство дата-центров, доставка, консультации по налогам и юридическим вопросам. Мы знаем, какие изменения ждут майнинговую отрасль, и подстраиваем майнинг-бизнес клиентов до их официальных изменений.</p>
<p>Оборудование только с НДС, площадки и контейнеры на балансе компании, продажа криптовалюты по безналу, приведение клиентского бизнеса в соответствие с законами РФ.</p>
<p><strong>Особенности хостинга Geometria</strong></p>
<p>Аккредитованный дата-центр, мониторинг оборудования 24/7, срок реагирования 15 мин, усиленная охрана Росгвардии, возможность работать на полном аптайме и с управлением спроса, полностью легальная площадка с прозрачным оформлением не только для клиентов, но и для проверяющих органов.</p>
`.trim(),
  rating: 0,
  reviewCount: 0,
  hasPublicRating: false,
  foundedYear: 2024,
  website: 'https://geometria.io/',
  email: 'info@geometria.io',
  workHours: 'пн-вс с 9:00 до 20:00 по Мск',
  verification: {
    contracts: true,
    legalEntity: true,
  },
  addresses: [
    {
      city: 'Москва',
      addressLine:
        'г. Москва, вн. тер. г. муниципальный округ Пресненский, Пресненская набережная, д. 12, этаж 64, пом/офис 204/1',
    },
  ],
  gallery: [],
  equipmentSales: {
    equipmentType: 'ASIC-майнеры',
    equipmentCondition: 'Новое',
    salesVolume: 'ОПТ; Розница от 5 шт.',
    availability: 'В наличии и под заказ',
    extras: [
      'Напрямую от производителей',
      'Официальный импорт с НДС',
      'При покупке у нас — 0 ₽ за размещение',
      'с НДС и ГТД',
      'Бесплатная установка',
    ],
  },
  miningHotel: {
    pricePerKwhFrom: 6.2,
    pricePerKwhLabel: 'от 6.2р',
    sitesCount: 1,
    totalCapacityMw: 10,
    siteCities:
      'Нижегородская область, г. Дзержинск, 20 км от аэропорта Нижнего Новгорода',
    minDevicesLabel: '5',
    energyType: 'Электросети',
  },
  paymentTerms: {
    paymentMethods: ['Безналичная'],
    paymentFormats: ['В кредит'],
    extraTerms: ['В кредит'],
    contractForms: ['Безналичная'],
  },
  legalProfile: {
    legalName: 'Общество с ограниченной ответственностью "ВЭБ3.0" (ООО "ВЭБ3.0")',
    primaryActivity:
      'Разработка компьютерного программного обеспечения (62.01)',
    ogrn: '1227700376760',
    inn: '9703094672',
    registeredAt: '2022-06-28',
    legalAddress:
      '123112, город Москва, Пресненская наб, д. 12, этаж 64 пом/офис 204/1',
    authorizedCapital: '10000',
    reliability: 'ВЫСОКАЯ',
    defendantCases: 'Нет данных',
    revenue: 'За 2024 год: 76 млн руб.',
    profit: 'За 2024 год: 45 тыс. руб.',
    taxDebt: 'Нет данных',
    inSanctionsLists: 'Нет данных',
    sanctionsRestrictions: 'Нет данных',
  },
  cardTags: [
    'Счет на оплату: С НДС',
    'Состояние: Новое',
    'Объем продаж: ОПТ; Розница от 5 шт.',
    'Наличие: В наличии и под заказ',
  ],
  cardFeatures: [
    'Напрямую от производителей',
    'Официальный импорт с НДС',
    'При покупке у нас — 0 ₽ за размещение',
  ],
}

const ORGANIZATION_FALLBACKS: Record<string, CatalogOrganizationDetail> = {
  geometria: GEOMETRIA_ORGANIZATION,
}

export function getOrganizationDetailFallback(
  slug: string,
): CatalogOrganizationDetail | null {
  return ORGANIZATION_FALLBACKS[slug] ?? null
}
