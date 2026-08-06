import { createError, getRequestURL, readBody } from 'h3'
import {
  HTTP_BAD_REQUEST,
  HTTP_SERVICE_UNAVAILABLE,
} from '~/common/modules/http'
import { parseLeadSubmit } from '~/common/modules/top-mining/layout/leads'
import { CREATE_LEAD_MUTATION } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'
import {
  buildLeadTelegramNotify,
  resolveTelegramConfig,
  sendTelegramMessage,
} from '~/server/utils/telegram/send'

type CreateLeadData = {
  createLead: {
    id: number
    source: string
    createdAt: string
  }
}

export default defineEventHandler(async (event) => {
  const body = await readBody(event)

  // Honeypot
  if (String(body?.website || '').trim()) {
    return { ok: true }
  }

  const parsed = parseLeadSubmit({
    ...body,
    pagePath:
      String(body?.pagePath || '').trim()
      || getRequestURL(event).pathname,
  })

  if (!parsed.ok) {
    throw createError({
      statusCode: HTTP_BAD_REQUEST,
      statusMessage: parsed.error,
    })
  }

  const { source, contact, name, message, fields, pagePath } = parsed.data

  let created: CreateLeadData['createLead']

  try {
    const data = await fetchGraphQL<CreateLeadData>(CREATE_LEAD_MUTATION, {
      source,
      contact,
      name: name || null,
      message: message || null,
      payload: JSON.stringify(fields),
      pagePath: pagePath || null,
    })
    created = data.createLead
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: HTTP_SERVICE_UNAVAILABLE,
      statusMessage: 'Lead storage unavailable',
      message: `Lead storage unavailable: ${detail}`,
      cause: error,
    })
  }

  const config = useRuntimeConfig(event)
  const telegram = resolveTelegramConfig(config)
  let telegramDelivered = false

  if (telegram) {
    try {
      await sendTelegramMessage({
        config: telegram,
        text: buildLeadTelegramNotify({
          id: created.id,
          source,
          name,
          contact,
          message,
          fields,
          pagePath,
        }),
      })
      telegramDelivered = true
    } catch {
      // Lead already saved in DB — Telegram is best-effort.
    }
  }

  return {
    ok: true,
    id: created.id,
    source: created.source,
    createdAt: created.createdAt,
    delivered: {
      database: true,
      telegram: telegramDelivered,
    },
  }
})
