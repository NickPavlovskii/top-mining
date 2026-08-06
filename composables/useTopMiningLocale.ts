import {
  normalizeTopMiningLocale,
  TOP_MINING_DEFAULT_LOCALE,
  TOP_MINING_LOCALE_COOKIE,
  TOP_MINING_LOCALE_OPTIONS,
  type TopMiningLocale,
} from '~/common/modules/top-mining/layout/locale'

/**
 * Общая локаль UI: cookie + useState, чтобы смена RU/EN
 * сразу пересчитывала t() во всех компонентах.
 */
export function useTopMiningLocale() {
  const localeCookie = useCookie<TopMiningLocale>(TOP_MINING_LOCALE_COOKIE, {
    default: () => TOP_MINING_DEFAULT_LOCALE,
    sameSite: 'lax',
    maxAge: 60 * 60 * 24 * 365,
  })

  const localeState = useState<TopMiningLocale>('tm-locale', () =>
    normalizeTopMiningLocale(localeCookie.value),
  )

  // Синхронизация cookie → state (SSR / первый визит).
  if (import.meta.server) {
    localeState.value = normalizeTopMiningLocale(localeCookie.value)
  }

  const locale = computed({
    get: () => normalizeTopMiningLocale(localeState.value),
    set: (value: TopMiningLocale) => {
      const next = normalizeTopMiningLocale(value)
      localeState.value = next
      localeCookie.value = next
    },
  })

  const options = TOP_MINING_LOCALE_OPTIONS

  function setLocale(next: TopMiningLocale) {
    locale.value = next
  }

  function toggleLocale() {
    locale.value = locale.value === 'ru' ? 'en' : 'ru'
  }

  useHead(() => ({
    htmlAttrs: {
      lang: locale.value,
    },
  }))

  return {
    locale,
    options,
    setLocale,
    toggleLocale,
  }
}
