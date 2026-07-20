import { CATALOG_CATEGORY_DEFINITIONS } from '../catalog/catalog-categories'

export interface TopMiningNavColumn {
  title: string
  slug: 'catalog' | 'ratings' | 'calculator' | 'articles' | 'consulting'
  icon: string
  mobileVisible: number
  phoneMenuVisible?: number
  mobileSingleColumn?: boolean
  items: string[]
}

export const TOP_MINING_NAV_COLUMNS: TopMiningNavColumn[] = [
  {
    title: 'Каталог организаций',
    slug: 'catalog',
    icon: 'mdi:office-building-outline',
    mobileVisible: CATALOG_CATEGORY_DEFINITIONS.length,
    phoneMenuVisible: 2,
    items: CATALOG_CATEGORY_DEFINITIONS.map((category) => category.label),
  },
  {
    title: 'Рейтинги в майнинге',
    slug: 'ratings',
    icon: 'mdi:trophy-outline',
    mobileVisible: 4,
    phoneMenuVisible: 2,
    items: [
      'Техника и оборудование',
      'Продажи и услуги',
      'Инструменты и сервисы',
      'Криптовалюты и токены',
    ],
  },
  {
    title: 'Майнинг-калькулятор',
    slug: 'calculator',
    icon: 'mdi:calculator-variant-outline',
    mobileVisible: 6,
    items: [
      'ASIC-майнеры',
      'GPU',
      'CPU',
      'Конвертер хешрейта',
      'Калькулятор в Telegram',
      'Рейтинги',
    ],
  },
  {
    title: 'Статьи в майнинге',
    slug: 'articles',
    icon: 'mdi:file-document-outline',
    mobileVisible: 5,
    phoneMenuVisible: 3,
    items: [
      'Майнинг',
      'Инструменты и сервисы',
      'Инвестиции',
      'Новичкам',
      'Разное',
    ],
  },
  {
    title: 'Бизнес-consulting',
    slug: 'consulting',
    icon: 'mdi:currency-rub',
    mobileVisible: 4,
    mobileSingleColumn: true,
    items: [
      'Подбираем майнинг-отель',
      'Помогаем купить ASIC выгодно',
      'Увеличим ваш доход',
      'Строительство дата-центров',
    ],
  },
]

export function getMobileNavItemGroups(
  items: readonly string[],
  singleColumn = false,
): string[][] {
  if (singleColumn) {
    return [items.slice()]
  }

  const groups: string[][] = []

  for (let index = 0; index < items.length; index += 2) {
    groups.push(items.slice(index, index + 2))
  }

  return groups
}

export function getMobileNavItemColumns(
  items: readonly string[],
  singleColumn = false,
): string[][] {
  if (singleColumn) {
    return [items.slice()]
  }

  const leftColumn: string[] = []
  const rightColumn: string[] = []

  items.forEach((item, index) => {
    if (index % 2 === 0) {
      leftColumn.push(item)
      return
    }

    rightColumn.push(item)
  })

  return [leftColumn, rightColumn]
}

export function getVisiblePhoneMenuItems(
  items: readonly string[],
  visibleCount: number | undefined,
  expanded: boolean,
): string[] {
  if (
    visibleCount === undefined
    || expanded
    || items.length <= visibleCount
  ) {
    return items.slice()
  }

  return items.slice(0, visibleCount)
}

export function hasPhoneMenuMoreItems(
  items: readonly string[],
  visibleCount: number | undefined,
): boolean {
  return visibleCount !== undefined && items.length > visibleCount
}

export function isNavHeadingLink(slug: TopMiningNavColumn['slug']): boolean {
  return slug === 'catalog' || slug === 'ratings' || slug === 'articles'
}

export function getCalculatorNavItemIcon(item: string): string {
  if (item === 'Конвертер хешрейта') {
    return 'mdi:sync'
  }

  if (item === 'Рейтинги') {
    return 'mdi:chart-bar'
  }

  return 'mdi:view-grid-outline'
}
