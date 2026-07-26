const STORAGE_PREFIX = 'tm-article-viewed:'

function storageKey(slug: string): string {
  return `${STORAGE_PREFIX}${slug}`
}

/** Уже считали просмотр этой статьи в текущем браузере? */
export function hasRecordedArticleView(slug: string): boolean {
  if (!import.meta.client || !slug) {
    return true
  }
  try {
    return Boolean(localStorage.getItem(storageKey(slug)))
  } catch {
    return false
  }
}

function markArticleViewRecorded(slug: string): void {
  if (!import.meta.client || !slug) {
    return
  }
  try {
    localStorage.setItem(storageKey(slug), '1')
  } catch {
    // private mode / quota — просто не дедуплицируем
  }
}

/**
 * Увеличивает view_count один раз на браузер (localStorage).
 * Два браузера на одном устройстве = два просмотра.
 */
export async function recordArticleView(slug: string): Promise<number | null> {
  if (!import.meta.client || !slug || hasRecordedArticleView(slug)) {
    return null
  }

  try {
    const data = await $fetch<{ viewCount: number }>(
      `/api/articles/${encodeURIComponent(slug)}/view`,
      { method: 'POST' },
    )
    markArticleViewRecorded(slug)
    return typeof data.viewCount === 'number' ? data.viewCount : null
  } catch {
    return null
  }
}
