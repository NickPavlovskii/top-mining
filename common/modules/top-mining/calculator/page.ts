/**
 * Папка calculator — майнинг-калькулятор.
 * SEO, hero, бренды и тексты about.
 */
import brandWhatsminer from '~/assets/images/calculator/brands/microbt-whatsminer.svg'
import brandAntminer from '~/assets/images/calculator/brands/bitmain-antminer.svg'
import brandJasminer from '~/assets/images/calculator/brands/jasminer.svg'
import brandCanaan from '~/assets/images/calculator/brands/canaan-avalon.svg'
import brandInnosilicon from '~/assets/images/calculator/brands/innosilicon.svg'
import brandGoldshell from '~/assets/images/calculator/brands/goldshell.svg'
import brandIpollo from '~/assets/images/calculator/brands/ipollo.svg'
import brandEbang from '~/assets/images/calculator/brands/ebang.svg'
import brandBitfury from '~/assets/images/calculator/brands/bitfury.svg'
import brandIbelink from '~/assets/images/calculator/brands/ibelink.svg'
import brandFusionsilicon from '~/assets/images/calculator/brands/fusionsilicon.svg'
import heroImage from '~/assets/images/calculator/hero-rig.png'
import { CALCULATOR_PAGE_PATH } from './path'

export { CALCULATOR_PAGE_PATH }

export type CalculatorBrand = {
  id: string
  label: string
  href: string
  logo: string
}

export const CALCULATOR_PAGE = {
  seoTitle: 'Удобный — Калькулятор майнинга доходности Асиков | Bitcoin и другой криптовалюты',
  seoDescription:
    'Майнинг-калькулятор доходности ASIC, GPU и CPU. Учёт курса, сложности сети, up-time, комиссии пула и срока окупаемости.',
  breadcrumb: 'Майнинг калькулятор',
  hero: {
    titleLines: ['МАЙНИНГ', 'КАЛЬКУЛЯТОР', 'ДОХОДНОСТИ'] as const,
    image: heroImage,
    imageAlt: 'ASIC-майнер',
  },
  brands: [
    {
      id: 'microbt-whatsminer',
      label: 'Whatsminer',
      href: '/calculator/microbt-whatsminer/',
      logo: brandWhatsminer,
    },
    {
      id: 'bitmain-antminer',
      label: 'Antminer',
      href: '/calculator/bitmain-antminer/',
      logo: brandAntminer,
    },
    {
      id: 'jasminer',
      label: 'Jasminer',
      href: '/calculator/jasminer/',
      logo: brandJasminer,
    },
    {
      id: 'canaan-avalon',
      label: 'Canaan Avalon',
      href: '/calculator/canaan-avalon/',
      logo: brandCanaan,
    },
    {
      id: 'innosilicon',
      label: 'Innosilicon',
      href: '/calculator/innosilicon/',
      logo: brandInnosilicon,
    },
    {
      id: 'goldshell',
      label: 'Goldshell',
      href: '/calculator/goldshell/',
      logo: brandGoldshell,
    },
    {
      id: 'ipollo',
      label: 'iPollo',
      href: '/calculator/ipollo/',
      logo: brandIpollo,
    },
    {
      id: 'ebang-ebit',
      label: 'Ebang',
      href: '/calculator/ebang-ebit/',
      logo: brandEbang,
    },
    {
      id: 'bitfury',
      label: 'Bitfury',
      href: '/calculator/bitfury/',
      logo: brandBitfury,
    },
    {
      id: 'ibelink',
      label: 'iBelink',
      href: '/calculator/ibelink/',
      logo: brandIbelink,
    },
    {
      id: 'fusionsilicon',
      label: 'Fusionsilicon',
      href: '/calculator/fusionsilicon/',
      logo: brandFusionsilicon,
    },
  ] as const satisfies readonly CalculatorBrand[],
  about: {
    title: 'ТОП МАЙНИНГ КАЛЬКУЛЯТОР — ЭТО ЛУЧШИЙ АНАЛОГ WHATTOMINE И НАЙСХЕШ',
    intro:
      'Мы взяли самое лучшее из привычных всеми калькуляторов Воттумайн и Nicehash, дополнив нашу платформу удобными инструментами:',
    features: [
      'Учет курса BTC-USDT и USDT-RUB;',
      'Вычисление сложности сети, up-time и награды за блок;',
      'Расчет срока окупаемости;',
      'Включение комиссии пула и награды за блок;',
      'Калькуляция доходности CPU, GPU и асиков.',
    ] as const,
    closing:
      'Максимально полная база устройств (асики, процессоры, видеокарты): привычный функционал Воттумайн и Найсхеш с качественным переводом на русский язык. Используйте профессиональный инструмент, в разработке которого принимали участие практикующие майнеры.',
  },
} as const

export type CalculatorPage = typeof CALCULATOR_PAGE
