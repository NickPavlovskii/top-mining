/**
 * Заявки с форм сайта: типы и константы.
 */
export type LeadSource =
  | 'footer-contact'
  | 'home-phone'
  | 'consulting-construction'
  | 'data-center-lead'
  | (string & {})

export type SubmitLeadInput = {
  source: LeadSource
  contact: string
  name?: string
  message?: string
  fields?: Record<string, string>
  website?: string
  pagePath?: string
}

export const LEADS_API_PATH = '/api/leads'

export const LEADS_UI = {
  sending: 'Отправляем заявку…',
  success: 'Заявка отправлена. Мы свяжемся с вами.',
  error: 'Не удалось отправить заявку. Попробуйте позже.',
  contactRequired: 'Укажите телефон или Telegram',
  privacyRequired: 'Нужно согласие на обработку персональных данных',
} as const
