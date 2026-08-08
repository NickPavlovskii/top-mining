/**
 * Пакет articles — статьи.
 * Хелпер «контент ещё не готов» (метка из старых сидов рейтингов).
 */
export const ARTICLE_CONTENT_NOT_READY =
  'Информация о статье ещё не добавлена'

export function isArticleContentPending(
  content: string | null | undefined,
): boolean {
  const trimmed = content?.trim() ?? ''
  return !trimmed || trimmed === ARTICLE_CONTENT_NOT_READY
}
