import type { TopMiningLocale } from '~/common/modules/top-mining/layout/locale'

export type I18nMessages = Record<string, unknown>

export type TranslateFn = (key: string, fallback?: string) => string

export function getMessageByPath(
  tree: I18nMessages,
  path: string,
): string | undefined {
  const parts = path.split('.')
  let current: unknown = tree

  for (const part of parts) {
    if (!current || typeof current !== 'object') {
      return undefined
    }
    current = (current as Record<string, unknown>)[part]
  }

  return typeof current === 'string' ? current : undefined
}

export function createTranslate(
  locale: TopMiningLocale,
  catalogs: Record<TopMiningLocale, I18nMessages>,
): TranslateFn {
  return (key: string, fallback?: string) => {
    const fromLocale = getMessageByPath(catalogs[locale], key)
    if (fromLocale !== undefined) {
      return fromLocale
    }

    const fromRu = getMessageByPath(catalogs.ru, key)
    if (fromRu !== undefined) {
      return fromRu
    }

    return fallback ?? key
  }
}
