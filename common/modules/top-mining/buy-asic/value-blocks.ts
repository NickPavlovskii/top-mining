import { INCREASE_INCOME_PAGE_PATH } from '~/common/modules/top-mining/increase-income-page'

export type BuyAsicTextPart = {
  text: string
  bold?: boolean
}

export type BuyAsicHowWeWorkStep = {
  id: string
  /** Step number badge; omit / null for the highlighted result card */
  number: number | null
  parts: BuyAsicTextPart[]
  highlighted?: boolean
}

export type BuyAsicValueCard = {
  id: string
  title: string
  subtitle?: string
  items: string[]
  moreItems?: string[]
  footnote?: string
  cta?: {
    href: string
    label: string
    labelAccent?: string
  }
  fullWidth?: boolean
}

export const BUY_ASIC_HOW_WE_WORK = {
  titleId: 'buy-asic-how-we-work-title',
  titleLead: 'СНИЗИМ ЦЕНУ НА',
  titleAccent: '7%',
  titleTail: 'НА ПОКУПКЕ МАЙНИНГ-ОБОРУДОВАНИЯ',
  subtitle: 'Как мы работаем:',
  steps: [
    {
      id: 'request',
      number: 1,
      parts: [
        { text: 'Скидываем всем компаниям ' },
        { text: 'запрос', bold: true },
        { text: ' цены асика и\u00a0тарифы хостинга' },
      ],
    },
    {
      id: 'collect',
      number: 2,
      parts: [
        { text: 'Собираем всю ' },
        { text: 'информацию по\u00a0тарифам, ценам', bold: true },
      ],
    },
    {
      id: 'negotiate',
      number: 3,
      parts: [
        { text: 'Ведем ' },
        { text: 'переговоры', bold: true },
        {
          text: ' со всеми компаниями. Вносим правки в договор. Торгуемся. Учитываем все риски',
        },
      ],
    },
    {
      id: 'offer',
      number: null,
      highlighted: true,
      parts: [{ text: 'Делаем вам наиболее выгодное предложение' }],
    },
  ] satisfies BuyAsicHowWeWorkStep[],
} as const

export const BUY_ASIC_SAFETY = {
  titleId: 'buy-asic-safety-title',
  titleLines: ['ОБЕСПЕЧИВАЕМ 100%', 'БЕЗОПАСНОСТЬ'],
  cards: [
    {
      id: 'risks',
      title: 'Уберем риски на старте, сбережем 5% от вложений',
      subtitle:
        'Снимем с вас юридические риски, которые часто\u00a0забирают 5-10 млн\u00a0₽',
      items: [
        'Как управлять рисками при покупке оборудования?',
        'Какие риски стоит учитывать при поставке асиков?',
        'Какие нужны документы от компании?',
        'Как избежать налоговых рисков при поставке? Что должно быть в договоре?',
      ],
      moreItems: [
        'Как легально заключить сделку, чтобы ваши асики не изъяли «контролирующие органы РФ»?',
        'Как получить страхование оборудования?',
        'Решаем проблемы поломанных асиков (из партии обычно ломается 3 процента (3 млн ₽ из ваших вложенных 100 млн ₽)',
        'Каждый день просрочки поставки — эти незаработанные деньги. Мы уберем вопросы с таможней, решим, в случае возникновения',
      ],
    },
    {
      id: 'secure',
      title: 'С нами ваши асики и вложения в безопасности',
      subtitle: 'Ваша безопасность иногда важнее любых экономий',
      items: [
        'Ваши асики доедут. ТОП МАЙНИНГ — гарант безопасности доставки. Не будет переносов, не будет банкротств',
        'Будут все документы на выходе после завершения сделки',
        'Ваши асики встанут в майнинг-отель',
        'Ваши асики не украдут',
        'Решаем вопросы затяжных ремонтов, вы не потеряете деньги',
      ],
      footnote: '*можем сделать все конфиденциально',
    },
  ] satisfies BuyAsicValueCard[],
} as const

export const BUY_ASIC_TIME_SAVE = {
  titleId: 'buy-asic-time-save-title',
  titleLines: ['ЭКОНОМИМ ВАМ В СРЕДНЕМ', '100+ ЧАСОВ ВАШЕГО ВРЕМЕНИ'],
  cards: [
    {
      id: 'asic-supply',
      title:
        '1. Подбор, закупка и поставка ASIC-майнеров. Самые низкие цены на рынке',
      subtitle:
        'Сколько зарабатывают майнинговые компании на продаже вам оборудования? Поможем вам скинуть этот процент в 2 раза',
      items: [
        'Что стоит учитывать при выборе асиков?',
        'Как выбрать оборудование с оптимальным соотношением цены и производительности?',
        'Собьем цены поставщиков',
        'Кредит / лизинг / рассрочка / инвестиции',
      ],
      moreItems: [
        'Как правильно составить договор поставки, что нужно учитывать?',
        'Как соблюсти сроки поставки и получить асики вовремя?',
        'Какие нужны документы от компании?',
        'Как зарегистрировать свои асики в соответствии с новым законом?',
      ],
      cta: {
        href: '#buy-asic-models',
        label: 'ПОДРОБНЕЕ',
        labelAccent: 'О ПОКУПКЕ ASIC-МАЙНЕРОВ',
      },
    },
    {
      id: 'hotel',
      title: '2. Подбор майнинг-отеля. Максимально выгодные условия',
      items: [
        'Что стоит учитывать при выборе майнинг-отеля?',
        'Какие документы нужны от компании?',
        'Как правильно составить договор на майнинг-отель, что нужно учитывать?',
        'Как утвердить и зафиксировать сроки размещения по вашему тарифу?',
        'На что стоит обратить внимание при расторжении договора?',
        'Как подобрать легальный хостинг?',
        'Что нужно знать о платеже за установку асика? (переезд на новый хостинг или размещение без покупки)',
      ],
      moreItems: [
        'На что стоит обратить внимание при выборе региона площадки?',
        'Как снизить затраты на электроэнергию?',
        'Безопасность размещения',
      ],
    },
    {
      id: 'income',
      fullWidth: true,
      title:
        '3. Ваши асики зарабатывают от\u00a0100.000 ₽ в\u00a0месяц?\nУвеличим вашу чистую прибыль на 7%',
      subtitle: 'Хотите узнать как?',
      items: [],
      cta: {
        href: INCREASE_INCOME_PAGE_PATH,
        label: 'ПОДРОБНЕЕ',
        labelAccent: 'ОБ УВЕЛИЧЕНИИ ДОХОДА',
      },
    },
  ] satisfies BuyAsicValueCard[],
} as const

export const BUY_ASIC_VALUE_BLOCKS = {
  howWeWork: BUY_ASIC_HOW_WE_WORK,
  safety: BUY_ASIC_SAFETY,
  timeSave: BUY_ASIC_TIME_SAVE,
  seeMoreLabel: 'Показать еще',
  seeLessLabel: 'Скрыть',
} as const
