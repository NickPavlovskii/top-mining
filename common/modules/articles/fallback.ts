import type {
  Article,
  ArticlePreview,
  ArticlesFeedResponse,
} from '~/types/articles'
import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/articles-section'

const SAMPLE_CONTENT = `Материал подготовлен редакцией TOP MINING. Здесь будет полный текст новости с разбором темы, практическими рекомендациями и ссылками на инструменты платформы.`

type FallbackItem = ArticlePreview & { sortOrder: number }

const FALLBACK_ITEMS: FallbackItem[] = [
  {
    id: 1,
    slug: 'blockchain-forum-2026-moscow',
    title: 'Blockchain Forum 2026 в Москве 14–15 апреля',
    excerpt:
      'Главное отраслевое событие весны: программа, спикеры и форматы нетворкинга.',
    imageUrl: '/images/articles/hero-blockchain-forum.jpg',
    imageAlt: 'Blockchain Forum 2026',
    topicId: 'mining',
    readingTimeMin: null,
    publishedAt: '2026-01-22',
    displayType: 'hero',
    sortOrder: 1,
  },
  {
    id: 2,
    slug: 'whatsminer-m70-line-review',
    title: 'Новое поколение Whatsminer M70: полный обзор линейки',
    excerpt:
      'Разбираем хешрейт, энергоэффективность и сценарии окупаемости новой линейки MicroBT.',
    imageUrl: '/images/articles/whatsminer-m70.jpg',
    imageAlt: 'Whatsminer M70',
    topicId: 'mining',
    readingTimeMin: 10,
    publishedAt: '2025-12-12',
    displayType: 'hero',
    sortOrder: 1,
  },
  {
    id: 3,
    slug: 'best-asic-miners-2026',
    title: 'Лучшие асики для майнинга: умный сервис, зрелая экосистема',
    excerpt:
      'Как выбрать ASIC в 2026 году: железо, сервис, логистика и прозрачные условия размещения.',
    imageUrl: '/images/articles/best-asic-miners.jpg',
    imageAlt: 'Лучшие ASIC-майнеры',
    topicId: 'mining',
    readingTimeMin: 10,
    publishedAt: '2025-12-12',
    displayType: 'featured',
    sortOrder: 2,
  },
  {
    id: 4,
    slug: 'crypto-market-outlook-2026',
    title: 'Падение или рост? Крипторынок на старте 2026 года',
    excerpt:
      'Ключевые факторы для Bitcoin и альткоинов: ликвидность, халвинг-цикл и институциональный спрос.',
    imageUrl: '/images/articles/crypto-market-2026.jpg',
    imageAlt: 'Крипторынок 2026',
    topicId: 'mining',
    readingTimeMin: 10,
    publishedAt: '2025-12-12',
    displayType: 'featured',
    sortOrder: 3,
  },
  {
    id: 5,
    slug: 'blockchain-life-2025-afterparty',
    title: 'Blockchain Life 2025 — главное событие СНГ',
    excerpt:
      'Итоги конференции, afterparty и главные анонсы для майнинг-сообщества.',
    imageUrl: '/images/articles/blockchain-life-2025.jpg',
    imageAlt: 'Blockchain Life 2025',
    topicId: 'mining',
    readingTimeMin: 10,
    publishedAt: '2025-12-12',
    displayType: 'featured',
    sortOrder: 4,
  },
  {
    id: 6,
    slug: 'the-trends-conference',
    title: 'THE TRENDS: технологии и тренды индустрии',
    excerpt:
      'Краткий обзор программы и тем, которые задал тон отрасли на осень.',
    imageUrl: '/images/articles/the-trends.jpg',
    imageAlt: 'THE TRENDS',
    topicId: 'mining',
    readingTimeMin: 8,
    publishedAt: '2025-11-16',
    displayType: 'featured',
    sortOrder: 5,
  },
  {
    id: 10,
    slug: 'top-mining-ecosystem',
    title:
      'Экосистема TOP MINING: единая платформа решений для майнеров, инвесторов и бизнеса',
    excerpt:
      'Калькулятор, каталог, рейтинги и сервисы — как связаны инструменты платформы.',
    imageUrl: '/images/articles/tools-ecosystem-hero.jpg',
    imageAlt: 'Экосистема TOP MINING',
    topicId: 'tools',
    readingTimeMin: 15,
    publishedAt: '2025-11-05',
    displayType: 'hero',
    sortOrder: 1,
  },
  {
    id: 11,
    slug: 'mining-consulting-services',
    title: 'Консалтинг в майнинге: сопровождение от идеи до запуска',
    excerpt:
      'Аудит, подбор оборудования, юридические и технические вопросы — что входит в консалтинг.',
    imageUrl: '/images/articles/tools-consulting.jpg',
    imageAlt: 'Консалтинг в майнинге',
    topicId: 'tools',
    readingTimeMin: 12,
    publishedAt: '2025-11-10',
    displayType: 'featured',
    sortOrder: 2,
  },
  {
    id: 12,
    slug: 'hosting-with-discount',
    title: 'Как выбрать хостинг со скидкой: критерии и подводные камни',
    excerpt:
      'На что смотреть при выборе площадки: тариф, аптайм, ремонт и прозрачность статистики.',
    imageUrl: '/images/articles/tools-hosting-discount.jpg',
    imageAlt: 'Хостинг со скидкой',
    topicId: 'tools',
    readingTimeMin: 9,
    publishedAt: '2025-11-08',
    displayType: 'featured',
    sortOrder: 3,
  },
  {
    id: 13,
    slug: 'tools-build-mining-site',
    title: 'Построим площадку для майнинга: полный цикл под ключ',
    excerpt:
      'Проектирование, монтаж, пусконаладка и сервис промышленной майнинг-площадки.',
    imageUrl: '/images/articles/tools-build-site.jpg',
    imageAlt: 'Строительство площадки',
    topicId: 'tools',
    readingTimeMin: 11,
    publishedAt: '2025-11-06',
    displayType: 'featured',
    sortOrder: 4,
  },
  {
    id: 14,
    slug: 'buy-asic-below-market',
    title: 'Купить ASIC по цене ниже рынка: как найти выгодные предложения',
    excerpt:
      'Где искать акции, как проверить поставщика и не переплатить за логистику.',
    imageUrl: '/images/articles/tools-buy-asic.jpg',
    imageAlt: 'Купить ASIC ниже рынка',
    topicId: 'tools',
    readingTimeMin: 10,
    publishedAt: '2025-11-04',
    displayType: 'featured',
    sortOrder: 5,
  },
  {
    id: 20,
    slug: 'best-time-to-buy-asic',
    title: 'Почему сейчас — самый выгодный момент для покупки асиков?',
    excerpt:
      'Разбираем факторы рынка, цены на оборудование и окно окупаемости для инвестора.',
    imageUrl: '/images/articles/investments-buy-asic-hero.jpg',
    imageAlt: 'Покупка ASIC',
    topicId: 'investments',
    readingTimeMin: 8,
    publishedAt: '2025-12-01',
    displayType: 'hero',
    sortOrder: 1,
  },
  {
    id: 21,
    slug: 'mining-on-gas-russia',
    title:
      'Майнинг на газе: как запустить ферму на природном или попутном газе в России',
    excerpt:
      'Энергетика, оборудование и юридические аспекты размещения на газовых генераторах.',
    imageUrl: '/images/articles/investments-mining-gas.jpg',
    imageAlt: 'Майнинг на газе',
    topicId: 'investments',
    readingTimeMin: 15,
    publishedAt: '2025-11-28',
    displayType: 'featured',
    sortOrder: 2,
  },
  {
    id: 22,
    slug: 'bitcoin-as-investment-asset',
    title: 'Bitcoin как инвестиционный актив: роль майнинга в портфеле',
    excerpt: 'Как совместить покупку BTC и добычу для долгосрочной стратегии.',
    imageUrl: '/images/articles/investments-bitcoin-coins.jpg',
    imageAlt: 'Bitcoin как инвестиция',
    topicId: 'investments',
    readingTimeMin: 11,
    publishedAt: '2025-11-25',
    displayType: 'featured',
    sortOrder: 3,
  },
  {
    id: 23,
    slug: 'mining-datacenter-investment',
    title: 'Инвестиции в майнинг-дата-центр: модели и доходность',
    excerpt:
      'Когда имеет смысл вкладываться в инфраструктуру, а не только в железо.',
    imageUrl: '/images/articles/investments-datacenter.jpg',
    imageAlt: 'Инвестиции в дата-центр',
    topicId: 'investments',
    readingTimeMin: 12,
    publishedAt: '2025-11-22',
    displayType: 'featured',
    sortOrder: 4,
  },
  {
    id: 24,
    slug: 'asic-payback-forecast-2026',
    title: 'Окупаемость ASIC в 2026: расчёт и прогноз для инвестора',
    excerpt:
      'Как оценить срок возврата вложений с учётом курса, тарифа и аптайма.',
    imageUrl: '/images/articles/investments-bitcoin-circuit.jpg',
    imageAlt: 'Окупаемость ASIC',
    topicId: 'investments',
    readingTimeMin: 10,
    publishedAt: '2025-11-18',
    displayType: 'featured',
    sortOrder: 5,
  },
  {
    id: 30,
    slug: 'mining-datacenter-guide',
    title: 'Как устроен современный майнинг-дата-центр',
    excerpt:
      'Мониторинг, безопасность и сервисные процессы на промышленной площадке.',
    imageUrl: '/images/articles/mining-datacenter.jpg',
    imageAlt: 'Майнинг-дата-центр',
    topicId: 'beginners',
    readingTimeMin: 6,
    publishedAt: '2025-10-15',
    displayType: 'hero',
    sortOrder: 1,
  },
  {
    id: 31,
    slug: 'asic-hardware-overview',
    title: 'Обзор промышленных ASIC: что важно при закупке',
    excerpt:
      'Форм-фактор, охлаждение и логистика при поставке партии оборудования.',
    imageUrl: '/images/articles/asic-miners.jpg',
    imageAlt: 'Промышленные ASIC',
    topicId: 'beginners',
    readingTimeMin: 8,
    publishedAt: '2025-09-28',
    displayType: 'featured',
    sortOrder: 2,
  },
  {
    id: 7,
    slug: 'top-mining-pools-2026',
    title: 'Лучшие майнинг-пулы 2026: топ-11 по доходности',
    excerpt:
      'Сравниваем комиссии, стабильность выплат и удобство мониторинга для майнеров.',
    imageUrl: '/images/articles/mining-pools-top11.jpg',
    imageAlt: 'Топ майнинг-пулов',
    topicId: 'tools',
    readingTimeMin: 9,
    publishedAt: '2025-12-01',
    displayType: 'list',
    sortOrder: 6,
  },
  {
    id: 15,
    slug: 'top-mining-articles-knowledge',
    title: 'Статьи о майнинге от TOP MINING: знание как инструмент прибыли',
    excerpt:
      'Подборка материалов для тех, кто хочет разобраться в отрасли системно.',
    imageUrl: '/images/articles/tools-datacenter.jpg',
    imageAlt: 'Статьи о майнинге',
    topicId: 'tools',
    readingTimeMin: 6,
    publishedAt: '2025-10-28',
    displayType: 'list',
    sortOrder: 7,
  },
  {
    id: 16,
    slug: 'where-to-buy-asic',
    title: 'Где купить ASIC — проверенный ресурс',
    excerpt:
      'Критерии надёжного поставщика и как сравнить предложения на рынке.',
    imageUrl: '/images/articles/asic-miners.jpg',
    imageAlt: 'Где купить ASIC',
    topicId: 'tools',
    readingTimeMin: 7,
    publishedAt: '2025-10-22',
    displayType: 'list',
    sortOrder: 8,
  },
  {
    id: 25,
    slug: 'mining-investment-entry',
    title: 'Инвестиции в майнинг: с чего начать частному инвестору',
    excerpt:
      'Минимальный бюджет, выбор модели и первые шаги без лишних рисков.',
    imageUrl: '/images/articles/investments-buy-asic-hero.jpg',
    imageAlt: 'Старт инвестора',
    topicId: 'investments',
    readingTimeMin: 7,
    publishedAt: '2025-11-15',
    displayType: 'list',
    sortOrder: 6,
  },
  {
    id: 9,
    slug: 'mining-sites-construction',
    title: 'Строительство площадок для майнинга: с чего начать',
    excerpt:
      'Инженерия, энергоснабжение и требования к инфраструктуре промышленного размещения.',
    imageUrl: '/images/articles/mining-sites-construction.jpg',
    imageAlt: 'Строительство майнинг-площадок',
    topicId: 'investments',
    readingTimeMin: 7,
    publishedAt: '2025-11-20',
    displayType: 'list',
    sortOrder: 9,
  },
  {
    id: 32,
    slug: 'whatsminer-m70-beginners',
    title: 'Whatsminer M70 для новичков: с чего начать знакомство с линейкой',
    excerpt:
      'Базовые характеристики, условия размещения и типичные вопросы на старте.',
    imageUrl: '/images/articles/whatsminer-m70.jpg',
    imageAlt: 'Whatsminer M70 для новичков',
    topicId: 'beginners',
    readingTimeMin: 7,
    publishedAt: '2025-10-10',
    displayType: 'featured',
    sortOrder: 3,
  },
  {
    id: 33,
    slug: 'mining-basics-start',
    title: 'Майнинг с нуля: первые шаги без типичных ошибок',
    excerpt: 'Как выбрать модель, площадку и не потерять бюджет на старте.',
    imageUrl: '/images/articles/best-asic-miners.jpg',
    imageAlt: 'Майнинг с нуля',
    topicId: 'beginners',
    readingTimeMin: 9,
    publishedAt: '2025-10-05',
    displayType: 'list',
    sortOrder: 4,
  },
]

function stripSortOrder(item: FallbackItem): ArticlePreview {
  const { sortOrder: _sortOrder, ...preview } = item
  return preview
}

export function buildArticlesFeedFallback(
  topic: TopMiningArticlesTopicId = 'all',
): ArticlesFeedResponse {
  const items = FALLBACK_ITEMS.filter(
    (item) => topic === 'all' || item.topicId === topic,
  ).sort(
    (a, b) =>
      a.sortOrder - b.sortOrder || b.publishedAt.localeCompare(a.publishedAt),
  )

  const feed: ArticlesFeedResponse = {
    source: 'fallback',
    updatedAt: new Date().toISOString(),
    hero: null,
    featured: [],
    list: [],
    hasMore: items.length > 9,
  }

  for (const item of items) {
    const preview = stripSortOrder(item)

    switch (item.displayType) {
      case 'hero':
        if (!feed.hero) {
          feed.hero = preview
        }
        break
      case 'featured':
        if (feed.featured.length < 4) {
          feed.featured.push(preview)
        }
        break
      default:
        if (feed.list.length < 8) {
          feed.list.push(preview)
        }
    }
  }

  if (!feed.hero && items.length > 0) {
    feed.hero = stripSortOrder(items[0]!)
  }

  return feed
}

export const ARTICLES_FALLBACK = buildArticlesFeedFallback('all')

const FALLBACK_BY_SLUG = new Map<string, Article>()

function withContent(preview: ArticlePreview): Article {
  return { ...preview, content: SAMPLE_CONTENT }
}

for (const item of FALLBACK_ITEMS) {
  FALLBACK_BY_SLUG.set(item.slug, withContent(stripSortOrder(item)))
}

export function getArticleFallback(slug: string): Article | null {
  return FALLBACK_BY_SLUG.get(slug) ?? null
}
