# Проектирование API и БД — Top Mining (niklad)

Версия: 2026-06-24  
Стек: **PostgreSQL 16** · **Go REST/GraphQL** (`:8080`) · **Nuxt 3** (прокси `/api/*`)

---

## 1. Архитектура

```
┌─────────────────────────────────────────────────────────────────────────┐
│  Browser (Nuxt 3 SSR/CSR)                                               │
│  pages: /, /articles, /articles/[slug], /sale_miners/, /calc/ …        │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │ useFetch('/api/...')
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  Nuxt Server Routes (server/api/*.ts)                                   │
│  · прокси к Go backend                                                  │
│  · fallback при недоступности БД                                        │
│  · crypto — напрямую CoinGecko (без PostgreSQL)                         │
└───────────────┬─────────────────────────────┬─────────────────────────┘
                │                             │
                ▼                             ▼
┌───────────────────────────┐   ┌───────────────────────────────────────┐
│  Go Backend :8080         │   │  CoinGecko API (внешний)              │
│  REST + GraphQL + Swagger │   │  GET /api/crypto → server/api/crypto  │
└───────────────┬───────────┘   └───────────────────────────────────────┘
                │
                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  PostgreSQL :5433 / niklad                                              │
│  32 таблицы · 3 домена · миграции 001–008                               │
└─────────────────────────────────────────────────────────────────────────┘
```

### Переменные окружения

| Переменная | Где | Назначение |
|------------|-----|------------|
| `DATABASE_URL` | Go backend | `postgres://niklad:niklad@localhost:5433/niklad?sslmode=disable` |
| `PORT` | Go backend | `8080` |
| `ARTICLES_API_URL` | Nuxt | URL Go для статей |
| `catalogGraphqlUrl` | Nuxt | `http://localhost:8080/graphql` |

---

## 2. База данных

### 2.1 Домены

| Домен | Таблиц | Миграции | Назначение |
|-------|--------|----------|------------|
| **Каталог** | 18 | 001, 007, 008 | Список, фильтры, карточка компании |
| **Статьи** | 4 | 003–007 | Лента, детальная страница |
| **Калькулятор** | 10 | 008 | ASIC/GPU/CPU, курсы, сеть |

Подробная ER-схема: [`database-full-schema.md`](./database-full-schema.md)

### 2.2 Все таблицы (краткий реестр)

#### Каталог

| Таблица | PK | Связи |
|---------|-----|-------|
| `catalog_categories` | id SERIAL | 1→N `catalog_organizations` |
| `catalog_organizations` | id SERIAL | N→1 category; центр профиля |
| `organization_addresses` | id SERIAL | N→1 org |
| `organization_gallery_images` | id SERIAL | N→1 org |
| `organization_equipment_sales` | organization_id | 0..1 org |
| `organization_mining_hotels` | organization_id | 0..1 org |
| `organization_payment_terms` | organization_id | 0..1 org |
| `organization_legal_profiles` | organization_id | 0..1 org |
| `organization_reviews` | id SERIAL | N→1 org |
| `organization_review_replies` | id SERIAL | N→1 review |
| `catalog_services` | id SERIAL | M:N org |
| `organization_services` | (org, service) | M:N |
| `catalog_locations` | id SERIAL | M:N org (доставка) |
| `organization_delivery_areas` | (org, location) | M:N |
| `catalog_tags` | id SERIAL | M:N org |
| `organization_tags` | (org, tag) | M:N |
| `asic_models` | id SERIAL | M:N org (фильтр) |
| `organization_asic_models` | (org, model) | M:N |

#### Статьи

| Таблица | PK | Связи |
|---------|-----|-------|
| `article_topics` | id TEXT | 1→N articles |
| `articles` | id SERIAL | N→1 topic |
| `article_sections` | id SERIAL | N→1 article (оглавление) |
| `article_related` | (article_id, related_id) | N↔N articles |

#### Калькулятор

| Таблица | PK | Связи |
|---------|-----|-------|
| `calculator_hardware_types` | id TEXT | asic, gpu, cpu |
| `calculator_manufacturers` | id SERIAL | M:N types |
| `calculator_manufacturer_types` | (mfr, type) | M:N |
| `mining_algorithms` | id TEXT | 1→N coins |
| `mining_coins` | id TEXT | N→1 algorithm |
| `calculator_hardware_models` | id SERIAL | N→1 type, mfr |
| `calculator_model_algorithms` | (model, algorithm) | M:N + coin |
| `calculator_model_specs` | id SERIAL | N→1 model (EAV) |
| `exchange_rates` | id SERIAL | BTC-USDT, USDT-RUB |
| `network_coin_stats` | coin_id | сложность, награда |
| `calculator_defaults` | id TEXT | дефолты формы |

### 2.3 Ключевые сущности (поля)

#### `catalog_organizations` (итоговая схема)

```sql
id SERIAL PRIMARY KEY
category_id INT NOT NULL → catalog_categories
slug TEXT UNIQUE NOT NULL          -- r7miner, ttm-mining
name, logo_url, description TEXT
rating NUMERIC(2,1), review_count INT, sort_order INT
tagline, page_title TEXT             -- карточка / SEO
founded_year INT
website, email, work_hours TEXT
domain_registered_at DATE
about_html TEXT
map_lat, map_lng NUMERIC
verified_contracts, verified_legal_entity BOOLEAN
has_public_rating, is_published BOOLEAN
sells_used_asic BOOLEAN              -- фильтр Б/У
office_city TEXT                     -- «Офис: Москва»
updated_at TIMESTAMPTZ
```

#### `articles` (итоговая схема)

```sql
id SERIAL PRIMARY KEY
slug TEXT UNIQUE NOT NULL
title TEXT NOT NULL
title_subtitle TEXT                  -- вторая строка H1
excerpt, content, content_html TEXT
image_url, image_alt TEXT
topic_id TEXT → article_topics       -- mining|tools|investments|beginners
reading_time_min INT
view_count INT
published_at DATE
display_type TEXT                    -- hero|featured|list
sort_order INT, is_published BOOLEAN
```

#### `calculator_hardware_models`

```sql
id SERIAL PRIMARY KEY
hardware_type_id TEXT → calculator_hardware_types
manufacturer_id INT → calculator_manufacturers
slug TEXT UNIQUE                     -- ryzen-9-7950x3d
name TEXT
release_year INT
description_html TEXT
default_price_rub NUMERIC(14,2)
default_hashrate NUMERIC(16,4)
hashrate_unit TEXT                   -- TH/s | MH/s | KH/s
default_power_watts INT
sort_order INT
```

---

## 3. API — обзор эндпоинтов

### Легенда статусов

| Статус | Значение |
|--------|----------|
| ✅ Реализовано | Есть в Go + Nuxt |
| 📋 Спроектировано | В БД есть, API — план |
| 🌐 Внешнее | Не в PostgreSQL |

---

### 3.1 System

| Метод | Путь (Go) | Nuxt | Статус | Описание |
|-------|-----------|------|--------|----------|
| GET | `/health` | — | ✅ | `ok` |
| GET | `/swagger/index.html` | — | ✅ | Swagger UI |
| POST | `/graphql` | через `catalog.get` | ✅ | GraphQL каталог |

---

### 3.2 Каталог — главная (блок на `/`)

| Метод | Путь | Статус | Описание |
|-------|------|--------|----------|
| GET | `/api/catalog` | ✅ | Все категории + организации (кратко) |
| GET | `/api/catalog` (Nuxt) | ✅ | Прокси GraphQL + fallback |

**Текущий ответ (реализован):**

```json
{
  "meta": {
    "totalReviews": 4569,
    "subtitle": "Помогаем найти подходящую вам компанию..."
  },
  "categories": [
    {
      "id": 1,
      "name": "Продажа ASIC",
      "slug": "asic-sales",
      "organizations": [
        {
          "id": 5,
          "name": "r7miner",
          "logoUrl": "/images/catalog/r7miner.png",
          "description": "...",
          "rating": 4.9,
          "reviewCount": 113
        }
      ]
    }
  ]
}
```

---

### 3.3 Каталог — страница со фильтрами (`/sale_miners/`)

| Метод | Путь | Статус | Описание |
|-------|------|--------|----------|
| GET | `/api/catalog/categories` | 📋 | Список вкладок (9 категорий) |
| GET | `/api/catalog/filters` | 📋 | Справочники для сайдбара |
| GET | `/api/catalog/organizations` | 📋 | Поиск + фильтры + пагинация |
| GET | `/api/catalog/organizations/{slug}` | 📋 | Полный профиль компании |
| POST | `/api/catalog/organizations/{slug}/reviews` | 📋 | Отправка отзыва (модерация) |

#### GET `/api/catalog/filters` — справочники

```json
{
  "services": [{ "id": 1, "slug": "asic-sales", "label": "Продажа ASIC" }],
  "locations": [{ "id": 1, "name": "Москва", "region": "" }],
  "tags": [{ "id": 1, "slug": "with-vat", "label": "С НДС", "group": "payment" }],
  "asicModels": [{ "id": 1, "manufacturerSlug": "microbt", "name": "Whatsminer M70 214 TH/s" }],
  "marketAgeOptions": [
    { "id": "gt3y", "label": "Более 3 лет" },
    { "id": "lt1y", "label": "До 1 года" },
    { "id": "1to3y", "label": "От 1 до 3 лет" }
  ]
}
```

#### GET `/api/catalog/organizations` — query-параметры

| Параметр | Тип | Пример | SQL-логика |
|----------|-----|--------|------------|
| `category` | string | `asic-sales` | `catalog_categories.slug` |
| `q` | string | `r7` | `ILIKE name` |
| `services` | string[] | `asic-sales,mining-hotels` | JOIN `organization_services` |
| `location` | int | `1` | JOIN `organization_addresses` или `office_city` |
| `delivery` | int | `3` | JOIN `organization_delivery_areas` |
| `tags` | string[] | `in-stock,new-equipment` | JOIN `organization_tags` |
| `asicModel` | int | `2` | JOIN `organization_asic_models` |
| `sellsUsed` | bool | `true` | `sells_used_asic = true` |
| `marketAge` | string | `gt3y` | по `founded_year` |
| `sort` | string | `rating` | `rating DESC`, `name`, `review_count` |
| `page` | int | `1` | LIMIT/OFFSET |
| `perPage` | int | `24` | default 24 |

**Ответ:**

```json
{
  "total": 52,
  "page": 1,
  "perPage": 24,
  "items": [
    {
      "id": 5,
      "slug": "r7miner",
      "name": "R7MINER",
      "logoUrl": "/images/catalog/r7miner.png",
      "rating": 4.9,
      "reviewCount": 113,
      "hasPublicRating": true,
      "foundedYear": 2017,
      "officeCity": "Москва",
      "categorySlug": "asic-sales",
      "tags": [
        { "slug": "with-vat", "label": "С НДС" },
        { "slug": "new-equipment", "label": "Новое" },
        { "slug": "on-order", "label": "Под заказ" }
      ],
      "href": "/sale_asic/r7miner/"
    }
  ]
}
```

#### GET `/api/catalog/organizations/{slug}` — профиль

```json
{
  "id": 5,
  "slug": "r7miner",
  "name": "R7MINER",
  "tagline": "Продажа, доставка асиков и размещение",
  "pageTitle": "R7MINER: продажа ASIC-майнеров...",
  "logoUrl": "/images/catalog/r7miner.png",
  "aboutHtml": "<p>...</p>",
  "rating": 4.9,
  "reviewCount": 113,
  "hasPublicRating": true,
  "foundedYear": 2017,
  "website": "https://r7miner.com/",
  "email": "info@r7miner.ru",
  "workHours": "Пн-Пт с 10 до 19",
  "domainRegisteredAt": "2022-09-01",
  "map": { "lat": 55.75, "lng": 37.62 },
  "verification": {
    "contracts": true,
    "legalEntity": true
  },
  "addresses": [
    { "city": "Москва", "addressLine": "ул. Минская 2Ж офис 204" }
  ],
  "gallery": [
    { "imageUrl": "/images/org/r7-1.jpg", "imageAlt": "" }
  ],
  "equipmentSales": {
    "equipmentType": "ASIC",
    "equipmentCondition": "Новое",
    "salesVolume": "Розница, Опт",
    "availability": "Под заказ",
    "extras": []
  },
  "miningHotel": {
    "pricePerKwhFrom": 6.2,
    "pricePerKwhLabel": "от 6,2 ₽ кВт/ч",
    "sitesCount": 3,
    "totalCapacityMw": 33,
    "siteCities": "Челябинская обл., Владимирская обл.",
    "minDevicesLabel": "5",
    "energyType": "Электрический"
  },
  "paymentTerms": {
    "paymentMethods": ["Наличными", "Безналичная"],
    "paymentFormats": ["Частичная предоплата", "Предоплата"],
    "extraTerms": ["В кредит", "В рассрочку"],
    "contractForms": ["Договор с ООО"]
  },
  "legalProfile": {
    "legalName": "ООО \"РАЙТ ГРУПП\"",
    "ogrn": "1217800082972",
    "inn": "7813653834",
    "reliability": "Средняя",
    "revenue": "429 млн ₽ (2023)",
    "profit": "-21 млн ₽ (2023)"
  },
  "tags": [{ "slug": "direct-from-manufacturer", "label": "Напрямую от производителей" }],
  "services": [{ "slug": "asic-sales", "label": "Продажа ASIC" }]
}
```

#### GET `/api/catalog/organizations/{slug}/reviews`

| Параметр | Тип | Описание |
|----------|-----|----------|
| `sort` | string | `new`, `old`, `popular`, `positive`, `negative` |
| `page` | int | пагинация |
| `status` | — | только `approved` для публики |

```json
{
  "summary": { "rating": 4.9, "count": 113 },
  "items": [
    {
      "id": 1,
      "authorName": "Иван",
      "rating": 5,
      "content": "...",
      "source": "top-mining.ru",
      "likesCount": 3,
      "dislikesCount": 0,
      "publishedAt": "2023-09-16T18:32:00Z",
      "replies": []
    }
  ],
  "page": 1,
  "total": 113
}
```

#### POST `/api/catalog/organizations/{slug}/reviews`

```json
// Request
{
  "authorName": "Иван",
  "authorEmail": "ivan@mail.ru",
  "authorPhone": "+79001234567",
  "rating": 5,
  "content": "Отличная консультация..."
}

// Response 201
{ "id": 42, "status": "pending", "message": "Отзыв отправлен на модерацию" }
```

---

### 3.4 Статьи

| Метод | Путь (Go) | Nuxt | Статус |
|-------|-----------|------|--------|
| GET | `/api/articles?topic=` | `/api/articles` | ✅ лента |
| GET | `/api/articles/{slug}` | `/api/articles/[slug]` | ✅ (без sections) |
| GET | `/api/articles/topics` | 📋 | список вкладок |
| GET | `/api/articles/{slug}` расширенный | 📋 | + sections, related, viewCount |

#### GET `/api/articles?topic=all|mining|tools|...` ✅

```json
{
  "hero": { "id": 2, "slug": "whatsminer-m70-line-review", "title": "...", "displayType": "hero", ... },
  "featured": [ /* до 4 */ ],
  "list": [ /* до 8 */ ],
  "hasMore": true
}
```

#### GET `/api/articles/{slug}` — целевой ответ 📋

```json
{
  "id": 2,
  "slug": "whatsminer-m70-line-review",
  "title": "Новое поколение Whatsminer M70",
  "titleSubtitle": "Полный обзор линейки",
  "excerpt": "...",
  "content": "...",
  "contentHtml": "<h2>Введение</h2><p>...</p>",
  "imageUrl": "/images/articles/whatsminer-m70.jpg",
  "topicId": "mining",
  "readingTimeMin": 10,
  "viewCount": 324,
  "publishedAt": "2025-12-12",
  "sections": [
    { "anchor": "intro", "title": "Введение", "level": 2 },
    { "anchor": "cooling", "title": "Охлаждение: три формата", "level": 2 }
  ],
  "related": [
    { "slug": "best-asic-miners-2026", "title": "...", "imageUrl": "...", "readingTimeMin": 10 }
  ],
  "topics": [
    { "id": "mining", "label": "Майнинг", "active": true },
    { "id": "tools", "label": "Инструменты и сервисы", "active": false }
  ]
}
```

**Побочный эффект:** `POST` или `PATCH` для инкремента `view_count` при открытии статьи.

---

### 3.5 Майнинг-калькулятор

| Метод | Путь | Статус | Описание |
|-------|------|--------|----------|
| GET | `/api/calculator/meta` | 📋 | типы, производители, дефолты, курсы |
| GET | `/api/calculator/models` | 📋 | модели по типу + производителю |
| GET | `/api/calculator/models/{slug}` | 📋 | модель + specs + algorithms |
| POST | `/api/calculator/calculate` | 📋 | расчёт доходности |

#### GET `/api/calculator/meta`

```json
{
  "hardwareTypes": [
    { "id": "asic", "label": "ASIC" },
    { "id": "gpu", "label": "GPU" },
    { "id": "cpu", "label": "CPU" }
  ],
  "manufacturers": [
    {
      "slug": "microbt",
      "name": "MicroBT Whatsminer",
      "logoUrl": "/images/calculator/brands/whatsminer.png",
      "hardwareTypes": ["asic"]
    }
  ],
  "exchangeRates": {
    "btcUsdt": 60366,
    "usdtRub": 76.89
  },
  "defaults": {
    "uptimePct": 99,
    "poolFeePct": 4,
    "electricityRubPerKwh": 5.5,
    "quantity": 1,
    "difficultyAdjustPct": 0
  },
  "updatedAt": "2026-06-24T12:00:00Z"
}
```

#### GET `/api/calculator/models?type=asic&manufacturer=microbt`

```json
{
  "items": [
    {
      "slug": "whatsminer-m70-214t",
      "name": "Whatsminer M70 214 TH/s",
      "defaultPriceRub": 1200000,
      "defaultHashrate": 214,
      "hashrateUnit": "TH/s",
      "defaultPowerWatts": 3103,
      "defaultAlgorithm": "sha-256",
      "defaultCoin": { "id": "bitcoin", "symbol": "BTC" }
    }
  ]
}
```

#### GET `/api/calculator/models/ryzen-9-7950x3d`

```json
{
  "slug": "ryzen-9-7950x3d",
  "name": "Ryzen 9 7950X3D",
  "hardwareType": "cpu",
  "manufacturer": { "slug": "amd", "name": "AMD" },
  "releaseYear": 2023,
  "descriptionHtml": "<p>...</p>",
  "defaultPriceRub": 120000,
  "defaultHashrate": 18.5,
  "hashrateUnit": "KH/s",
  "defaultPowerWatts": 120,
  "specs": [
    { "key": "Сокет", "value": "Socket AM5" },
    { "key": "TDP", "value": "120 Вт" }
  ],
  "algorithms": [
    {
      "algorithmId": "randomx",
      "coin": { "id": "monero", "symbol": "XMR", "name": "Monero" },
      "hashrate": 18.5,
      "hashrateUnit": "KH/s",
      "network": {
        "blockRewardBtc": 0.000000000037,
        "networkDifficulty": 500977796816
      }
    }
  ]
}
```

#### POST `/api/calculator/calculate`

```json
// Request
{
  "hardwareType": "asic",
  "modelSlug": "whatsminer-m70-214t",
  "coinId": "bitcoin",
  "priceRub": 1200000,
  "quantity": 1,
  "hashrate": 214,
  "hashrateUnit": "TH/s",
  "powerWatts": 3103,
  "electricityRubPerKwh": 5.5,
  "uptimePct": 99,
  "poolFeePct": 4,
  "btcUsdt": 60366,
  "usdtRub": 76.89,
  "blockRewardBtc": 0.000000000037,
  "networkDifficulty": 500977796816,
  "difficultyAdjustPct": 0
}

// Response
{
  "daily": {
    "revenueRub": 1250.50,
    "electricityRub": 380.20,
    "profitRub": 870.30,
    "btcMined": 0.000021
  },
  "monthly": { "revenueRub": 37515, "electricityRub": 11406, "profitRub": 26109 },
  "paybackDays": 1370,
  "breakdown": {
    "hashrateTh": 214,
    "powerKw": 3.103,
    "uptimeFactor": 0.99
  }
}
```

> Формулы расчёта — в Go-пакете `internal/calculator` (план). Курсы и сложность читаются из `exchange_rates`, `network_coin_stats`, с возможностью override из запроса.

---

### 3.6 Криптовалюты (без PostgreSQL)

| Метод | Nuxt | Статус | Источник |
|-------|------|--------|----------|
| GET | `/api/crypto` | ✅ | CoinGecko API |

Не хранится в БД niklad. Для калькулятора курсы BTC — в `exchange_rates`.

---

## 4. Nuxt — прокси-слой

| Nuxt route | Проксирует | Fallback |
|------------|------------|----------|
| `GET /api/catalog` | GraphQL `http://localhost:8080/graphql` | `CATALOG_FALLBACK` |
| `GET /api/articles` | `GET {ARTICLES_API_URL}/api/articles` | `buildArticlesFeedFallback()` |
| `GET /api/articles/[slug]` | `GET .../api/articles/{slug}` | статический fallback |
| `GET /api/crypto` | CoinGecko | `FALLBACK_COINS` |

### Планируемые Nuxt routes

| Nuxt route | Go backend |
|------------|------------|
| `GET /api/catalog/organizations` | `GET /api/catalog/organizations` |
| `GET /api/catalog/organizations/[slug]` | `GET /api/catalog/organizations/{slug}` |
| `GET /api/catalog/organizations/[slug]/reviews` | reviews endpoint |
| `GET /api/calculator/meta` | calculator meta |
| `GET /api/calculator/models/[slug]` | model detail |
| `POST /api/calculator/calculate` | calculate |

---

## 5. Соглашения API

### Формат

- JSON, `Content-Type: application/json`
- Поля в **camelCase** (Go `json` tags)
- Даты: ISO 8601 (`2025-12-12` или `2023-09-16T18:32:00Z`)
- Деньги: `NUMERIC` → number в JSON

### Ошибки

```json
{ "error": "article not found" }
```

| HTTP | Когда |
|------|-------|
| 200 | Успех |
| 201 | Создан отзыв |
| 400 | Невалидные параметры |
| 404 | slug не найден |
| 500 | Ошибка БД |

### CORS

Go: `Access-Control-Allow-Origin: *` для `/api/catalog`, `/graphql`.

### Пагинация (стандарт)

Query: `page` (1-based), `perPage` (default 24).  
Ответ: `{ total, page, perPage, items: [] }`.

---

## 6. Маппинг API → таблицы БД

### Каталог список

```
GET /api/catalog/organizations
  → catalog_organizations o
  → JOIN catalog_categories c ON c.id = o.category_id
  → LEFT JOIN organization_tags ot, catalog_tags t
  → LEFT JOIN organization_services os
  → WHERE filters...
```

### Профиль организации

```
GET /api/catalog/organizations/{slug}
  → catalog_organizations WHERE slug = $1
  → organization_addresses, organization_gallery_images
  → organization_equipment_sales, organization_mining_hotels
  → organization_payment_terms, organization_legal_profiles
  → organization_tags + catalog_tags
  → organization_services + catalog_services
```

### Статья

```
GET /api/articles/{slug}
  → articles WHERE slug = $1
  → article_sections WHERE article_id = $1 ORDER BY sort_order
  → article_related JOIN articles ON related_article_id
  → UPDATE articles SET view_count = view_count + 1
```

### Калькулятор

```
GET /api/calculator/meta
  → calculator_hardware_types, calculator_manufacturers
  → calculator_manufacturer_types
  → exchange_rates, calculator_defaults

GET /api/calculator/models/{slug}
  → calculator_hardware_models
  → calculator_model_specs, calculator_model_algorithms
  → mining_algorithms, mining_coins, network_coin_stats
```

---

## 7. Диаграмма сущностей API (Mermaid)

```mermaid
flowchart TB
    subgraph Client
        Nuxt[Nuxt Pages]
    end

    subgraph NuxtAPI["Nuxt /api/*"]
        CatProxy[catalog.get]
        ArtProxy[articles/*]
        CryptoProxy[crypto.get]
        OrgProxy["catalog/organizations (plan)"]
        CalcProxy["calculator/* (plan)"]
    end

    subgraph GoAPI["Go :8080"]
        Health[/health]
        GQL[/graphql]
        CatREST[/api/catalog]
        ArtREST[/api/articles]
        OrgREST["/api/catalog/organizations (plan)"]
        CalcREST["/api/calculator (plan)"]
    end

    subgraph DB["PostgreSQL"]
        CatTables[(Каталог 18 tbl)]
        ArtTables[(Статьи 4 tbl)]
        CalcTables[(Калькулятор 10 tbl)]
    end

    subgraph External
        CG[CoinGecko]
    end

    Nuxt --> NuxtAPI
    CatProxy --> GQL
    CatProxy --> CatREST
    ArtProxy --> ArtREST
    OrgProxy --> OrgREST
    CalcProxy --> CalcREST
    CryptoProxy --> CG

    CatREST --> CatTables
    GQL --> CatTables
    ArtREST --> ArtTables
    OrgREST --> CatTables
    CalcREST --> CalcTables
```

---

## 8. Roadmap реализации API

| Приоритет | Задача | Пакет Go |
|-----------|--------|----------|
| P0 | Расширить `GET /api/articles/{slug}` (+sections, related, viewCount) | `internal/articles` |
| P0 | `GET /api/catalog/organizations/{slug}` профиль | `internal/organizations` |
| P1 | `GET /api/catalog/organizations` с фильтрами | `internal/organizations` |
| P1 | `GET /api/catalog/filters` справочники | `internal/catalog` |
| P1 | `GET /api/calculator/meta`, `models`, `models/{slug}` | `internal/calculator` |
| P2 | `POST /api/calculator/calculate` | `internal/calculator` |
| P2 | Reviews GET/POST | `internal/reviews` |
| P3 | Admin API для импорта с top-mining.ru | `cmd/import-*` |

---

## 9. Файлы проекта

```
backend/
  migrations/001–008_*.sql       # схема БД
  docs/
    database-full-schema.md      # ER, 32 таблицы
    api-and-database-design.md   # этот документ
  internal/
    catalog/                     # ✅ FetchCatalog
    articles/                    # ✅ FetchFeed, FetchBySlug
    organizations/               # 📋 план
    calculator/                  # 📋 план
  cmd/server/handlers.go         # REST handlers

server/api/
  catalog.get.ts                 # ✅
  articles/index.get.ts          # ✅
  articles/[slug].get.ts         # ✅
  crypto.get.ts                  # ✅ CoinGecko

types/
  catalog.ts, articles.ts        # TypeScript типы
```

---

## 10. Инструкция для ИИ

> Спроектируй REST API для Nuxt+Go+PostgreSQL. 3 домена: каталог (18 таблиц, центр `catalog_organizations`), статьи (4 таблицы), калькулятор (10 таблиц). Реализовано: GET /health, /api/catalog, /api/articles, GraphQL catalog, Nuxt /api/crypto. Спроектировано: фильтруемый список организаций, профиль org с 8 дочерними блоками, отзывы с модерацией, расширенная статья с sections/related/viewCount, калькулятор meta/models/calculate. JSON camelCase, ошибки `{error}`, пагинация page/perPage. Прокси Nuxt → Go с fallback.
