export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',

  devtools: { enabled: true },

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
    './assets/scss/variables.scss',
    './assets/scss/scrollbar.scss',
    './assets/scss/main.css',
  ],

  modules: ['nuxt-quasar-ui', '@nuxt/ui', '@nuxt/icon'],

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
    articlesApiUrl:
      process.env.ARTICLES_API_URL || 'http://localhost:8080',
  },
})
