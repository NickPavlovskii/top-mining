import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningChip from '~/components/global/labels/TopMiningChip.vue'

import { canvasDark, canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningChip',
  component: TopMiningChip,
  tags: ['autodocs'],
  args: {
    label: 'Проверены',
    size: 'md',
    shape: 'rounded',
    iconPosition: 'left',
    iconVariant: 'badge',
    icon: 'mdi:check',
    prependIconColor: '#fff',
    prependIconBackground: '#4caf50',
    preset: 'dark-success',
    minWidth: '158px',
  },
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        component: `
Универсальный чип Top Mining для статусов, бейджей и меток. Основан на Quasar \`q-chip\` (аналог Vuetify \`v-chip\`) с кастомными пресетами и иконками Iconify.

- **label** / **title** — текст чипа
- **size** — \`xs\` / \`sm\` / \`md\` / \`lg\`
- **shape** — \`pill\` / \`rounded\` / \`square\`
- **preset** — готовые цветовые схемы (\`blue\`, \`green\`, \`dark-success\` и др.)
- **icon** + **iconPosition** — \`left\` / \`right\` / \`none\`
- **prependIcon** / **appendIcon** (или **leftIcon** / **rightIcon**) — иконки по бокам
- **iconVariant** — \`badge\` (в круге) / \`plain\`
- **closable** / **removable**, **clickable**, **disabled**, **dot**, **outlined**, **flat**, **counter**
- **prependIcon** / **appendIcon** — иконки с обеих сторон
- **title** / **label**, **color** / **bgColor**
        `.trim(),
      },
    },
  },
  argTypes: {
    label: { description: 'Текст чипа' },
    title: { description: 'Алиас для label' },
    size: { control: 'select', options: ['xs', 'sm', 'md', 'lg'] },
    shape: { control: 'select', options: ['pill', 'rounded', 'square'] },
    preset: {
      control: 'select',
      options: [
        '',
        'blue',
        'green',
        'orange',
        'red',
        'purple',
        'gray',
        'teal',
        'pink',
        'yellow',
        'indigo',
        'dark',
        'dark-success',
        'dark-danger',
      ],
    },
    iconPosition: {
      control: 'select',
      options: ['left', 'right', 'none'],
    },
    iconVariant: { control: 'select', options: ['badge', 'plain'] },
    icon: { description: 'Основная иконка (слева или справа по iconPosition)' },
    prependIcon: { description: 'Иконка слева' },
    appendIcon: { description: 'Иконка справа' },
    leftIcon: { description: 'Алиас prependIcon' },
    rightIcon: { description: 'Алиас appendIcon' },
    prependIconColor: { control: 'color' },
    appendIconColor: { control: 'color' },
    prependIconBackground: { control: 'color' },
    appendIconBackground: { control: 'color' },
    bgColor: { control: 'color' },
    textColor: { control: 'color' },
    borderColor: { control: 'color' },
    borderRadius: { control: 'text' },
    borderWidth: { control: 'text' },
    minWidth: { control: 'text' },
    iconSize: { control: 'text' },
    closable: { control: 'boolean' },
    clickable: { control: 'boolean' },
    disabled: { control: 'boolean' },
    dot: { control: 'boolean' },
    outlined: { control: 'boolean' },
    counter: { control: 'text' },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.compact)],
} satisfies Meta<typeof TopMiningChip>

export default meta

type Story = StoryObj<typeof meta>

export const Playground: Story = {
  name: 'Playground',
}

export const Verified: Story = {
  name: 'Проверены',
  args: {
    label: 'Проверены',
    icon: 'mdi:check',
    iconPosition: 'left',
    prependIconBackground: '#4caf50',
    prependIconColor: '#fff',
    preset: 'dark-success',
    minWidth: '158px',
  },
  parameters: {
    docs: {
      description: {
        story: 'Статус успешной проверки — как в блоке «ТОП МАЙНИНГ» на странице организации.',
      },
    },
  },
}

export const NotVerified: Story = {
  name: 'Не проверены',
  args: {
    label: 'Не проверены',
    icon: 'mdi:close',
    iconPosition: 'left',
    prependIconBackground: '#ef4444',
    prependIconColor: '#fff',
    preset: 'dark-danger',
    minWidth: '158px',
  },
  parameters: {
    docs: {
      description: {
        story: 'Статус неуспешной проверки.',
      },
    },
  },
}

export const WithoutIcon: Story = {
  name: 'Без иконки',
  args: {
    label: 'Новый статус',
    iconPosition: 'none',
    preset: 'dark',
    shape: 'pill',
    minWidth: 'auto',
  },
}

export const IconRight: Story = {
  name: 'Иконка справа',
  args: {
    label: 'Подробнее',
    iconPosition: 'right',
    icon: 'mdi:chevron-right',
    appendIconColor: 'var(--tm-orange-accent-light)',
    iconVariant: 'plain',
    preset: 'dark-danger',
    minWidth: 'auto',
  },
}

export const IconBothSides: Story = {
  name: 'Иконки с обеих сторон',
  args: {
    label: 'В реестре',
    iconPosition: 'left',
    prependIcon: 'mdi:check-decagram',
    appendIcon: 'mdi:open-in-new',
    prependIconBackground: '#41e7b4',
    prependIconColor: '#0a0a0a',
    appendIconColor: '#bdbdbd',
    iconVariant: 'badge',
    bgColor: 'rgba(26, 26, 26, 0.95)',
    textColor: '#fff',
    minWidth: 'auto',
  },
}

export const WithBorder: Story = {
  name: 'С обводкой',
  args: {
    label: 'Оранжевый бордер',
    iconPosition: 'none',
    outlined: true,
    textColor: 'var(--tm-orange-accent-light)',
    minWidth: 'auto',
  },
}

export const Closable: Story = {
  name: 'Закрываемый',
  args: {
    label: 'Фильтр: ASIC',
    preset: 'dark',
    closable: true,
    minWidth: 'auto',
  },
}

export const Clickable: Story = {
  name: 'Кликабельный',
  args: {
    label: 'Все статусы',
    preset: 'blue',
    clickable: true,
    minWidth: 'auto',
  },
}

export const WithCounter: Story = {
  name: 'Со счётчиком',
  args: {
    label: 'Отзывы',
    preset: 'green',
    counter: 12,
    minWidth: 'auto',
  },
}

export const WithDot: Story = {
  name: 'С точкой',
  args: {
    label: 'Онлайн',
    preset: 'dark',
    dot: true,
    dotColor: '#4caf50',
    minWidth: 'auto',
  },
}

export const Presets: Story = {
  name: 'Пресеты',
  render: () => ({
    components: { TopMiningChip },
    template: `
      <div class="sb-row" style="flex-wrap: wrap; gap: 8px; background: #f5f5f5; padding: 16px; border-radius: 8px">
        <TopMiningChip label="Blue" preset="blue" min-width="auto" />
        <TopMiningChip label="Green" preset="green" min-width="auto" />
        <TopMiningChip label="Orange" preset="orange" min-width="auto" />
        <TopMiningChip label="Red" preset="red" min-width="auto" />
        <TopMiningChip label="Purple" preset="purple" min-width="auto" />
        <TopMiningChip label="Gray" preset="gray" min-width="auto" />
        <TopMiningChip label="Teal" preset="teal" min-width="auto" />
        <TopMiningChip label="Pink" preset="pink" min-width="auto" />
        <TopMiningChip label="Yellow" preset="yellow" min-width="auto" />
        <TopMiningChip label="Indigo" preset="indigo" min-width="auto" />
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.row)],
}

export const Sizes: Story = {
  name: 'Размеры',
  render: () => ({
    components: { TopMiningChip },
    template: `
      <div class="sb-stack">
        <TopMiningChip
          label="XS"
          size="xs"
          icon="mdi:check"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          preset="dark-success"
        />
        <TopMiningChip
          label="Small"
          size="sm"
          icon="mdi:check"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          preset="dark-success"
        />
        <TopMiningChip
          label="Medium"
          size="md"
          icon="mdi:check"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          preset="dark-success"
          min-width="158px"
        />
        <TopMiningChip
          label="Large"
          size="lg"
          icon="mdi:check"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          preset="dark-success"
          min-width="180px"
        />
      </div>
    `,
  }),
  decorators: [canvasDark],
}

export const VerificationStates: Story = {
  name: 'Статусы проверки',
  render: () => ({
    components: { TopMiningChip },
    template: `
      <div class="sb-stack">
        <TopMiningChip
          label="Проверены"
          icon="mdi:check"
          icon-position="left"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          preset="dark-success"
          min-width="158px"
        />
        <TopMiningChip
          label="Не проверены"
          icon="mdi:close"
          icon-position="left"
          prepend-icon-background="#ef4444"
          prepend-icon-color="#fff"
          preset="dark-danger"
          min-width="158px"
        />
        <TopMiningChip
          label="Внесена"
          icon="mdi:check"
          icon-position="left"
          prepend-icon-background="#4caf50"
          prepend-icon-color="#fff"
          text-color="#fff"
          bg-color="transparent"
          border-width="0"
          min-width="auto"
        />
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.compact)],
  parameters: {
    docs: {
      description: {
        story: 'Типовые чипы со страницы организации: одинаковая ширина у статусов проверки.',
      },
    },
  },
}

export const AllVariants: Story = {
  name: 'Все варианты',
  render: () => ({
    components: { TopMiningChip },
    template: `
      <div class="sb-stack" style="gap: 16px">
        <div class="sb-row" style="flex-wrap: wrap; gap: 12px">
          <TopMiningChip label="Без иконки" icon-position="none" preset="dark" min-width="auto" />
          <TopMiningChip label="Слева" icon="mdi:check" prepend-icon-background="#4caf50" prepend-icon-color="#fff" preset="dark-success" />
          <TopMiningChip label="Справа" icon-position="right" icon="mdi:chevron-right" append-icon-color="var(--tm-orange-accent-light)" icon-variant="plain" preset="dark" min-width="auto" />
        </div>
        <div class="sb-row" style="flex-wrap: wrap; gap: 12px">
          <TopMiningChip label="Обе стороны" prepend-icon="mdi:star" append-icon="mdi:open-in-new" prepend-icon-background="var(--tm-orange-accent-light)" prepend-icon-color="#fff" append-icon-color="#bdbdbd" preset="dark" min-width="auto" />
          <TopMiningChip label="С бордером" outlined text-color="var(--tm-orange-accent-light)" min-width="auto" />
          <TopMiningChip label="Pill" shape="pill" preset="dark" min-width="auto" />
        </div>
      </div>
    `,
  }),
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.row)],
}

export const InfoCard: Story = {
  name: 'Info card',
  args: {
    layout: 'info',
    label: '14.04.2021',
    subtitle: 'регистрация домена',
    appendImageUrl: '/images/catalog/domain-cloud-lock.png',
    preset: 'dark',
    bgColor: '#1a1a1a',
    borderRadius: '32px',
    minWidth: '100%',
  },
  decorators: [canvasDarkMaxWidth('360px')],
}
