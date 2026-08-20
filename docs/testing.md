# Тесты

В проекте два уровня:

| Уровень | Инструмент | Каталог | Язык |
|---------|------------|---------|------|
| Unit / snapshot | Vitest + Vue Test Utils | `test/unit/` | TypeScript |
| E2E (приложение + Storybook) | Playwright | `tests/` | JavaScript |

Правила для E2E в Cursor: [`.cursor/rules/playwright-e2e.mdc`](../.cursor/rules/playwright-e2e.mdc).
CI: в `Jenkinsfile` — lint → unit → e2e → build.

---

## Быстрый старт

```bash
npm install
npx playwright install chromium   # один раз для E2E

npm run test          # Vitest watch
npm run test:run      # Vitest один прогон
npm run test:e2e      # Playwright: app + Storybook
npm run test:e2e:app
npm run test:e2e:storybook
```

| Команда | Что делает |
|---------|------------|
| `npm run test` | Vitest в watch |
| `npm run test:run` | Vitest без watch (CI) |
| `npm run test:e2e` | Оба Playwright-проекта |
| `npm run test:e2e:app` | Только Nuxt-приложение |
| `npm run test:e2e:storybook` | Только Storybook |

Отчёт Playwright после прогона: `playwright-report/` (HTML). В CI дополнительно `test-results/junit.xml`.

---

## Unit-тесты (Vitest)

### Конфиг и окружение

- [`vitest.config.ts`](../vitest.config.ts) — `happy-dom`, алиасы `~` / `@`, AutoImport composables
- [`test/setup.ts`](../test/setup.ts) — stubs Nuxt (`useCookie`, `useState`, `useHead`), `NuxtLink` → `RouterLink`, Icon / Quasar (`QBtn`, `QChip`, …)
- Файлы: `test/unit/**/*.spec.ts`

### Структура

```
test/unit/
  components/     # Vue-компоненты (global, calculator, buy-asic, …)
  pages/          # страницы
  common/         # модули common/modules (калькулятор, i18n, layout)
  stores/         # Pinia
```

Рядом со спеками могут лежать `__snapshots__/*.snap`.

### Как писать

1. Импорты из `vitest`, монтирование через `@vue/test-utils`.
2. Для Pinia: `createPinia` + `setActivePinia` в `beforeEach`.
3. Проверяйте поведение и видимый текст/структуру, не внутренности реализации.
4. Snapshot — только для стабильной вёрстки/разметки; при смене UI обновляйте осознанно:

```bash
npx vitest run -u
# или точечно:
npx vitest run test/unit/components/converter/HashrateConverterWidget.spec.ts -u
```

### Запуск выборочно

```bash
npx vitest run test/unit/stores
npx vitest run TopMiningButton
```

---

## E2E (Playwright)

### Конфиг

[`playwright.config.js`](../playwright.config.js):

| Проект | Порт (по умолчанию) | Dev-сервер | Тесты |
|--------|---------------------|------------|--------|
| `app` | `3010` (`PLAYWRIGHT_APP_PORT`) | `nuxt dev --host 127.0.0.1` | `tests/*.spec.js` (кроме `storybook/`) |
| `storybook` | `6010` (`PLAYWRIGHT_STORYBOOK_PORT`) | Storybook `--ci` | `tests/storybook/*.spec.js` |

Локально при уже запущенном сервере на том же порту Playwright может переиспользовать его (`reuseExistingServer`, если не `CI`).  
В CI серверы поднимаются сами; `CI=true` → 1 worker, retries=2, junit-репортёр.

### Структура

```
tests/
  helpers/
    goto-app.js           # переход + ожидание шапки
    install-api-mocks.js  # моки только /api/*
    fixtures.js           # ответы API
    storybook.js          # gotoStory / toStoryId
    index.js
  home.spec.js
  navigation.spec.js
  calculator.spec.js
  catalog.spec.js
  …
  storybook/
    global.spec.js
    calculator.spec.js
    …
```

Имена файлов — по зоне продукта. Названия тестов — на русском.

### Хелперы

- `gotoApp(page, path)` — ставит API-моки (по умолчанию) и ждёт `header .top-mining__logo`.
- `gotoApp(page, path, { mockApi: false })` — для статических страниц без API.
- `gotoStory(page, storyId)` — открывает iframe Storybook.
- Фикстуры в `fixtures.js` — каталог, калькулятор, статьи, рейтинги и т.д.

### API-моки

Мокаются **только** явные маршруты Nitro вида `/api/...`.  
Нельзя использовать glob `**/api/**` (и не писать его в JSDoc — ломает закрытие комментария).

SSR `useFetch` на первом рендере Playwright не перехватывает — E2E проверяют **статический UI/структуру**, а не данные из моков после гидрации там, где контент уже в HTML с сервера.

### Локаторы

1. `getByRole` → `getByLabel` → `getByPlaceholder` → `getByText`
2. CSS-классы и test id — только если нет семантики
3. При strict mode: `.first()`, `exact: true`, узкий scope (`main h1`)

### Пример (app)

```js
import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Майнинг-калькулятор', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/calculator')
  })

  test('отображает форму калькулятора', async ({ page }) => {
    await expect(
      page.getByRole('region', { name: 'Калькулятор доходности' }),
    ).toBeVisible()
  })
})
```

### Пример (Storybook)

```js
import { test, expect } from '@playwright/test'
import { gotoStory } from '../helpers/index.js'

test('TopMiningButton — default', async ({ page }) => {
  await gotoStory(page, 'global-topminingbutton--default')
  await expect(page.frameLocator('iframe[title="storybook-preview-iframe"]').getByRole('button')).toBeVisible()
})
```

(точный id сторис — из URL Storybook / `toStoryId()`.)

### Отладка

```bash
npx playwright test --project=app --headed
npx playwright test tests/calculator.spec.js --debug
npx playwright show-report
```

Trace при падении/retry: смотрите в HTML-отчёте.

### Порты заняты

```bash
# PowerShell
$env:PLAYWRIGHT_APP_PORT='3020'
$env:PLAYWRIGHT_STORYBOOK_PORT='6020'
npm run test:e2e
```

---

## Что тестировать где

| Слой | Unit | E2E |
|------|------|-----|
| Чистая логика (`common/modules`, stores) | да | нет |
| UI-компонент, props/events/snapshot | да | опционально Storybook |
| Навигация, страницы, формы «видно пользователю» | точечно pages | да (app) |
| Визуальные сторис UI-kit | нет | да (storybook) |
| Backend Go | `cd backend && go test ./...` | — |

Авторизации на сайте нет — `storageState` / login-setup не используются.

---

## CI

В Jenkins (`Jenkinsfile`):

1. `npm ci` → `nuxt prepare`
2. lint
3. `npm run test:run`
4. `go test` / build backend
5. `npx playwright install --with-deps chromium`
6. `npm run test:e2e`

Артефакты: `playwright-report/**`, `test-results/**`, при наличии — JUnit XML.
