/**
 * Раньше генерировал SQL из common/modules/ratings/fallback.ts.
 * Источник правды теперь: backend/migrations/005_ratings.sql
 * (и при необходимости 021_ratings_home_flags.sql, 023_sales_ratings_replace.sql).
 */
console.error(
  'Obsolete: ratings live in backend/migrations/005_ratings.sql (and related). Local fallback removed.',
)
process.exit(1)
