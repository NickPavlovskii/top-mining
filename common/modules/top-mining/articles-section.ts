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
