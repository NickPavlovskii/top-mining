/**
 * Пакет articles — статьи.
 * Сборка TOC и секций из plain-текста.
 */
import type { ArticleTocItem } from './section-types'

export function buildTocFromPlainContent(content: string): ArticleTocItem[] {
  const lines = content
    .split(/\n+/)
    .map((line) => line.trim())
    .filter(Boolean)

  const toc: ArticleTocItem[] = []
  const seen = new Set<string>()

  for (const line of lines) {
    const isHeading =
      line.length < 90
      && !line.endsWith('.')
      && (
        /^(Введение|Выводы|Особенности|Почему)/i.test(line)
        || /^\d+\s*место:/i.test(line)
        || /^[A-ZА-ЯЁ0-9].{8,}$/.test(line)
      )

    if (!isHeading) {
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

export function slugifyHeading(title: string): string {
  return title
    .toLowerCase()
    .replace(/ё/g, 'е')
    .replace(/[^a-zа-я0-9]+/gi, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80)
}
