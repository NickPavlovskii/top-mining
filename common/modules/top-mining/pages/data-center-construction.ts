import heroContainer from '~/assets/images/data-center-construction/hero-container.png'
import investIconNoRisk from '~/assets/images/data-center-construction/invest/invest-wrap-icon-1.svg'
import investIconStableIncome from '~/assets/images/data-center-construction/invest/invest-wrap-icon-2.svg'
import investIconEarnings from '~/assets/images/data-center-construction/invest/invest-wrap-icon-3.svg'
import investIconNoEntryFee from '~/assets/images/data-center-construction/invest/invest-wrap-icon-4.svg'
import investIconEnergySave from '~/assets/images/data-center-construction/invest/invest-wrap-icon-5.svg'
import investIconNoDeposit from '~/assets/images/data-center-construction/invest/invest-wrap-icon-6.svg'
import investIconScale from '~/assets/images/data-center-construction/invest/invest-wrap-icon-7.svg'
import investIconControl from '~/assets/images/data-center-construction/invest/invest-wrap-icon-8.svg'

export const DATA_CENTER_CONSTRUCTION_PAGE_PATH = '/data-center-construction/'

export const DATA_CENTER_CALC_FOOTNOTE =
  'Для расчетов использовали ASIC-майнер Bitmain Antminer S21 Pro 234 Th/s, потребление 3,51 кВт/ч, цена 310 000 ₽, 1427 единиц (5 МВт), курс BTC-USDT 100 000 USDT, курс USDT-RUB 100 ₽.'

export const DATA_CENTER_CALCULATOR_HREF = '/calculator/'

export const DATA_CENTER_CTA_FORM_DEFAULTS = {
  phonePlaceholder: 'Телефон',
  honeypotLabel: 'Оставьте это поле пустым.',
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
} as const

export type DataCenterCtaFormDefaults = typeof DATA_CENTER_CTA_FORM_DEFAULTS

export type DataCenterCtaFormVariant = 'hero' | 'compact'

export type DataCenterCtaFormSubmitPayload = {
  phone: string
}

export type DataCenterCtaFormCardProps = {
  title: string
  text: string
  submitLabel: string
  phonePlaceholder?: string
  honeypotLabel?: string
  privacyPrefix?: string
  privacyLinkLabel?: string
  privacyHref?: string
  titleId?: string
  variant?: DataCenterCtaFormVariant
}

export type DataCenterCtaSectionCopy = {
  id: string
  title: string
  text: string
  submitLabel: string
} & DataCenterCtaFormDefaults

export type DataCenterMiniTableRow = {
  label: string
  value: string
  accent?: boolean
}

export type DataCenterMiniTable = {
  title: string
  rows: readonly DataCenterMiniTableRow[]
}

export type DataCenterBusinessModelBase = {
  id: string
  label: string
  title: string
  invested: string
  resultHighlight: string
  resultText: string
}

export type DataCenterBusinessModelGrid = DataCenterBusinessModelBase & {
  kind: 'grid'
  highlightColumn: number
  columns: readonly (readonly string[])[]
}

export type DataCenterBusinessModelText = DataCenterBusinessModelBase & {
  kind: 'text'
  paragraphs: readonly { html: string }[]
}

export type DataCenterBusinessModelDual = DataCenterBusinessModelBase & {
  kind: 'dual'
  miniTables: readonly DataCenterMiniTable[]
}

export type DataCenterBusinessModelItem =
  | DataCenterBusinessModelGrid
  | DataCenterBusinessModelText
  | DataCenterBusinessModelDual

export type DataCenterStageItem = {
  title: string
  intro?: string
  introLast?: boolean
  points?: readonly string[]
  example?: string
}

export type DataCenterPowerIconId = 'gaz' | 'el'

export type DataCenterPowerAlign = 'gaz-4' | 'gaz-6' | 'row-2' | 'row-3' | 'row-7'

export type DataCenterPowerCompareItem = {
  label: string
  text: string
  align?: DataCenterPowerAlign
}

export type DataCenterPowerCompareColumn = {
  id: string
  title: string
  icon: DataCenterPowerIconId
  items: readonly DataCenterPowerCompareItem[]
}

export type DataCenterWhyCompareCell = {
  title: string
  paragraphs: readonly string[]
}

export type { TopMiningCompareTableRow as DataCenterCompareTableRow } from '../ui/compare-table'
export { toCompareTableRows } from '../ui/compare-table'

export const DATA_CENTER_CONSTRUCTION_PAGE = {
  breadcrumb: 'Строительство дата-центров',
  seoTitle: 'Строительство дата-центров для майнинга под ключ | ТОП МАЙНИНГ',
  seoDescription:
    'Проектируем и строим современные дата-центры для майнинга под ключ с доходностью от 70% годовых. Инвестиции от 125 млн ₽, окупаемость от 17 мес.',
  hero: {
    title: 'СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРОВ ДЛЯ МАЙНИНГА ПОД КЛЮЧ',
    titleAccent: 'С ДОХОДНОСТЬЮ ОТ 70% ГОДОВЫХ',
    subtitle: 'ПОЛНЫЙ ЦИКЛ ОТ ИДЕИ ДО ЗАПУСКА',
    text: 'Мы проектируем и строим современные дата-центры любой сложности, обеспечивая полную реализацию проекта – от первичного аудита и инженерных расчетов до пусконаладки и ввода объекта в эксплуатацию.',
    image: heroContainer,
    imageAlt: 'Модульный дата-центр в контейнере с логотипом ТОП МАЙНИНГ',
    investmentLabel: 'Размер инвестиций',
    investmentValue: 'от 125 млн ₽',
    paybackLabel: 'Окупаемость',
    paybackValue: 'от 17 мес.',
    ctaLabel: 'ОСТАВИТЬ ЗАЯВКУ',
    ctaHref: '#data-center-offer',
    info: 'Термины «дата-центр», «майнинг-отель», «ЦОД» и «хостинг» означают одно и то же — место для размещения ASIC-майнеров.',
  },
  advantages: {
    title: 'ПРЕИМУЩЕСТВА ИНВЕСТИЦИЙ В ДАТА-ЦЕНТР',
    items: [
      {
        index: '01',
        title: 'БИЗНЕС СТРОИТЕЛЬСТВА – ЭТО ЛЕГКО',
        text: 'Знания о майнинге вам не нужны. Бизнес-модели 1-3: вам не нужно майнить для получения дохода, вы зарабатываете на продаже площадки или сдаче ее в аренду.',
      },
      {
        index: '02',
        title: 'НЕТ ПРИВЯЗКИ К КУРСАМ BTC ИЛИ $',
        text: 'Бизнес строительства дата-центра не привязан к курсу криптовалюты или доллара. Вам не нужно майнить для получения дохода, вы зарабатываете на продаже площадки или сдаче ее в аренду.',
      },
      {
        index: '03',
        title: 'ИНВЕСТИЦИИ В МАЙНИНГ – ЭТО ВЛОЖЕНИЯ БЕЗ РИСКОВ',
        text: 'Вся инфраструктура в вашей собственности и в любой момент можно продать дата-центр и выйти из бизнеса.\n\nНа этапе строительства ваша майнинг-площадка дорожает за счет рыночной ликвидности данного актива, а по окончанию она уже стоит на 20% дороже.',
      },
    ],
  },
  discuss: {
    id: 'data-center-discuss',
    title: 'ГОТОВЫ ОБСУДИТЬ СТРОИТЕЛЬСТВО ВАШЕГО ДАТА-ЦЕНТРА?',
    text: 'Оставьте заявку, и мы проведем для вас бесплатную предварительную оценку – рассчитаем мощность, определим подходящий формат и предложим ориентировочный бюджет именно под ваши задачи.',
    submitLabel: 'ОТПРАВИТЬ',
    ...DATA_CENTER_CTA_FORM_DEFAULTS,
  },
  offer: {
    title: 'НАШЕ ПРЕДЛОЖЕНИЕ',
    lead: 'Купить недвижимость в энергетике, выкупить дешевое электричество и продавать дорого.',
    beforeAccent: 'Уникальность нашего предложения – возможность покупки электричества',
    accent: 'по 3 ₽ за кВт/ч.',
    afterAccent: 'Узнайте как',
    phonePlaceholder: 'Телефон',
    submitLabel: 'УЗНАТЬ КАК',
    honeypotLabel: 'Оставьте это поле пустым.',
    privacyPrefix: 'Продолжая, вы соглашаетесь с',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
  models: {
    title: 'КАКИЕ ЕСТЬ МОДЕЛИ ЗАРАБОТКА НА СТРОИТЕЛЬСТВЕ ДАТА-ЦЕНТРА ПОД КЛЮЧ?',
    calculatorHref: DATA_CENTER_CALCULATOR_HREF,
    ctaLabel: 'ПОЛУЧИТЬ БИЗНЕС-МОДЕЛЬ',
    formSubmitLabel: 'ОТПРАВИТЬ',
    phonePlaceholder: 'Телефон',
    honeypotLabel: 'Оставьте это поле пустым.',
    privacyPrefix: 'Продолжая, вы соглашаетесь с',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
    businessModelModal: {
      downloadPromptPrefix: 'Оставьте ваш контакт, чтобы скачать',
      submitLabel: 'СКАЧАТЬ',
      phonePlaceholder: 'Телефон',
      phoneLabel: 'Телефон',
      honeypotLabel: 'Оставьте это поле пустым.',
      privacyPrefix: 'Продолжая, вы соглашаетесь с',
      privacyLinkLabel: 'Политикой конфиденциальности',
      privacyHref: '/privacy',
      closeLabel: 'Закрыть',
    },
    calcFootnote: DATA_CENTER_CALC_FOOTNOTE,
    scenarioLabels: [
      'Оптимальная модель',
      'Оптимистичная модель',
      'Пессимистичная модель',
    ] as const,
    rowLabels: [
      'Вложения',
      'Тариф на покупку ЭЭ',
      'Тариф на продажу ЭЭ',
      'Окупаемость дата-центра',
    ] as const,
    items: [
      {
        id: 'model-1',
        label: 'Бизнес-модель №1',
        title: 'СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРА В СОБСТВЕННОСТЬ (БЕЗ ПОКУПКИ АСИКОВ)',
        invested: 'Вложили 125 млн ₽',
        resultHighlight: 'Через 17 месяцев',
        resultText: 'дата-центр окупился, дальше вы зарабатываете',
        kind: 'grid',
        highlightColumn: 1,
        columns: [
          ['125 млн ₽', '3.0 ₽', '4.7 ₽', '20.26 мес.'],
          ['125 млн ₽', '3.0 ₽', '4.7 ₽', '17.22 мес.'],
          ['125 млн ₽', '3.0 ₽', '4.7 ₽', '14.35 мес.'],
        ],
      },
      {
        id: 'model-2',
        label: 'Бизнес-модель №2',
        title: 'ПОСТРОИЛИ — СРАЗУ ПРОДАЛИ НА 20% ДОРОЖЕ',
        invested: 'Вложили 125 млн ₽',
        resultHighlight: 'Через 4 месяца',
        resultText: 'продали за 150 млн ₽',
        kind: 'text',
        paragraphs: [
          { html: 'Вложение - <b>от 125 млн ₽.</b>' },
          {
            html: 'К окончанию строительства площадки вы уже можете продать ее на 20% дороже, чем купили за счет естественного удорожания площадки за счет рыночной ликвидности данного актива.',
          },
          {
            html: 'Ваша задача - найти покупателя дата-центра.<br>С поиском покупателя поможет ТОП МАЙНИНГ. <a href="/consulting/" target="_blank" rel="noopener noreferrer">Подробнее</a>',
          },
        ],
      },
      {
        id: 'model-3',
        label: 'Бизнес-модель №3',
        title: 'СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРА ДЛЯ МАЙНИНГА (С ПОКУПКОЙ АСИКОВ)',
        invested: 'Вложили 567 млн ₽',
        resultHighlight: 'Через 14 месяцев',
        resultText: 'дата-центр и ASIC-майнеры окупились, дальше вы зарабатываете',
        kind: 'dual',
        miniTables: [
          {
            title: 'Окупаемость дата-центра',
            rows: [
              { label: 'Вложения в строительство дата-центра', value: '125 млн ₽' },
              { label: 'Тариф на покупку ЭЭ', value: '3.0 ₽' },
              { label: 'Окупаемость дата-центра', value: '3.19 мес.', accent: true },
            ],
          },
          {
            title: 'Окупаемость ASIC',
            rows: [
              { label: 'Вложения в покупку ASIC', value: '442.37 млн ₽' },
              { label: 'Тариф на покупку ЭЭ', value: '3.0 ₽' },
              { label: 'Окупаемость ASIC', value: '11.08 мес', accent: true },
            ],
          },
        ],
      },
      {
        id: 'model-4',
        label: 'Бизнес-модель №4',
        title: 'СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРА В АРЕНДУ НА 7 ЛЕТ',
        invested: 'Вложили 62.5 млн ₽',
        resultHighlight: 'Через 17 месяцев',
        resultText: 'окупили вложения, дальше вы зарабатываете',
        kind: 'grid',
        highlightColumn: 1,
        columns: [
          ['62.5 млн ₽', '4.0 ₽', '4.7 ₽', '24.6 мес.'],
          ['62.5 млн ₽', '4.0 ₽', '5.0 ₽', '17.22 мес.'],
          ['62.5 млн ₽', '4.0 ₽', '5.4 ₽', '12.3 мес.'],
        ],
      },
    ] satisfies readonly DataCenterBusinessModelItem[],
  },
  whyInvest: {
    title: 'ПОЧЕМУ ВЫГОДНО ИНВЕСТИРОВАТЬ В СТРОИТЕЛЬСТВО СВОЕЙ ПЛОЩАДКИ ДЛЯ МАЙНИНГА?',
    calculatorHref: DATA_CENTER_CALCULATOR_HREF,
    calcFootnote: DATA_CENTER_CALC_FOOTNOTE,
    rent: {
      title: 'Если вы сдаете дата-центр в аренду',
      cards: [
        {
          title: 'Нет финансовых рисков',
          text: 'Вся инфраструктура в вашей собственности.\nВ любой момент можно продать дата-центр и выйти из бизнеса.',
          icon: investIconNoRisk,
        },
        {
          title: 'Доход от дата-центра стабильный',
          text: 'Вы не привязаны к курсу BTC или $, вам не нужно майнить.\nВам необязательно знать что-либо о майнинге.\nПостроили дата-центр и сдали в аренду.',
          icon: investIconStableIncome,
        },
      ],
      earnings: {
        title:
          'Вы зарабатываете от 7 млн ₽ в месяц при вложении 125 млн ₽ на разнице тарифов (оптимальная модель)',
        icon: investIconEarnings,
        highlightColumn: 1,
        scenarioLabels: [
          'Пессимистичная модель',
          'Оптимальная модель',
          'Оптимистичная модель',
        ] as const,
        rowLabels: [
          'Тариф на покупку ЭЭ',
          'Тариф на продажу ЭЭ',
          'Разница тарифов на ЭЭ',
          'Ваша чистая прибыль',
        ] as const,
        columns: [
          ['3.0 ₽', '4.7 ₽', '1.7 ₽', '6.17 млн ₽ / мес.'],
          ['3.0 ₽', '5.0 ₽', '2.0 ₽', '7,26 млн ₽ / мес.'],
          ['3.0 ₽', '5.4 ₽', '2.4 ₽', '8.71 млн ₽ / мес.'],
        ],
      },
    },
    mine: {
      title: 'Если вы майните сами',
      savings: [
        {
          title:
            'Вы экономите от 14 млн ₽ на входе, так как не платите входную комиссию за размещение',
          icon: investIconNoEntryFee,
          headers: [
            'Размещение <b>в собственном</b> data-центре',
            'Размещение в data-центре <b>компании Х</b>',
          ],
          rows: [
            {
              label: 'Входная комиссия',
              labelDetail: 'на размещение',
              values: ['0 ₽', '~10 000 ₽ / 1 асик'],
            },
            {
              label: 'Всего ASIC-майнеров',
              values: [
                '1427 (общее потребление 5 МВт)',
                '1427 (общее потребление 5 МВт)',
              ],
              mobileValues: ['1427 ед.', '1427 ед.'],
            },
            {
              label: 'Общая комиссия',
              values: ['0 ₽', '14,27 млн ₽'],
              accent: true,
            },
          ],
        },
        {
          title: 'Вы экономите от 7 млн ₽ в месяц на электроэнергии',
          icon: investIconEnergySave,
          headers: [
            'Размещение <b>в собственном</b> data-центре',
            'Размещение в data-центре <b>компании Х</b>',
          ],
          rows: [
            {
              label: 'Тариф на ЭЭ',
              values: ['3,0 ₽ за 1 кВт/ч', '5,0 ₽ за 1 кВт/ч'],
            },
            {
              label: 'Общая стоимость размещения, мес.',
              values: ['10.89 млн ₽ / мес.', '18.15 млн ₽ / мес.'],
              accent: true,
            },
          ],
        },
        {
          title: 'Вы не замораживаете 40 млн ₽ на старте',
          icon: investIconNoDeposit,
          headers: [
            'Размещение <b>в собственном</b> data-центре',
            'Размещение в data-центре <b>компании Х</b>',
          ],
          rows: [
            {
              label: 'Депозит (аренда за 1-й и посл. месяц)',
              values: [
                '0 ₽ за 5 МВт',
                '40 млн ₽ за 5 МВт (8 млн ₽ за 1 МВт)',
              ],
              accent: true,
            },
          ],
        },
      ],
      comparisons: [
        {
          title:
            'Вы имеете возможность масштабирования мест, экономите на электроэнергии',
          icon: investIconScale,
          headers: [
            'Размещение <b>в собственном</b> data-центре',
            'Размещение в data-центре компании Х',
          ],
          columns: [
            [
              {
                title: 'Гибкость, возможность масштабирования мест',
                paragraphs: [
                  'Собственный дата-центр – это актив, который легко расширяется: вы можете добавить новые стойки, увеличить энерговвод, масштабировать охлаждение без перестройки всей инфраструктуры.',
                  'Один из наших заказчиков, владеющий дата-центром мощностью 1 МВт, за 6 месяцев масштабировал объект до 2,5 МВт без остановки работы.',
                ],
              },
              {
                title: 'Снижение затрат на электроэнергию и обслуживание',
                paragraphs: [
                  'Возможность масштабирования за счет внушительного потенциала электрификации, а также оптимизации собственных сетей и подключений.',
                ],
              },
            ],
            [
              {
                title: 'Высокая загруженность',
                paragraphs: [
                  'Абсолютная загруженность большинства площадок не позволяет увеличить число активных устройств клиента.',
                  'Необходимость ожидания решения именно вашей проблемы (поломка, ТО, гарантийный случай) из-за загруженности сервисных служб.',
                ],
              },
              {
                title: 'Невыгодные условия размещения',
                paragraphs: [
                  'Невозможность сохранения прежних условий тарификации при желании масштабирования: предложения выгодных условий часто ограничены.',
                ],
              },
            ],
          ],
        },
        {
          title: 'Вы имеете полный контроль над оборудованием',
          icon: investIconControl,
          headers: [
            'Размещение <b>в собственном</b> data-центре',
            'Размещение в data-центре компании Х',
          ],
          columns: [
            [
              {
                title: 'Полный контроль',
                paragraphs: [
                  'Управление оборудованием и сетями осуществляется только вами.',
                  'Нет зависимости от политики стороннего оператора – вы сами определяете уровень безопасности, доступ и правила эксплуатации.',
                  'Возможность гибкой настройки и модернизации системы без согласований.',
                  'Если вы размещаете оборудование на своей площадке, у вас будет полный контроль над всеми аспектами его управления.',
                  'Вы можете лучше управлять условиями эксплуатации, безопасностью и доступом к оборудованию.',
                ],
              },
            ],
            [
              {
                title: 'Риски',
                paragraphs: [
                  'Объективные риски (пожар, кража) распространяются на все асики фермы, включая ваши.',
                  'Конфискация оборудования на хостинге в случае нарушения законодательства любым участником может затронуть технику любого арендатора.',
                  'Даже самая надежная площадка может встать на путь мошенничества, совершив кражу вашего оборудования.',
                  'Трудности удаленного контроля и невозможность оперативного решения проблемы самостоятельно.',
                  'Коммуникационные риски (поломка IP-телефонии, перебои с доступом к сети Интернет и др.) оставят вас без связи с тех. поддержкой на неопределенное время.',
                ],
              },
            ],
          ],
        },
      ],
    },
  },
  stages: {
    title: 'ОСНОВНЫЕ ЭТАПЫ СТРОИТЕЛЬСТВА МАЙНИНГ-ПЛОЩАДКИ',
    items: [
      {
        title: '1. Аналитика и техническое проектирование',
        intro: 'Каждый успешный проект начинается с глубокого анализа. На этом этапе:',
        points: [
          '<b>1. Оценивается предполагаемая IT-нагрузка:</b> количество серверов, энергопотребление, потребности в охлаждении, сетевой пропускной способности и др.',
          '<b>2. Выполняется аудит</b> доступных энергоресурсов, каналов связи и инфраструктуры на предполагаемой площадке.',
          '<b>3. Разрабатывается архитектура ЦОД</b> – определяется уровень отказоустойчивости, модель резервирования, система охлаждения, источники бесперебойного питания и т.д.',
        ],
        example:
          'Для одного из наших клиентов мы спроектировали дата-центр мощностью 30 МВт, распределенный на 6 модулей, каждый из которых может обслуживаться независимо от других.',
      },
      {
        title: '2. Подбор площадки, проведение переговоров',
        points: [
          '<b>1. Подбираем площадку под ваш запрос (выбираем локацию с оптимальным сочетанием стоимости земли, доступности инженерных сетей и логистики).</b>',
          '<b>2. Проведение переговоров</b>, если нужно - получим ТУ и АТП (технические условия и акт технического присоединения)',
        ],
      },
      {
        title: '3. Реализация проекта, строительные работы',
        intro:
          'Мы нанимаем и выстраиваем техническую службу по обслуживанию площадки,  далее – реализация:',
        points: [
          '<b>1. Строительство здания или модульных конструкций,</b> адаптированных под нужный температурный режим, антистатическую защиту и физическую безопасность.',
          '<b>2. Установка систем пожаротушения</b> (газовых, порошковых), <b>систем мониторинга климата и доступа</b> (СКУД).',
          '<b>3. Прокладка энергетической инфраструктуры:</b> собственные трансформаторы, дизель-генераторы, ИБП, распределительные щиты.',
        ],
        example:
          'В одном из проектов в Сибири мы реализовали ЦОД на базе контейнерных решений, что позволило сократить время строительства на 40% и упростить логистику оборудования.',
      },
      {
        title: '4. Запуск площадки в работу',
        intro:
          'После завершения строительных работ — оснащение, пусконаладка, тестирование:',
        points: [
          '<b>1. Устанавливается серверное и коммуникационное оборудование:</b> стойки, патч-панели, маршрутизаторы, серверы.',
          '<b>2. Интегрируются инженерные системы:</b> охлаждение (in-row, free cooling, иммерсионное), электроснабжение, системы резервного питания.',
          '<b>3. Выполняются нагрузочные испытания</b> на отказоустойчивость, температурные испытания, сценарии аварийного отключения и восстановления.',
        ],
        example:
          'Один из наших дата-центров успешно прошел нагрузочные тесты при температуре окружающей среды +35°C, показав стабильность работы всех систем на 100% мощности.',
      },
      {
        title: 'Заполнение площадки под ключ',
        intro:
          'По желанию — заполним площадку под ключ клиентами в минимальные сроки',
        introLast: true,
      },
    ] satisfies readonly DataCenterStageItem[],
  },
  lead: {
    id: 'data-center-lead',
    title: 'РАЗРАБОТАЕМ ИНДИВИДУАЛЬНЫЙ ПРОЕКТ ПОД ВАШУ ИНФРАСТРУКТУРУ',
    text: 'Оставьте заявку, и наши специалисты составят индивидуальную бизнес-модель под ваш бюджет и задачи',
    submitLabel: 'ОТПРАВИТЬ',
    ...DATA_CENTER_CTA_FORM_DEFAULTS,
  },
  consult: {
    id: 'data-center-consult',
    title: 'МЫ СТРОИМ ЛЮБЫЕ ДАТА-ЦЕНТРЫ.\nНУЖНА КОНСУЛЬТАЦИЯ?',
    text: 'Оставьте заявку, поможем в выборе',
    submitLabel: 'ОСТАВИТЬ ЗАЯВКУ',
    ...DATA_CENTER_CTA_FORM_DEFAULTS,
  },
  powerCompare: {
    title: 'СРАВНЕНИЕ ДАТА-ЦЕНТРОВ С РАЗНЫМИ ИСТОЧНИКАМИ ПИТАНИЯ',
    columns: [
      {
        id: 'gas',
        title: 'Газ',
        icon: 'gaz',
        items: [
          {
            label: 'Стоимость земли',
            text: 'Стоимость земли с месторождениями дороже из-за нахождения в недрах природных ресурсов.',
          },
          {
            label: 'Необходимый объем инвестиций',
            text: 'Требуется ощутимый размер инвестиций, необходимых не только для покупки (аренды) земли, но и приобретения, а также последующего запуска генерирующих мощностей.',
          },
          {
            label: 'Стоимость эл-ва',
            text: 'Минимальная стоимость электричества, значительно дешевле средних рыночных значений.',
          },
          {
            label: 'Уровень шума',
            text: 'Высокий уровень шума из-за специфики работы газовой инфраструктуры.',
            align: 'gaz-4',
          },
          {
            label: 'Up-time',
            text: 'Обеспечение бесперебойной работы зависит от качества газовой инфраструктуры и регламентов обслуживания мощностей.',
          },
          {
            label: 'Перспективы продажи',
            text: 'Продажа земли усложняется из-за профильной специфики недвижимости и узким сегментом спроса.',
            align: 'gaz-6',
          },
          {
            label: 'Вступление в реестр',
            text: 'Возможные сложности при постановке в реестр из-за специфики формата инвестирования.',
          },
          {
            label: 'Обслуживание и сопровождение',
            text: 'Необходимость формирования ощутимого штата специалистов как для майнингового направления, так и электротехнического сопровождения.',
          },
        ],
      },
      {
        id: 'grid',
        title: 'Электросеть',
        icon: 'el',
        items: [
          {
            label: 'Стоимость земли',
            text: 'Стоимость земли дешевле: цены формируются на основе традиционной коммерческой недвижимости.',
          },
          {
            label: 'Необходимый объем инвестиций',
            text: 'Объем инвестиций значительно меньше за счет отсутствия собственных генерирующих мощностей.',
            align: 'row-2',
          },
          {
            label: 'Стоимость эл-ва',
            text: 'Стоимость электричества выше и напрямую зависит от региона и тарификации на выбранной локации.',
            align: 'row-3',
          },
          {
            label: 'Уровень шума',
            text: 'Традиционный для майнинговых ферм уровень шума без негативного влияния добавочных источников.',
          },
          {
            label: 'Up-time',
            text: 'Более стабильный вариант электропитания за счет бесперебойной подачи тока со стороны снабжающей организации.',
          },
          {
            label: 'Перспективы продажи',
            text: 'Упрощенная продажа за счет формирования устойчивого спроса без технических тонкостей и влияния профильных особенностей.',
          },
          {
            label: 'Вступление в реестр',
            text: 'Простой и регламентированный формат попадания в реестр за счет множества успешных кейсов.',
            align: 'row-7',
          },
          {
            label: 'Обслуживание и сопровождение',
            text: 'Формирования исключительно штата по сопровождению работы фермы (без обслуживания электростанции).',
          },
        ],
      },
    ] satisfies readonly DataCenterPowerCompareColumn[],
  },
} as const

export type DataCenterConstructionPage = typeof DATA_CENTER_CONSTRUCTION_PAGE
