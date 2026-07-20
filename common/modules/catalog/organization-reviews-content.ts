import type { OrganizationReviewSort } from '~/types/organization-reviews'

export type OrganizationReviewSortOption = {
  value: OrganizationReviewSort
  label: string
}

export const ORGANIZATION_REVIEW_QUESTIONS = [
  'Вас плохо или хорошо проконсультировали?',
  'Вам понравилась или не понравилась коммуникация?',
  'Компания не выполнила свои обязательства или выполнила их превосходя ваши ожидания?',
  'Нарушены сроки поставки?',
  'Вам необоснованно подняли тариф на электроэнергию?',
] as const

export const ORGANIZATION_REVIEW_SORT_OPTIONS: OrganizationReviewSortOption[] = [
  { value: 'newest', label: 'Новые' },
  { value: 'oldest', label: 'Старые' },
  { value: 'rating-desc', label: 'Высокая оценка' },
  { value: 'rating-asc', label: 'Низкая оценка' },
]

export const ORGANIZATION_REVIEW_SORT_VALUES: OrganizationReviewSort[] =
  ORGANIZATION_REVIEW_SORT_OPTIONS.map((option) => option.value)

export function formatOrganizationReviewCount(count: number) {
  const mod10 = count % 10
  const mod100 = count % 100

  if (mod100 >= 11 && mod100 <= 14) {
    return `${count} отзывов`
  }

  if (mod10 === 1) {
    return `${count} отзыв`
  }

  if (mod10 >= 2 && mod10 <= 4) {
    return `${count} отзыва`
  }

  return `${count} отзывов`
}
