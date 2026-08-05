import { describe, expect, it } from 'vitest'
import {
  isValidSubscribeEmail,
  normalizeSubscribeEmail,
} from '~/common/modules/top-mining/layout/subscribe'
import { buildSubscribeWelcomeEmail } from '~/server/utils/mail/subscribe-template'
import { resolveSmtpConfig } from '~/server/utils/mail/send'

describe('subscribe email', () => {
  it('normalizes and validates email', () => {
    expect(normalizeSubscribeEmail('  User@Mail.RU ')).toBe('user@mail.ru')
    expect(isValidSubscribeEmail('user@mail.ru')).toBe(true)
    expect(isValidSubscribeEmail('not-an-email')).toBe(false)
    expect(isValidSubscribeEmail('')).toBe(false)
  })

  it('builds branded welcome letter', () => {
    const letter = buildSubscribeWelcomeEmail('user@mail.ru')

    expect(letter.subject).toContain('ТОП МАЙНИНГ')
    expect(letter.html).toContain('user@mail.ru')
    expect(letter.html).toContain('Подписка оформлена')
    expect(letter.text).toContain('user@mail.ru')
  })

  it('escapes html in email address', () => {
    const letter = buildSubscribeWelcomeEmail('a<b>@x.com')

    expect(letter.html).toContain('a&lt;b&gt;@x.com')
    expect(letter.html).not.toContain('a<b>@x.com')
  })

  it('resolves smtp only when required fields exist', () => {
    expect(resolveSmtpConfig({})).toBeNull()
    expect(
      resolveSmtpConfig({
        smtpHost: 'smtp.example.com',
        smtpUser: 'u',
        smtpPass: 'p',
        smtpFrom: 'noreply@example.com',
        smtpPort: '465',
      }),
    ).toMatchObject({
      host: 'smtp.example.com',
      port: 465,
      secure: true,
    })
  })
})
