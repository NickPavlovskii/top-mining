/**
 * Папка layout — оболочка сайта.
 * Подписка на email-рассылку: валидация и тексты UI.
 */

const EMAIL_PATTERN = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

export const SUBSCRIBE_API_PATH = '/api/subscribe'

export const SUBSCRIBE_UI = {
  success: 'Письмо отправлено — проверьте почту',
  invalidEmail: 'Укажите корректный e-mail',
  error: 'Не удалось отправить письмо. Попробуйте позже',
  sending: 'Отправляем…',
} as const

export type SubscribeSource = 'contact-section' | 'footer'

export function normalizeSubscribeEmail(value: string): string {
  return value.trim().toLowerCase()
}

export function isValidSubscribeEmail(value: string): boolean {
  const email = normalizeSubscribeEmail(value)
  return email.length > 3 && email.length <= 254 && EMAIL_PATTERN.test(email)
}
