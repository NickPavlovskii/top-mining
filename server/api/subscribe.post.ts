import { createError, readBody } from 'h3'
import {
  isValidSubscribeEmail,
  normalizeSubscribeEmail,
  type SubscribeSource,
} from '~/common/modules/top-mining/layout/subscribe'
import {
  HTTP_BAD_REQUEST,
  HTTP_SERVICE_UNAVAILABLE,
} from '~/common/modules/http'
import { resolveSmtpConfig, sendMail } from '~/server/utils/mail/send'
import { buildSubscribeWelcomeEmail } from '~/server/utils/mail/subscribe-template'

type SubscribeBody = {
  email?: string
  source?: SubscribeSource
  website?: string
}

export default defineEventHandler(async (event) => {
  const body = await readBody<SubscribeBody>(event)

  // Honeypot: bots fill hidden fields
  if (String(body?.website || '').trim()) {
    return { ok: true }
  }

  const email = normalizeSubscribeEmail(String(body?.email || ''))

  if (!isValidSubscribeEmail(email)) {
    throw createError({
      statusCode: HTTP_BAD_REQUEST,
      statusMessage: 'Valid email is required',
    })
  }

  const config = useRuntimeConfig(event)
  const smtp = resolveSmtpConfig(config)

  if (!smtp) {
    throw createError({
      statusCode: HTTP_SERVICE_UNAVAILABLE,
      statusMessage:
        'Email delivery is not configured (SMTP_HOST / SMTP_USER / SMTP_PASS)',
    })
  }

  try {
    await sendMail({
      config: smtp,
      to: email,
      content: buildSubscribeWelcomeEmail(email),
    })
  } catch (error) {
    const message =
      error instanceof Error ? error.message : 'Failed to send email'

    throw createError({
      statusCode: HTTP_SERVICE_UNAVAILABLE,
      statusMessage: message,
    })
  }

  return {
    ok: true,
    email,
    source: body?.source ?? null,
  }
})
