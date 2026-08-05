/**
 * Пакет process — процесс работы.
 * PROCESS_SECTION_STEPS: иконки и тексты шагов.
 */
export interface ProcessSectionStep {
  id: number
  icon: string
  arrow: string
  lines: string[]
  light?: boolean
}

export const PROCESS_SECTION_STEPS: ProcessSectionStep[] = [
  {
    id: 1,
    icon: 'mdi:file-search-outline',
    arrow: 'mdi:arrow-bottom-right',
    lines: ['Аналитика'],
  },
  {
    id: 2,
    icon: 'mdi:vector-bezier',
    arrow: 'mdi:arrow-bottom-right',
    lines: ['Дизайн'],
    light: true,
  },
  {
    id: 3,
    icon: 'mdi:code-tags',
    arrow: 'mdi:arrow-bottom-left',
    lines: ['Разработка'],
  },
  {
    id: 4,
    icon: 'mdi:chart-pie',
    arrow: 'mdi:arrow-bottom-left',
    lines: ['SEO', 'и тестирование'],
  },
  {
    id: 5,
    icon: 'mdi:rocket-launch-outline',
    arrow: 'mdi:arrow-bottom-left',
    lines: ['Запуск'],
    light: true,
  },
]
