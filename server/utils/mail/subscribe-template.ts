export type SubscribeEmailContent = {
  subject: string
  text: string
  html: string
}

export function buildSubscribeWelcomeEmail(
  email: string,
): SubscribeEmailContent {
  const subject = 'Вы подписались на рассылку ТОП МАЙНИНГ'
  const siteUrl = 'https://top-mining.ru'
  const telegramUrl = 'https://t.me/TOP_MINING_CONSULTING'

  const text = [
    'Здравствуйте!',
    '',
    'Вы подписались на рассылку ТОП МАЙНИНГ.',
    'Будем присылать новости майнинга, обзоры и полезные материалы.',
    '',
    `Сайт: ${siteUrl}`,
    `Telegram: ${telegramUrl}`,
    '',
    `Ваш e-mail: ${email}`,
  ].join('\n')

  const html = `<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${subject}</title>
</head>
<body style="margin:0;padding:0;background:#141414;color:#f6f6f6;font-family:'Segoe UI',Arial,sans-serif;">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#141414;padding:32px 16px;">
    <tr>
      <td align="center">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="max-width:560px;background:#1c1c1c;border-radius:24px;overflow:hidden;border:1px solid #2a2a2a;">
          <tr>
            <td style="padding:28px 28px 16px;background:linear-gradient(90deg,#ff7a18,#ff9f1a);">
              <p style="margin:0;font-size:13px;letter-spacing:0.08em;text-transform:uppercase;color:#141414;font-weight:700;">
                ТОП МАЙНИНГ
              </p>
              <h1 style="margin:12px 0 0;font-size:28px;line-height:1.2;color:#141414;font-weight:700;">
                Подписка оформлена
              </h1>
            </td>
          </tr>
          <tr>
            <td style="padding:28px;">
              <p style="margin:0 0 16px;font-size:16px;line-height:1.5;color:#f6f6f6;">
                Здравствуйте!
              </p>
              <p style="margin:0 0 16px;font-size:16px;line-height:1.5;color:#d8d8d8;">
                Вы подписались на нашу рассылку. Будем присылать новости майнинга,
                обзоры оборудования и полезные материалы на
                <strong style="color:#ff9f1a;">${escapeHtml(email)}</strong>.
              </p>
              <p style="margin:0 0 24px;font-size:16px;line-height:1.5;color:#d8d8d8;">
                Если письмо пришло по ошибке — просто проигнорируйте его.
              </p>
              <table role="presentation" cellspacing="0" cellpadding="0">
                <tr>
                  <td style="border-radius:999px;background:#ff7a18;">
                    <a href="${siteUrl}" style="display:inline-block;padding:14px 22px;color:#141414;text-decoration:none;font-weight:700;font-size:14px;">
                      Перейти на сайт
                    </a>
                  </td>
                  <td width="12"></td>
                  <td style="border-radius:999px;border:1px solid #3a3a3a;">
                    <a href="${telegramUrl}" style="display:inline-block;padding:14px 22px;color:#f6f6f6;text-decoration:none;font-weight:600;font-size:14px;">
                      Telegram
                    </a>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td style="padding:0 28px 28px;">
              <p style="margin:0;font-size:12px;line-height:1.4;color:#8a8a8a;">
                © ТОП МАЙНИНГ · консалтинг, рейтинги и инструменты для майнеров
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>`

  return { subject, text, html }
}

function escapeHtml(value: string): string {
  return value
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
}
