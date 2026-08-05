/**
 * Папка consulting — лендинг консалтинга.
 * Поля форм строительства / заявок.
 */
export type ConsultingConstructionFormField = {
  name: string
  placeholder: string
  required?: boolean
  autocomplete?: string
}

export type ConsultingConstructionForm = {
  id: string
  titleLines: string[]
  fields: ConsultingConstructionFormField[]
}

export const CONSULTING_CONSTRUCTION_FORMS = {
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  submitLabel: 'Отправить',
  honeypotLabel: 'Оставьте это поле пустым.',
  forms: [
    {
      id: 'sell',
      titleLines: [
        'Продать дата-центр',
        'Продать мощность (МВт)',
        'Продать землю (под МВт)',
        'Сдать в аренду',
      ],
      fields: [
        {
          name: 'your-name',
          placeholder: 'Ваше имя',
          required: true,
          autocomplete: 'name',
        },
        { name: 'region', placeholder: 'Регион' },
        { name: 'power', placeholder: 'Мощность' },
        {
          name: 'price',
          placeholder: 'Ориентировочная стоимость ЭЭ',
        },
        {
          name: 'your-telegram',
          placeholder: 'Ваш Telegram',
          required: true,
        },
      ],
    },
    {
      id: 'buy',
      titleLines: [
        'Купить дата-центр',
        'Построить дата-центр',
        'Взять в аренду',
      ],
      fields: [
        {
          name: 'your-name',
          placeholder: 'Ваше имя',
          required: true,
          autocomplete: 'name',
        },
        { name: 'invesr_value', placeholder: 'Размер инвестиций' },
        {
          name: 'your-telegram',
          placeholder: 'Ваш Telegram',
          required: true,
        },
      ],
    },
  ],
} as const satisfies {
  privacyPrefix: string
  privacyLinkLabel: string
  privacyHref: string
  submitLabel: string
  honeypotLabel: string
  forms: ConsultingConstructionForm[]
}
