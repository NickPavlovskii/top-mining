export const TOP_MINING_ARTICLES_SECTION = {
  titleLine1: 'Интересные',
  titleLine2: 'статьи',
  subtitle:
    'Помогаем вам изучить сферу майнинга с нуля и быть в курсе новостей, разбираться в «фишках»',
} as const

export type TopMiningArticlesTopicId =
  | 'all'
  | 'mining'
  | 'tools'
  | 'investments'
  | 'beginners'

export interface TopMiningArticlesTopic {
  id: TopMiningArticlesTopicId
  label: string
}

export const TOP_MINING_ARTICLES_TOPICS: TopMiningArticlesTopic[] = [
  { id: 'all', label: 'Все' },
  { id: 'mining', label: 'Все о майнинге' },
  { id: 'tools', label: 'Инструменты и сервисы' },
  { id: 'investments', label: 'Инвестиции' },
  { id: 'beginners', label: 'Новичкам' },
]

const ARTICLE_NAV_TOPIC_MAP: Record<string, TopMiningArticlesTopicId> = {
  'Майнинг': 'mining',
  'Инструменты и сервисы': 'tools',
  'Инвестиции': 'investments',
  'Новичкам': 'beginners',
  'Разное': 'all',
}

export function getArticlesNavHref(label: string): string {
  const topic = ARTICLE_NAV_TOPIC_MAP[label]

  if (!topic || topic === 'all') {
    return '/articles/'
  }

  return `/articles/?topic=${topic}`
}
