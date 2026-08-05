/**
 * Пакет articles — статьи.
 * Преобразование DB-блоков в секции и TOC.
 */
import type { ArticleBlock, ArticleSection, ArticleTocItem } from './section-types'
import type { ArticleDbBlock } from './types'

function parsePayload(payload: unknown): Record<string, unknown> {
  if (payload == null) {
    return {}
  }
  if (typeof payload === 'string') {
    try {
      return JSON.parse(payload) as Record<string, unknown>
    } catch {
      return {}
    }
  }
  if (typeof payload === 'object') {
    return payload as Record<string, unknown>
  }
  return {}
}

function mapContentBlock(block: ArticleDbBlock): ArticleBlock | null {
  const payload = parsePayload(block.payload)

  switch (block.type) {
    case 'paragraph': {
      const text =
        (typeof payload.text === 'string' && payload.text) ||
        (typeof payload.html === 'string' && payload.html) ||
        ''
      if (!text) {
        return null
      }
      return { type: 'paragraph', text }
    }
    case 'list': {
      const items = Array.isArray(payload.items)
        ? payload.items.filter((item): item is string => typeof item === 'string')
        : []
      return { type: 'list', items }
    }
    case 'rich_list':
    case 'richList': {
      const items = Array.isArray(payload.items)
        ? payload.items
            .map((item) => {
              if (!item || typeof item !== 'object') {
                return null
              }
              const row = item as { title?: unknown; text?: unknown }
              if (typeof row.title !== 'string' || typeof row.text !== 'string') {
                return null
              }
              return { title: row.title, text: row.text }
            })
            .filter(
              (item): item is { title: string; text: string } => item != null,
            )
        : []
      return {
        type: 'richList',
        ordered: payload.ordered !== false,
        items,
      }
    }
    case 'image': {
      const src =
        (typeof payload.src === 'string' && payload.src) ||
        (typeof payload.url === 'string' && payload.url) ||
        ''
      const alt = typeof payload.alt === 'string' ? payload.alt : ''
      if (!src) {
        return null
      }
      return { type: 'image', src, alt }
    }
    case 'stats': {
      const rows = Array.isArray(payload.rows)
        ? payload.rows
            .map((row) => {
              if (!row || typeof row !== 'object') {
                return null
              }
              const item = row as { label?: unknown; value?: unknown }
              if (typeof item.label !== 'string' || typeof item.value !== 'string') {
                return null
              }
              return { label: item.label, value: item.value }
            })
            .filter(
              (row): row is { label: string; value: string } => row != null,
            )
        : []
      return { type: 'stats', rows }
    }
    case 'pros_cons':
    case 'prosCons': {
      const pros = Array.isArray(payload.pros)
        ? payload.pros.filter((item): item is string => typeof item === 'string')
        : []
      const cons = Array.isArray(payload.cons)
        ? payload.cons.filter((item): item is string => typeof item === 'string')
        : []
      return { type: 'prosCons', pros, cons }
    }
    case 'html': {
      const html = typeof payload.html === 'string' ? payload.html : ''
      if (!html.trim()) {
        return null
      }
      return { type: 'paragraph', text: html.replace(/<[^>]+>/g, '') }
    }
    default:
      return null
  }
}

export function articleBlocksToSections(
  blocks: ArticleDbBlock[] | null | undefined,
): ArticleSection[] | null {
  if (!blocks?.length) {
    return null
  }

  const sections: ArticleSection[] = []
  let current: ArticleSection | null = null

  for (const block of blocks) {
    if (block.type === 'heading') {
      const payload = parsePayload(block.payload)
      const title =
        (typeof payload.text === 'string' && payload.text) ||
        (typeof payload.title === 'string' && payload.title) ||
        'Раздел'
      const id =
        (typeof block.anchor === 'string' && block.anchor.trim()) ||
        `section-${sections.length + 1}`

      current = { id, title, blocks: [] }
      sections.push(current)
      continue
    }

    const mapped = mapContentBlock(block)
    if (!mapped) {
      continue
    }

    if (!current) {
      current = {
        id: 'content',
        title: '',
        blocks: [],
      }
      sections.push(current)
    }

    current.blocks.push(mapped)
  }

  return sections.length ? sections : null
}

export function sectionsToToc(sections: ArticleSection[] | null): ArticleTocItem[] {
  if (!sections?.length) {
    return []
  }
  return sections
    .filter((section) => section.id && section.title)
    .map((section) => ({ id: section.id, title: section.title }))
}
