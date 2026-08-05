import { BUY_ASIC_PAGE_PATH } from '../buy-asic/page'
import { INCREASE_INCOME_PAGE_PATH } from '../pages/increase-income'
import { PODBOR_MINING_HOTEL_PATH } from '../podbor/mining-hotel'
import { DATA_CENTER_CONSTRUCTION_PAGE_PATH } from '../pages/data-center-construction'

export type TopMiningConsultingDropdownItem = {
  label: string
  href: string
}

export const TOP_MINING_CONSULTING_DROPDOWN_ITEMS: readonly TopMiningConsultingDropdownItem[] =
  [
    { label: 'Consulting в майнинге', href: '/consulting/' },
    { label: 'Помогаем купить ASIC выгодно', href: BUY_ASIC_PAGE_PATH },
    { label: 'Увеличим ваш доход', href: INCREASE_INCOME_PAGE_PATH },
    { label: 'Подбираем майнинг-отель', href: PODBOR_MINING_HOTEL_PATH },
    {
      label: 'Строительство дата-центров',
      href: DATA_CENTER_CONSTRUCTION_PAGE_PATH,
    },
  ] as const

const consultingHrefByLabel = new Map(
  TOP_MINING_CONSULTING_DROPDOWN_ITEMS.map((item) => [item.label, item.href]),
)

export function getConsultingServiceHref(label: string): string {
  return consultingHrefByLabel.get(label) ?? '#'
}
