# Niklad

Финансовая платформа.

## Стек

- Nuxt 3 + Vue 3
- Quasar (`nuxt-quasar-ui`)
- Tailwind CSS 4
- @nuxt/ui
- BEM — именование классов в компонентах
- Глобальные UI-компоненты через Vue-плагин

## Структура

```
niklad/
├── app.vue
├── app.config.ts
├── nuxt.config.ts
├── assets/
│   ├── quasar-variables.scss
│   └── style/              # variables, global, tailwind
├── components/
│   └── global/             # index.ts + UI-компоненты
├── composables/            # composables (пока пусто)
├── layouts/default.vue
├── pages/                  # file-based routing
├── plugins/global-components.ts
└── utils/                  # утилиты (пока пусто)
```

## Глобальные компоненты

Регистрируются в `components/global/index.ts`, подключаются через `plugins/global-components.ts`:

- `<name-display>`
- `<animated-button>`
- `<tooltip>`

## Запуск

```bash
npm install
npm run dev
```

## Дальше

- `pages/` — новые маршруты
- `components/<feature>/` — фичи + `data/*.ts`
- `composables/` — логика страниц
- `utils/` — чистые функции
