export type SubscribeEmailContent = {
  subject: string
  text: string
  html: string
}

export function buildSubscribeWelcomeEmail(
  email: string,
): SubscribeEmailContent {
  const subject = 'Добро пожаловать в рассылку ТОП МАЙНИНГ'
  const siteUrl = 'https://top-mining.ru'
  const calculatorUrl = 'https://top-mining.ru/calculator/'
  const converterUrl = 'https://top-mining.ru/konverter-heshrejta/'
  const telegramUrl = 'https://t.me/TOP_MINING_CONSULTING'
  const safeEmail = escapeHtml(email)

  const text = [
    'Здравствуйте!',
    '',
    'Вы подписались на рассылку ТОП МАЙНИНГ.',
    'Будем присылать новости майнинга, обзоры ASIC/GPU и полезные материалы.',
    '',
    `Ваш e-mail: ${email}`,
    '',
    `Сайт: ${siteUrl}`,
    `Калькулятор: ${calculatorUrl}`,
    `Конвертер хешрейта: ${converterUrl}`,
    `Telegram: ${telegramUrl}`,
    '',
    'Если письмо пришло по ошибке — просто проигнорируйте его.',
  ].join('\n')

  const html = `<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>${escapeHtml(subject)}</title>
  <!--[if mso]>
  <style type="text/css">
    body, table, td { font-family: Arial, Helvetica, sans-serif !important; }
  </style>
  <![endif]-->
</head>
<body style="margin:0;padding:0;background-color:#0f0f0f;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;">
  <div style="display:none;max-height:0;overflow:hidden;opacity:0;">
    Подписка оформлена — новости майнинга, калькулятор и обзоры от ТОП МАЙНИНГ.
  </div>
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color:#0f0f0f;padding:0;margin:0;">
    <tr>
      <td align="center" style="padding:40px 16px;">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="max-width:600px;border-collapse:separate;">

          <!-- Brand -->
          <tr>
            <td align="center" style="padding:0 0 20px;">
              <img
                src="cid:tm-logo-mark"
                width="56"
                height="56"
                alt="ТОП МАЙНИНГ"
                style="display:block;width:56px;height:56px;border:0;border-radius:14px;margin:0 auto 12px;"
              />
              <span style="font-family:Arial,Helvetica,sans-serif;font-size:12px;letter-spacing:0.22em;text-transform:uppercase;color:#ff8a1f;font-weight:700;">
                TOP MINING
              </span>
            </td>
          </tr>

          <!-- Card -->
          <tr>
            <td style="background-color:#1a1a1a;border:1px solid #2c2c2c;border-radius:28px;overflow:hidden;">
              <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0">

                <!-- Orange header bar -->
                <tr>
                  <td style="background-color:#ff7a18;background-image:linear-gradient(90deg,#ff6a00,#ff9f1a);padding:0;">
                    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td style="padding:32px 36px 28px;">
                          <p style="margin:0 0 10px;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1;letter-spacing:0.14em;text-transform:uppercase;color:#1a1208;font-weight:700;">
                            Рассылка
                          </p>
                          <h1 style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:30px;line-height:1.15;color:#141414;font-weight:800;">
                            Подписка оформлена
                          </h1>
                          <p style="margin:14px 0 0;font-family:Arial,Helvetica,sans-serif;font-size:15px;line-height:1.45;color:#3a2410;">
                            Добро пожаловать в сообщество ТОП МАЙНИНГ
                          </p>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>

                <!-- Body -->
                <tr>
                  <td style="padding:32px 36px 8px;">
                    <p style="margin:0 0 18px;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.55;color:#f6f6f6;">
                      Здравствуйте!
                    </p>
                    <p style="margin:0 0 18px;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.55;color:#cfcfcf;">
                      Вы успешно подписались на нашу рассылку. Будем присылать свежие новости майнинга,
                      обзоры оборудования и практические материалы на
                      <a href="mailto:${safeEmail}" style="color:#ff9f1a;text-decoration:none;font-weight:700;">${safeEmail}</a>.
                    </p>
                  </td>
                </tr>

                <!-- Feature cards -->
                <tr>
                  <td style="padding:8px 28px 8px;">
                    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td style="padding:8px;">
                          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color:#222222;border:1px solid #333333;border-radius:16px;">
                            <tr>
                              <td style="padding:18px 20px;">
                                <p style="margin:0 0 6px;font-family:Arial,Helvetica,sans-serif;font-size:13px;letter-spacing:0.08em;text-transform:uppercase;color:#ff8a1f;font-weight:700;">
                                  Калькулятор
                                </p>
                                <p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:1.45;color:#d0d0d0;">
                                  Считайте доходность ASIC, GPU и CPU онлайн.
                                </p>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td style="padding:8px;">
                          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color:#222222;border:1px solid #333333;border-radius:16px;">
                            <tr>
                              <td style="padding:18px 20px;">
                                <p style="margin:0 0 6px;font-family:Arial,Helvetica,sans-serif;font-size:13px;letter-spacing:0.08em;text-transform:uppercase;color:#ff8a1f;font-weight:700;">
                                  Конвертер
                                </p>
                                <p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:1.45;color:#d0d0d0;">
                                  Переводите хешрейт из H/s в ZH/s за секунды.
                                </p>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td style="padding:8px;">
                          <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color:#222222;border:1px solid #333333;border-radius:16px;">
                            <tr>
                              <td style="padding:18px 20px;">
                                <p style="margin:0 0 6px;font-family:Arial,Helvetica,sans-serif;font-size:13px;letter-spacing:0.08em;text-transform:uppercase;color:#ff8a1f;font-weight:700;">
                                  Консалтинг
                                </p>
                                <p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:1.45;color:#d0d0d0;">
                                  Поможем с отелем, закупкой ASIC и ростом дохода.
                                </p>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>

                <!-- CTA -->
                <tr>
                  <td align="center" style="padding:28px 36px 12px;">
                    <table role="presentation" cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td align="center" bgcolor="#ff7a18" style="border-radius:999px;background-color:#ff7a18;">
                          <a href="${siteUrl}" style="display:inline-block;padding:15px 28px;font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:800;color:#141414;text-decoration:none;">
                            Открыть top-mining.ru
                          </a>
                        </td>
                      </tr>
                    </table>
                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" style="margin-top:12px;">
                      <tr>
                        <td align="center" style="padding-right:8px;">
                          <a href="${calculatorUrl}" style="display:inline-block;padding:12px 18px;font-family:Arial,Helvetica,sans-serif;font-size:13px;font-weight:600;color:#f6f6f6;text-decoration:none;border:1px solid #3a3a3a;border-radius:999px;">
                            Калькулятор
                          </a>
                        </td>
                        <td align="center" style="padding-left:8px;">
                          <a href="${telegramUrl}" style="display:inline-block;padding:12px 18px;font-family:Arial,Helvetica,sans-serif;font-size:13px;font-weight:600;color:#f6f6f6;text-decoration:none;border:1px solid #3a3a3a;border-radius:999px;">
                            Telegram
                          </a>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>

                <!-- Note -->
                <tr>
                  <td style="padding:8px 36px 32px;">
                    <p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:13px;line-height:1.5;color:#8a8a8a;text-align:center;">
                      Если письмо пришло по ошибке — просто проигнорируйте его.
                      Вы не будете получать регулярную рассылку без согласия.
                    </p>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td align="center" style="padding:24px 12px 0;">
              <p style="margin:0 0 8px;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1.5;color:#777777;">
                © ТОП МАЙНИНГ · консалтинг, рейтинги и инструменты для майнеров
              </p>
              <p style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1.5;color:#555555;">
                <a href="${siteUrl}" style="color:#999999;text-decoration:underline;">top-mining.ru</a>
                &nbsp;·&nbsp;
                <a href="${converterUrl}" style="color:#999999;text-decoration:underline;">конвертер</a>
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
