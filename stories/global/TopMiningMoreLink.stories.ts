import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningMoreLink from '~/components/global/TopMiningMoreLink.vue'
import { CATALOG_PAGE_HREF } from '~/common/modules/catalog/nav-links'

import { CANVAS_WIDTH, canvasDarkMaxWidth } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningMoreLink',
  component: TopMiningMoreLink,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'jet' },
    docs: {
      description: {
        component: `
Полноширинная ссылка с оранжевой стрелкой.

- **size \`md\`** — блок каталога («Ещё категории»)
- **size \`lg\`** — лента статей («Смотреть ещё»)
- Использует \`NuxtLink\` через prop \`to\`
- При наведении фон становится оранжевым, стрелка сдвигается на 3px вправо
        `.trim(),
      },
    },
  },
  argTypes: {
    label: { description: 'Текст ссылки' },
    to: { description: 'Маршрут Nuxt' },
    size: {
      control: 'select',
      options: ['md', 'lg'],
      description: 'Размер и типографика',
    },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
} satisfies Meta<typeof TopMiningMoreLink>

export default meta

type Story = StoryObj<typeof meta>

export const Catalog: Story = {
  args: {
    to: '/catalog',
    label: 'Ещё категории',
    size: 'md',
  },
  parameters: {
    docs: {
      description: { story: 'Вариант `md` для секции каталога.' },
    },
  },
}

export const Articles: Story = {
  args: {
    to: '/articles',
    label: 'Смотреть ещё',
    size: 'lg',
  },
  parameters: {
    docs: {
      description: { story: 'Вариант `lg` для ленты статей.' },
    },
  },
}

export const AllSizes: Story = {
  render: () => ({
    components: { TopMiningMoreLink },
    setup() {
      return { CATALOG_PAGE_HREF }
    },
    template: `
      <div class="sb-stack sb-stack--stretch">
        <TopMiningMoreLink :to="CATALOG_PAGE_HREF" label="Ещё категории" size="md" />
        <TopMiningMoreLink to="/articles" label="Смотреть ещё" size="lg" />
      </div>
    `,
  }),
  parameters: {
    docs: {
      description: {
        story: 'Сравнение размеров `md` и `lg` на полной ширине секции.',
      },
    },
  },
}
