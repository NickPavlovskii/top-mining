/** @typedef {import('@playwright/test').Page} Page */

/**
 * Storybook 9 iframe URL.
 * @param {string} storyId например `global-topminingbutton--primary-light`
 */
export function storybookIframeUrl(storyId) {
  return `/iframe.html?id=${encodeURIComponent(storyId)}&viewMode=story`
}

/**
 * @param {Page} page
 * @param {string} storyId
 */
export async function gotoStory(page, storyId) {
  await page.goto(storybookIframeUrl(storyId), {
    waitUntil: 'domcontentloaded',
  })
}

/**
 * Title + export name → story id (Storybook kebab-case).
 * @param {string} title
 * @param {string} storyName
 */
export function toStoryId(title, storyName) {
  const titleSlug = title
    .toLowerCase()
    .replace(/\//g, '-')
    .replace(/\s+/g, '-')
  const storySlug = storyName
    .replace(/([a-z0-9])([A-Z])/g, '$1-$2')
    .replace(/([A-Z]+)([A-Z][a-z])/g, '$1-$2')
    .toLowerCase()
  return `${titleSlug}--${storySlug}`
}
