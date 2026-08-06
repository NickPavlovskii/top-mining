export type TelegramConfig = {
  botToken: string
  chatId: string
}

export function resolveTelegramConfig(runtime: {
  telegramBotToken?: string
  telegramChatId?: string
}): TelegramConfig | null {
  const botToken = String(runtime.telegramBotToken || '').trim()
  const chatId = String(runtime.telegramChatId || '').trim()

  if (!botToken || !chatId) {
    return null
  }

  return { botToken, chatId }
}

export async function sendTelegramMessage(options: {
  config: TelegramConfig
  text: string
  parseMode?: 'HTML' | 'MarkdownV2'
}): Promise<void> {
  const url = `https://api.telegram.org/bot${options.config.botToken}/sendMessage`

  const response = await fetch(url, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({
      chat_id: options.config.chatId,
      text: options.text,
      parse_mode: options.parseMode || 'HTML',
      disable_web_page_preview: true,
    }),
  })

  const payload = (await response.json().catch(() => null)) as {
    ok?: boolean
    description?: string
  } | null

  if (!response.ok || !payload?.ok) {
    throw new Error(
      payload?.description || `Telegram API error (${response.status})`,
    )
  }
}

export function buildSubscribeTelegramNotify(options: {
  email: string
  source?: string | null
}): string {
  const source = options.source || 'unknown'
  return [
    '<b>Новая подписка на рассылку</b>',
    '',
    `📧 Email: <code>${escapeTelegramHtml(options.email)}</code>`,
    `📍 Источник: <code>${escapeTelegramHtml(source)}</code>`,
    `🕒 ${new Date().toLocaleString('ru-RU', { timeZone: 'Europe/Moscow' })}`,
  ].join('\n')
}

export function buildLeadTelegramNotify(options: {
  id: number
  source: string
  name?: string
  contact: string
  message?: string
  fields?: Record<string, string>
  pagePath?: string
}): string {
  const lines = [
    `<b>Новая заявка #${options.id}</b>`,
    '',
    `📍 Источник: <code>${escapeTelegramHtml(options.source)}</code>`,
  ]

  if (options.name) {
    lines.push(`👤 Имя: <code>${escapeTelegramHtml(options.name)}</code>`)
  }

  lines.push(
    `📞 Контакт: <code>${escapeTelegramHtml(options.contact)}</code>`,
  )

  if (options.message) {
    lines.push(`💬 Сообщение: ${escapeTelegramHtml(options.message)}`)
  }

  const fields = options.fields || {}
  for (const [key, value] of Object.entries(fields)) {
    if (!value?.trim()) {
      continue
    }
    lines.push(
      `• ${escapeTelegramHtml(key)}: <code>${escapeTelegramHtml(value)}</code>`,
    )
  }

  if (options.pagePath) {
    lines.push(`🔗 Страница: <code>${escapeTelegramHtml(options.pagePath)}</code>`)
  }

  lines.push(
    `🕒 ${new Date().toLocaleString('ru-RU', { timeZone: 'Europe/Moscow' })}`,
  )

  return lines.join('\n')
}

function escapeTelegramHtml(value: string): string {
  return value
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
}
