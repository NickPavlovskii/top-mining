const isStorybook =
  process.env.STORYBOOK === 'true' ||
  process.env.npm_lifecycle_event === 'storybook' ||
  process.env.npm_lifecycle_event === 'build-storybook' ||
  process.argv.some((arg) => /storybook/.test(arg))

export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',

  devtools: { enabled: !isStorybook },

  // Nuxt сканирует dir.modules как локальные Nuxt-модули.
  // Данные фич лежат в common/modules/, не здесь.
  dir: {
    modules: 'nuxt-local-modules',
  },

  components: {
    dirs: [
      {
        path: '~/components',
        pathPrefix: false,
        ignore: ['**/index.ts'],
      },
    ],
  },

  css: [
    '@fontsource/unbounded/cyrillic-400.css',
    '@fontsource/unbounded/cyrillic-500.css',
    '@fontsource/unbounded/cyrillic-600.css',
    '@fontsource/unbounded/latin-400.css',
    '@fontsource/unbounded/latin-500.css',
    '@fontsource/unbounded/latin-600.css',
    './assets/scss/variables.scss',
    // Global orange scrollbar — only in the app, not Storybook docs/canvas.
    ...(!isStorybook ? ['./assets/scss/vertical-scrollbar.scss'] : []),
    './assets/scss/scrollbar.scss',
    './assets/scss/main.css',
  ],

  modules: [
    'nuxt-quasar-ui',
    '@nuxt/ui',
    '@nuxt/icon',
    '@nuxt/test-utils/module',
    '@nuxt/eslint',
  ],

  // `@storybook-vue/nuxt` rewrites color-mode imports to absolute Windows paths
  // (backslashes → broken JS escapes) and the iframe then 404s the plugin.
  // Keep color-mode enabled for normal `nuxt dev` / production.
  ui: {
    colorMode: !isStorybook,
  },

  eslint: {
    config: {
      stylistic: false,
    },
  },

  fonts: {
    providers: {
      adobe: false,
      bunny: false,
      fontshare: false,
      fontsource: false,
      google: false,
      googleicons: false,
    },
  },

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          silenceDeprecations: ['import'],
        },
        sass: {
          silenceDeprecations: ['import'],
        },
      },
    },
    server: {
      // Do not pin a separate Storybook HMR port here. Storybook runs Vite in
      // middleware mode on its HTTP port (:6007); a clientPort like 24679 makes
      // the browser open a WebSocket that never connects.
      watch: {
        ignored: [
          '**/storybook-static/**',
          ...(isStorybook ? ['**/.nuxt/**'] : []),
        ],
      },
    },
  },

  quasar: {
    sassVariables: '@/assets/quasar-variables.scss',
    extras: {
      font: 'roboto-font',
      fontIcons: ['material-icons'],
    },
  },

  runtimeConfig: {
    catalogGraphqlUrl:
      process.env.CATALOG_GRAPHQL_URL || 'http://localhost:8080/graphql',
    smtpHost: process.env.SMTP_HOST || '',
    smtpPort: process.env.SMTP_PORT || '587',
    smtpUser: process.env.SMTP_USER || '',
    smtpPass: process.env.SMTP_PASS || '',
    smtpFrom: process.env.SMTP_FROM || '',
    smtpSecure: process.env.SMTP_SECURE || '',
  },
})
