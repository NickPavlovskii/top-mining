import { i18nCatalogs } from '~/common/modules/i18n/messages'
import { createTranslate } from '~/common/modules/i18n/resolve'

/**
 * Перевод UI-строк по текущей локали (cookie tm_locale).
 * Ключи вида `nav.catalog`, `navItem.ASIC-майнеры`, `footer.send`.
 * Плейсхолдеры: `t('calculator.coinUsdt', undefined, { symbol: 'BTC' })`.
 */
export function useT() {
  const { locale } = useTopMiningLocale()

  // Явная зависимость: смена cookie должна пересчитывать все t() в шаблонах.
  const translate = computed(() => createTranslate(locale.value, i18nCatalogs))

  function t(
    key: string,
    fallback?: string,
    params?: Record<string, string | number>,
  ): string {
    let text = translate.value(key, fallback)
    if (params) {
      for (const [name, value] of Object.entries(params)) {
        text = text.replaceAll(`{${name}}`, String(value))
      }
    }
    return text
  }

  function tNavItem(item: string): string {
    return t(`navItem.${item}`, item)
  }

  function tNavTitle(slug: string, fallback: string): string {
    return t(`nav.${slug}`, fallback)
  }

  function tRatingTitle(title: string): string {
    return t(`ratingTitle.${title}`, title)
  }

  function tRatingItem(label: string): string {
    return t(`ratingItem.${label}`, label)
  }

  function tCoinName(id: string, fallback: string): string {
    return t(`coinName.${id}`, fallback)
  }

  return {
    locale,
    t,
    tNavItem,
    tNavTitle,
    tRatingTitle,
    tRatingItem,
    tCoinName,
  }
}
