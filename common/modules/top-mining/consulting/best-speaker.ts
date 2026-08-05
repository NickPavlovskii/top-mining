/**
 * Папка consulting — лендинг консалтинга.
 * Контент блока лучшего спикера.
 */
import bestImgGirl from '~/assets/images/consulting/best-img-girl.jpg'

export const CONSULTING_BEST_SPEAKER = {
  title: 'МЫ СОБИРАЕМ ЛУЧШИХ ЭКСПЕРТОВ В\u00a0МИРЕ МАЙНИНГА!',
  subtitle:
    'Вы лучший в какой-то сфере в майнинге и хотите стать нашим партнером, экспертом ТОП МАЙНИНГА ?',
  telegramLead: 'Напишите нам в',
  telegramLabel: 'TELEGRAM',
  telegramTail: 'или оставьте резюме / напишите о себе / оставьте ваш контакт',
  telegramHref: 'https://t.me/Top_mining_consulting',
  anonymityNote: 'Все отклики абсолютно анонимны!',
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
  ],
  textarea: {
    name: 'textarea-best',
    placeholder: 'В чем вы лучший в майнинге',
    required: true,
  },
  fileUpload: {
    accept: '.pdf,.doc',
    allowedExtensions: ['pdf', 'doc'] as const,
    maxFiles: 1,
    maxSizeMb: 10,
    chooseLabel: 'Выберите файл',
    counterTemplate: 'из',
    invalidFormatError: 'Неправильный формат файла. Разрешены PDF и DOC',
    invalidSizeError: 'Размер файла не должен превышать 10 МБ',
    removeFileLabel: 'Удалить файл',
  },
  submitLabel: 'ОТПРАВИТЬ',
  honeypotLabel: 'Оставьте это поле пустым.',
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  bestImgGirl,
} as const
