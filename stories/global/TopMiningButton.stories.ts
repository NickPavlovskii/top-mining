import type { Meta, StoryObj } from '@storybook/vue3'

import catalogArrowIcon from '~/assets/images/catalog/arrow-right.png'
import TopMiningButton from '~/components/global/TopMiningButton.vue'

import {
  canvasDarkMaxWidth,
  canvasLightMaxWidth,
  CANVAS_WIDTH,
} from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningButton',
  component: TopMiningButton,
  tags: ['autodocs'],
  args: {
    title: 'Подробнее',
    variant: 'primary',
    size: 'big',
    surface: 'light',
  },
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Универсальная кнопка Top Mining.

- **variant** — \`primary\` (заливка), \`secondary\` (обводка), \`tertiary\` (текстовая)
- **surface** — \`light\` / \`dark\` — контраст на светлом или тёмном фоне
- **size** — \`big\` (основные CTA) / \`small\`
- **preset** — именованный визуальный пресет для частных случаев верстки: \`badge-prepend\`, \`consulting\`, \`contact\`, \`contact-section-telegram\` (и его модификатор \`contact-section-telegram--compact\`)
- **disabled** / **loading** — блокируют клик; \`loading\` подменяет содержимое кнопки спиннером
- При наличии \`href\` рендерится как \`<a>\`, иначе \`<button>\`

**Фирменный жест**: иконка \`append\` (обычно стрелка) сдвигается на 3px вправо при наведении — единый почерк, который также используется в \`TopMiningRoundIconButton\` и \`TopMiningMoreLink\`. Учитывает \`prefers-reduced-motion\`.
        `.trim(),
      },
    },
  },
  argTypes: {
    title: { description: 'Текст на кнопке' },
    variant: {
      control: 'select',
      options: ['primary', 'secondary', 'tertiary'],
      description: 'Визуальный стиль',
    },
    size: {
      control: 'select',
      options: ['big', 'small'],
      description: 'Размер',
    },
    surface: {
      control: 'select',
      options: ['light', 'dark'],
      description: 'Цветовая схема под фон секции',
    },
    preset: {
      control: 'select',
      options: [
        '',
        'badge-prepend',
        'consulting',
        'contact',
        'contact-pill',
        'contact-section-telegram',
      ],
      description:
        'Именованный визуальный пресет для нестандартных мест использования',
    },
    disabled: { control: 'boolean', description: 'Блокирует кнопку' },
    loading: {
      control: 'boolean',
      description: 'Показывает спиннер вместо содержимого',
    },
    href: { description: 'Если задан — кнопка становится ссылкой' },
    width: { description: 'Фиксированная ширина (CSS-значение)' },
    click: { action: 'click' },
  },
  decorators: [
    (story, { args }) => {
      const surface = args?.surface ?? 'light'
      const canvasClass =
        surface === 'dark'
          ? 'sb-canvas sb-canvas--padded sb-canvas--dark sb-canvas--inline'
          : 'sb-canvas sb-canvas--padded sb-canvas--light sb-canvas--inline'

      return {
        template: `<div class="${canvasClass}" style="max-width: ${CANVAS_WIDTH.section}px; width: 100%"><story /></div>`,
      }
    },
  ],
} satisfies Meta<typeof TopMiningButton>

export default meta

type Story = StoryObj<typeof meta>

export const PrimaryLight: Story = {
  args: {
    title: 'Подробнее',
    variant: 'primary',
    size: 'big',
    surface: 'light',
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'off-white' },
    docs: {
      description: { story: 'Основной CTA на светлой секции — оранжевая заливка, белый текст.' },
    },
  },
}

export const PrimaryDark: Story = {
  args: {
    title: 'Написать в Telegram',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: { story: 'Основной CTA на тёмной секции лендинга.' },
    },
  },
}

export const Secondary: Story = {
  args: {
    title: 'Каталог',
    variant: 'secondary',
    size: 'big',
    surface: 'light',
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'off-white' },
    docs: {
      description: { story: 'Вторичная кнопка с обводкой.' },
    },
  },
}

export const TertiaryDark: Story = {
  args: {
    title: 'Подробнее',
    variant: 'tertiary',
    size: 'big',
    surface: 'dark',
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: { story: 'Текстовая кнопка без заливки на тёмном фоне.' },
    },
  },
}

export const Small: Story = {
  args: {
    title: 'Связаться',
    variant: 'primary',
    size: 'small',
    surface: 'dark',
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: { story: 'Компактный вариант для плотных блоков.' },
    },
  },
}

export const AsLink: Story = {
  args: {
    title: 'Перейти',
    href: 'https://example.com',
    target: '_blank',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: { story: 'Внешняя ссылка с `target="_blank"`.' },
    },
  },
}

export const WithWidth: Story = {
  args: {
    title: '220px',
    width: '220px',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: { story: 'Фиксированная ширина через prop `width`.' },
    },
  },
}

export const WithAppendIcon: Story = {
  args: {
    title: 'Подробнее',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
    appendIcon: catalogArrowIcon,
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        story:
          'С иконкой `append` — при hover стрелка сдвигается на 3px вправо.',
      },
    },
  },
}

export const Disabled: Story = {
  args: {
    title: 'Недоступно',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
    disabled: true,
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        story:
          'Кнопка заблокирована: `aria-disabled`, курсор `not-allowed`, клик и hover-эффекты отключены.',
      },
    },
  },
}

export const Loading: Story = {
  args: {
    title: 'Отправка…',
    variant: 'primary',
    size: 'big',
    surface: 'dark',
    loading: true,
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        story:
          'Содержимое подменяется спиннером, `aria-busy="true"`, клик блокируется.',
      },
    },
  },
}

export const States: Story = {
  render: () => ({
    components: { TopMiningButton },
    template: `
      <div class="sb-row">
        <TopMiningButton title="Обычная" variant="primary" size="big" surface="dark" />
        <TopMiningButton title="Disabled" variant="primary" size="big" surface="dark" disabled />
        <TopMiningButton title="Loading" variant="primary" size="big" surface="dark" loading />
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        story: 'Сравнение обычного, disabled и loading состояний.',
      },
    },
  },
}

export const AllVariants: Story = {
  render: () => ({
    components: { TopMiningButton },
    template: `
      <div class="sb-stack">
        <div class="sb-row">
          <TopMiningButton title="Primary dark" variant="primary" size="big" surface="dark" />
          <TopMiningButton title="Secondary dark" variant="secondary" size="big" surface="dark" />
          <TopMiningButton title="Tertiary dark" variant="tertiary" size="big" surface="dark" />
        </div>
        <div class="sb-row">
          <TopMiningButton title="Primary light" variant="primary" size="big" surface="light" />
          <TopMiningButton title="Secondary light" variant="secondary" size="big" surface="light" />
          <TopMiningButton title="Small" variant="primary" size="small" surface="dark" />
        </div>
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        story: 'Сводная таблица вариантов для визуальной проверки.',
      },
    },
  },
}
