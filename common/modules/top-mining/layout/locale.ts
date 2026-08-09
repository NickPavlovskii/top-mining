/**
 * Локаль интерфейса (RU / EN).
 * Cookie tm_locale; контент статей локализуется в БД (article_translations).
 */
export const TOP_MINING_LOCALES = ['ru', 'en'] as const

export type TopMiningLocale = (typeof TOP_MINING_LOCALES)[number]

export const TOP_MINING_DEFAULT_LOCALE: TopMiningLocale = 'ru'

export const TOP_MINING_LOCALE_COOKIE = 'tm_locale'

export const TOP_MINING_LOCALE_OPTIONS = [
  { code: 'ru' as const, label: 'RU', ariaLabel: 'Русский' },
  { code: 'en' as const, label: 'EN', ariaLabel: 'English' },
] as const

export function isTopMiningLocale(value: unknown): value is TopMiningLocale {
  return value === 'ru' || value === 'en'
}

export function normalizeTopMiningLocale(value: unknown): TopMiningLocale {
  return isTopMiningLocale(value) ? value : TOP_MINING_DEFAULT_LOCALE
}
