import type { TopMiningRatingCard } from './types'

function hasCyrillic(text: string): boolean {
  return /[а-яА-ЯёЁ]/.test(text)
}

function needsTextFix(text: string): boolean {
  return text.length > 0 && !hasCyrillic(text)
}

function buildFallbackMaps(cards: TopMiningRatingCard[]) {
  const itemsByCardId = new Map<
    string,
    Map<string, TopMiningRatingCard['items'][number]>
  >()
  const titlesByCardId = new Map<string, string>()

  for (const card of cards) {
    titlesByCardId.set(card.id, card.title)
    itemsByCardId.set(
      card.id,
      new Map(card.items.map((item) => [item.number, item])),
    )
  }

  return { itemsByCardId, titlesByCardId }
}

export function mergeRatingsWithFallback(
  cards: TopMiningRatingCard[],
  fallbackCards: TopMiningRatingCard[],
): TopMiningRatingCard[] {
  const { itemsByCardId, titlesByCardId } = buildFallbackMaps(fallbackCards)

  return cards.map((card) => {
    const fallbackItems = itemsByCardId.get(card.id)
    const fallbackTitle = titlesByCardId.get(card.id)

    return {
      ...card,
      title:
        fallbackTitle && needsTextFix(card.title) ? fallbackTitle : card.title,
      items: card.items.map((item) => {
        const fallbackItem = fallbackItems?.get(item.number)

        if (!fallbackItem) {
          return item
        }

        return {
          ...item,
          label: needsTextFix(item.label) ? fallbackItem.label : item.label,
          href: item.href || fallbackItem.href,
        }
      }),
    }
  })
}
