/**
 * Пакет articles — статьи.
 * Типы блоков, секций и TOC.
 */
export type ArticleBlock =
  | { type: 'paragraph'; text: string }
  | { type: 'list'; items: string[] }
  | {
      type: 'richList'
      ordered?: boolean
      items: Array<{ title: string; text: string }>
    }
  | { type: 'image'; src: string; alt: string }
  | { type: 'stats'; rows: Array<{ label: string; value: string }> }
  | { type: 'prosCons'; pros: string[]; cons: string[] }

export interface ArticleSection {
  id: string
  title: string
  blocks: ArticleBlock[]
}

export interface ArticleTocItem {
  id: string
  title: string
}
