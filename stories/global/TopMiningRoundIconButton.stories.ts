import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningRoundIconButton from '~/components/global/buttons/TopMiningRoundIconButton.vue'

import {
  CANVAS_WIDTH,
  canvasDark,
  canvasDarkMaxWidth,
  canvasLight,
} from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningRoundIconButton',
  component: TopMiningRoundIconButton,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        component: `
Круглая кнопка с иконкой на базе Quasar \`q-btn\` (аналог Vuetify \`v-btn\`).

- **icon** — Iconify (\`mdi:...\`) или URL SVG-файла с перекраской через \`color\`
- **tooltip** — подсказка через \`q-tooltip\`
- **variant** — \`primary\` (заливка) / \`outline\` (обводка)
- **size** — \`small\` / \`medium\`
- **width** / **height** / **minWidth** — размеры кнопки
- **borderColor** — включает обводку (\`has-border\`)
- При \`href\` рендерится как ссылка
        `.trim(),
      },
    },
  },
  argTypes: {
    ariaLabel: { description: 'Доступное имя для screen reader' },
    variant: {
      control: 'select',
      options: ['primary', 'outline'],
    },
    size: {
      control: 'select',
      options: ['small', 'medium'],
    },
    href: { description: 'Внешняя или внутренняя ссылка' },
    click: { action: 'click' },
  },
} satisfies Meta<typeof TopMiningRoundIconButton>

export default meta

type Story = StoryObj<typeof meta>

export const Primary: Story = {
  args: {
    ariaLabel: 'Отправить',
    variant: 'primary',
    size: 'medium',
    type: 'submit',
  },
  decorators: [canvasLight],
  parameters: {
    backgrounds: { default: 'off-white' },
    docs: {
      description: { story: 'Основной вариант на светлом фоне.' },
    },
  },
}

export const Outline: Story = {
  args: {
    ariaLabel: 'Перейти',
    variant: 'outline',
    size: 'medium',
  },
  decorators: [canvasLight],
  parameters: {
    backgrounds: { default: 'off-white' },
    docs: {
      description: { story: 'Контурный вариант без заливки.' },
    },
  },
}

export const Small: Story = {
  args: {
    ariaLabel: 'Наверх',
    variant: 'primary',
    size: 'small',
  },
  decorators: [canvasDark],
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Компактный размер для тёмных секций.' },
    },
  },
}

export const AsLink: Story = {
  args: {
    ariaLabel: 'Telegram',
    href: 'https://t.me/example',
    target: '_blank',
    variant: 'primary',
    size: 'medium',
  },
  decorators: [canvasDark],
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Ссылка на внешний ресурс.' },
    },
  },
}

export const Disabled: Story = {
  args: {
    ariaLabel: 'Отключена',
    variant: 'primary',
    size: 'medium',
    disabled: true,
  },
  decorators: [canvasDark],
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Недоступное состояние.' },
    },
  },
}

export const AllVariants: Story = {
  render: () => ({
    components: { TopMiningRoundIconButton },
    template: `
      <div class="sb-row">
        <TopMiningRoundIconButton aria-label="Primary" variant="primary" size="medium" />
        <TopMiningRoundIconButton aria-label="Outline" variant="outline" size="medium" />
        <TopMiningRoundIconButton aria-label="Small" variant="primary" size="small" />
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.row)],
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Все варианты в одном кадре.' },
    },
  },
}
