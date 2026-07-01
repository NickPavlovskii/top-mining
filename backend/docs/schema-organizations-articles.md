# Схема БД: организации каталога и детальные статьи

Миграция: `backend/migrations/007_organizations_and_article_detail.sql`

Референсы с [top-mining.ru](https://top-mining.ru):

- Карточка организации: [TTM Mining](https://top-mining.ru/sale_asic/ttm-mining/), [R7MINER](https://top-mining.ru/sale_asic/r7miner/)
- Детальная статья: [Whatsminer M70](https://top-mining.ru/mining/novoe-pokolenie-whatsminer-m70-polnyj-obzor-linejki/)

---

## UML (ER-диаграмма)

```mermaid
erDiagram
    catalog_categories ||--o{ catalog_organizations : "содержит"
    catalog_organizations ||--o{ organization_addresses : "офисы"
    catalog_organizations ||--o{ organization_gallery_images : "галерея"
    catalog_organizations ||--o| organization_equipment_sales : "продажа"
    catalog_organizations ||--o| organization_mining_hotels : "майнинг-отель"
    catalog_organizations ||--o| organization_payment_terms : "оплата"
    catalog_organizations ||--o| organization_legal_profiles : "rusprofile"
    catalog_organizations ||--o{ organization_reviews : "отзывы"
    organization_reviews ||--o{ organization_review_replies : "ответы"

    article_topics ||--o{ articles : "тема"
    articles ||--o{ article_sections : "оглавление"
    articles ||--o{ article_related : "читайте также"
    articles ||--o{ article_related : "связанные"

    catalog_categories {
        int id PK
        text name
        text slug UK
        int sort_order
    }

    catalog_organizations {
        int id PK
        int category_id FK
        text slug UK
        text name
        text tagline
        text page_title
        text logo_url
        text about_html
        numeric rating
        int review_count
        int founded_year
        text website
        text email
        text work_hours
        date domain_registered_at
        numeric map_lat
        numeric map_lng
        bool verified_contracts
        bool verified_legal_entity
        bool has_public_rating
        bool is_published
    }

    organization_addresses {
        int id PK
        int organization_id FK
        text city
        text address_line
        int sort_order
    }

    organization_gallery_images {
        int id PK
        int organization_id FK
        text image_url
        text image_alt
        int sort_order
    }

    organization_equipment_sales {
        int organization_id PK_FK
        text equipment_type
        text equipment_condition
        text sales_volume
        text availability
        text_array extras
    }

    organization_mining_hotels {
        int organization_id PK_FK
        numeric price_per_kwh_from
        text price_per_kwh_label
        int sites_count
        numeric total_capacity_mw
        text site_cities
        text min_devices_label
        text energy_type
    }

    organization_payment_terms {
        int organization_id PK_FK
        text_array payment_methods
        text_array payment_formats
        text_array extra_terms
        text_array contract_forms
    }

    organization_legal_profiles {
        int organization_id PK_FK
        text legal_name
        text primary_activity
        text ogrn
        text inn
        date registered_at
        text legal_address
        text reliability
        text revenue
        text profit
    }

    organization_reviews {
        int id PK
        int organization_id FK
        text author_name
        smallint rating
        text content
        text source
        text status
        timestamptz published_at
    }

    organization_review_replies {
        int id PK
        int review_id FK
        text content
        timestamptz published_at
    }

    articles {
        int id PK
        text slug UK
        text title
        text title_subtitle
        text excerpt
        text content
        text content_html
        text topic_id FK
        int reading_time_min
        int view_count
        date published_at
    }

    article_sections {
        int id PK
        int article_id FK
        text anchor UK
        text title
        smallint level
        int sort_order
    }

    article_related {
        int article_id PK_FK
        int related_article_id PK_FK
        int sort_order
    }
```

---

## Описание сущностей

### Каталог организаций

| Сущность | Назначение | Кардинальность |
|----------|------------|----------------|
| `catalog_categories` | Раздел каталога (Продажа ASIC, Майнинг-отели…) | 1 → N организаций |
| `catalog_organizations` | Профиль компании, URL: `/{category_slug}/{org_slug}/` | N → 1 категория (основная) |
| `organization_addresses` | Офисы (Москва, СПб…) | 1 → N |
| `organization_gallery_images` | Карусель «Галерея» | 1 → N |
| `organization_equipment_sales` | Блок «Продажа оборудования» | 1 → 0..1 |
| `organization_mining_hotels` | Блок «Майнинг-отель» | 1 → 0..1 |
| `organization_payment_terms` | Блок «Оплата услуг» | 1 → 0..1 |
| `organization_legal_profiles` | Блок «rusprofile» | 1 → 0..1 |
| `organization_reviews` | Отзывы с модерацией | 1 → N |
| `organization_review_replies` | Ответы на отзывы | 1 → N |

Одна организация может одновременно иметь и продажу оборудования, и майнинг-отель (как [TTM Mining](https://top-mining.ru/sale_asic/ttm-mining/)) — это две отдельные 1:1 таблицы, а не дублирование записи в каталоге.

Поля верификации ТОП МАЙНИНГ:

- `verified_contracts` — договора проверены
- `verified_legal_entity` — юрлицо проверено
- `has_public_rating` — показывать ли звёзды (у TTM — «Нет рейтинга»)

### Статьи

| Сущность | Назначение | Кардинальность |
|----------|------------|----------------|
| `articles` | Материал, URL: `/mining/{slug}/` | N → 1 тема |
| `article_sections` | Боковая навигация «Навигация по статье» | 1 → N |
| `article_related` | Блок «Читайте также» | N ↔ N (self) |

Новые поля статьи по макету [обзора M70](https://top-mining.ru/mining/novoe-pokolenie-whatsminer-m70-polnyj-obzor-linejki/):

- `title` + `title_subtitle` — двухстрочный заголовок
- `view_count` — «Просмотры: 324»
- `content_html` — полный HTML-текст (параллельно `content` для обратной совместимости)

---

## Связи (кратко)

```
catalog_categories (1) ──< catalog_organizations (N)
catalog_organizations (1) ──< organization_addresses (N)
catalog_organizations (1) ──< organization_gallery_images (N)
catalog_organizations (1) ──|| organization_equipment_sales (0..1)
catalog_organizations (1) ──|| organization_mining_hotels (0..1)
catalog_organizations (1) ──|| organization_payment_terms (0..1)
catalog_organizations (1) ──|| organization_legal_profiles (0..1)
catalog_organizations (1) ──< organization_reviews (N)
organization_reviews (1) ──< organization_review_replies (N)

article_topics (1) ──< articles (N)
articles (1) ──< article_sections (N)
articles (N) ──< article_related >── (N) articles
```

---

## Seed-данные в миграции

- **r7miner** — рейтинг 4.9 / 113 отзывов, проверка ТОП МАЙНИНГ, rusprofile ООО «РАЙТ ГРУПП»
- **ttm-mining** — без рейтинга, не проверен, данные с [страницы TTM](https://top-mining.ru/sale_asic/ttm-mining/)
- **whatsminer-m70-line-review** — подзаголовок, просмотры, 7 пунктов оглавления, связанные статьи

---

## Применение

```bash
cd backend
docker compose up -d
psql "$DATABASE_URL" -f migrations/007_organizations_and_article_detail.sql
```

Или пересоздать БД с нуля — все миграции `001`…`007` подхватятся через `docker-entrypoint-initdb.d`, если смонтированы в compose.

---

## Следующие шаги (не в этой миграции)

1. Go API: `GET /api/organizations/{categorySlug}/{orgSlug}`
2. Go API: расширить `GET /api/articles/{slug}` — sections, related, view_count
3. Nuxt-страницы: `/sale_asic/[slug].vue`, доработка `[slug].vue` для статей
4. Импортёр с WordPress REST API для полного HTML и галереи
