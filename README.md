<p align="center">
  <img src="docs/brand/logo.svg" alt="ТОП МАЙНИНГ" width="320" />
</p>

<h1 align="center">Top Mining</h1>

<p align="center">
  <strong>Платформа о майнинге</strong><br/>
  каталог · рейтинги · статьи · калькулятор доходности · конвертер хешрейта · лендинги
</p>

<p align="center">
  <a href="https://top-mining.ru"><strong>top-mining.ru</strong></a>
  &nbsp;·&nbsp;
  <a href="./docs/frontend.md">Frontend</a>
  &nbsp;·&nbsp;
  <a href="./docs/architecture.md">Архитектура</a>
  &nbsp;·&nbsp;
  <a href="./docs/top-mining-architecture.pdf">Архитектура (PDF)</a>
  &nbsp;·&nbsp;
  <a href="./docs/calculator.md">Калькулятор</a>
  &nbsp;·&nbsp;
  <a href="./docs/mining-calculator-guide.pdf">Гайд калькулятора (PDF)</a>
  &nbsp;·&nbsp;
  <a href="./docs/leads.md">Заявки и Zod</a>
  &nbsp;·&nbsp;
  <a href="./backend/README.md">Backend</a>
</p>

<p align="center">
  <img alt="Nuxt" src="https://img.shields.io/badge/Nuxt-3-00DC82?style=flat-square&logo=nuxt&logoColor=white" />
  <img alt="Vue" src="https://img.shields.io/badge/Vue-3-4FC08D?style=flat-square&logo=vuedotjs&logoColor=white" />
  <img alt="TypeScript" src="https://img.shields.io/badge/TypeScript-5-3178C6?style=flat-square&logo=typescript&logoColor=white" />
  <img alt="Go" src="https://img.shields.io/badge/Go-1.22+-00ADD8?style=flat-square&logo=go&logoColor=white" />
  <img alt="PostgreSQL" src="https://img.shields.io/badge/PostgreSQL-16-4169E1?style=flat-square&logo=postgresql&logoColor=white" />
  <img alt="Storybook" src="https://img.shields.io/badge/Storybook-9-FF4785?style=flat-square&logo=storybook&logoColor=white" />
  <img alt="Vitest" src="https://img.shields.io/badge/Vitest-4-729B1B?style=flat-square&logo=vitest&logoColor=white" />
</p>

---

## Быстрый старт

```bash
npm install
npm run dev          # http://localhost:3000
npm run storybook    # http://localhost:6007
npm run test:run     # unit + snapshot
```

| Команда | Что делает |
|---------|------------|
| `npm run dev` | Dev-сервер Nuxt |
| `npm run build` / `preview` | Сборка и предпросмотр |
| `npm run lint` / `lint:fix` | ESLint + Stylelint |
| `npm run storybook` | UI-kit и визуальные сторис |
| `npm run test` | Vitest (watch) |
| `npm run test:run` | Vitest один прогон |

Backend (Go + Postgres): см. [`backend/README.md`](./backend/README.md).

---

## Стек

```text
┌──────────────────────────────────────────────────────────────┐
│  Browser                                                     │
│  Nuxt 3 · Vue 3 · TypeScript · Quasar · Tailwind 4 · SCSS    │
└────────────────────────────┬─────────────────────────────────┘
                             │  /api/*
┌────────────────────────────▼─────────────────────────────────┐
│  Nitro (Nuxt server)                                         │
│  server/api/*  →  GraphQL-прокси к Go                        │
└────────────────────────────┬─────────────────────────────────┘
                             │
┌────────────────────────────▼─────────────────────────────────┐
│  Go GraphQL (:8080)  ·  PostgreSQL (Docker)                  │
└──────────────────────────────────────────────────────────────┘
```

| Слой | Технологии |
|------|------------|
| **Frontend** | Nuxt 3, Vue 3, TypeScript, Vue Router |
| **UI** | Quasar (`nuxt-quasar-ui`), `@nuxt/ui`, Tailwind CSS 4 |
| **Стили** | SCSS-токены (`--tm-*`), BEM, шрифт **Unbounded** / Mulish |
| **Качество** | ESLint, Stylelint, Prettier, Vitest, Storybook 9 |
| **Backend** | Go, GraphQL, PostgreSQL, Docker Compose |
| **Тесты** | Vitest + `@vue/test-utils` + happy-dom, HTML-snapshots |

---

## Документация

| Документ | Описание |
|----------|----------|
| [`docs/frontend.md`](./docs/frontend.md) | Архитектура фронтенда |
| [`docs/architecture.md`](./docs/architecture.md) | Система: BFF, GraphQL, BPMN |
| [`docs/top-mining-architecture.pdf`](./docs/top-mining-architecture.pdf) | Архитектура (PDF) · [Drive](https://drive.google.com/file/d/1qOMIISLVlTwU8XhqFbly8rzvgxW8Z0PN/view?usp=drive_link) |
| [`docs/calculator.md`](./docs/calculator.md) | Спека калькулятора (UI + формулы) |
| [`docs/mining-calculator-guide.pdf`](./docs/mining-calculator-guide.pdf) | Гайд калькулятора (PDF) · [Drive](https://drive.google.com/file/d/1zq-x05P5ODkBb7_5D0j7RZe8210lT087/view?usp=drive_link) |
| [`docs/leads.md`](./docs/leads.md) | Заявки и Zod |
| [`backend/README.md`](./backend/README.md) | GraphQL, Postgres, миграции |
| [`components/README.md`](./components/README.md) | Зоны Vue-компонентов |
| [`docs/brand/`](./docs/brand/) | Логотип и иконки |
| [`docs/diagrams/`](./docs/diagrams/) | UML / ER / flowchart PNG |

---

## Схемы архитектуры

Полные PDF:

- [Архитектура Top Mining (PDF)](./docs/top-mining-architecture.pdf) · [Google Drive](https://drive.google.com/file/d/1qOMIISLVlTwU8XhqFbly8rzvgxW8Z0PN/view?usp=drive_link)
- [Гайд по калькулятору (PDF)](./docs/mining-calculator-guide.pdf) · [Google Drive](https://drive.google.com/file/d/1zq-x05P5ODkBb7_5D0j7RZe8210lT087/view?usp=drive_link)

Markdown: [`docs/architecture.md`](./docs/architecture.md), [`docs/calculator.md`](./docs/calculator.md), [`docs/leads.md`](./docs/leads.md).

### GraphQL Schema

Центральный `GraphQLSchema` — точка входа Go API. Запросы и мутации делегируются доменным пакетам: каталог, железо/монеты калькулятора, статьи, организации, рейтинги, подбор (`podbor`), лиды.

| Операция | Модуль | Назначение |
|----------|--------|------------|
| `catalog()` | `catalog` | Каталог организаций и производителей |
| `calculatorHardware()` | `hardware` | Модели ASIC / GPU / CPU |
| `calculatorCoins()` | `hardware` | Монеты, алгоритмы, рыночные дефолты |
| `createLead()` | `leads` | Заявка с формы |

`hardware` тянет каталог через `FetchCalculatorCatalog()` / `FetchCalculatorCoins()`. `leads.Create()` пишет в Postgres.

<p align="center">
  <img src="docs/diagrams/graphql-schema.png" alt="UML: GraphQL Schema и доменные модули" width="720" />
</p>

### Sequence — загрузка калькулятора

BFF-паттерн: браузер → `CalculatorForm` → Nitro `/api/calculator/*` → Go GraphQL → `hardware` pkg → PostgreSQL.

1. Пользователь открывает `/calculator`.
2. Форма запрашивает hardware + coins у Nuxt API.
3. Nitro проксирует GraphQL `calculatorHardware` / `calculatorCoins`.
4. Go вызывает `FetchCalculatorCatalog` / `FetchCalculatorCoins`.
5. SQL по таблицам `hardware_*`, `market_stats`, `fx_rates`.
6. DTO → JSON GraphQL → JSON API → форма.

Расчёт `calculateMiningProfit` идёт **на клиенте**, без второго круга на сервер.

<p align="center">
  <img src="docs/diagrams/sequence-calculator.png" alt="Sequence: калькулятор Browser → Nuxt → Go GraphQL → PostgreSQL" width="860" />
</p>

### Sequence — заявка с двойной Zod-валидацией

`useSubmitLead` валидирует тело той же схемой `parseLeadSubmit` на клиенте и на сервере.

1. Пользователь сабмитит форму.
2. Клиент: `safeParse` → при ошибке `TopMiningFormStatus`.
3. `POST /api/leads` → повторный `safeParse` на сервере.
4. GraphQL `createLead` → `INSERT` в `leads`.
5. Опционально уведомление в Telegram.
6. Клиенту — success status.

<p align="center">
  <img src="docs/diagrams/sequence-leads.png" alt="Sequence: lead submit с двойной Zod-валидацией" width="860" />
</p>

### ER — ядро hardware (миграция 017, сид 028)

Нормализованная схема калькулятора: виды и вендоры железа, модели (hashrate, Вт), алгоритмы, монеты, рыночные статы и курсы.

Прибыль считается связкой `hardware_models` (hashrate, `power_w`) → алгоритмы → `hardware_coins` → `market_stats` (`price_usdt`, difficulty, block reward) + `fx_rates`.

<p align="center">
  <img src="docs/diagrams/er-hardware.png" alt="ER: ядро hardware, миграция 017, сид 028" width="860" />
</p>

### Flowchart — сценарий калькулятора

1. Старт → загрузка hardware и coins.
2. Тип: ASIC / GPU / CPU.
3. Модель или ручные параметры → монета / алгоритм.
4. Цена, qty, hashrate, мощность, тариф.
5. Валидация → ошибка или подтверждение дефолтной цены.
6. Расчёт на клиенте → результаты.
7. Можно изменить параметры и пройти цикл снова.

<p align="center">
  <img src="docs/diagrams/flowchart-calculator.png" alt="Flowchart: пользовательский сценарий калькулятора" width="420" />
</p>

---

## Бизнес-процесс продукта

ТОП МАЙНИНГ помогает майнеру и бизнесу пройти путь от интереса до решения:

```text
  Узнать рынок          Посчитать экономику         Выбрать партнёра
 ───────────────       ─────────────────────       ─────────────────
  Статьи / рейтинги  →  Калькулятор доходности   →  Каталог организаций
                        Конвертер хешрейта           Майнинг-отели / пулы
                                                    Покупка ASIC
                                                    Консалтинг
```

| Этап | Что делает пользователь | Где в продукте |
|------|-------------------------|----------------|
| 1. Ориентация | Читает статьи, смотрит рейтинги | `/articles/`, `/rating/` |
| 2. Расчёт | Считает доход ASIC / GPU / CPU | `/calculator/` |
| 3. Конвертация | Переводит H/s ↔ TH/s ↔ EH/s… | `/konverter-heshrejta/` |
| 4. Выбор | Ищет отели, пулы, продавцов | каталог, лендинги |
| 5. Контакт | Оставляет заявку / Telegram | формы, бот калькулятора |

Калькулятор и конвертер — **инструменты принятия решения**: пользователь видит чистую прибыль, окупаемость и корректные единицы хешрейта до покупки оборудования или размещения.

---

## Инструменты: калькулятор и конвертер

### Майнинг-калькулятор — `/calculator/`

Считает доходность оборудования с учётом курса, сложности сети, up-time, тарифа и комиссии пула.

**Сценарий пользователя**

1. Выбрать тип: **ASIC / GPU / CPU** (или прийти из меню с `#asic` / `#gpu` / `#cpu`).
2. Выбрать **модель** из каталога (ASIC можно разблокировать ручным вводом).
3. Указать **монету** (ASIC) или **алгоритм → монету** (GPU/CPU).
4. Поправить цену, количество, хешрейт, Вт, тариф; при необходимости — расширенные опции.
5. Нажать **Рассчитать** → таблица: доход / эл-во / окупаемость / чистая прибыль.
6. Переключить валюту результата: **₽ | USDT | монета**.

```text
┌─────────────────────────────────────────────┐
│ (01) Устройство   ASIC | GPU | CPU          │
│ (02) Модель       бренд → модель + поиск    │
├─────────────────────────────────────────────┤
│ Параметры: монета, цена, HR, Вт, тариф…     │
│ Расширенные: up-time, курсы, пул, сложность │
├─────────────────────────────────────────────┤
│ Результат          ₽  |  USDT  |  монета    │
└─────────────────────────────────────────────┘
```

**Ключевые файлы**

| Часть | Путь |
|-------|------|
| Страница | `pages/calculator/index.vue` |
| Форма | `components/calculator/form/CalculatorForm.vue` |
| Формулы | `common/modules/top-mining/calculator/profit.ts` |
| Каталоги | железо/монеты из БД (`/api/calculator/hardware`, `/api/calculator/coins`); хелперы — `coins.ts`, `gpu.ts` |
| Спека | [`docs/calculator.md`](./docs/calculator.md) |

> Формула в духе WhatToMine: доля хешрейта в сети × награда × up-time − стоимость электричества. Подробности и псевдокод — в `docs/calculator.md`.

### Конвертер хешрейта — `/konverter-heshrejta/`

Быстрый перевод мощности между единицами:

`H/s → kH/s → MH/s → GH/s → TH/s → PH/s → EH/s → ZH/s`

| Часть | Путь |
|-------|------|
| Страница | `pages/konverter-heshrejta/index.vue` |
| Виджет | `components/converter/HashrateConverterWidget.vue` |
| Логика | `common/modules/top-mining/converter/hashrate.ts` |
| Тексты / FAQ | `converter/page.ts` |

Ввод в любом поле пересчитывает остальные; есть копирование значения.

---

## Тесты

Стек: **Vitest 4** + **@vue/test-utils** + **happy-dom**.

```bash
npm run test          # watch
npm run test:run      # CI / один прогон

# Точечно
npm test -- --run test/unit/components/converter
npm test -- --run test/unit/common/top-mining/converter
```

| Тип | Что проверяет | Примеры |
|-----|---------------|---------|
| **Unit (логика)** | Формулы прибыли, конвертация единиц, навигация | `calculator/profit.spec.ts`, `converter/hashrate.spec.ts`, `calculator/nav.spec.ts` |
| **Component** | Рендер, события select, модалки, секции | `CalculatorForm.spec.ts`, `TopMiningSelect.spec.ts`, `ConverterHero.spec.ts` |
| **Page smoke** | Состав секций + SEO | `calculator.spec.ts`, `konverter-heshrejta.spec.ts` |
| **Snapshot** | HTML-снимок разметки (регрессия UI) | `__snapshots__/*.snap` у converter / hero |

**Снапшоты** — это «скрин-тесты» на уровне разметки: при изменении шаблона тест упадёт, пока не обновите эталон:

```bash
npm test -- --run -u test/unit/components/converter
```

Тесты лежат в `test/unit/` зеркалом к коду: `common/`, `components/`, `pages/`.

---

## Storybook

UI-kit и визуальная проверка секций без полного Nuxt-приложения.

```bash
npm run storybook     # http://localhost:6007
npm run build-storybook
```

| Раздел | Содержание |
|--------|------------|
| **Global** | Кнопки, инпуты, select, чипы, collapse, токены |
| **Calculator** | Hero калькулятора |
| **Converter** | Hero, виджет, about, FAQ конвертера |
| **Buy ASIC / Consulting / …** | Секции лендингов |

Сторисы с тегом **`visual`** удобны для ручных скриншотов и ревью дизайна (desktop / tablet / mobile viewport в параметрах).

Структура: `stories/<домен>/…`, хелперы декораторов — `stories/helpers/decorators.ts`.

---

## Возможности продукта

- **Каталог** организаций: отели, пулы, продажи ASIC, фильтры и карточки
- **Рейтинги** и **статьи** по майнингу
- **Калькулятор доходности** ASIC / GPU / CPU
- **Конвертер хешрейта** (H/s … ZH/s)
- **Лендинги**: покупка ASIC, подбор отеля, консалтинг, увеличение дохода, дата-центры
- **Дизайн-система** в Storybook

---

## Структура репозитория

```text
top-mining/
├── assets/                 # Стили, шрифты, изображения
├── common/modules/         # Данные, типы, чистая логика по доменам
│   ├── top-mining/         # ui · layout · calculator · converter · buy-asic · …
│   ├── catalog/            # nav · filters · pages · content
│   ├── articles/ ratings/ crypto/ …
├── components/
│   ├── global/             # Переиспользуемый UI (в т.ч. TopMiningSelect)
│   ├── calculator/         # Hero, form, about калькулятора
│   ├── converter/          # Страница конвертера хешрейта
│   ├── top-mining/         # Шапка, футер, секции главной
│   ├── catalog/ buy-asic/ consulting/ …
├── pages/                  # Маршруты (тонкая композиция)
├── composables/            # useCalculatorDeviceRoute и др.
├── server/api/             # Nitro → GraphQL
├── stories/                # Storybook
├── test/unit/              # Vitest
├── docs/                   # frontend, architecture, calculator, leads, PDF, diagrams/
└── backend/                # Go GraphQL + Postgres
```

---

## Принципы кода

1. **Страница** (`pages/`) — маршрут, SEO, сборка секций.
2. **Компонент** (`components/<домен>/`) — UI и локальное состояние.
3. **Модуль** (`common/modules/<домен>/`) — типы, константы, тексты, чистая логика.
4. **API** (`server/api/`) — HTTP для браузера, часто GraphQL к Go.

```ts
import { calculateMiningProfit } from '~/common/modules/top-mining'
import type { CalculatorDeviceKind } from '~/common/modules/top-mining'
```

Токены: `assets/scss/variables.scss` → `var(--tm-orange)`, `var(--tm-ink)`.

---

## Модули `common/modules`

Слой **чистой логики и данных**: типы, константы, тексты страниц, формулы.  
UI-компоненты только импортируют отсюда. Файлы `index.ts` — barrel-реэкспорты.

```ts
import { calculateMiningProfit } from '~/common/modules/top-mining'
import { getCatalogCategoryHref } from '~/common/modules/catalog/nav/links'
```

### Обзор пакетов

| Пакет | Зона ответственности |
|-------|----------------------|
| `top-mining/` | Лендинг, калькулятор, конвертер, consulting, buy-asic, подбор отеля |
| `catalog/` | Каталог организаций и производителей |
| `articles/` | Статьи: типы, fallback, TOC, просмотры |
| `ratings/` | Рейтинги: карточки, ссылки, merge с API |
| `crypto/` | Крипторинок: CoinGecko, fallback, формат |
| `charts/` | Sparkline для графиков монет |
| `format/` | Дата, marquee-анимация |
| `http/` | HTTP-коды (`200`, `404`…) |
| `not-found/` | 3D-сфера на странице 404 |
| `process/` | Шаги секции «процесс работы» |
| `constants.ts` | Реэкспорт `top-mining` + `crypto` + `process` |

---

### `top-mining/`

#### `ui/` — токены дизайн-системы

| Файл | Ответственность | Ключевые экспорты |
|------|-----------------|-------------------|
| `button.ts` | Кнопки: варианты, размеры, цвета | `TOP_MINING_BUTTON_PROPS`, `TOP_MINING_BUTTON_COLORS` |
| `chip.ts` | Чипы / verification-бейджи | `TOP_MINING_CHIP_*`, verification colors |
| `colors.ts` | Бренд-палитра hex | `TM_ORANGE`, `TM_PAGE_BG` |
| `compare-table.ts` | Сравнительная таблица | `toCompareTableRows()` |

#### `layout/` — шапка, футер, главная

| Файл | Ответственность | Ключевые экспорты |
|------|-----------------|-------------------|
| `nav-columns.ts` | Колонки мегаменю | `TOP_MINING_NAV_COLUMNS`, `getMobileNavItemGroups()` |
| `footer-nav.ts` | Ссылки футера | `TOP_MINING_FOOTER_*_LINKS` |
| `mobile-menu.ts` | Телефон и соцкнопки | `TOP_MINING_MOBILE_MENU_*` |
| `contact-section.ts` | Контактный круг: тексты + layout | `getTopMiningContactBlockStyle()` |
| `useTopMiningContactCircleLayout.ts` | ResizeObserver круга | `useTopMiningContactCircleLayout()` |
| `articles-section.ts` | Блок статей на главной | `TOP_MINING_ARTICLES_TOPICS`, `getArticlesNavHref()` |
| `epic-blocks.ts` | URL Telegram и конвертера | `TOP_MINING_TELEGRAM_BOT_URL`, `TOP_MINING_HASHRATE_CONVERTER_URL` |
| `useful-section.ts` | «Чем полезен ТОП майнинг» | `TOP_MINING_USEFUL_ITEMS` |
| `companies.ts` | Логотипы партнёров | `TOP_MINING_COMPANIES` |
| `calculator-promo.ts` | Промо калькулятора | `MINING_CALCULATOR_PROMO_STATS` |

#### `calculator/` — майнинг-калькулятор

| Файл | Ответственность | Ключевые экспорты |
|------|-----------------|-------------------|
| `path.ts` | Путь страницы | `CALCULATOR_PAGE_PATH` |
| `page.ts` | SEO, hero, бренды, about | `CALCULATOR_PAGE` |
| `nav.ts` | Меню → ASIC/GPU/CPU/конвертер | `getCalculatorNavItemHref()`, `parseCalculatorDeviceHash()` |
| `hardware.ts` | Типы устройств + хелперы | `CALCULATOR_DEVICE_OPTIONS`, `filterHardwareBrands()`; каталог моделей — API/БД |
| `coins.ts` | Типы монет + хелперы | каталог — API/БД (`GET /api/calculator/coins`) |
| `gpu.ts` | Алгоритмы и монеты GPU/CPU | `filterGpuCoinsByAlgorithm()` |
| `profit.ts` | Формулы прибыли | **`calculateMiningProfit()`**, `hashrateToThs()`, `placingMonthRub()` |

#### `converter/` — конвертер хешрейта

| Файл | Ответственность | Ключевые экспорты |
|------|-----------------|-------------------|
| `hashrate.ts` | Пересчёт H/s…ZH/s | `convertHashrateValues()`, `parseConverterInput()` |
| `page.ts` | SEO, about, FAQ | `HASHRATE_CONVERTER_PAGE` |

#### `buy-asic/` · `consulting/` · `podbor/` · `pages/`

| Папка / файл | Ответственность |
|--------------|-----------------|
| `buy-asic/page.ts` | Hero, модели, `getBuyAsicModelBySlug()` |
| `buy-asic/client-problems.ts` | Отзывы «проблемы клиентов» |
| `buy-asic/value-blocks.ts` | Как работаем / безопасность / время |
| `buy-asic/summary.ts`, `promo-banners.ts` | Итого-форма и кросс-промо |
| `consulting/*.ts` | Контент секций consulting + `getConsultingServiceHref()` |
| `podbor/mining-hotel.ts` | Весь контент страницы подбора отеля |
| `pages/increase-income.ts` | «Увеличим ваш доход» |
| `pages/data-center-construction.ts` | Строительство дата-центров |

---

### `catalog/`

| Папка / файл | Ответственность | Ключевые экспорты |
|--------------|-----------------|-------------------|
| `types.ts` | Контракты организаций, категорий, фильтров | типы API |
| `nav/links.ts` | URL каталога | `getCatalogCategoryHref()`, `CATALOG_PAGE_HREF` |
| `nav/categories.ts` | Определения категорий | `CATALOG_CATEGORY_DEFINITIONS`, `getVisibleCatalogCategories()` |
| `nav/tabs.ts` | Табы категорий | `getCatalogCategoryTabs()` |
| `nav/sort-options.ts` | Сортировка списка | `CATALOG_MANUFACTURERS_SORT_OPTIONS` |
| `nav/use-visible-categories.ts` | Fetch + видимые категории | `useVisibleCatalogCategories()` |
| `filters/organization.ts` | Возраст рынка, min ASIC | `matchesMinAsicFilter()` |
| `filters/sidebar.ts` | Сайдбар бирж/кошельков | `matchesCategorySidebarFilters()` |
| `pages/organizations.ts` | Плоский список орг. | `flattenCatalogOrganizations()` |
| `pages/manufacturers.ts` | Производители из БД | `manufacturersFromCatalogCategories()`, `emptyCatalogManufacturersResponse()` |
| `content/empty.ts` | Пустой ответ для loading | `emptyCatalogResponse()` |
| `content/mid-block-banner.ts` | Промо в сетке карточек | `buildCatalogGridWithBanners()` |
| `content/reviews.ts` | Вопросы/сортировка отзывов | `formatOrganizationReviewCount()` |

---

### `articles/` · `ratings/` · `crypto/`

| Пакет | Файл | Ответственность |
|-------|------|-----------------|
| **articles** | `types.ts`, `section-types.ts` | Preview / full article / UI-блоки |
| | `sections.ts`, `blocks-to-sections.ts` | TOC и секции из текста / DB-блоков |
| | `format.ts` | Дата, время чтения, split title |
| | `fallback.ts`, `from-rating.ts` | Статика и статьи из рейтингов |
| | `record-view.ts` | Учёт просмотра один раз на браузер |
| **ratings** | `fallback.ts`, `content.ts` | Карточки рейтингов + video |
| | `nav-links.ts` | `/rating/` и `?category=` |
| | `article-href.ts` | Нормализация ссылок в статьи |
| | `merge-ratings-fallback.ts` | Слияние API + fallback |
| | `stagger.ts` | Отступы списка |
| **crypto** | `types.ts`, `coingecko-types.ts` | Нормализованные и сырые типы |
| | `lists.ts`, `periods.ts` | ID монет и периоды 24h/7d |
| | `crypto-period.ts` | `%` изменения и формат цены |
| | `crypto-icons.ts`, `fallback.ts` | Иконки и офлайн-данные |

---

### Мелкие пакеты

| Пакет | Файл | Методы / данные |
|-------|------|-----------------|
| `charts/` | `sparkline.ts` | `buildSparklinePoints()` |
| `format/` | `date.ts`, `marquee.ts` | `formatDateTime()`, `getMarqueeTrackStyle()` |
| `http/` | `status.ts` | `HTTP_OK`, `HTTP_NOT_FOUND`, … |
| `not-found/` | `sphere.ts` | `buildSphereTags()`, `projectSphereTags()` |
| `process/` | `steps.ts` | `PROCESS_SECTION_STEPS` |

---

<p align="center">
  <img src="docs/brand/logo-mark.png" width="40" height="40" alt="ТОП МАЙНИНГ" />
  <br/>
  <sub>© Top Mining · консалтинг, рейтинги и инструменты для майнеров</sub>
</p>
