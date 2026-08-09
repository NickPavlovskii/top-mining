import type { ArticlePreview } from '~/common/modules/articles'
import type { TopMiningLocale } from '~/common/modules/top-mining/layout/locale'

/**
 * Раньше подставлял EN из статических моков.
 * Теперь перевод приходит из БД через API (?locale= / cookie tm_locale).
 */
export function localizeArticlePreview<T extends ArticlePreview>(
  article: T,
  _locale: TopMiningLocale,
): T {
  return article
}

export function useLocalizedArticle() {
  const { locale } = useTopMiningLocale()

  function localize<T extends ArticlePreview>(article: T): T {
    return localizeArticlePreview(article, locale.value)
  }

  return {
    locale,
    localize,
  }
}
