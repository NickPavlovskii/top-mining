# Backend: GraphQL + PostgreSQL (Go)

Сервер отдаёт каталог организаций для фронтенда Nuxt.

## Что установить

| Программа | Зачем | Ссылка |
|-----------|-------|--------|
| **Go 1.22+** | запуск backend | https://go.dev/dl/ |
| **Docker Desktop** | PostgreSQL в контейнере | https://www.docker.com/products/docker-desktop/ |
| **VS Code** или **GoLand** | IDE для Go | https://code.visualstudio.com/ или https://www.jetbrains.com/go/ |

### Расширения для VS Code / Cursor

- **Go** (`golang.go`) — подсветка, запуск, `go mod tidy`
- **Docker** — удобно смотреть контейнеры (опционально)

## Структура

```
backend/
  cmd/server/main.go          # GraphQL HTTP-сервер (:8080)
  cmd/fetch/main.go           # проверка: вывести каталог в консоль
  internal/catalog/
    fetch_catalog.go          # ← основной файл: читает данные из Postgres
    db.go                     # подключение к БД
  migrations/
    README.md                   # документация по миграциям (порядок, применение, организации)
    001_init.sql                # каталог: схема + базовые организации
    002_articles.sql            # статьи
    003_organizations.sql       # схема организаций, фильтры, калькулятор
    004_organizations_seed.sql  # seed детальных страниц организаций
    005_ratings.sql             # рейтинги
    006_reviews.sql             # отзывы и синхронизация счётчиков
    007_fix_catalog_encoding.sql
    008_dc_mining_import.sql
    009_gis_mining_import.sql
    010_organization_catalog_db.sql  # AFM Hotel, Терешково, verified_data_center
    011_mining_hotels_import.sql     # BitBird, DataCheap, RusHash, WATT MANOR, Weltall
    012_mining_pools_import.sql      # K8X, Poolin, Antpool, Neopool
    013_crypto_exchanges_import.sql  # Binance, BingX, Bybit, Bitget, OKX, MEXC, KuCoin, Gate.io
    014_sync_rating_from_reviews.sql # рейтинг только из одобренных отзывов
    015_crypto_wallets_import.sql    # MetaMask, Trust Wallet, Exodus, Phantom…
    016_core_media_and_links.sql     # media_assets, entity_links, profile_block
    017_hardware_domain.sql          # единый hardware_* домен (+ сиды моделей)
    018_article_blocks.sql           # блочные статьи
    019_rating_autosync.sql          # триггер рейтинга из отзывов
    021_ratings_home_flags.sql       # флаги главной (если ещё нет в 005)
    000_inspect.sql                  # только SELECT, не в initdb
    archive/imports-split/           # старые поштучные 011–033
    archive/README.md           # карта старых инкрементальных миграций
  docs/db_schema_target.puml  # целевая ER (PlantUML)
  docker-compose.yml          # PostgreSQL
```

Фронтенд ходит в `GET /api/catalog` (Nuxt), Nuxt проксирует запрос в GraphQL.

## Быстрый старт

### 1. PostgreSQL

```powershell
cd backend
docker compose up -d
```

База: `niklad` / пользователь `niklad` / пароль `niklad` / порт **`5433`** (не 5432 — на 5432 часто занят локальный PostgreSQL в Windows).

При первом `docker compose up -d` применяются миграции **001–021** автоматически.

Подробнее: [`migrations/README.md`](migrations/README.md).

### 2. Go-зависимости

```powershell
cd backend
go mod tidy
```

### 3. Проверить чтение из БД (без GraphQL)

```powershell
cd backend
$env:DATABASE_URL="postgres://niklad:niklad@localhost:5433/niklad?sslmode=disable"
go run ./cmd/fetch
```

Должен вывести JSON с категориями и организациями.

### 4. Запустить GraphQL-сервер

```powershell
cd backend
$env:DATABASE_URL="postgres://niklad:niklad@localhost:5433/niklad?sslmode=disable"
$env:PORT="8080"
go run ./cmd/server
```

- GraphQL: http://localhost:8080/graphql  
- GraphiQL (тест GraphQL в браузере): тот же URL  
- **Swagger UI**: http://localhost:8080/swagger/index.html  
- Health: http://localhost:8080/health  

### Swagger

Откройте http://localhost:8080/swagger/index.html — там остался только health-check.

Все данные (каталог, статьи, организации) доступны через GraphQL: http://localhost:8080/graphql

Перегенерация Swagger после изменения аннотаций в `cmd/server/handlers.go`:

```powershell
go install github.com/swaggo/swag/cmd/swag@latest
swag init -g cmd/server/main.go -o docs --parseDependency --parseInternal
```

Примеры GraphQL-запросов:

```graphql
query {
  catalog {
    meta { totalReviews subtitle }
    categories {
      id name slug
      organizations { id name slug rating reviewCount }
    }
  }
}
```

```graphql
query ArticlesFeed($topic: String) {
  articlesFeed(topic: $topic) {
    hasMore
    hero { slug title }
    featured { slug title }
    list { slug title }
  }
}
```

```graphql
query Article($slug: String!) {
  article(slug: $slug) {
    slug title content
  }
}
```

```graphql
query Organization($slug: String!) {
  organization(slug: $slug) {
    slug name categoryName rating
  }
}
```

### 5. Фронтенд Nuxt

В корне проекта создайте `.env` (см. `.env.example`):

```env
CATALOG_GRAPHQL_URL=http://localhost:8080/graphql
```

```powershell
cd ..
npm run dev
```

Секция «Каталог организаций» на главной берёт данные из `/api/catalog` (Nuxt BFF → GraphQL → PostgreSQL).  
Страницы организаций (`/sale_asic/[slug]/`) — из `/api/catalog/organizations/[slug]`.  
Требуется запущенный Go GraphQL-сервер и PostgreSQL с применёнными миграциями.

## Как добавить данные в БД

```sql
INSERT INTO catalog_organizations (category_id, name, logo_url, rating, review_count, sort_order)
VALUES (1, 'Новая компания', '/images/logo.png', 4.5, 12, 99);
```

Или измените `migrations/001_init.sql` и пересоздайте контейнер:

```powershell
docker compose down -v
docker compose up -d
```

### Если БД уже создана — применить миграции вручную

`docker-compose` выполняет SQL только при **первом** запуске контейнера. Если база создана раньше, примените недостающие файлы из `migrations/`. **Важно:** на Windows pipe через PowerShell может испортить кириллицу — надёжнее копировать файл в контейнер:

```powershell
cd backend
docker cp migrations/010_organization_catalog_db.sql niklad-postgres:/tmp/010.sql
docker exec niklad-postgres psql -U niklad -d niklad -f /tmp/010.sql
```

Полный список миграций и порядок — в [`migrations/README.md`](migrations/README.md).

Проще пересоздать том с нуля (все данные сбросятся):

```powershell
cd backend
docker compose down -v
docker compose up -d
```

Старые инкрементальные файлы `003`–`024` объединены; карта соответствия — в `migrations/archive/README.md`.


| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `DATABASE_URL` | `postgres://niklad:niklad@localhost:5433/niklad?sslmode=disable` | PostgreSQL |
| `PORT` | `8080` | порт GraphQL-сервера |
| `CATALOG_GRAPHQL_URL` | `http://localhost:8080/graphql` | URL для Nuxt (в `.env` корня) |

## IDE: как запускать

### VS Code / Cursor

1. Откройте папку `backend` или весь репозиторий.
2. Установите расширение **Go**.
3. `F5` → создайте конфиг **Go: Launch Package** для `cmd/server`.
4. Либо терминал: `go run ./cmd/server`.

### GoLand

1. **File → Open** → папка `backend`.
2. ПКМ по `cmd/server/main.go` → **Run 'go build main.go'**.
3. **Run → Edit Configurations** → Environment: `DATABASE_URL=...`.

## Файл с логикой выборки

Вся работа с PostgreSQL — в:

`internal/catalog/fetch_catalog.go` → функция **`FetchCatalog`**

Её вызывают:

- GraphQL-резолвер (`internal/graphql/schema.go`)
- утилита `go run ./cmd/fetch`
