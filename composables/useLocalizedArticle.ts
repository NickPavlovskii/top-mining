import type { ArticlePreview } from '~/common/modules/articles'
import { articleContentEn } from '~/common/modules/i18n/article-content-en'
import type { TopMiningLocale } from '~/common/modules/top-mining/layout/locale'

/**
 * Подставляет EN title/excerpt/imageAlt по slug, если есть перевод.
 */
export function localizeArticlePreview<T extends ArticlePreview>(
  article: T,
  locale: TopMiningLocale,
): T {
  if (locale !== 'en') {
    return article
  }

  const localized = articleContentEn[article.slug]
  if (!localized) {
    return article
  }

  return {
    ...article,
    title: localized.title,
    excerpt: localized.excerpt || article.excerpt,
    imageAlt: localized.imageAlt ?? article.imageAlt,
  }
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
