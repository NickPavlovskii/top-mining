import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningArticleRow from '~/components/global/articles/TopMiningArticleRow.vue'
import { sampleArticlePreview } from '~/test/fixtures/article-preview'

import { CANVAS_WIDTH, canvasDarkMaxWidth } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningArticleRow',
  component: TopMiningArticleRow,
  tags: ['autodocs'],
  parameters: {
    docs: {
      description: {
        component: `
Строка статьи для list-режима ленты.

Meta слева, заголовок по центру, стрелка справа.  
Prop \`titleTag\` задаёт уровень заголовка для семантики (\`h2\` / \`h3\`).
        `.trim(),
      },
    },
  },
  argTypes: {
    article: { description: 'Объект `ArticlePreview`' },
    to: { description: 'Ссылка на страницу статьи' },
    titleTag: {
      control: 'select',
      options: ['h2', 'h3'],
      description: 'HTML-тег заголовка',
    },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
} satisfies Meta<typeof TopMiningArticleRow>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    article: sampleArticlePreview,
    to: `/articles/${sampleArticlePreview.slug}`,
    titleTag: 'h3',
  },
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Стандартная строка с заголовком `h3`.' },
    },
  },
}

export const HeadingLevel2: Story = {
  args: {
    article: sampleArticlePreview,
    to: `/articles/${sampleArticlePreview.slug}`,
    titleTag: 'h2',
  },
  parameters: {
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: { story: 'Вариант с `h2` для верхнего уровня списка.' },
    },
  },
}
