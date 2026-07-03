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
  migrations/001_init.sql     # таблицы + тестовые данные
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
- REST каталог: `GET http://localhost:8080/api/catalog`  
- Health: http://localhost:8080/health  

### Swagger (REST)

Откройте http://localhost:8080/swagger/index.html — там можно нажать **Try it out** на эндпоинтах:

| Метод | URL | Описание |
|-------|-----|----------|
| GET | `/health` | сервер жив |
| GET | `/api/catalog` | каталог из PostgreSQL (JSON) |

GraphQL по-прежнему тестируется в GraphiQL: http://localhost:8080/graphql

Перегенерация Swagger после изменения аннотаций в `cmd/server/handlers.go`:

```powershell
go install github.com/swaggo/swag/cmd/swag@latest
swag init -g cmd/server/main.go -o docs --parseDependency --parseInternal
```

Пример GraphQL-запроса:

```graphql
query {
  catalog {
    meta {
      totalReviews
      subtitle
    }
    categories {
      id
      name
      slug
      organizations {
        id
        name
        logoUrl
        rating
        reviewCount
      }
    }
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

Секция «Каталог организаций» на главной берёт данные из `/api/catalog`.  
Если Go-сервер недоступен — показываются fallback-данные из `common/modules/catalog/fallback.ts`.

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

## Переменные окружения

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

- GraphQL-резолвер (`cmd/server/main.go`)
- утилита `go run ./cmd/fetch`
