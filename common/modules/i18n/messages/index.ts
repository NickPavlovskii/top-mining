import type { TopMiningLocale } from '~/common/modules/top-mining/layout/locale'
import type { I18nMessages } from '~/common/modules/i18n/resolve'
import { enMessages } from '~/common/modules/i18n/messages/en'
import { ruMessages } from '~/common/modules/i18n/messages/ru'

export const i18nCatalogs: Record<TopMiningLocale, I18nMessages> = {
  ru: ruMessages as unknown as I18nMessages,
  en: enMessages as unknown as I18nMessages,
}

export { enMessages, ruMessages }
