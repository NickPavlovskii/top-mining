import { describe, expect, it } from 'vitest'
import {
  isValidSubscribeEmail,
  normalizeSubscribeEmail,
  parseSubscribeSubmit,
} from '~/common/modules/top-mining/layout/subscribe'
import { buildSubscribeWelcomeEmail } from '~/server/utils/mail/subscribe-template'
import { resolveSmtpConfig } from '~/server/utils/mail/send'
import {
  buildSubscribeTelegramNotify,
  resolveTelegramConfig,
} from '~/server/utils/telegram/send'

describe('subscribe email', () => {
  it('normalizes and validates email', () => {
    expect(normalizeSubscribeEmail('  User@Mail.RU ')).toBe('user@mail.ru')
    expect(isValidSubscribeEmail('user@mail.ru')).toBe(true)
    expect(isValidSubscribeEmail('not-an-email')).toBe(false)
    expect(isValidSubscribeEmail('')).toBe(false)
  })

  it('parses subscribe payload with zod', () => {
    const ok = parseSubscribeSubmit({
      email: '  User@Mail.RU ',
      source: 'footer',
      website: '',
    })

    expect(ok).toEqual({
      ok: true,
      data: {
        email: 'user@mail.ru',
        source: 'footer',
        website: '',
      },
    })

    expect(parseSubscribeSubmit({ email: 'bad' }).ok).toBe(false)
  })

  it('builds branded welcome letter', () => {
    const letter = buildSubscribeWelcomeEmail('user@mail.ru')

    expect(letter.subject).toContain('ТОП МАЙНИНГ')
    expect(letter.html).toContain('user@mail.ru')
    expect(letter.html).toContain('Подписка оформлена')
    expect(letter.html).toContain('Калькулятор')
    expect(letter.html).toContain('Конвертер')
    expect(letter.html).toContain('top-mining.ru')
    expect(letter.html).toContain('cid:tm-logo-mark')
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

  it('builds telegram notify and resolves bot config', () => {
    expect(resolveTelegramConfig({})).toBeNull()
    expect(
      resolveTelegramConfig({
        telegramBotToken: '123:ABC',
        telegramChatId: '-100123',
      }),
    ).toEqual({
      botToken: '123:ABC',
      chatId: '-100123',
    })

    const text = buildSubscribeTelegramNotify({
      email: 'a<b>@x.com',
      source: 'footer',
    })
    expect(text).toContain('Новая подписка')
    expect(text).toContain('a&lt;b&gt;@x.com')
    expect(text).toContain('footer')
  })
})
