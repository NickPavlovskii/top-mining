import fs from 'node:fs'

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

const path = 'common/modules/ratings/fallback.ts'
let source = fs.readFileSync(path, 'utf8')

source = source.replace(
  /"href": "https:\/\/top-mining\.ru\/rating\/[^"]+"/g,
  (match) => {
    const href = match.slice(9, -1)
    return `"href": "${toInternalArticleHref(href)}"`
  },
)

fs.writeFileSync(path, source)
console.log('Updated', path)
