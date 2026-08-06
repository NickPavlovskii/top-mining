import { createError, readBody } from 'h3'
import {
  parseSubscribeSubmit,
} from '~/common/modules/top-mining/layout/subscribe'
import {
  HTTP_BAD_REQUEST,
  HTTP_SERVICE_UNAVAILABLE,
} from '~/common/modules/http'
import { resolveSmtpConfig, sendMail } from '~/server/utils/mail/send'
import { buildSubscribeWelcomeEmail } from '~/server/utils/mail/subscribe-template'
import {
  buildSubscribeTelegramNotify,
  resolveTelegramConfig,
  sendTelegramMessage,
} from '~/server/utils/telegram/send'

export default defineEventHandler(async (event) => {
  const body = await readBody(event)

  // Honeypot: bots fill hidden fields
  if (String(body?.website || '').trim()) {
    return { ok: true }
  }

  const parsed = parseSubscribeSubmit(body)

  if (!parsed.ok) {
    throw createError({
      statusCode: HTTP_BAD_REQUEST,
      statusMessage: parsed.error,
    })
  }

  const { email, source } = parsed.data
  const config = useRuntimeConfig(event)
  const smtp = resolveSmtpConfig(config)
  const telegram = resolveTelegramConfig(config)

  if (!smtp && !telegram) {
    throw createError({
      statusCode: HTTP_SERVICE_UNAVAILABLE,
      statusMessage:
        'Delivery is not configured (SMTP and/or TELEGRAM_BOT_TOKEN + TELEGRAM_CHAT_ID)',
    })
  }

  const delivered = {
    email: false,
    telegram: false,
  }

  const errors: string[] = []

  if (smtp) {
    try {
      await sendMail({
        config: smtp,
        to: email,
        content: buildSubscribeWelcomeEmail(email),
      })
      delivered.email = true
    } catch (error) {
      errors.push(
        error instanceof Error ? error.message : 'Failed to send email',
      )
    }
  }

  if (telegram) {
    try {
      await sendTelegramMessage({
        config: telegram,
        text: buildSubscribeTelegramNotify({
          email,
          source: source ?? null,
        }),
      })
      delivered.telegram = true
    } catch (error) {
      errors.push(
        error instanceof Error ? error.message : 'Failed to send Telegram',
      )
    }
  }

  if (!delivered.email && !delivered.telegram) {
    throw createError({
      statusCode: HTTP_SERVICE_UNAVAILABLE,
      statusMessage: errors.join('; ') || 'Failed to deliver subscription',
    })
  }

  return {
    ok: true,
    email,
    source: source ?? null,
    delivered,
    warnings: errors.length ? errors : undefined,
  }
})
