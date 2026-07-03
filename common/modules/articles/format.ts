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
