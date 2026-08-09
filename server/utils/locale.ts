import type { H3Event } from 'h3'
import {
  normalizeTopMiningLocale,
  TOP_MINING_LOCALE_COOKIE,
  type TopMiningLocale,
} from '~/common/modules/top-mining/layout/locale'

export function resolveRequestLocale(event: H3Event): TopMiningLocale {
  const fromQuery = getQuery(event).locale
  if (typeof fromQuery === 'string' && fromQuery.trim()) {
    return normalizeTopMiningLocale(fromQuery)
  }

  return normalizeTopMiningLocale(getCookie(event, TOP_MINING_LOCALE_COOKIE))
}
