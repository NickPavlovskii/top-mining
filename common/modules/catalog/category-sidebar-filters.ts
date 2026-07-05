import type { CatalogOrganization } from '~/types/catalog'
import type {
  CatalogSidebarFilterGroup,
  CatalogSidebarFilterOption,
} from '~/types/catalog-category-filters'
import { getOrganizationMarketAge } from './organization-filters'

const MARKET_AGE_FILTER_MAP: Record<string, string> = {
  'bolshe-3-let': 'over-3y',
  'do-goda': 'under-1y',
  'ot-1-do-3-let': '1-to-3y',
}

const EXCHANGE_FEATURE_MATCHERS: Record<string, (org: CatalogOrganization) => boolean> = {
  'vnebirzhevoj-trejding': (org) => hasFeature(org, 'otc', 'внебирж'),
  'konvertacziya-kriptovalyut': (org) => hasFeature(org, 'конверт'),
  'kriptozajmy': (org) => hasFeature(org, 'займ'),
  'marzhinalnaya-torgovlya': (org) => hasFeature(org, 'маржин'),
  'pokupka-prodazha-nft': (org) => hasFeature(org, 'nft'),
  'stejking-eth': (org) => hasFeature(org, 'стейкинг', 'staking'),
  'torgovlya-fyuchersami': (org) => hasFeature(org, 'дериват', 'фьюч'),
}

const WALLET_FEATURE_MATCHERS: Record<string, (org: CatalogOrganization) => boolean> = {
  'pc-browser': (org) => hasFeature(org, 'браузер', 'web', 'desktop'),
  'mobile-app': (org) => hasFeature(org, 'мобильн', 'mobile', 'app'),
  'nft-yes': (org) => hasFeature(org, 'nft'),
  'nft-no': (org) => !hasFeature(org, 'nft'),
  'fee-included': (org) => hasFeature(org, 'комисс'),
  'fee-user': (org) => hasFeature(org, 'комисс', 'сеть'),
}

function hasFeature(org: CatalogOrganization, ...needles: string[]) {
  const haystack = [
    ...(org.cardFeatures ?? []),
    ...(org.cardTags ?? []),
  ].join(' ').toLowerCase()

  return needles.some((needle) => haystack.includes(needle.toLowerCase()))
}

function numericOptions(prefix: string, values: number[]): CatalogSidebarFilterOption[] {
  return values.map((value) => ({
    id: `${prefix}${value}`,
    label: String(value),
  }))
}

function exchangeNestedFees(
  prefix: string,
  title: string,
  values: string[],
): CatalogSidebarFilterOption {
  return {
    id: prefix,
    label: title,
    children: values.map((value) => ({
      id: `${prefix}-${value.replace(',', '').replace('%', 'pct')}`,
      label: value,
    })),
  }
}

export const CRYPTO_EXCHANGE_SIDEBAR_FILTERS: CatalogSidebarFilterGroup[] = [
  {
    id: 'derivativy',
    title: 'Биржи деривативов',
    searchable: true,
    options: [
      exchangeNestedFees('maker-fee', 'Комиссия мейкера', [
        '0%', '0,01%', '0,02%', '0,04%', '0,06%',
      ]),
      exchangeNestedFees('taker-fee', 'Комиссия тейкера', [
        '0%', '0,01%', '0,02%', '0,04%', '0,06%',
      ]),
      {
        id: 'deriv-markets',
        label: 'Рынки деривативов',
        children: [
          ...numericOptions('rderiv', [100, 200, 500, 1000, 2000, 3000]),
          { id: 'rderiv-menee-100', label: 'менее 100' },
          { id: 'rderiv-bolee3000', label: 'более 3000' },
        ],
      },
    ],
  },
  {
    id: 'dopolnitelnye-funkczii',
    title: 'Дополнительные функции',
    searchable: true,
    options: [
      { id: 'vnebirzhevoj-trejding', label: 'Внебиржевой трейдинг' },
      { id: 'konvertacziya-kriptovalyut', label: 'Конвертация криптовалют' },
      { id: 'kriptozajmy', label: 'Криптозаймы' },
      { id: 'marzhinalnaya-torgovlya', label: 'Маржинальная торговля' },
      { id: 'pokupka-prodazha-nft', label: 'Покупка/продажа NFT' },
      { id: 'stejking-eth', label: 'Стейкинг ETH' },
      { id: 'torgovlya-fyuchersami', label: 'Торговля фьючерсами' },
    ],
  },
  {
    id: 'kolichestvo-monet',
    title: 'Количество монет',
    searchable: true,
    options: numericOptions('kkm', [100, 200, 300, 500, 700, 1000, 1500, 2000]),
  },
  {
    id: 'chislo-torgovyh-par',
    title: 'Количество торговых пар',
    searchable: true,
    options: [
      ...numericOptions('kkt', [100, 200, 500, 1000, 1500, 2000]),
      { id: 'kkt-bolee2000', label: 'Более 2000' },
    ],
  },
  {
    id: 'yurisdikcziya',
    title: 'Юрисдикция',
    searchable: true,
    options: [
      { id: 'virginskie-ostrova', label: 'Виргинские острова' },
      { id: 'gongkong', label: 'Гонконг' },
      { id: 'kajmanovy-ostrova', label: 'Каймановы острова' },
      { id: 'ssha', label: 'США' },
      { id: 'sejshelskie-ostrova', label: 'Сейшельские острова' },
      { id: 'singapur', label: 'Сингапур' },
    ],
  },
  {
    id: 'harakteristiki-spot',
    title: 'Spot биржи',
    searchable: true,
    options: [
      {
        id: 'spot-markets',
        label: 'SPOT Рынки',
        children: [
          ...numericOptions('spot', [100, 200, 500, 1000, 2000, 3000]),
          { id: 'spot-bolee3000', label: 'более 3000' },
          { id: 'spot-menee100', label: 'менее 100' },
        ],
      },
      {
        id: 'liquidity',
        label: 'Коэффициент ликвидности',
        children: [
          ...numericOptions('klk', [100, 200, 300, 500, 700, 900, 1000]),
          { id: 'klk-bolee1000', label: 'более 1000' },
          { id: 'klk-menee100', label: 'менее 100' },
        ],
      },
      {
        id: 'currency-support',
        label: 'Поддержка валют',
        children: [
          { id: 'eur-podderzhka-valyut', label: 'EUR' },
          { id: 'rub-podderzhka-valyut', label: 'RUB' },
          { id: 'usd-podderzhka-valyut', label: 'USD' },
        ],
      },
    ],
  },
  {
    id: 'kompaniya-na-rynke',
    title: 'Компания на рынке',
    options: [
      { id: 'bolshe-3-let', label: 'Больше 3 лет' },
      { id: 'do-goda', label: 'До 1 года' },
      { id: 'ot-1-do-3-let', label: 'От 1 до 3 лет' },
    ],
  },
]

export const CRYPTO_WALLET_SIDEBAR_FILTERS: CatalogSidebarFilterGroup[] = [
  {
    id: 'platforma',
    title: 'Платформа',
    options: [
      { id: 'pc-browser', label: 'PC Browser' },
      { id: 'mobile-app', label: 'Mobile App' },
    ],
  },
  {
    id: 'nft-support',
    title: 'Поддержка NFT',
    options: [
      { id: 'nft-yes', label: 'Да' },
      { id: 'nft-no', label: 'Нет' },
    ],
  },
  {
    id: 'coin-support',
    title: 'Поддержка монет',
    searchable: true,
    options: [
      { id: 'coin-arbitrum', label: 'Arbitrum One' },
      { id: 'coin-aurora', label: 'Aurora Network' },
      { id: 'coin-avalanche', label: 'Avalanche' },
      { id: 'coin-btc', label: 'Bitcoin' },
      { id: 'coin-bch', label: 'Bitcoin Cash' },
      { id: 'coin-eth', label: 'Ethereum' },
      { id: 'coin-sol', label: 'Solana' },
      { id: 'coin-polygon', label: 'Polygon' },
    ],
  },
  {
    id: 'fee-calculation',
    title: 'Расчет комиссии',
    options: [
      { id: 'fee-included', label: 'Комиссия включена в транзакцию' },
      { id: 'fee-user', label: 'Комиссия оплачивается пользователем' },
    ],
  },
  {
    id: 'kompaniya-na-rynke',
    title: 'Компания на рынке',
    options: [
      { id: 'bolshe-3-let', label: 'Больше 3 лет' },
      { id: 'do-goda', label: 'До 1 года' },
      { id: 'ot-1-do-3-let', label: 'От 1 до 3 лет' },
    ],
  },
]

export function getCategorySidebarFilters(
  categorySlug: string,
): CatalogSidebarFilterGroup[] {
  switch (categorySlug) {
    case 'crypto-exchanges':
      return CRYPTO_EXCHANGE_SIDEBAR_FILTERS
    case 'crypto-wallets':
      return CRYPTO_WALLET_SIDEBAR_FILTERS
    default:
      return []
  }
}

export function flattenSidebarFilterOptions(
  options: CatalogSidebarFilterOption[],
): CatalogSidebarFilterOption[] {
  return options.flatMap((option) =>
    option.children?.length
      ? [option, ...flattenSidebarFilterOptions(option.children)]
      : [option],
  )
}

function matchesLiquidityFilter(org: CatalogOrganization, filterId: string) {
  const tag = org.cardTags?.find((item) => item.includes('ликвидности'))
  if (!tag) {
    return false
  }

  const match = tag.match(/(\d+)/)
  if (!match) {
    return false
  }

  const value = Number(match[1])

  if (filterId === 'klk-menee100') {
    return value < 100
  }

  if (filterId === 'klk-bolee1000') {
    return value > 1000
  }

  const threshold = Number(filterId.replace('klk', ''))
  return Number.isFinite(threshold) && value >= threshold
}

function matchesCurrencyFilter(org: CatalogOrganization, filterId: string) {
  const features = (org.cardFeatures ?? []).join(' ').toLowerCase()

  if (filterId === 'rub-podderzhka-valyut') {
    return features.includes('rub')
  }

  if (filterId === 'usd-podderzhka-valyut') {
    return features.includes('usd')
  }

  if (filterId === 'eur-podderzhka-valyut') {
    return features.includes('eur')
  }

  return false
}

function matchesCoinFilter(org: CatalogOrganization, filterId: string) {
  const coinsTag = org.cardTags?.find((item) => item.startsWith('Добываемые монеты:'))
  if (!coinsTag) {
    return false
  }

  const coinMap: Record<string, string[]> = {
    'coin-arbitrum': ['arb'],
    'coin-aurora': ['aurora'],
    'coin-avalanche': ['avax'],
    'coin-btc': ['btc'],
    'coin-bch': ['bch'],
    'coin-eth': ['eth'],
    'coin-sol': ['sol'],
    'coin-polygon': ['matic', 'polygon'],
  }

  const needles = coinMap[filterId]
  if (!needles) {
    return false
  }

  const haystack = coinsTag.toLowerCase()
  return needles.some((needle) => haystack.includes(needle))
}

export function matchesCategorySidebarFilter(
  org: CatalogOrganization,
  filterId: string,
): boolean {
  const marketAgeId = MARKET_AGE_FILTER_MAP[filterId]
  if (marketAgeId) {
    return getOrganizationMarketAge(org.foundedYear) === marketAgeId
  }

  if (EXCHANGE_FEATURE_MATCHERS[filterId]) {
    return EXCHANGE_FEATURE_MATCHERS[filterId](org)
  }

  if (WALLET_FEATURE_MATCHERS[filterId]) {
    return WALLET_FEATURE_MATCHERS[filterId](org)
  }

  if (filterId.startsWith('klk')) {
    return matchesLiquidityFilter(org, filterId)
  }

  if (filterId.endsWith('podderzhka-valyut')) {
    return matchesCurrencyFilter(org, filterId)
  }

  if (filterId.startsWith('coin-')) {
    return matchesCoinFilter(org, filterId)
  }

  if (filterId === 'spot-menee100' || filterId.startsWith('spot')) {
    return hasFeature(org, 'спот', 'spot')
  }

  return true
}

export function matchesCategorySidebarFilters(
  org: CatalogOrganization,
  activeFilterIds: string[],
): boolean {
  if (!activeFilterIds.length) {
    return true
  }

  return activeFilterIds.every((filterId) =>
    matchesCategorySidebarFilter(org, filterId),
  )
}
