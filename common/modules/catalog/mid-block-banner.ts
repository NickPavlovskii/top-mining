export const MINING_HOTELS_CATEGORY_ID = 'mining-hotels'
export const ASIC_SALES_CATEGORY_ID = 'asic-sales'

export const CATALOG_MID_BLOCK_BANNER_INTERVAL = 4

export type CatalogMidBlockBannerVariant = 'mining-hotels' | 'asic-sales'

export interface CatalogMidBlockBannerConfig {
  title: string
  subtitle: string
  subtitleAccent: string
  href: string
  benefits: readonly string[]
}

export const CATALOG_MID_BLOCK_BANNER_CONFIG: Record<
  CatalogMidBlockBannerVariant,
  CatalogMidBlockBannerConfig
> = {
  'mining-hotels': {
    title: 'НУЖЕН МАЙНИНГ-ОТЕЛЬ?',
    subtitle: 'Подберем вам майнинг-отель, где вы сможете разместить асики',
    subtitleAccent: 'на 5% дешевле рынка',
    href: 'https://top-mining.ru/podbor-majning-otelya/',
    benefits: [
      'Договоримся\nо минимальном тарифе\nна размещение',
      'Сэкономим вам\n100+ часов на подборе, договорах, поломках',
      'Разместим\nот 1 МВт ваших ASIC-майнеров',
    ],
  },
  'asic-sales': {
    title: 'ХОТИТЕ КУПИТЬ ASIC-МАЙНЕРЫ?',
    subtitle:
      'Подберем вам майнинг-компанию, где вы сможете купить асики',
    subtitleAccent: 'на 10% дешевле рынка',
    href: 'https://top-mining.ru/asic-majnery-po-czenam-nizhe-rynka/',
    benefits: [
      'Собьем цены поставщиков\nна асики на 7%',
      'Сэкономим вам 100+ часов\nна подборе, договорах, поломках',
      'Договоримся\nо минимальном тарифе\nна размещение',
    ],
  },
}

export type CatalogGridItem<T> =
  | { type: 'card'; key: string; data: T }
  | { type: 'banner'; key: string; variant: CatalogMidBlockBannerVariant }

export function getCatalogMidBlockBannerVariant(
  categorySlug: string,
): CatalogMidBlockBannerVariant | null {
  if (categorySlug === MINING_HOTELS_CATEGORY_ID) {
    return 'mining-hotels'
  }

  if (categorySlug === ASIC_SALES_CATEGORY_ID) {
    return 'asic-sales'
  }

  return null
}

export function buildCatalogGridWithBanners<T>(
  items: readonly T[],
  getKey: (item: T) => string,
  options?: {
    interval?: number
    variant?: CatalogMidBlockBannerVariant | null
  },
): CatalogGridItem<T>[] {
  const interval = options?.interval ?? CATALOG_MID_BLOCK_BANNER_INTERVAL
  const variant = options?.variant ?? null
  const result: CatalogGridItem<T>[] = []

  items.forEach((item, index) => {
    result.push({
      type: 'card',
      key: getKey(item),
      data: item,
    })

    if (variant && index + 1 === interval) {
      result.push({
        type: 'banner',
        key: `catalog-mid-block-${variant}`,
        variant,
      })
    }
  })

  return result
}
