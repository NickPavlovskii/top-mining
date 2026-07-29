import bannerAsic from '~/assets/images/increase-income/banner-asic.png'
import bannerHotel from '~/assets/images/increase-income/banner-hotel.png'

export const INCREASE_INCOME_PAGE_PATH = '/uvelichim-vash-dohod/'

export const INCREASE_INCOME_PAGE = {
  breadcrumb: 'Увеличим ваш доход',
  titleLead: 'ВЫ МАЙНЕР?',
  titleMain: 'УВЕЛИЧИМ ВАШ ДОХОД',
  cardLead:
    'Ваши асики зарабатывают от 100.000 ₽ месяц? Увеличим вашу чистую прибыль на 7%',
  cardCta: 'Хотите узнать как? Оставьте заявку',
  phonePlaceholder: 'Телефон',
  submitLabel: 'УЗНАТЬ',
  honeypotLabel: 'Оставьте это поле пустым.',
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  promoCards: [
    {
      id: 'asic',
      title: 'Найдем для вас самые выгодные и\u00a0дешевые асики',
      href: '/asic-majnery-po-czenam-nizhe-rynka/',
      buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
      image: bannerAsic,
      imageAlt: 'ASIC-майнеры Whatsminer с брендингом ТОП МАЙНИНГ',
    },
    {
      id: 'hotel',
      title: 'Улучшим ваш тариф на\u00a0майнинг-отель',
      href: '/podbor-majning-otelya/',
      buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
      image: bannerHotel,
      imageAlt: 'Лампочка с символом Bitcoin и монеты',
    },
  ],
} as const
