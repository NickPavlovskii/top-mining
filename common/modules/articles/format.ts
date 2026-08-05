/**
 * Пакет articles — статьи.
 * Формат даты, времени чтения, split заголовка.
 */
export function formatArticleDate(isoDate: string): string {
  const datePart = isoDate.split('T')[0] ?? isoDate
  const [year, month, day] = datePart.split('-')

  if (!year || !month || !day) {
    return isoDate
  }

  return `${day}.${month}.${year}`
}

export function formatReadingTime(minutes: number | null | undefined): string | null {
  if (minutes == null || minutes <= 0) {
    return null
  }

  return `${minutes} мин.`
}

export function splitArticleTitle(title: string): {
  primary: string
  secondary: string | null
} {
  const separatorIndex = title.indexOf(':')

  if (separatorIndex === -1) {
    return { primary: title.trim(), secondary: null }
  }

  const primary = title.slice(0, separatorIndex).trim()
  const secondary = title.slice(separatorIndex + 1).trim()

  if (!primary || !secondary) {
    return { primary: title.trim(), secondary: null }
  }

  return { primary, secondary }
}
