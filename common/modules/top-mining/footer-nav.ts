import { CATALOG_PAGE_HREF } from '../catalog/nav-links'

export interface TopMiningFooterNavLink {
  label: string
  href: string
  external?: boolean
}

export const TOP_MINING_FOOTER_CALCULATOR_LINKS: TopMiningFooterNavLink[] = [
  { label: 'Майнинг-калькулятор', href: 'https://top-mining.ru/calculator/' },
  { label: 'ASIC-майнеры', href: 'https://top-mining.ru/calculator/' },
  { label: 'GPU', href: 'https://top-mining.ru/calculator/gpu/' },
  { label: 'CPU', href: 'https://top-mining.ru/calculator/cpu/' },
]

export const TOP_MINING_FOOTER_MAIN_LINKS: TopMiningFooterNavLink[] = [
  { label: 'Бизнес-consulting', href: 'https://top-mining.ru/consulting/' },
  { label: 'Рейтинги', href: '/rating/' },
  { label: 'Статьи', href: '/articles/' },
  { label: 'Каталог организаций', href: CATALOG_PAGE_HREF },
  { label: 'Контакты', href: '#footer-contact-title' },
]

export const TOP_MINING_FOOTER_TELEGRAM_HREF = 'https://t.me/miningcalculator_bot'
