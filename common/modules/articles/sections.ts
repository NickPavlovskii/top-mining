/**
 * Пакет articles — статьи.
 * Сборка TOC и секций из plain-текста / HTML.
 */
import type { ArticleSection, ArticleTocItem } from './section-types'

function decodeBasicEntities(text: string): string {
  return text
    .replace(/&nbsp;/gi, ' ')
    .replace(/&mdash;/gi, '—')
    .replace(/&ndash;/gi, '–')
    .replace(/&laquo;/gi, '«')
    .replace(/&raquo;/gi, '»')
    .replace(/&quot;/gi, '"')
    .replace(/&#39;/g, "'")
    .replace(/&amp;/gi, '&')
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
}

/** HTML/plain → текст со строками для разбиения на секции. */
export function normalizeArticlePlainContent(content: string): string {
  const trimmed = content.trim()
  if (!trimmed) {
    return ''
  }

  const looksLikeHtml = /<\/?[a-z][\s\S]*>/i.test(trimmed)
  if (!looksLikeHtml) {
    return trimmed
  }

  return decodeBasicEntities(
    trimmed
      .replace(/<h[1-6][^>]*>/gi, '\n\n')
      .replace(/<\/h[1-6]>/gi, '\n\n')
      .replace(/<\/p>/gi, '\n\n')
      .replace(/<br\s*\/?>/gi, '\n')
      .replace(/<\/div>/gi, '\n')
      .replace(/<li[^>]*>/gi, '\n• ')
      .replace(/<[^>]+>/g, '')
      .replace(/[ \t]+\n/g, '\n')
      .replace(/\n{3,}/g, '\n\n')
      .trim(),
  )
}

export function isPlainArticleHeading(line: string): boolean {
  const text = line.trim()
  if (!text || text.length >= 90 || text.endsWith('.')) {
    return false
  }

  return (
    /^(Введение|Выводы|Особенности|Почему|Билеты|AI\b)/i.test(text)
    || /^\d+\s*место:/i.test(text)
    || /^[A-ZА-ЯЁ0-9].{8,}$/.test(text)
  )
}

export function buildTocFromPlainContent(content: string): ArticleTocItem[] {
  const lines = normalizeArticlePlainContent(content)
    .split(/\n+/)
    .map((line) => line.trim())
    .filter(Boolean)

  const toc: ArticleTocItem[] = []
  const seen = new Set<string>()

  for (const line of lines) {
    if (!isPlainArticleHeading(line)) {
      continue
    }

    const id = slugifyHeading(line)
    if (seen.has(id)) {
      continue
    }
    seen.add(id)
    toc.push({ id, title: line })
  }

  return toc
}

/** Есть ли в секциях реальный контент (не только пустые заголовки). */
export function sectionsHaveBody(sections: ArticleSection[] | null | undefined): boolean {
  if (!sections?.length) {
    return false
  }

  return sections.some((section) => section.blocks.length > 0)
}

/** Секции без текста под заголовками (stub html + headings). */
export function sectionsAreHollow(sections: ArticleSection[] | null | undefined): boolean {
  if (!sections?.length) {
    return true
  }

  const withTitle = sections.filter((section) => section.title.trim())
  if (!withTitle.length) {
    return !sectionsHaveBody(sections)
  }

  const emptyHeadings = withTitle.filter((section) => section.blocks.length === 0).length
  return emptyHeadings >= Math.ceil(withTitle.length / 2)
}

/** Plain/HTML content → секции с заголовками (как ArticleSections). */
export function plainContentToSections(
  content: string | null | undefined,
): ArticleSection[] | null {
  const normalized = normalizeArticlePlainContent(content ?? '')
  if (!normalized) {
    return null
  }

  const chunks = normalized
    .split(/\n\s*\n/)
    .map((part) => part.trim())
    .filter(Boolean)

  if (!chunks.length) {
    return null
  }

  const sections: ArticleSection[] = []
  let current: ArticleSection | null = null

  const ensureSection = (title: string, id: string) => {
    current = { id, title, blocks: [] }
    sections.push(current)
  }

  for (const chunk of chunks) {
    const lines = chunk
      .split(/\n+/)
      .map((line) => line.trim())
      .filter(Boolean)

    if (!lines.length) {
      continue
    }

    if (lines.length === 1 && isPlainArticleHeading(lines[0]!)) {
      ensureSection(lines[0]!, slugifyHeading(lines[0]!))
      continue
    }

    let startIndex = 0
    if (isPlainArticleHeading(lines[0]!)) {
      ensureSection(lines[0]!, slugifyHeading(lines[0]!))
      startIndex = 1
    } else if (!current) {
      ensureSection('', 'content')
    }

    const paragraph = lines.slice(startIndex).join('\n').trim()
    if (!paragraph || !current) {
      continue
    }

    current.blocks.push({ type: 'paragraph', text: paragraph })
  }

  return sections.length ? sections : null
}

export function slugifyHeading(title: string): string {
  return title
    .toLowerCase()
    .replace(/ё/g, 'е')
    .replace(/[^a-zа-я0-9]+/gi, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80)
}
