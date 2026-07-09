import fs from 'node:fs'

const src = fs.readFileSync('common/modules/ratings/fallback.ts', 'utf8')
const cardsMatch = src.match(
  /export const RATINGS_FALLBACK_CARDS[^=]*=\s*(\[[\s\S]*?\n\])\s*export const RATINGS_FALLBACK_HOME/,
)

if (!cardsMatch) {
  throw new Error('RATINGS_FALLBACK_CARDS not found')
}

const cards = eval(cardsMatch[1])

function esc(value) {
  return value.replace(/'/g, "''")
}

function toInternalArticleHref(href) {
  if (href.startsWith('/')) {
    return href
  }

  const match = href.match(/\/rating\/(.+?)\/?$/)
  if (!match) {
    return href
  }

  const slug = match[1].split('/').filter(Boolean).at(-1)
  return slug ? `/articles/${slug}` : href
}

let sql = ''

sql += `INSERT INTO rating_categories (slug, title, columns, sort_order) VALUES
${cards
  .map((card, index) => `  ('${card.id}', '${esc(card.title)}', 1, ${index + 1})`)
  .join(',\n')}
ON CONFLICT (slug) DO NOTHING;

`

for (const card of cards) {
  sql += `-- ${card.id}\n`
  sql += `INSERT INTO rating_items (category_id, display_number, label, href, sort_order)
SELECT c.id, v.display_number, v.label, v.href, v.sort_order
FROM rating_categories c
JOIN (VALUES
${card.items
  .map(
    (item, index) =>
      `  ('${item.number}', '${esc(item.label)}', '${esc(toInternalArticleHref(item.href))}', ${index + 1})`,
  )
  .join(',\n')}
) AS v(display_number, label, href, sort_order) ON c.slug = '${card.id}'
ON CONFLICT DO NOTHING;

`
}

const homeCards = [
  ['equipment', cards.find((card) => card.id === 'equipment').title, 2, 1],
  ['tools', cards.find((card) => card.id === 'tools').title, 2, 2],
  ['sales', 'ТОП: Продажи и услуги', 1, 3],
  ['crypto', cards.find((card) => card.id === 'crypto').title, 1, 4],
]

sql += `INSERT INTO rating_home_cards (slug, title, columns, sort_order) VALUES
${homeCards
  .map(
    (entry) =>
      `  ('${entry[0]}', '${esc(entry[1])}', ${entry[2]}, ${entry[3]})`,
  )
  .join(',\n')}
ON CONFLICT (slug) DO NOTHING;

`

function homeItemSql(homeSlug, categorySlug, itemNumber, displayNumber, sortOrder) {
  return `INSERT INTO rating_home_card_items (home_card_id, item_id, display_number, sort_order)
SELECT hc.id, i.id, '${displayNumber}', ${sortOrder}
FROM rating_home_cards hc, rating_items i
JOIN rating_categories c ON c.id = i.category_id
WHERE hc.slug = '${homeSlug}' AND c.slug = '${categorySlug}' AND i.display_number = '${itemNumber}';

`
}

let order = 1
for (const number of ['07', '08', '09', '10', '11', '12', '13', '14', '15']) {
  sql += homeItemSql(
    'equipment',
    'equipment',
    number,
    String(order).padStart(2, '0'),
    order,
  )
  order += 1
}

order = 1
for (const number of ['02', '03', '08', '04', '05', '06']) {
  sql += homeItemSql('tools', 'tools', number, String(order).padStart(2, '0'), order)
  order += 1
}

sql += homeItemSql('sales', 'sales', '03', '01', 1)
sql += homeItemSql('sales', 'equipment', '17', '02', 2)

order = 1
for (const number of ['02', '03']) {
  sql += homeItemSql('crypto', 'crypto', number, String(order).padStart(2, '0'), order)
  order += 1
}

const header = `CREATE TABLE IF NOT EXISTS rating_categories (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    columns SMALLINT NOT NULL DEFAULT 1 CHECK (columns IN (1, 2)),
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS rating_items (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES rating_categories (id) ON DELETE CASCADE,
    display_number TEXT NOT NULL,
    label TEXT NOT NULL,
    href TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (category_id, display_number)
);

CREATE INDEX IF NOT EXISTS rating_items_category_sort_idx
    ON rating_items (category_id, sort_order);

CREATE TABLE IF NOT EXISTS rating_home_cards (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    columns SMALLINT NOT NULL DEFAULT 1 CHECK (columns IN (1, 2)),
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS rating_home_card_items (
    id SERIAL PRIMARY KEY,
    home_card_id INT NOT NULL REFERENCES rating_home_cards (id) ON DELETE CASCADE,
    item_id INT NOT NULL REFERENCES rating_items (id) ON DELETE CASCADE,
    display_number TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE (home_card_id, sort_order)
);

`

fs.writeFileSync(
  'backend/migrations/016_ratings.sql',
  header + sql,
)
console.log('Wrote backend/migrations/016_ratings.sql')
