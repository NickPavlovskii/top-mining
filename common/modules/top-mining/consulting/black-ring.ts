/**
 * Папка consulting — лендинг консалтинга.
 * Контент секции black-ring.
 */
import blackRingBg from '~/assets/images/consulting/black-ring-bg.png'
import blackRingImg from '~/assets/images/consulting/black-ring.png'

export const CONSULTING_BLACK_RING = {
  title: 'Размещение вашей организации на портале',
  fields: [
    {
      name: 'your-name',
      placeholder: 'Ваше имя',
      required: true,
      autocomplete: 'name',
      width: 'half' as const,
    },
    {
      name: 'your-telegram',
      placeholder: 'Ваш Telegram',
      required: true,
      width: 'half' as const,
    },
    {
      name: 'company',
      placeholder: 'Компания',
      width: 'full' as const,
    },
  ],
  submitLabel: 'Отправить',
  honeypotLabel: 'Оставьте это поле пустым.',
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  telegramLead: 'Или напишите нам в',
  telegramLabel: 'TELEGRAM',
  telegramHref: 'https://t.me/Top_mining_consulting',
  priceLabel: 'Общая стоимость:',
  priceValue: 'Бесплатно',
  blackRingBg,
  blackRingImg,
} as const
