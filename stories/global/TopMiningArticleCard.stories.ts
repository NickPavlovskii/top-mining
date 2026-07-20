import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningArticleCard from '~/components/global/articles/TopMiningArticleCard.vue'
import { sampleArticlePreview } from '~/test/fixtures/article-preview'

import { CANVAS_WIDTH, canvasDarkMaxWidth } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningArticleCard',
  component: TopMiningArticleCard,
  tags: ['autodocs'],
  parameters: {
    docs: {
      description: {
        component: `
Карточка превью статьи для grid-сетки.

Показывает обложку, время чтения, дату публикации и excerpt.  
Prop \`showOverlay\` добавляет градиент поверх изображения.
        `.trim(),
      },
    },
  },
  argTypes: {
    article: { description: 'Объект `ArticlePreview`' },
    to: { description: 'Ссылка на страницу статьи' },
    showOverlay: { description: 'Градиент поверх обложки' },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.card)],
} satisfies Meta<typeof TopMiningArticleCard>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    article: sampleArticlePreview,
    to: `/articles/${sampleArticlePreview.slug}`,
  },
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Стандартная карточка с полным набором meta.' },
    },
  },
}

export const WithOverlay: Story = {
  args: {
    article: sampleArticlePreview,
    to: `/articles/${sampleArticlePreview.slug}`,
    showOverlay: true,
  },
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'С градиентным оверлеем на обложке.' },
    },
  },
}

export const WithoutReadingTime: Story = {
  args: {
    article: {
      ...sampleArticlePreview,
      readingTimeMin: null,
    },
    to: `/articles/${sampleArticlePreview.slug}`,
  },
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Без блока времени чтения (`readingTimeMin: null`).' },
    },
  },
}
