import nodemailer from 'nodemailer'
import type { SubscribeEmailContent } from './subscribe-template'

export type SmtpMailConfig = {
  host: string
  port: number
  user: string
  pass: string
  from: string
  secure: boolean
}

export function resolveSmtpConfig(runtime: {
  smtpHost?: string
  smtpPort?: string | number
  smtpUser?: string
  smtpPass?: string
  smtpFrom?: string
  smtpSecure?: string | boolean
}): SmtpMailConfig | null {
  const host = String(runtime.smtpHost || '').trim()
  const user = String(runtime.smtpUser || '').trim()
  const pass = String(runtime.smtpPass || '').trim()
  const from = String(runtime.smtpFrom || '').trim() || user
  const port = Number(runtime.smtpPort || 587)

  if (!host || !user || !pass || !from || !Number.isFinite(port)) {
    return null
  }

  const secure =
    runtime.smtpSecure === true ||
    runtime.smtpSecure === 'true' ||
    port === 465

  return { host, port, user, pass, from, secure }
}

export async function sendMail(options: {
  config: SmtpMailConfig
  to: string
  content: SubscribeEmailContent
}): Promise<void> {
  const transporter = nodemailer.createTransport({
    host: options.config.host,
    port: options.config.port,
    secure: options.config.secure,
    auth: {
      user: options.config.user,
      pass: options.config.pass,
    },
  })

  await transporter.sendMail({
    from: options.config.from,
    to: options.to,
    subject: options.content.subject,
    text: options.content.text,
    html: options.content.html,
  })
}
