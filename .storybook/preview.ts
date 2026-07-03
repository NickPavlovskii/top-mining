import '@storybook-vue/nuxt/preview'
import '@storybook/addon-docs/preview'

import type { Preview } from '@storybook/vue3'

import '../assets/scss/variables.scss'
import './storybook.css'

import { topMiningTheme } from './brand-theme'

const preview: Preview = {
  parameters: {
    layout: 'centered',
    options: {
      storySort: {
        order: [
          'Top Mining',
          ['Введение', 'Дизайн-токены', 'Использование в Nuxt', '*'],
          'Global',
          '*',
        ],
      },
    },
    controls: {
      matchers: {
        color: /(background|color)$/i,
      },
      expanded: true,
    },
    backgrounds: {
      default: 'landing-dark',
      values: [
        { name: 'landing-dark', value: '#141414' },
        { name: 'jet', value: '#151515' },
        { name: 'card', value: '#2a2a2a' },
        { name: 'off-white', value: '#f6f6f6' },
        { name: 'white', value: '#ffffff' },
      ],
    },
    docs: {
      toc: {
        headingSelector: 'h2, h3',
        title: 'На этой странице',
      },
      theme: topMiningTheme,
    },
  },
}

export default preview
