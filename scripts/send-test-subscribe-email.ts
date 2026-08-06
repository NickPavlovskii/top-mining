import fs from 'node:fs'
import path from 'node:path'
import { buildSubscribeWelcomeEmail } from '../server/utils/mail/subscribe-template'
import { resolveSmtpConfig, sendMail } from '../server/utils/mail/send'

function loadEnvFile(filePath: string) {
  if (!fs.existsSync(filePath)) {
    return
  }

  const raw = fs.readFileSync(filePath, 'utf8')
  for (const line of raw.split(/\r?\n/)) {
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

    if (!(key in process.env)) {
      process.env[key] = value
    }
  }
}

loadEnvFile(path.resolve('.env'))

const to = process.argv[2] || 'o_niklad_o@list.ru'

const smtp = resolveSmtpConfig({
  smtpHost: process.env.SMTP_HOST,
  smtpPort: process.env.SMTP_PORT,
  smtpUser: process.env.SMTP_USER,
  smtpPass: process.env.SMTP_PASS,
  smtpFrom: process.env.SMTP_FROM,
  smtpSecure: process.env.SMTP_SECURE,
})

if (!smtp) {
  console.error('SMTP is not configured in .env')
  process.exit(1)
}

const content = buildSubscribeWelcomeEmail(to)

await sendMail({
  config: smtp,
  to,
  content,
})

console.log(`Sent branded welcome email to ${to}`)
console.log(`From: ${smtp.from}`)
