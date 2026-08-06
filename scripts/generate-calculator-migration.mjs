import fs from 'node:fs'
import path from 'node:path'

const root = path.resolve(import.meta.dirname, '..')
// Исторический генератор: раньше парсил CALCULATOR_HARDWARE_BY_KIND из hardware.ts.
// Каталог моделей теперь живёт в БД (миграции 017/028); этот скрипт больше не
// перегенерирует hardware seed из TS. Оставлен для coins/gpu при необходимости.
const hwPath = path.join(root, 'common/modules/top-mining/calculator/hardware.ts')
const hw = fs.existsSync(hwPath) ? fs.readFileSync(hwPath, 'utf8') : ''
if (!hw.includes('asic: [')) {
  console.error(
    '[generate-calculator-migration] hardware seed удалён из TS.\n' +
      'Каталог моделей — в БД (backend/migrations/017_*, 028_calculator_catalog_seed.sql).\n' +
      'Не перезаписывайте 028 из этого скрипта.',
  )
  process.exit(1)
}
const coinsTs = fs.readFileSync(
  path.join(root, 'common/modules/top-mining/calculator/coins.ts'),
  'utf8',
)
const gpuTs = fs.readFileSync(
  path.join(root, 'common/modules/top-mining/calculator/gpu.ts'),
  'utf8',
)

function sqlStr(value) {
  return `'${String(value).replace(/'/g, "''")}'`
}

function sqlNum(value) {
  if (typeof value === 'string') {
    const cleaned = value.trim()
    if (!cleaned) return '0'
    return cleaned
  }
  if (!Number.isFinite(value)) return '0'
  return String(value)
}

function slugifyAlgo(title) {
  const normalized = title.trim().toLowerCase()
  const aliases = {
    'sha-256': 'sha256',
    sha256: 'sha256',
    scrypt: 'scrypt',
    kawpow: 'kawpow',
    etchash: 'etchash',
    ethash: 'ethash',
    ethash4g: 'ethash4g',
    autolykos: 'autolykos',
    autolykos2: 'autolykos',
    randomx: 'randomx',
    'x11': 'x11',
    zksnark: 'zksnark',
    blake3: 'blake3',
    blake3ironfish: 'blake3-ironfish',
    blake2s: 'blake2s',
    eaglesong: 'eaglesong',
    groestl: 'groestl',
    handshake: 'handshake',
    kheavyhash: 'kheavyhash',
    lyra2rev2: 'lyra2rev2',
    equihash: 'equihash',
    zhash: 'zhash',
    sha512256d: 'sha512256d',
    dynexsolve: 'dynexsolve',
    pyrinhash: 'pyrinhash',
    skydoge: 'skydoge',
    cuckatoo32: 'cuckatoo32',
    karlsenhash: 'karlsenhash',
    ironfish: 'ironfish',
    fishhash: 'fishhash',
    pouw: 'pouw',
    nexapow: 'nexapow',
    ghostrider: 'ghostrider',
  }

  const key = normalized.replace(/[^a-z0-9]+/g, '')
  if (aliases[key]) return aliases[key]
  if (aliases[normalized]) return aliases[normalized]

  return normalized
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function vendorSlugFromBrand(brand) {
  const map = {
    'Microbt Whatsminer': 'microbt',
    'Bitmain Antminer': 'bitmain',
    'Canaan Avalon': 'canaan',
    Goldshell: 'goldshell',
    Innosilicon: 'innosilicon',
    ipollo: 'ipollo',
    Jasminer: 'jasminer',
    BeeMiner: 'beeminer',
    Hummer: 'hummer',
    AMD: 'amd',
    NVIDIA: 'nvidia',
    INTEL: 'intel',
  }
  if (map[brand]) return map[brand]
  return brand
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

const modelRe =
  /model\(\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*([0-9.]+)\s*,\s*'([^']+)'\s*,\s*([0-9.]+)\s*,\s*'([^']+)'\s*,?\s*\)/g

const asicStart = hw.indexOf('asic: [')
const gpuStart = hw.indexOf('gpu: [')
const cpuStart = hw.indexOf('cpu: [')

function kindOf(index) {
  if (index > cpuStart) return 'cpu'
  if (index > gpuStart) return 'gpu'
  return 'asic'
}

const models = []
let match
while ((match = modelRe.exec(hw))) {
  models.push({
    kind: kindOf(match.index),
    brand: match[1],
    name: match[2],
    algo: match[3],
    hashrate: Number(match[4]),
    unit: match[5],
    power: Number(match[6]),
    slug: match[7],
  })
}

const coinObjectRe =
  /\{\s*id:\s*'([^']+)',\s*symbol:\s*'([^']+)',\s*name:\s*'([^']+)',\s*algorithm:\s*'([^']+)',\s*difficulty:\s*([^,]+),\s*blockReward:\s*([^,]+),\s*exchangeRateUsdt:\s*([^,]+),\s*netHash:\s*([^,]+),\s*stepen:\s*'([^']+)',\s*dualCoin:\s*(true|false),\s*iconUrl:\s*'([^']+)',\s*sort:\s*([0-9]+),?\s*\}/gs

function toSqlNumber(raw) {
  return String(raw).replace(/_/g, '').trim()
}

function parseCoins(source, scope) {
  const out = []
  let m
  while ((m = coinObjectRe.exec(source))) {
    out.push({
      scope,
      id: m[1],
      symbol: m[2],
      name: m[3],
      algorithm: m[4],
      difficulty: toSqlNumber(m[5]),
      blockReward: toSqlNumber(m[6]),
      exchangeRateUsdt: toSqlNumber(m[7]),
      netHash: toSqlNumber(m[8]),
      stepen: m[9],
      dualCoin: m[10] === 'true',
      iconUrl: m[11],
      sort: Number(m[12]),
    })
  }
  return out
}

const asicCoins = parseCoins(coinsTs, 'asic')
const gpuCoins = parseCoins(gpuTs, 'gpu')
const coins = [...asicCoins, ...gpuCoins]

const gpuAlgoListMatch = gpuTs.match(
  /CALCULATOR_GPU_ALGORITHMS: string\[] = \[([\s\S]*?)\]/,
)
const gpuAlgorithms = (gpuAlgoListMatch?.[1].match(/'([^']+)'/g) || []).map(
  (s) => s.slice(1, -1),
)

const allAlgoTitles = [
  ...new Set([
    ...models.map((m) => m.algo),
    ...coins.map((c) => c.algorithm),
    ...gpuAlgorithms,
  ]),
].sort((a, b) => a.localeCompare(b))

const vendors = [
  ...new Map(
    models.map((m) => {
      const slug = vendorSlugFromBrand(m.brand)
      return [slug, { slug, title: m.brand }]
    }),
  ).values(),
]

const kindVendors = []
for (const model of models) {
  const key = `${model.kind}:${vendorSlugFromBrand(model.brand)}`
  if (!kindVendors.find((x) => `${x.kind}:${x.vendor}` === key)) {
    kindVendors.push({
      kind: model.kind,
      vendor: vendorSlugFromBrand(model.brand),
    })
  }
}

const lines = []
lines.push(`SET client_encoding = 'UTF8';`)
lines.push('')
lines.push(`-- =====================================================================`)
lines.push(`-- 028_calculator_catalog_seed.sql`)
lines.push(`-- Полный сид параметров калькулятора (алгоритмы, монеты, модели)`)
lines.push(`-- из фронтовых модулей calculator-*.ts. Идемпотентно.`)
lines.push(`-- =====================================================================`)
lines.push('')
lines.push(`-- Расширяем hardware_coins под поля калькулятора`)
lines.push(`ALTER TABLE hardware_coins`)
lines.push(`    ADD COLUMN IF NOT EXISTS slug TEXT,`)
lines.push(`    ADD COLUMN IF NOT EXISTS dual_coin BOOLEAN NOT NULL DEFAULT FALSE,`)
lines.push(`    ADD COLUMN IF NOT EXISTS stepen TEXT NOT NULL DEFAULT '0',`)
lines.push(`    ADD COLUMN IF NOT EXISTS icon_url TEXT NOT NULL DEFAULT '',`)
lines.push(`    ADD COLUMN IF NOT EXISTS scope TEXT NOT NULL DEFAULT 'shared';`)
lines.push(`    ADD COLUMN IF NOT EXISTS net_hash NUMERIC(40, 4);`)
lines.push('')
lines.push(`UPDATE hardware_coins`)
lines.push(`SET slug = lower(ticker)`)
lines.push(`WHERE slug IS NULL OR slug = '';`)
lines.push('')
lines.push(`DO $$`)
lines.push(`BEGIN`)
lines.push(`    IF NOT EXISTS (`)
lines.push(`        SELECT 1 FROM pg_constraint WHERE conname = 'hardware_coins_slug_key'`)
lines.push(`    ) THEN`)
lines.push(`        ALTER TABLE hardware_coins ADD CONSTRAINT hardware_coins_slug_key UNIQUE (slug);`)
lines.push(`    END IF;`)
lines.push(`END $$;`)
lines.push('')
lines.push(`-- ticker больше не глобально уникален (ALPH asic/gpu), уникальность по slug`)
lines.push(`ALTER TABLE hardware_coins DROP CONSTRAINT IF EXISTS hardware_coins_ticker_key;`)
lines.push(`CREATE UNIQUE INDEX IF NOT EXISTS idx_hardware_coins_scope_ticker`)
lines.push(`    ON hardware_coins (scope, ticker);`)
lines.push('')
lines.push(`ALTER TABLE market_stats`)
lines.push(`    ALTER COLUMN price_usdt TYPE NUMERIC(40, 20),`)
lines.push(`    ALTER COLUMN difficulty TYPE NUMERIC(50, 12),`)
lines.push(`    ALTER COLUMN block_reward TYPE NUMERIC(40, 20),`)
lines.push(`    ALTER COLUMN network_hashrate TYPE NUMERIC(50, 8);`)
lines.push('')

// kinds hints from CALCULATOR_DEVICE_OPTIONS already in 017 — update empty_hint for ASIC
lines.push(`UPDATE hardware_kinds SET`)
lines.push(`    empty_hint = CASE slug`)
lines.push(`        WHEN 'asic' THEN 'Выберите модель ASIC, чтобы рассчитать доходность или введите свои параметры'`)
lines.push(`        WHEN 'gpu' THEN 'Выберите модель GPU, чтобы рассчитать доходность'`)
lines.push(`        WHEN 'cpu' THEN 'Выберите модель CPU, чтобы рассчитать доходность'`)
lines.push(`        ELSE empty_hint`)
lines.push(`    END,`)
lines.push(`    picker_hint = CASE slug`)
lines.push(`        WHEN 'asic' THEN 'Модель ASIC-майнера'`)
lines.push(`        WHEN 'gpu' THEN 'Выберите Модель GPU'`)
lines.push(`        WHEN 'cpu' THEN 'Выберите Модель CPU'`)
lines.push(`        ELSE picker_hint`)
lines.push(`    END;`)
lines.push('')

// vendors
lines.push(`INSERT INTO hardware_vendors (slug, title) VALUES`)
lines.push(
  vendors
    .map((v) => `    (${sqlStr(v.slug)}, ${sqlStr(v.title)})`)
    .join(',\n'),
)
lines.push(`ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;`)
lines.push('')

// kind vendors
let ord = 10
const kvRows = kindVendors.map((kv) => {
  const row = `    (${sqlStr(kv.kind)}, ${sqlStr(kv.vendor)}, ${ord})`
  ord += 10
  return row
})
lines.push(`INSERT INTO hardware_kind_vendors (kind_id, vendor_id, sort_order)`)
lines.push(`SELECT k.id, v.id, x.ord`)
lines.push(`FROM (VALUES`)
lines.push(kvRows.join(',\n'))
lines.push(`) AS x(kind_slug, vendor_slug, ord)`)
lines.push(`JOIN hardware_kinds k ON k.slug = x.kind_slug`)
lines.push(`JOIN hardware_vendors v ON v.slug = x.vendor_slug`)
lines.push(`ON CONFLICT (kind_id, vendor_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;`)
lines.push('')

// algorithms
lines.push(`INSERT INTO hardware_algorithms (slug, title, sort_order) VALUES`)
lines.push(
  allAlgoTitles
    .map((title, i) => `    (${sqlStr(slugifyAlgo(title))}, ${sqlStr(title)}, ${(i + 1) * 10})`)
    .join(',\n'),
)
lines.push(`ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, sort_order = EXCLUDED.sort_order;`)
lines.push('')

// coins
lines.push(`INSERT INTO hardware_coins (`)
lines.push(`    algorithm_id, ticker, title, slug, dual_coin, stepen, icon_url, scope, net_hash, sort_order, is_active`)
lines.push(`)`)
lines.push(`SELECT a.id, x.ticker, x.title, x.slug, x.dual_coin::boolean, x.stepen, x.icon_url, x.scope, x.net_hash::numeric, x.ord, TRUE`)
lines.push(`FROM (VALUES`)
lines.push(
  coins
    .map((c) => {
      const slug = c.id.toLowerCase().replace(/\+/g, '-plus-')
      return `    (${sqlStr(slugifyAlgo(c.algorithm))}, ${sqlStr(c.symbol)}, ${sqlStr(c.name)}, ${sqlStr(slug)}, ${c.dualCoin}, ${sqlStr(c.stepen)}, ${sqlStr(c.iconUrl)}, ${sqlStr(c.scope)}, ${sqlNum(c.netHash)}, ${c.sort * 10})`
    })
    .join(',\n'),
)
lines.push(`) AS x(algo_slug, ticker, title, slug, dual_coin, stepen, icon_url, scope, net_hash, ord)`)
lines.push(`JOIN hardware_algorithms a ON a.slug = x.algo_slug`)
lines.push(`ON CONFLICT (slug) DO UPDATE SET`)
lines.push(`    algorithm_id = EXCLUDED.algorithm_id,`)
lines.push(`    ticker = EXCLUDED.ticker,`)
lines.push(`    title = EXCLUDED.title,`)
lines.push(`    dual_coin = EXCLUDED.dual_coin,`)
lines.push(`    stepen = EXCLUDED.stepen,`)
lines.push(`    icon_url = EXCLUDED.icon_url,`)
lines.push(`    scope = EXCLUDED.scope,`)
lines.push(`    net_hash = EXCLUDED.net_hash,`)
lines.push(`    sort_order = EXCLUDED.sort_order,`)
lines.push(`    is_active = TRUE;`)
lines.push('')

// market stats
lines.push(`INSERT INTO market_stats (coin_id, price_usdt, difficulty, block_reward, network_hashrate, updated_at)`)
lines.push(`SELECT hc.id, x.price::numeric, x.diff::numeric, x.reward::numeric, x.nethash::numeric, NOW()`)
lines.push(`FROM (VALUES`)
lines.push(
  coins
    .map((c) => {
      const slug = c.id.toLowerCase().replace(/\+/g, '-plus-')
      return `    (${sqlStr(slug)}, ${sqlNum(c.exchangeRateUsdt)}, ${sqlNum(c.difficulty)}, ${sqlNum(c.blockReward)}, ${sqlNum(c.netHash)})`
    })
    .join(',\n'),
)
lines.push(`) AS x(slug, price, diff, reward, nethash)`)
lines.push(`JOIN hardware_coins hc ON hc.slug = x.slug`)
lines.push(`ON CONFLICT (coin_id) DO UPDATE SET`)
lines.push(`    price_usdt = EXCLUDED.price_usdt,`)
lines.push(`    difficulty = EXCLUDED.difficulty,`)
lines.push(`    block_reward = EXCLUDED.block_reward,`)
lines.push(`    network_hashrate = EXCLUDED.network_hashrate,`)
lines.push(`    updated_at = NOW();`)
lines.push('')

// fx rates from calculator defaults
lines.push(`INSERT INTO fx_rates (pair, rate) VALUES`)
lines.push(`    ('USDT-RUB', 79.2),`)
lines.push(`    ('BTC-USDT', 63076)`)
lines.push(`ON CONFLICT (pair) DO UPDATE SET rate = EXCLUDED.rate, updated_at = NOW();`)
lines.push('')

// models
lines.push(`INSERT INTO hardware_models (`)
lines.push(`    kind_id, vendor_id, slug, name, price_default, price_currency, is_published, sort_order`)
lines.push(`)`)
lines.push(`SELECT k.id, v.id, x.slug, x.name, 120000, 'RUB', TRUE, x.ord`)
lines.push(`FROM (VALUES`)
lines.push(
  models
    .map((m, i) => {
      return `    (${sqlStr(m.kind)}, ${sqlStr(vendorSlugFromBrand(m.brand))}, ${sqlStr(m.slug)}, ${sqlStr(m.name)}, ${(i + 1) * 10})`
    })
    .join(',\n'),
)
lines.push(`) AS x(kind_slug, vendor_slug, slug, name, ord)`)
lines.push(`JOIN hardware_kinds k ON k.slug = x.kind_slug`)
lines.push(`JOIN hardware_vendors v ON v.slug = x.vendor_slug`)
lines.push(`ON CONFLICT (slug) DO UPDATE SET`)
lines.push(`    kind_id = EXCLUDED.kind_id,`)
lines.push(`    vendor_id = EXCLUDED.vendor_id,`)
lines.push(`    name = EXCLUDED.name,`)
lines.push(`    sort_order = EXCLUDED.sort_order,`)
lines.push(`    is_published = TRUE,`)
lines.push(`    updated_at = NOW();`)
lines.push('')

// model algorithms
lines.push(`INSERT INTO hardware_model_algorithms (model_id, algorithm_id, hashrate, hashrate_unit, power_watts, is_primary)`)
lines.push(`SELECT hm.id, a.id, x.hashrate, x.unit, x.power, TRUE`)
lines.push(`FROM (VALUES`)
lines.push(
  models
    .map((m) => {
      return `    (${sqlStr(m.slug)}, ${sqlStr(slugifyAlgo(m.algo))}, ${sqlNum(m.hashrate)}, ${sqlStr(m.unit)}, ${sqlNum(m.power)})`
    })
    .join(',\n'),
)
lines.push(`) AS x(model_slug, algo_slug, hashrate, unit, power)`)
lines.push(`JOIN hardware_models hm ON hm.slug = x.model_slug`)
lines.push(`JOIN hardware_algorithms a ON a.slug = x.algo_slug`)
lines.push(`ON CONFLICT (model_id, algorithm_id) DO UPDATE SET`)
lines.push(`    hashrate = EXCLUDED.hashrate,`)
lines.push(`    hashrate_unit = EXCLUDED.hashrate_unit,`)
lines.push(`    power_watts = EXCLUDED.power_watts,`)
lines.push(`    is_primary = TRUE;`)
lines.push('')

// optional: calculator settings table for units/defaults
lines.push(`CREATE TABLE IF NOT EXISTS calculator_settings (`)
lines.push(`    key        TEXT PRIMARY KEY,`)
lines.push(`    value_json JSONB NOT NULL DEFAULT '{}'::jsonb,`)
lines.push(`    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()`)
lines.push(`);`)
lines.push('')
lines.push(`INSERT INTO calculator_settings (key, value_json) VALUES`)
lines.push(`    ('hashrate_units', '["Th/s","Gh/s","Mh/s","Kh/s","H/s"]'::jsonb),`)
lines.push(`    ('fiat_options', '["₽","$"]'::jsonb),`)
lines.push(`    ('defaults', '{"price":120000,"quantity":1,"uptime":99,"pool_fee":4,"usdt_rub":79.2,"electricity_price":5.5}'::jsonb),`)
lines.push(`    ('gpu_algorithms', ${sqlStr(JSON.stringify(gpuAlgorithms))}::jsonb)`)
lines.push(`ON CONFLICT (key) DO UPDATE SET value_json = EXCLUDED.value_json, updated_at = NOW();`)
lines.push('')

const outPath = path.join(root, 'backend/migrations/028_calculator_catalog_seed.sql')
fs.writeFileSync(outPath, `${lines.join('\n')}\n`, 'utf8')

console.log(
  JSON.stringify(
    {
      outPath,
      models: models.length,
      coins: coins.length,
      algorithms: allAlgoTitles.length,
      vendors: vendors.length,
      byKind: models.reduce((acc, m) => {
        acc[m.kind] = (acc[m.kind] || 0) + 1
        return acc
      }, {}),
    },
    null,
    2,
  ),
)
