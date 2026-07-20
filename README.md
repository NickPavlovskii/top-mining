# Niklad

Лендинг финансовой платформы Top Mining на Nuxt 3.

## Стек

- Nuxt 3 + Vue 3 + TypeScript
- Quasar (`nuxt-quasar-ui`)
- Tailwind CSS 4
- @nuxt/ui
- BEM — именование CSS-классов в компонентах
- SCSS — глобальные переменные и стили

## Структура проекта

```
niklad/
├── app.vue                     # Корневой компонент + layout
├── app.config.ts
├── nuxt.config.ts
│
├── assets/
│   ├── quasar-variables.scss   # Переменные Quasar
│   ├── scss/
│   │   ├── variables.scss      # CSS-переменные (цвета, отступы)
│   │   ├── global.css          # Базовые стили
│   │   ├── main.css            # Точка входа стилей
│   │   └── scrollbar.scss      # Кастомный скроллбар
│   └── images/
│       └── top-mining/         # Изображения лендинга
│
├── common/
│   └── modules/                # Данные, типы, чистая логика по доменам
│       ├── top-mining/
│       ├── catalog/
│       ├── crypto/
│       ├── ratings/
│       ├── charts/
│       ├── not-found/
│       └── ...
│
├── components/                 # Vue UI по доменам (см. components/README.md)
│   ├── global/                 # Кнопки, чипы, brand title, 404
│   ├── top-mining/             # Секции лендинга + footer
│   │   └── header/             # Шапка сайта (TopMiningHeader + nav)
│   ├── catalog/                # Каталог (home, filters, cards, detail)
│   ├── crypto/                 # Блок крипторынка
│   ├── charts/                 # Графики (SparklineChart)
│   ├── rating/                 # Рейтинги
│   └── process/                # «Как мы работаем»
│
├── layouts/
│   └── default.vue             # Header + slot + footer
│
├── pages/                      # Маршруты (тонкая композиция)
│
├── composables/                # Реэкспорты доменных хуков (Nuxt auto-import)
│
├── server/
│   └── api/                    # Nitro API / прокси
```

Подробнее про зоны папок и слои: [`docs/frontend.md`](./docs/frontend.md) (полная карта клиента), кратко — [`components/README.md`](./components/README.md).

## Принципы организации

### Компоненты по фичам

Компоненты лежат в подпапках по домену, а не в одной плоской директории:

| Папка | Назначение |
|-------|------------|
| `components/global/` | Переиспользуемый UI по всему сайту |
| `components/top-mining/` | Секции главной, футер |
| `components/top-mining/header/` | Шапка: header + desktop/compact/mobile nav |
| `components/catalog/` | Каталог организаций / manufacturers / detail |
| `components/crypto/` | CryptoMarketSection, CryptoCoinList |
| `components/charts/` | Sparkline и другие графики |
| `components/rating/` | Рейтинги |
| `components/process/` | WorkProcessSection |

Nuxt автоматически импортирует компоненты из вложенных папок — имя берётся из файла (`TopMiningHeader.vue` → `<TopMiningHeader>`).

### Модули (`common/modules/`)

Каждый домен — самодостаточный пакет: типы, данные, логика, fallback. Импорт предпочтительно через `index.ts`:

```ts
import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining'
import { CRYPTO_PERIODS } from '~/common/modules/crypto'
import type { CatalogOrganization } from '~/common/modules/catalog'
```

Внутри модуля: `types.ts`, `fallback.ts`, чистые функции, доменные composables.

> Папка `common/modules/`, а не `modules/` в корне — в Nuxt корневая `modules/` зарезервирована под Nuxt-модули (`nuxt-quasar-ui`, `@nuxt/ui` и т.д.).

### Страницы и layout

- `pages/` — file-based routing Nuxt (аналог `views/` в эталонном Vue-проекте).
- `layouts/default.vue` — обёртка с шапкой и футером.

### Стили

Цвета и дизайн-токены — в `assets/scss/variables.scss`. Компоненты используют CSS-переменные:

```css
color: var(--orange-color);
background: var(--bg);
```

Подключение глобальных стилей — в `nuxt.config.ts` → `css: [...]`.

## Запуск

```bash
npm install
npm run dev      # dev-сервер
npm run build    # production-сборка
npm run preview  # предпросмотр сборки
```

## Куда класть новый код

| Задача | Куда |
|--------|------|
| Новая страница | `pages/<route>.vue` (тонкая, только композиция) |
| UI-компонент фичи | `components/<домен>/` |
| Шапка / пункты меню | `components/top-mining/header/` + данные в `common/modules/top-mining/` |
| Типы, константы, логика домена | `common/modules/<домен>/` |
| Vue-хук домена | `common/modules/<домен>/use*.ts` + реэкспорт в `composables/` |
| API-эндпоинт | `server/api/<домен>/` |
| Кросс-доменный хелпер | `utils/` (только если не принадлежит одному домену) |
| Глобальный стиль / переменная | `assets/scss/` |
