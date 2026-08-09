import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const srcPath = path.join(root, 'backend/migrations/024_rating_articles_seed.sql')
const outDir = path.join(root, 'backend/migrations/manual-chunks')

const MAX_BYTES = 280_000

const src = fs.readFileSync(srcPath, 'utf8')
const lines = src.split(/\r?\n/)

const encoding = "SET client_encoding = 'UTF8';\n\n"

function findLine(pred, from = 0) {
  for (let i = from; i < lines.length; i++) {
    if (pred(lines[i])) return i
  }
  return -1
}

const deleteIdx = findLine((l) => l.startsWith('-- Replace blocks for seeded rating articles'))
if (deleteIdx < 0) throw new Error('DELETE section not found')

let articlesBody = lines.slice(0, deleteIdx).join('\n').trimEnd() + '\n'
articlesBody = articlesBody.replace(/^SET client_encoding = 'UTF8';\s*/m, '')
const deleteEnd = findLine((l) => l.startsWith('-- Blocks:'), deleteIdx)
const deleteSection = lines.slice(deleteIdx, deleteEnd).join('\n').trimEnd() + '\n'

const blockStarts = []
for (let i = deleteEnd; i < lines.length; i++) {
  if (lines[i].startsWith('-- Blocks:')) blockStarts.push(i)
}
blockStarts.push(lines.length)

const articleUnits = []
{
  const parts = articlesBody.split(/\n(?=INSERT INTO articles \()/)
  const preamble = parts[0]
  for (let i = 1; i < parts.length; i++) {
    articleUnits.push((i === 1 ? preamble : '') + (i === 1 ? '' : '\n') + parts[i])
  }
  if (parts.length === 1) articleUnits.push(preamble)
  // Fix: first unit should include preamble + first INSERT
  if (parts.length > 1) {
    articleUnits.length = 0
    articleUnits.push(parts[0] + '\n' + parts[1])
    for (let i = 2; i < parts.length; i++) articleUnits.push(parts[i])
  }
}

const blockUnits = []
for (let i = 0; i < blockStarts.length - 1; i++) {
  const chunk = lines.slice(blockStarts[i], blockStarts[i + 1]).join('\n').trimEnd() + '\n'
  blockUnits.push(chunk)
}

function pack(units, { prepend = '', oncePrefix = '' } = {}) {
  const out = []
  let current = encoding + prepend
  let usedOnce = false
  let currentBytes = Buffer.byteLength(current)

  for (const unit of units) {
    let add = unit
    if (!usedOnce && oncePrefix) {
      add = oncePrefix + (oncePrefix.endsWith('\n') ? '' : '\n') + unit
    }
    const addBytes = Buffer.byteLength(add) + 1
    if (currentBytes + addBytes > MAX_BYTES && currentBytes > Buffer.byteLength(encoding + prepend) + 10) {
      out.push(current)
      current = encoding + prepend
      currentBytes = Buffer.byteLength(current)
      add = unit
      // oncePrefix only in first chunk of this pack call
    }
    if (!usedOnce && oncePrefix && add.includes(oncePrefix.slice(0, 40))) {
      usedOnce = true
    } else if (!usedOnce && oncePrefix && current.includes(oncePrefix.slice(0, 40))) {
      usedOnce = true
    }
    current += (current.endsWith('\n') ? '' : '\n') + add
    currentBytes = Buffer.byteLength(current)
    if (oncePrefix && current.includes('-- Replace blocks')) usedOnce = true
  }
  if (current.trim() && current.trim() !== encoding.trim()) out.push(current)
  return out
}

// Simpler packers
function packSimple(units, headerExtra = '') {
  const out = []
  let current = encoding + headerExtra
  let currentBytes = Buffer.byteLength(current)
  const base = encoding + headerExtra

  for (const unit of units) {
    const addBytes = Buffer.byteLength(unit) + 1
    if (currentBytes + addBytes > MAX_BYTES && current !== base) {
      out.push(current)
      current = base
      currentBytes = Buffer.byteLength(current)
    }
    current += (current.endsWith('\n') ? '' : '\n') + unit
    currentBytes = Buffer.byteLength(current)
  }
  if (current.trim() && Buffer.byteLength(current) > Buffer.byteLength(base) + 5) {
    out.push(current)
  }
  return out
}

const articleChunks = packSimple(articleUnits)
const blockChunks = []
{
  // First block chunk gets DELETE once
  let pending = [...blockUnits]
  let first = true
  while (pending.length) {
    let body = encoding
    if (first) {
      body += deleteSection + '\n'
      first = false
    }
    let bytes = Buffer.byteLength(body)
    const taken = []
    while (pending.length) {
      const next = pending[0]
      const nextBytes = Buffer.byteLength(next) + 1
      if (taken.length && bytes + nextBytes > MAX_BYTES) break
      // single unit larger than max: still take it alone
      if (!taken.length && bytes + nextBytes > MAX_BYTES) {
        taken.push(pending.shift())
        bytes += nextBytes
        break
      }
      taken.push(pending.shift())
      bytes += nextBytes
    }
    blockChunks.push(body + taken.join('\n'))
  }
}

fs.mkdirSync(outDir, { recursive: true })
for (const f of fs.readdirSync(outDir)) {
  if (f.startsWith('024_rating_articles_seed_')) {
    fs.unlinkSync(path.join(outDir, f))
  }
}

const all = [...articleChunks, ...blockChunks]
const written = []
all.forEach((body, i) => {
  const n = String(i + 1).padStart(2, '0')
  const name = `024_rating_articles_seed_${n}.sql`
  const outPath = path.join(outDir, name)
  fs.writeFileSync(outPath, body.replace(/\n{3,}/g, '\n\n'), 'utf8')
  written.push({ name, kb: Math.round(fs.statSync(outPath).size / 1024) })
})

console.log(
  JSON.stringify(
    {
      outDir: path.relative(root, outDir),
      articleChunks: articleChunks.length,
      blockChunks: blockChunks.length,
      total: written.length,
      files: written,
    },
    null,
    2,
  ),
)
