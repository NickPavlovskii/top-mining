# manual-chunks (не для migrate)

Файлы здесь **не подхватываются** `cmd/migrate` (glob только `migrations/*.sql`).

Использовались для ручного применения через `psql`, когда один SQL был слишком большим для Docker/IDE.

**Канон:** одноимённые или более новые файлы в `migrations/` (корень). Перед ручным запуском chunk сверьте с корневым файлом.

| Chunk | Корневой файл |
|-------|----------------|
| `024_rating_articles_seed_*.sql` | `024_rating_articles_seed.sql` |
| `028_calculator_catalog_seed.sql` | `028_calculator_catalog_seed.sql` |
| `029–031_*.sql` | `029–031` в корне |

Новые миграции добавляйте только в корень `migrations/`.
