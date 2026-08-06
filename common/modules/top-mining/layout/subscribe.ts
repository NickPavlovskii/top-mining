/**
 * Папка layout — оболочка сайта.
 * Подписка на email-рассылку: Zod-валидация и тексты UI.
 */
import { z } from 'zod'

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

export const subscribeSubmitSchema = z.object({
  email: z
    .string()
    .transform(normalizeSubscribeEmail)
    .pipe(
      z
        .string()
        .min(4, SUBSCRIBE_UI.invalidEmail)
        .max(254, SUBSCRIBE_UI.invalidEmail)
        .email(SUBSCRIBE_UI.invalidEmail),
    ),
  source: z.enum(['contact-section', 'footer']).optional().nullable(),
  website: z.string().optional().default(''),
})

export type SubscribeSubmitInput = z.infer<typeof subscribeSubmitSchema>

export type ParseSubscribeSubmitResult =
  | { ok: true, data: SubscribeSubmitInput }
  | { ok: false, error: string }

export function parseSubscribeSubmit(input: unknown): ParseSubscribeSubmitResult {
  const result = subscribeSubmitSchema.safeParse(input)

  if (!result.success) {
    return {
      ok: false,
      error: result.error.issues[0]?.message || SUBSCRIBE_UI.invalidEmail,
    }
  }

  return { ok: true, data: result.data }
}

export function isValidSubscribeEmail(value: string): boolean {
  return parseSubscribeSubmit({ email: value }).ok
}
