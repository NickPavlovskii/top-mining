# Клиентская часть: логика и зоны ответственности

Документ описывает, **как устроен фронтенд** Top Mining (Nuxt 3) и **кто за что отвечает** по папкам и файлам.

## Как устроена логика

Клиент разделён на слои. Данные и правила — отдельно от разметки.

```
┌─────────────────────────────────────────────────────────┐
│  app.vue                                                │
│    └─ NuxtLayout (layouts/default.vue)                  │
│         ├─ TopMiningHeader                              │
│         ├─ <slot> → NuxtPage (pages/*)                  │
│         └─ TopMiningFooter                              │
└─────────────────────────────────────────────────────────┘
                          │
          pages/* только собирают секции + useFetch/SEO
                          │
                          ▼
              components/<домен>/*  — Vue UI
                          │
                          ▼
           common/modules/<домен>/* — типы, константы,
                         чистые функции, fallback, хуки
                          │
                          ▼
              server/api/*  — Nitro: прокси к backend GraphQL
```

### Правила потока данных

1. **Страница** (`pages/`) — тонкая: маршрут, `useFetch` / `useAsyncData`, SEO, композиция секций.
2. **Компонент** (`components/`) — UI и локальное состояние представления (открыт фильтр, hover, анимация).
3. **Модуль** (`common/modules/`) — доменная логика без Vue-шаблонов: типы, константы, merge/fallback, математика, тексты.
4. **Server API** (`server/api/`) — HTTP для браузера; внутри часто GraphQL к Go-бэкенду.
5. **Composables** (`composables/`) — auto-import Nuxt; либо тонкий реэкспорт из модуля, либо общий UI-хук (viewport, resize).

Не смешивать: не класть бизнес-правила в `.vue`, не класть разметку в `common/modules/`.

---

## Корневые папки клиента

| Папка / файл | Зона ответственности |
|--------------|----------------------|
| `app.vue` | Корень приложения: `UApp` + `NuxtLayout` + `NuxtPage`, favicon |
| `error.vue` | Глобальные ошибки (404 и др.): header + `AppNotFoundCloud` / org not found |
| `nuxt.config.ts` | Конфиг Nuxt, CSS, модули, runtime |
| `app.config.ts` | Конфиг Nuxt UI / app |
| `layouts/` | Оболочка страниц (header / content / footer) |
| `pages/` | Маршруты и композиция экранов |
| `components/` | Vue-компоненты по доменам |
| `common/modules/` | Доменная логика без шаблонов |
| `composables/` | Хуки с Nuxt auto-import |
| `server/` | Nitro API и GraphQL-клиент |
| `assets/` | Стили и картинки, импортируемые из кода |
| `public/` | Статика по прямому URL (`/images/...`) |
| `plugins/` | Плагины Nuxt (глобальная регистрация UI) |
| `types/` | Общие TS-типы (legacy / shared DTO) |
| `utils/` | Редкие кросс-доменные хелперы |
| `stories/` + `.storybook/` | Storybook / документация UI |
| `test/` | Юнит-тесты компонентов |
| `scripts/` | Вспомогательные скрипты сборки/генерации |

Backend Go (`backend/`) — **не** клиентская зона; фронт ходит к нему через `server/api` или напрямую по конфигу.

---

## `layouts/`

| Файл | Ответственность |
|------|-----------------|
| `default.vue` | Сайт-шелл: `<top-mining-header />` + `<main><slot /></main>` + `<top-mining-footer />` |

Контент страниц сюда не класть.

---

## `pages/` — маршруты

| Файл | Маршрут | Ответственность |
|------|---------|-----------------|
| `index.vue` | `/` | Главная: секции hero, crypto, calculator, catalog, contact, useful |
| `privacy.vue` | `/privacy` | Политика конфиденциальности |
| `articles/index.vue` | `/articles` | Список статей |
| `articles/[slug].vue` | `/articles/:slug` | Статья |
| `rating/index.vue` | `/rating` | Страница рейтингов → `TopMiningRatingsView` |
| `asic-manufacturers/index.vue` | `/asic-manufacturers` | Производители ASIC |
| `sale_asic/[slug].vue` | `/sale_asic/:slug` | Карточка организации: fetch + статус HTTP + detail / error |

Страница не рисует сложные карточки сама — подключает view/section из `components/`.

---

## `components/` — UI по доменам

Подробный индекс папок: этот файл; краткая шпаргалка также в корневом README.

### `components/global/` — переиспользуемый UI

| Путь | Ответственность |
|------|-----------------|
| `AppNotFoundCloud.vue` | Визуал 404 (canvas-сфера) |
| `buttons/TopMiningButton.vue` | Основная CTA-кнопка (Quasar `q-btn`) |
| `buttons/TopMiningRoundIconButton.vue` | Круглая icon-кнопка |
| `buttons/TopMiningMoreLink.vue` | Ссылка «ещё / смотреть» |
| `labels/TopMiningChip.vue` | Чип / бейдж |
| `labels/VerificationStatusBadge.vue` | Бейдж проверки (да/нет) |
| `pageTitle/TopMiningBrandTitle.vue` | Заголовок бренда (hero / menu) |
| `articles/TopMiningArticleCard.vue` | Карточка статьи |
| `articles/TopMiningArticleRow.vue` | Строка статьи в ленте |
| `selection-controls/TopMiningCheckbox.vue` | Чекбокс |
| `selection-controls/TopMiningRadio.vue` | Радио |
| `index.ts` | Реестр для плагина глобальных компонентов |

### `components/top-mining/` — секции лендинга

| Файл | Ответственность |
|------|-----------------|
| `TopMiningSection.vue` | Hero-карточки главной (каталог / калькулятор / рейтинги / telegram) |
| `TopMiningEpicBlocks.vue` | Крупные промо-блоки |
| `TopMiningArticlesSection.vue` | Секция статей на главной |
| `TopMiningArticlesFeed.vue` | Лента статей |
| `TopMiningContactSection.vue` | Блок «есть вопросы» + подписка |
| `TopMiningUsefulSection.vue` | Полезные материалы |
| `MiningCalculatorPromo.vue` | Промо калькулятора |
| `TopMiningFooter.vue` | Подвал сайта |

#### `components/top-mining/header/` — шапка

| Файл | Ответственность |
|------|-----------------|
| `TopMiningHeader.vue` | Корень шапки: sticky, breakpoints, меню, лого |
| `TopMiningHeaderDesktopNav.vue` | Полная десктоп-навигация (колонки) |
| `TopMiningHeaderCompactNav.vue` | Компактное горизонтальное меню |
| `TopMiningHeaderMobileMenu.vue` | Мобильное меню |
| `TopMiningContactPillButtons.vue` | Pills Telegram / телефон |

Данные меню — в `common/modules/top-mining/` (`nav-columns`, `mobile-menu`, `consulting-dropdown`, `contact-section`).

### `components/catalog/` — каталог

| Подпапка / файл | Ответственность |
|-----------------|-----------------|
| `home/CatalogSection.vue` | Секция каталога на главной |
| `home/CatalogCategoryRow.vue` | Ряд категории с карточками |
| `cards/CatalogOrganizationCard.vue` | Карточка организации в сетке |
| `filters/*` | Фильтры, сайдбар, сортировка |
| `manufacturers/*` | Страница/карточки производителей |
| `organization-detail/CatalogOrganizationDetailView.vue` | Страница организации |
| `organization-detail/CatalogOrganizationDetailSidebar.vue` | Сайдбар (проверка, контакты, реестр) |
| `organization-detail/CatalogOrganizationGallery.vue` | Галерея |
| `organization-detail/CatalogOrganizationReviews.vue` | Блок отзывов |
| `organization-detail/CatalogOrganizationReviewList.vue` | Список отзывов |
| `organization-detail/CatalogOrganizationNotFound.vue` | 404 организации |
| `shared/CatalogPageBreadcrumbs.vue` | Хлебные крошки |
| `shared/CatalogCategoryTabs.vue` | Табы категорий |
| `shared/CatalogMidBlockBanner.vue` | Баннер в середине списка |

### `components/crypto/`

| Файл | Ответственность |
|------|-----------------|
| `CryptoMarketSection.vue` | Секция «криптовалюта сейчас» |
| `CryptoCoinList.vue` | Список монет (популярные / рост / объём) |

### `components/charts/`

| Файл | Ответственность |
|------|-----------------|
| `SparklineChart.vue` | SVG sparkline (точки из `common/modules/charts`) |

### `components/rating/`

| Файл | Ответственность |
|------|-----------------|
| `TopMiningRatingSection.vue` | Рейтинги на главной |
| `TopMiningRatingsView.vue` | Полная страница рейтингов |
| `TopMiningRatingCardsGrid.vue` | Сетка карточек |
| `TopMiningRatingMarqueeLink.vue` | Бегущая строка-ссылка |

### `components/process/`

| Файл | Ответственность |
|------|-----------------|
| `WorkProcessSection.vue` | Секция «как мы работаем» |

---

## `common/modules/` — доменная логика

Публичный вход модуля — обычно `index.ts`.

### `top-mining/`

| Файл | Ответственность |
|------|-----------------|
| `button.ts` | Пропсы/цвета/лейблы кнопок |
| `chip.ts` | Цвета verification chip |
| `nav-columns.ts` | Колонки десктоп-навигации |
| `mobile-menu.ts` | Соцсети / пункты мобильного меню |
| `consulting-dropdown.ts` | Пункты консультаций |
| `contact-section.ts` | Контакты, telegram/phone |
| `footer-nav.ts` | Ссылки футера |
| `companies.ts` | Компании в hero-карточке |
| `articles-section.ts` | Контент секции статей |
| `calculator-promo.ts` | Данные промо калькулятора |
| `epic-blocks.ts` | Данные epic-блоков |
| `useful-section.ts` | Данные useful-секции |
| `useTopMiningContactCircleLayout.ts` | Layout кругов в contact-секции |
| `index.ts` | Реэкспорт |

### `catalog/`

| Файл | Ответственность |
|------|-----------------|
| `types.ts` | Типы организаций, каталога, detail |
| `catalog-categories.ts` | Категории |
| `category-tabs.ts` / `category-sidebar-filters.ts` | Табы и фильтры сайдбара |
| `organization-filters.ts` / `sort-options.ts` | Фильтры и сортировка |
| `organizations-page.ts` / `manufacturers-page.ts` | Контент/конфиг страниц |
| `empty-catalog.ts` | Пустое состояние |
| `organization-reviews-content.ts` | Тексты отзывов |
| `mid-block-banner.ts` | Данные баннера |
| `nav-links.ts` | Href каталога |
| `useVisibleCatalogCategories.ts` | Какие категории показывать |
| `fallback.ts` / merge-* | Fallback и слияние с API |
| `organization-detail/*` | Detail fallback / merge |
| `index.ts` | Реэкспорт |

### `crypto/`

| Файл | Ответственность |
|------|-----------------|
| `types.ts` | Типы ответа / монет |
| `lists.ts` | ID популярных / роста / объёма |
| `periods.ts` / `crypto-period.ts` | Периоды графика |
| `crypto-icons.ts` | Иконки монет |
| `fallback.ts` | Fallback при недоступности API |
| `coingecko-types.ts` | Типы внешнего API |
| `index.ts` | Реэкспорт |

### `ratings/`

| Файл | Ответственность |
|------|-----------------|
| `types.ts` | Типы рейтингов |
| `content.ts` | Статический контент |
| `fallback.ts` / `merge-ratings-fallback.ts` | Fallback и merge |
| `nav-links.ts` / `article-href.ts` | Ссылки |
| `stagger.ts` | Анимационный stagger |
| `index.ts` | Реэкспорт |

### `articles/`

| Файл | Ответственность |
|------|-----------------|
| `types.ts` | Типы статей |
| `format.ts` | Форматирование |
| `fallback.ts` | Fallback |
| `index.ts` | Реэкспорт |

### `charts/`

| Файл | Ответственность |
|------|-----------------|
| `sparkline.ts` | ViewBox, сетка, `buildSparklinePoints` |
| `index.ts` | Реэкспорт |

### `not-found/`

| Файл | Ответственность |
|------|-----------------|
| `types.ts` | `SphereTag`, `ProjectedSphereTag` |
| `sphere.ts` | Fibonacci-сфера, проекция, depthStyle |
| `index.ts` | Реэкспорт |

### Прочее

| Папка / файл | Ответственность |
|--------------|-----------------|
| `http/status.ts` | Константы HTTP (200/400/404/503) |
| `format/date.ts` | Формат дат |
| `format/marquee.ts` | Хелперы marquee |
| `process/steps.ts` | Шаги процесса |
| `constants.ts` | Сводный re-export (если используется) |

---

## `composables/`

| Файл | Ответственность |
|------|-----------------|
| `useViewportBreakpoint.ts` (+ `.types.ts`) | Брейкпоинты viewport |
| `useWindowResize.ts` | Подписка на resize |
| `useMarqueeTrackStyle.ts` | Стили бегущей строки |
| `useVisibleCatalogCategories.ts` | Реэкспорт / обёртка каталога |
| `useTopMiningContactCircleLayout.ts` | Реэкспорт layout contact-кругов |

Новую доменную логику пишите в `common/modules/<домен>/`, сюда — только то, что должно auto-import’иться, или общий UI-хук.

---

## `server/` — клиентский BFF (Nitro)

Браузер бьёт в `/api/...`. Здесь нет Vue.

| Путь | Ответственность |
|------|-----------------|
| `api/crypto.get.ts` | Прокси/агрегация криптоданных |
| `api/catalog.get.ts` | Каталог |
| `api/catalog/manufacturers.get.ts` | Производители |
| `api/catalog/organizations/[slug].get.ts` | Организация по slug |
| `api/catalog/organizations/[slug]/reviews.get.ts` | Отзывы |
| `api/catalog/organizations/[slug]/reviews.post.ts` | Создание отзыва |
| `api/articles/index.get.ts` | Список статей |
| `api/articles/[slug].get.ts` | Статья |
| `api/ratings/index.get.ts` | Рейтинги |
| `api/ratings/home.get.ts` | Рейтинги для главной |
| `graphql/queries.ts` | GraphQL-запросы к backend |
| `utils/graphql.ts` | Клиент / выполнение GraphQL |

---

## `assets/` и `public/`

| Путь | Ответственность |
|------|-----------------|
| `assets/scss/variables.scss` | CSS-переменные / токены |
| `assets/scss/global.css` / `main.css` | Глобальные стили, точка входа |
| `assets/scss/scrollbar.scss` | Скроллбар |
| `assets/images/**` | Картинки, импортируемые в компоненты (`import img from '...'`) |
| `public/images/**` | Картинки по URL (`src="/images/..."`) |
| `public/videos/**` | Видео |
| `public/small-logo.ico` и др. | Favicon / robots |

---

## `plugins/`, `types/`, `utils/`

| Путь | Ответственность |
|------|-----------------|
| `plugins/global-components.ts` | Регистрация набора global UI |
| `types/crypto-coin.ts` | Shared типы монет |
| `types/organization-reviews.ts` | Shared типы отзывов |
| `types/ratings.ts` | Shared типы рейтингов |
| `utils/cryptoIcons.ts` | Хелпер иконок (кросс-использование) |

Предпочтение новым типам домена — `common/modules/<домен>/types.ts`. Папка `types/` — для уже общих DTO.

---

## Storybook и тесты

| Путь | Ответственность |
|------|-----------------|
| `.storybook/` | Конфиг Storybook |
| `stories/global/` | Сторисы UI |
| `stories/docs/` | Документация в Storybook (UsagePage и т.п.) |
| `test/unit/components/` | Юнит-тесты global-компонентов |
| `test/fixtures/` | Фикстуры |

---

## Куда класть новый код

| Задача | Куда |
|--------|------|
| Новый экран | `pages/...` + view в `components/<домен>/` |
| Новый UI-блок фичи | `components/<домен>/...` |
| Правка шапки | `components/top-mining/header/` + данные в `common/modules/top-mining/` |
| Константы / типы / merge / математика | `common/modules/<домен>/` |
| График | UI → `components/charts/`, математика → `common/modules/charts/` |
| API для браузера | `server/api/...` (+ query в `server/graphql/` при GraphQL) |
| Общий хук viewport | `composables/` |
| Доменный хук | `common/modules/<домен>/use*.ts` + при необходимости реэкспорт в `composables/` |
| Токены стилей | `assets/scss/variables.scss` |

---

## Пример: карточка организации

1. `pages/sale_asic/[slug].vue` — `useFetch('/api/catalog/organizations/:slug')`, HTTP-статусы из `common/modules/http/status`.
2. `server/api/catalog/organizations/[slug].get.ts` — GraphQL к backend.
3. `CatalogOrganizationDetailView.vue` — раскладка страницы.
4. Сайдбар / отзывы / галерея — соседние компоненты в `organization-detail/`.
5. Тексты verification / chip colors — `common/modules/top-mining/chip.ts`.
