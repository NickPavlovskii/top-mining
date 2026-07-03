import type { DesignTokenGroup } from './design-token-types'

export const designTokenGroups: DesignTokenGroup[] = [
  {
    id: 'animation',
    title: 'Основные цвета',
    swatches: [
      { token: '--tm-orange-anim-1', hex: '#C12F04', note: 'Кадр 1 · тёмный' },
      { token: '--tm-orange-anim-2', hex: '#D8480D', note: 'Кадр 2' },
      { token: '--tm-orange-anim-3', hex: '#F26619', note: 'Кадр 3 · средний' },
      { token: '--tm-orange-anim-4', hex: '#FF853B', note: 'Кадр 4' },
      { token: '--tm-orange-anim-5', hex: '#FFA366', note: 'Кадр 5 · светлый' },
      {
        token: '--tm-orange-anim-gradient',
        hex: '#C12F04 → #FFA366',
        note: 'Горизонтальный градиент палитры',
        gradient:
          'linear-gradient(90deg, #C12F04 0%, #D8480D 25%, #F26619 50%, #FF853B 75%, #FFA366 100%)',
      },
    ],
  },
  {
    id: 'surfaces',
    title: 'Поверхности',
    swatches: [
      {
        token: 'canvas / preview',
        hex: '#141414',
        note: 'Фон Storybook canvas',
      },
      { token: '--tm-black', hex: '#151515', note: 'Jet-чёрный' },
      { token: '--tm-card-bg', hex: '#2a2a2a', note: 'Карточки' },
      { token: '--tm-off-white', hex: '#f6f6f6', note: 'Светлые секции' },
    ],
  },
  {
    id: 'text',
    title: 'Текст',
    swatches: [
      { token: '--tm-text-primary', hex: '#111111' },
      { token: '--tm-text-secondary', hex: '#303030' },
      { token: '--tm-text-subtle', hex: '#777777' },
      { token: '--tm-icon', hex: '#c8c8c8' },
    ],
  },
  {
    id: 'borders',
    title: 'Границы и разделители',
    swatches: [
      { token: '--tm-border', hex: '#d8d8d8' },
      { token: '--tm-border-light', hex: '#cfcfcf' },
      { token: '--tm-border-dark', hex: '#d7d7d7' },
    ],
  },
]
