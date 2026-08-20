// @ts-check
import { defineConfig, devices } from '@playwright/test'

const appPort = Number(process.env.PLAYWRIGHT_APP_PORT || 3010)
const storybookPort = Number(process.env.PLAYWRIGHT_STORYBOOK_PORT || 6010)

const appBaseURL = `http://127.0.0.1:${appPort}`
const storybookBaseURL = `http://localhost:${storybookPort}`

const appWebServer = {
  command: `npm run dev -- --port ${appPort} --host 127.0.0.1`,
  url: appBaseURL,
  reuseExistingServer: !process.env.CI,
  timeout: 240_000,
  env: {
    ...process.env,
    NUXT_IGNORE_LOCK: '1',
  },
}

const storybookWebServer = {
  command: `npx storybook dev -p ${storybookPort} --ci --no-open`,
  url: storybookBaseURL,
  reuseExistingServer: !process.env.CI,
  timeout: 300_000,
}

export default defineConfig({
  testDir: 'tests',
  fullyParallel: true,
  forbidOnly: Boolean(process.env.CI),
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : 4,
  reporter: process.env.CI
    ? [
        ['list'],
        ['html', { open: 'never' }],
        ['junit', { outputFile: 'test-results/junit.xml' }],
      ]
    : [['list'], ['html', { open: 'never' }]],
  use: {
    trace: 'on-first-retry',
    locale: 'ru-RU',
  },
  projects: [
    {
      name: 'app',
      testIgnore: '**/storybook/**',
      use: {
        ...devices['Desktop Chrome'],
        baseURL: appBaseURL,
      },
      webServer: appWebServer,
    },
    {
      name: 'storybook',
      testDir: 'tests/storybook',
      use: {
        ...devices['Desktop Chrome'],
        baseURL: storybookBaseURL,
      },
      webServer: storybookWebServer,
    },
  ],
})
