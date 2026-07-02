import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningBrandTitle from '~/components/global/TopMiningBrandTitle.vue'

import {
  CANVAS_WIDTH,
  canvasBrandAllVariants,
  canvasBrandFooter,
  canvasBrandHero,
  canvasLightMaxWidth,
} from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningBrandTitle',
  component: TopMiningBrandTitle,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Текстовый логотип «ТОП-МАЙНИНГ» с маркой.

- **hero** — крупный заголовок (\`h1\`) на первом экране
- **menu** — компактный вариант в шапке (\`h2\`)
- **footer** — вариант для подвала (\`span\`)
- **spaced** — увеличенный letter-spacing
        `.trim(),
      },
    },
  },
  decorators: [
    (story, { args }) => {
      const variant = args?.variant ?? 'hero'

      if (variant === 'hero') {
        return {
          template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light sb-brand-hero-wrap" style="max-width: ${CANVAS_WIDTH.section}px; width: 100%"><story /></div>`,
        }
      }

      if (variant === 'footer') {
        return {
          template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light" style="max-width: ${CANVAS_WIDTH.section}px; width: 100%"><div class="sb-brand-footer-wrap"><story /></div></div>`,
        }
      }

      return {
        template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light" style="max-width: ${CANVAS_WIDTH.section}px; width: 100%"><story /></div>`,
      }
    },
  ],
  argTypes: {
    variant: {
      control: 'select',
      options: ['hero', 'menu', 'footer'],
      description: 'Контекст использования',
    },
    spaced: { description: 'Расширенный межбуквенный интервал' },
  },
} satisfies Meta<typeof TopMiningBrandTitle>

export default meta

type Story = StoryObj<typeof meta>

export const Hero: Story = {
  args: {
    variant: 'hero',
  },
  decorators: [canvasBrandHero()],
  parameters: {
    docs: {
      description: { story: 'Главный экран на светлом фоне, крупный размер.' },
    },
  },
}

export const Menu: Story = {
  args: {
    variant: 'menu',
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    docs: {
      description: { story: 'Шапка сайта на светлом фоне.' },
    },
  },
}

export const Footer: Story = {
  args: {
    variant: 'footer',
    spaced: true,
  },
  decorators: [canvasBrandFooter()],
  parameters: {
    docs: {
      description: { story: 'Подвал на белом фоне, как в site-footer__brand.' },
    },
  },
}

export const Spaced: Story = {
  args: {
    variant: 'menu',
    spaced: true,
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.section)],
  parameters: {
    docs: {
      description: { story: 'Меню с увеличенным letter-spacing.' },
    },
  },
}

export const AllVariants: Story = {
  args: {
    variant: 'menu',
  },
  render: () => ({
    components: { TopMiningBrandTitle },
    template: `
      <div class="sb-brand-all-variants">
        <section class="sb-brand-all-variants__block sb-brand-all-variants__block--hero">
          <p class="sb-brand-all-variants__label">Hero</p>
          <div class="sb-brand-hero-wrap">
            <TopMiningBrandTitle variant="hero" />
          </div>
        </section>
        <section class="sb-brand-all-variants__block sb-brand-all-variants__block--menu">
          <p class="sb-brand-all-variants__label">Menu</p>
          <TopMiningBrandTitle variant="menu" />
        </section>
        <section class="sb-brand-all-variants__block sb-brand-all-variants__block--footer">
          <p class="sb-brand-all-variants__label">Footer</p>
          <div class="sb-brand-footer-wrap">
            <TopMiningBrandTitle variant="footer" spaced />
          </div>
        </section>
      </div>
    `,
  }),
  decorators: [canvasBrandAllVariants()],
  parameters: {
    backgrounds: { default: 'off-white' },
    docs: {
      description: { story: 'Сравнение всех вариантов логотипа.' },
    },
  },
}
