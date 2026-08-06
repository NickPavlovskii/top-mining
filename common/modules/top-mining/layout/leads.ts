/**
 * Заявки с форм сайта: типы, Zod-схема и константы.
 */
import { z } from 'zod'

export type LeadSource =
  | 'footer-contact'
  | 'home-phone'
  | 'consulting-construction'
  | 'data-center-lead'
  | (string & {})

const trimmedString = z.string().trim()

export const leadSubmitSchema = z.object({
  source: trimmedString.min(1, 'source is required'),
  contact: trimmedString.min(1, 'contact is required'),
  name: trimmedString.optional().default(''),
  message: trimmedString.optional().default(''),
  fields: z.record(z.string(), z.string()).optional().default({}),
  website: z.string().optional().default(''),
  pagePath: trimmedString.optional().default(''),
})

export type SubmitLeadInput = z.input<typeof leadSubmitSchema>
export type ParsedLeadSubmit = z.output<typeof leadSubmitSchema>

export type ParseLeadSubmitResult =
  | { ok: true, data: ParsedLeadSubmit }
  | { ok: false, error: string }

export function parseLeadSubmit(input: unknown): ParseLeadSubmitResult {
  const result = leadSubmitSchema.safeParse(input)

  if (!result.success) {
    return {
      ok: false,
      error: result.error.issues[0]?.message || 'Invalid lead payload',
    }
  }

  return { ok: true, data: result.data }
}

export const LEADS_API_PATH = '/api/leads'

export const LEADS_UI = {
  sending: 'Отправляем заявку…',
  success: 'Заявка отправлена. Мы свяжемся с вами.',
  error: 'Не удалось отправить заявку. Попробуйте позже.',
  contactRequired: 'Укажите телефон или Telegram',
  privacyRequired: 'Нужно согласие на обработку персональных данных',
} as const
