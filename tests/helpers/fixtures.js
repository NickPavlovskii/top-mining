/** @typedef {import('@playwright/test').Page} Page */

const now = () => new Date().toISOString()

/** @returns {import('~/common/modules/catalog').CatalogResponse} */
export function mockCatalogResponse() {
  return {
    source: 'graphql',
    updatedAt: now(),
    meta: {
      totalReviews: 42,
      subtitle: 'Тестовый каталог для E2E',
    },
    categories: [
      {
        id: 'asic-sales',
        slug: 'asic-sales',
        name: 'Продажа ASIC',
        href: '/asic-manufacturers/?category=asic-sales',
        organizations: [
          {
            id: 1,
            slug: 'test-miner',
            name: 'Test Miner',
            href: '/asic-manufacturers/test-miner/',
            logoUrl: '/images/catalog/star-24.png',
            rating: 4.8,
            reviewCount: 12,
            verification: null,
            categorySlug: 'asic-sales',
          },
        ],
      },
    ],
  }
}

/** @returns {import('~/common/modules/catalog').CatalogManufacturersResponse} */
export function mockCatalogManufacturersResponse() {
  return {
    source: 'api',
    updatedAt: now(),
    meta: {
      title: 'Производители ASIC',
      subtitle: 'E2E mock',
      totalReviews: 10,
      categorySlug: 'equipment-manufacturers',
    },
    categoryTabs: [],
    algorithmFilters: [],
    modelCountFilters: [],
    marketAgeFilters: [],
    manufacturers: [],
  }
}

/** @returns {import('~/common/modules/top-mining').CalculatorHardwareByKind} */
export function mockCalculatorHardware() {
  return {
    asic: [
      {
        name: 'Bitmain',
        models: [
          {
            id: 's21',
            slug: 'antminer-s21',
            name: 'Antminer S21',
            brand: 'Bitmain',
            algorithm: 'SHA-256',
            hashrate: 200,
            hashrateUnit: 'Th/s',
            powerW: 3500,
          },
        ],
      },
    ],
    gpu: [],
    cpu: [],
  }
}

/** @returns {import('~/common/modules/top-mining').CalculatorCoinsCatalog} */
export function mockCalculatorCoins() {
  return {
    asic: [
      {
        id: 'BTC',
        symbol: 'BTC',
        name: 'Bitcoin',
        algorithm: 'SHA-256',
        difficulty: 1e14,
        blockReward: 3.125,
        exchangeRateUsdt: 63_000,
        netHash: 1e21,
        stepen: '2v32',
        dualCoin: false,
        iconUrl: '/images/catalog/star-24.png',
        sort: 1,
      },
    ],
    gpu: [],
    gpuAlgorithms: [],
    defaultUsdtRub: 79.2,
  }
}

/** @returns {import('~/common/modules/ratings').RatingsResponse} */
export function mockRatingsResponse() {
  return {
    source: 'graphql',
    updatedAt: now(),
    cards: [
      {
        id: 'equipment',
        title: 'Техника и оборудование',
        columns: 1,
        items: [
          {
            number: '01',
            label: 'Тестовый рейтинг ASIC',
            href: '/articles/test-rating/',
          },
        ],
      },
    ],
  }
}

/** @returns {import('~/common/modules/articles').ArticlesFeedResponse} */
export function mockArticlesFeedResponse() {
  return {
    source: 'graphql',
    updatedAt: now(),
    hero: null,
    featured: [],
    list: [
      {
        id: 1,
        slug: 'test-article',
        title: 'Тестовая статья E2E',
        excerpt: 'Краткое описание для Playwright.',
        imageUrl: '/images/catalog/star-24.png',
        imageAlt: 'Тест',
        topicId: 'mining',
        readingTimeMin: 5,
        publishedAt: '2026-01-01T00:00:00.000Z',
        displayType: 'list',
        viewCount: 0,
      },
    ],
    hasMore: false,
  }
}

/** @returns {import('~/common/modules/articles').ArticlesCatalogResponse} */
export function mockArticlesCatalogResponse() {
  const feed = mockArticlesFeedResponse()
  return {
    source: 'graphql',
    updatedAt: feed.updatedAt,
    topic: 'all',
    items: feed.list,
  }
}

/** @returns {import('~/common/modules/crypto').CryptoResponse} */
export function mockCryptoResponse() {
  return {
    source: 'fallback',
    currency: 'rub',
    updatedAt: now(),
    bitcoinUsd: {
      price: 26_000,
      change7d: -1.2,
      sparkline: [25000, 25500, 26000],
      image: '/images/catalog/star-24.png',
    },
    coins: [
      {
        id: 'bitcoin',
        symbol: 'btc',
        name: 'Bitcoin',
        image: '/images/catalog/star-24.png',
        price: 26_000,
        volume: 1_000_000,
        change24h: 0.5,
        change7d: -1.2,
        sparkline: [25000, 25500, 26000],
      },
    ],
  }
}

/** @returns {unknown} */
export function mockPodborOffers() {
  return {
    source: 'graphql',
    updatedAt: now(),
    offers: [],
  }
}

/** @returns {import('~/common/modules/catalog').CatalogOrganizationDetailResponse} */
export function mockOrganizationDetailResponse() {
  return {
    source: 'graphql',
    updatedAt: now(),
    organization: {
      id: 1,
      slug: 'test-miner',
      name: 'Test Miner',
      categorySlug: 'asic-sales',
      categoryName: 'Продажа ASIC',
      tagline: 'E2E тестовая организация',
      pageTitle: 'Test Miner',
      logoUrl: '/images/catalog/star-24.png',
      detailLogoUrl: null,
      aboutHtml: '<p>Описание организации для E2E.</p>',
      rating: 4.8,
      reviewCount: 12,
      hasPublicRating: true,
      foundedYear: 2020,
      website: 'https://example.com',
      phone: '+7 495 000-00-00',
      email: 'info@test-miner.example',
      workHours: '10:00–19:00',
      verification: {
        contracts: true,
        legalEntity: true,
        miningRegistry: false,
      },
      addresses: [],
      gallery: [],
      equipmentSales: null,
      miningHotel: null,
      miningPool: null,
      cryptoExchange: null,
      cryptoWallet: null,
      paymentTerms: null,
      legalProfile: null,
      articleHref: null,
      showGallery: false,
      showArticleBlock: false,
      cardTags: [],
      cardFeatures: [],
    },
  }
}

/** @returns {unknown} */
export function mockOrganizationReviewsResponse() {
  return {
    source: 'graphql',
    updatedAt: now(),
    reviews: [],
    total: 0,
  }
}

/** @returns {import('~/common/modules/articles').ArticleResponse} */
export function mockArticleDetailResponse() {
  const preview = mockArticlesFeedResponse().list[0]
  return {
    source: 'graphql',
    updatedAt: now(),
    ...preview,
    content: '<p>Тело тестовой статьи для Playwright E2E.</p>',
    related: [],
  }
}
