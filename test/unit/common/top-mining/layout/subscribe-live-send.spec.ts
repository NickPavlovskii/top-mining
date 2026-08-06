import fs from 'node:fs'
import path from 'node:path'
import { describe, expect, it } from 'vitest'
import { buildSubscribeWelcomeEmail } from '~/server/utils/mail/subscribe-template'
import { resolveSmtpConfig, sendMail } from '~/server/utils/mail/send'

function readEnvSmtp() {
  const envPath = path.resolve('.env')
  if (!fs.existsSync(envPath)) {
    return null
  }

  const values: Record<string, string> = {}
  for (const line of fs.readFileSync(envPath, 'utf8').split(/\r?\n/)) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) {
      continue
    }
    const eq = trimmed.indexOf('=')
    if (eq <= 0) {
      continue
    }
    const key = trimmed.slice(0, eq).trim()
    let value = trimmed.slice(eq + 1).trim()
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1)
    }
    values[key] = value
  }

  return resolveSmtpConfig({
    smtpHost: values.SMTP_HOST,
    smtpPort: values.SMTP_PORT,
    smtpUser: values.SMTP_USER,
    smtpPass: values.SMTP_PASS,
    smtpFrom: values.SMTP_FROM,
    smtpSecure: values.SMTP_SECURE,
  })
}

describe('subscribe email live send', () => {
  it(
    'sends branded welcome email to o_niklad_o@list.ru when SEND_LIVE_EMAIL=1',
    async () => {
      if (process.env.SEND_LIVE_EMAIL !== '1') {
        return
      }

      const smtp = readEnvSmtp()
      expect(smtp).not.toBeNull()
      if (!smtp) {
        return
      }

      const to = 'o_niklad_o@list.ru'
      await sendMail({
        config: smtp,
        to,
        content: buildSubscribeWelcomeEmail(to),
      })
    },
    30_000,
  )
})
