<p align="center">
  <img src="docs/brand/logo.svg" alt="ТОП МАЙНИНГ" width="280" />
</p>

<h1 align="center">Top Mining</h1>

<p align="center">
  <strong>Платформа о майнинге</strong><br/>
  каталог · рейтинги · статьи · калькулятор · конвертер · лендинги
</p>

<p align="center">
  <a href="https://top-mining.ru"><strong>top-mining.ru</strong></a>
  ·
  <a href="./docs/business.md">Бизнес</a>
  ·
  <a href="./docs/architecture.md">Архитектура</a>
  ·
  <a href="./docs/testing.md">Тесты</a>
  ·
  <a href="./backend/README.md">Backend</a>
</p>

<p align="center">
  <img alt="Nuxt" src="https://img.shields.io/badge/Nuxt-3-00DC82?style=flat-square&logo=nuxt&logoColor=white" />
  <img alt="Vue" src="https://img.shields.io/badge/Vue-3-4FC08D?style=flat-square&logo=vuedotjs&logoColor=white" />
  <img alt="TypeScript" src="https://img.shields.io/badge/TypeScript-5-3178C6?style=flat-square&logo=typescript&logoColor=white" />
  <img alt="Go" src="https://img.shields.io/badge/Go-1.22+-00ADD8?style=flat-square&logo=go&logoColor=white" />
  <img alt="PostgreSQL" src="https://img.shields.io/badge/PostgreSQL-16-4169E1?style=flat-square&logo=postgresql&logoColor=white" />
  <img alt="Playwright" src="https://img.shields.io/badge/Playwright-E2E-2EAD33?style=flat-square&logo=playwright&logoColor=white" />
  <img alt="Storybook" src="https://img.shields.io/badge/Storybook-9-FF4785?style=flat-square&logo=storybook&logoColor=white" />
</p>

---

## Быстрый старт

```bash
npm install
npm run dev              # http://localhost:3000
npm run storybook        # http://localhost:6007
npm run test:run         # Vitest
npm run test:e2e         # Playwright (app + Storybook)
```

| Команда | Назначение |
|---------|------------|
| `npm run dev` | Nuxt |
| `npm run lint` | ESLint + Stylelint |
| `npm run test` / `test:run` | Unit |
| `npm run test:e2e` | E2E |
| `npm run storybook` | UI-kit |

Backend (Go + Postgres): [`backend/README.md`](./backend/README.md).

---

## Стек

```text
Browser (Nuxt 3 · Vue 3 · TS · Quasar · Tailwind)
        │  /api/*
Nitro BFF  →  Go GraphQL (:8080)  →  PostgreSQL
```

Расчёт калькулятора — **на клиенте**; API отдаёт справочники железа и рынка.

---

## Возможности

- Каталог организаций (отели, пулы, ASIC, фильтры)
- Рейтинги и статьи (RU / EN-блоки)
- Калькулятор доходности ASIC / GPU / CPU
- Конвертер хешрейта
- Лендинги: buy-ASIC, подбор отеля, консалтинг, ЦОД, increase-income
- Заявки → Postgres + Telegram

---

## Бизнес-задачи и процессы

Цепочка ценности: **узнать → сравнить → посчитать → заявка**.

Подробно (BZ/BP, шаблоны схем, чеклист): [`docs/business.md`](./docs/business.md)  
PNG: [`docs/diagrams/business/`](./docs/diagrams/business/)

| ID | Задача | Процесс |
|----|--------|---------|
| BZ-01 | Информировать о рынке | BP-01 Главная |
| BZ-02 | Найти организацию | BP-02 Каталог |
| BZ-04 | Оценить доходность | BP-04 Калькулятор |
| BZ-05 | Перевести хешрейт | BP-05 Конвертер |
| BZ-06 / 07 | Рейтинги и статьи | BP-06 / BP-07 |
| BZ-08 / 09 | Подбор и лендинги услуг | BP-08 / BP-09 |
| BZ-10 | Собрать лид | BP-10 Лиды |
| BZ-11 / 12 | Подписка и отзывы | BP-11 / BP-12 |

### Путь клиента

<p align="center">
  <img src="docs/diagrams/business/map-customer-journey.png" alt="Узнавание → Решение → Конверсия" width="860" />
</p>

### Ключевые схемы

<details>
<summary><strong>BPMN — калькулятор (BP-04)</strong></summary>
<br/>
<p align="center">
  <img src="docs/diagrams/business/bpmn-bp04-calculator-lanes.png" alt="BPMN BP-04" width="860" />
</p>
</details>

<details>
<summary><strong>BPMN — заявка / лид (BP-10)</strong></summary>
<br/>
<p align="center">
  <img src="docs/diagrams/business/bpmn-bp10-leads.png" alt="BPMN BP-10" width="860" />
</p>
</details>

<details>
<summary><strong>Sequence — статьи и лиды</strong></summary>
<br/>
<p align="center">
  <img src="docs/diagrams/business/sequence-bp07-articles.png" alt="Sequence BP-07" width="860" />
</p>
<p align="center">
  <img src="docs/diagrams/business/sequence-bp10-leads.png" alt="Sequence BP-10" width="860" />
</p>
</details>

<details>
<summary><strong>ER — контент и каталог / hardware</strong></summary>
<br/>
<p align="center">
  <img src="docs/diagrams/business/er-articles-ratings.png" alt="ER статьи и рейтинги" width="860" />
</p>
<p align="center">
  <img src="docs/diagrams/business/er-catalog-leads-hardware.png" alt="ER каталог, leads, hardware" width="860" />
</p>
</details>

---

## Архитектура (кратко)

| Документ | Содержание |
|----------|------------|
| [`docs/architecture.md`](./docs/architecture.md) | Слои, GraphQL, BPMN калькулятора |
| [`docs/frontend.md`](./docs/frontend.md) | Зоны фронтенда |
| [`docs/calculator.md`](./docs/calculator.md) | Формулы и UI калькулятора |
| [`docs/leads.md`](./docs/leads.md) | Заявки и Zod |
| [`docs/testing.md`](./docs/testing.md) | Vitest + Playwright |
| PDF | [Архитектура](./docs/top-mining-architecture.pdf) · [Калькулятор](./docs/mining-calculator-guide.pdf) |

<p align="center">
  <img src="docs/diagrams/graphql-schema.png" alt="GraphQL Schema" width="640" />
</p>

<details>
<summary>Ещё схемы (sequence / ER / flowchart)</summary>
<br/>
<p align="center">
  <img src="docs/diagrams/sequence-calculator.png" alt="Sequence калькулятор" width="800" />
</p>
<p align="center">
  <img src="docs/diagrams/sequence-leads.png" alt="Sequence лиды" width="800" />
</p>
<p align="center">
  <img src="docs/diagrams/er-hardware.png" alt="ER hardware" width="800" />
</p>
<p align="center">
  <img src="docs/diagrams/flowchart-calculator.png" alt="Flowchart калькулятор" width="400" />
</p>
</details>

---

## Структура

```text
top-mining/
├── pages/              # маршруты
├── components/         # UI по доменам
├── common/modules/     # чистая логика и тексты
├── server/api/         # Nitro → GraphQL
├── stories/ · test/ · tests/   # Storybook · Vitest · Playwright
├── docs/               # бизнес, архитектура, схемы
└── backend/            # Go + Postgres + миграции
```

**Принципы:** страница собирает → компонент рисует → модуль считает → API отдаёт данные.

---

<p align="center">
  <img src="docs/brand/logo-mark.png" width="36" height="36" alt="ТОП МАЙНИНГ" />
  <br/>
  <sub>© Top Mining</sub>
</p>
