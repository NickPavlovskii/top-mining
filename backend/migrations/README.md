# Миграции PostgreSQL

Применяет `go run ./cmd/migrate` из каталога `backend/`: по одному SQL-файлу в транзакции, порядок — по имени файла, учёт в `schema_migrations`.

## Правила

| Тип | Префикс | Пример |
|-----|---------|--------|
| Схема (DDL) | `0NN_*` | `042_article_translations.sql` |
| Сиды / правки данных | тот же | `006_reviews.sql`, `028_calculator_catalog_seed.sql` |
| Baseline (не в раннере) | `000_*` | зарезервировано под squash для greenfield |
| Ручные куски | `manual-chunks/` | **не применяются** migrate; только `psql` вручную |

**Не редактировать** уже применённые миграции на проде — только новые файлы с большим номером.

**Не объединять** старые файлы в один: у существующих БД они уже в `schema_migrations`. Объединение допустимо только для новых установок через отдельный `000_baseline.sql` (пока не используется).

## Карта по назначению

### Схема (001–019, 029–031, 042)

- **001** — `catalog_categories`, `catalog_organizations`
- **002** — `articles`, `article_topics` + начальный seed
- **003** — профиль организаций, адреса, галерея, отзывы, фильтры каталога
- **005** — рейтинги (`rating_*`)
- **016** — `media_assets`, `entity_links`
- **017** — домен `hardware_*`, калькулятор
- **018** — `article_blocks`
- **019** — триггер синхронизации рейтинга из отзывов
- **021** — флаги «на главной» для рейтингов
- **029–030** — podbor offers
- **031** — `leads`
- **042** — `article_translations`, `article_block_translations`

### Импорты и профили организаций (004, 007–015, 025–026)

Поштучные UPDATE/INSERT по slug. **025** уже консolidated (бывшие 025–034 по org-профилям и индексам ленты).

### Большие сиды статей (024, 027, 033–041, 043_*)

| Файл | ~размер | Заметка |
|------|---------|---------|
| `024_rating_articles_seed.sql` | 2.2 MB | один файл; chunks в `manual-chunks/` — legacy |
| `027_articles_content.sql` | 940 KB | контент статей |
| `043_article_en_seed_01..09.sql` | ~2.7 MB суммарно | EN переводы; **намеренно разбиты** для транзакций |

Новые большие сиды — по образцу **043**: `NNN_description_01.sql`, `_02.sql`, …

### Оптимизация

- **044** — индексы каталога/ленты статей, удаление дублирующего индекса `article_blocks`

## Bootstrap старых БД

Если таблица `organizations` есть, а `schema_migrations` пуста — migrate помечает **001–004** как applied и продолжает с **005**.

## Генерация сидов

```powershell
node scripts/generate-calculator-migration.mjs   # → 028_calculator_catalog_seed.sql
node scripts/generate-ratings-migration.mjs      # рейтинги / статьи
```

## Ручное применение одного файла

```powershell
cd backend
docker cp migrations/028_calculator_catalog_seed.sql niklad-postgres:/tmp/028.sql
docker exec niklad-postgres psql -U niklad -d niklad -v ON_ERROR_STOP=1 -f /tmp/028.sql
```

После ручного `psql` добавьте запись в `schema_migrations`, иначе `go run ./cmd/migrate` применит файл повторно.

## manual-chunks/

Устаревшие фрагменты для ручного `psql` (024 по частям, дубликаты 028–031). Канонические версии — файлы в корне `migrations/`. Папку можно удалить после проверки, что корневые файлы актуальны.

## Пропуски в нумерации

- **020**, **022** — удалены пустые каталоги-заглушки (legacy migrate/drop без SQL).
- **035** — не использовался.
