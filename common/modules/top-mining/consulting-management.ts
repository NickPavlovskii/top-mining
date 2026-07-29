export type ConsultingManagementListItem = {
  text?: string
  html?: string
}

export type ConsultingManagementCard = {
  id: string
  title: string
  descriptionHtml?: string
  listItems?: ConsultingManagementListItem[]
  visibleListCount?: number
  priceLabel: string
  priceValue: string
  ctaLabel: string
  ctaHref: string
  detailsLabel?: string
  detailsHref?: string
}

export const CONSULTING_MANAGEMENT = {
  sectionTitle: 'Управление',
  cards: [
    {
      id: 'data-center',
      title: 'Управление вашим дата центром',
      descriptionHtml:
        'Берем на себя <b>управление вашим дата-центром и его обслуживание</b> как в коммерческой части, так и в технической',
      priceLabel: 'Общая стоимость:',
      priceValue: '% от прибыли',
      ctaLabel: 'Оставить заявку',
      ctaHref: '#home_contact_form',
    },
    {
      id: 'asics',
      title: 'Управление вашими асиками',
      descriptionHtml:
        'Берем на себя управление вашими майнинговыми активами (100+ асик майнеров) для получения максимальной прибыли',
      priceLabel: 'Общая стоимость:',
      priceValue: '% от прибыли',
      ctaLabel: 'Оставить заявку',
      ctaHref: '#home_contact_form',
    },
    {
      id: 'construction',
      title: 'Строительство дата-центров',
      visibleListCount: 5,
      listItems: [
        { html: 'Как <b>купить</b> площадку?' },
        { html: 'Как <b>продать</b> площадку?' },
        { html: 'Как <b>построить</b> площадку?' },
        { text: 'В каком регионе выбрать место под-дата центр?' },
        {
          html: 'Как получить <b>самый низкий тариф</b> при строительстве?',
        },
        { text: 'Как выбрать землю под дата-центр (геодезия, юр. условия)?' },
        { text: 'Какая рыночная цена за МВт?' },
        { text: 'Какие преимущества собственной площадки?' },
        { text: 'Станем гарантом сделки' },
        { text: 'Станем поручителем сделки' },
        { text: 'Как и какие тех. условия нужно соблюсти?' },
        { text: 'Как получить техническое присоединение мощности к площадке?' },
        { text: 'Какие оптимальные сроки окупаемости дата-центра?' },
        { text: 'Как обслуживать дата-центр?' },
        { text: 'Какие юридические подводные камни?' },
        { text: 'Как работать с новым законодательством от 2024г?' },
        {
          text: 'Как обеспечить Безопасность вашей площадке? (юридическая, физическая, экономическая)',
        },
        {
          text: 'Какие требования должны быть выполнены для размещения дата-центра?',
        },
        {
          text: 'Как правильно инвестировать, чтобы не заморозить их на этапе строительства?',
        },
        {
          text: 'Какие особенности размещения контейнеров и асиков на площадке?',
        },
        {
          text: 'Какая пессимистичная финансовая модель на случай низкого курса BTC и криптовалют?',
        },
      ],
      priceLabel: 'Общая стоимость:',
      priceValue: 'от 100 000 ₽',
      ctaLabel: 'Оставить заявку',
      ctaHref: '#home_contact_form',
      detailsLabel: 'Подробнее',
      detailsHref: '/stroitelstvo-data-czentrov/',
    },
  ],
} as const satisfies {
  sectionTitle: string
  cards: ConsultingManagementCard[]
}
