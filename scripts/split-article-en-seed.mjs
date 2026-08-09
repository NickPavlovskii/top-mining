import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const srcPath = path.join(
  root,
  'backend/migrations/043_article_en_translations_seed.sql',
)
const outDir = path.join(root, 'backend/migrations')

const MAX_BYTES = 350_000

const src = fs.readFileSync(srcPath, 'utf8')
const parts = src.split(/\n(?=-- [a-z0-9][a-z0-9-]*)/g)

const header = parts[0].startsWith('SET client_encoding')
  ? parts.shift()
  : "SET client_encoding = 'UTF8';\n\n"

const chunks = []
let current = header
let currentBytes = Buffer.byteLength(current)

for (const part of parts) {
  const partBytes = Buffer.byteLength(part) + 1
  if (currentBytes + partBytes > MAX_BYTES && current !== header) {
    chunks.push(current)
    current = header + '\n' + part
    currentBytes = Buffer.byteLength(current)
  } else {
    current += (current.endsWith('\n') ? '' : '\n') + part
    currentBytes = Buffer.byteLength(current)
  }
}
if (current.trim()) {
  chunks.push(current)
}

fs.unlinkSync(srcPath)

const written = []
chunks.forEach((body, i) => {
  const n = String(i + 1).padStart(2, '0')
  const name = `043_article_en_seed_${n}.sql`
  const outPath = path.join(outDir, name)
  const note =
    `-- EN article translations seed chunk ${i + 1}/${chunks.length}\n` +
    `-- Apply in order via Supabase SQL Editor or: psql "$DATABASE_URL" -f ${name}\n` +
    `-- Safe to re-run (ON CONFLICT DO UPDATE).\n\n`
  fs.writeFileSync(outPath, note + body, 'utf8')
  written.push({ name, bytes: fs.statSync(outPath).size })
})

console.log(
  JSON.stringify(
    {
      chunks: written.length,
      files: written,
      removed: path.basename(srcPath),
    },
    null,
    2,
  ),
)
