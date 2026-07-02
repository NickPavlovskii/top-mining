import type { StorybookConfig } from '@storybook-vue/nuxt'
import { mergeConfig } from 'vite'

const config: StorybookConfig = {
  stories: ['../stories/**/*.stories.ts'],
  addons: ['@storybook/addon-docs'],
  framework: {
    name: '@storybook-vue/nuxt',
    options: {},
  },
  docs: {
    autodocs: 'tag',
    defaultName: 'Документация',
  },
  staticDirs: ['../public'],
  async viteFinal(config) {
    return mergeConfig(config, {
      resolve: {
        dedupe: ['vue', 'react', 'react-dom', '@mdx-js/react'],
      },
      optimizeDeps: {
        include: ['react', 'react-dom', '@mdx-js/react'],
      },
      server: {
        watch: {
          ignored: ['**/.nuxt/**', '**/storybook-static/**'],
        },
        hmr: {
          port: 24679,
          clientPort: 24679,
        },
      },
    })
  },
}

export default config
