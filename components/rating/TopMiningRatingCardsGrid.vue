<template>
  <div
    :class="[
      'rating-cards-grid',
      { 'rating-cards-grid--single': cards.length === 1 },
    ]"
  >
    <article
      v-for="card in cards"
      :id="cardAnchorId(card.id)"
      :key="card.id"
      :class="[
        'rating-cards-grid__card',
        {
          'rating-cards-grid__card--highlighted':
            highlightedCardId === card.id,
        },
      ]"
    >
      <h3 class="rating-cards-grid__card-title">{{ card.title }}</h3>

      <div
        v-if="getCardColumnCount(card) === 2"
        class="rating-cards-grid__columns"
      >
        <ul
          v-for="(columnItems, columnIndex) in getCardColumns(card)"
          :key="`${card.id}-${columnIndex}`"
          class="rating-cards-grid__column"
        >
          <li
            v-for="item in columnItems"
            :key="item.number"
          >
            <NuxtLink
              class="rating-cards-grid__link"
              :to="item.href"
            >
              <span class="rating-cards-grid__num">({{ item.number }})</span>
              <span class="rating-cards-grid__label">{{ item.label }}</span>
            </NuxtLink>
          </li>
        </ul>
      </div>

      <ul
        v-else
        class="rating-cards-grid__list"
      >
        <li
          v-for="item in card.items"
          :key="item.number"
        >
          <NuxtLink
            class="rating-cards-grid__link"
            :to="item.href"
          >
            <span class="rating-cards-grid__num">({{ item.number }})</span>
            <span class="rating-cards-grid__label">{{ item.label }}</span>
          </NuxtLink>
        </li>
      </ul>
    </article>
  </div>
</template>

<script setup lang="ts">
  import {
    DEFAULT_RATING_CARD_COLUMNS,
    type TopMiningRatingCard,
    type TopMiningRatingItem,
  } from '~/types/ratings'

  const props = withDefaults(
    defineProps<{
      cards: TopMiningRatingCard[]
      highlightedCardId?: string | null
      anchorPrefix?: string
    }>(),
    {
      highlightedCardId: null,
      anchorPrefix: '',
    },
  )

  function getCardColumnCount(card: TopMiningRatingCard) {
    return card.columns ?? DEFAULT_RATING_CARD_COLUMNS
  }

  function getCardColumns(card: TopMiningRatingCard): TopMiningRatingItem[][] {
    const columnCount = getCardColumnCount(card)
    const splitAt = Math.ceil(card.items.length / columnCount)

    return [
      card.items.slice(0, splitAt),
      card.items.slice(splitAt),
    ]
  }

  function cardAnchorId(cardId: string) {
    return props.anchorPrefix ? `${props.anchorPrefix}${cardId}` : undefined
  }
</script>

<style scoped>
  .rating-cards-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
  }

  .rating-cards-grid--single {
    grid-template-columns: 1fr;
  }

  .rating-cards-grid__card {
    margin-bottom: 6px;
    padding: 24px;
    border: 1px solid #5c5c5c;
    border-radius: 32px;
    scroll-margin-top: 120px;
    box-sizing: border-box;
  }

  .rating-cards-grid__card--highlighted {
    border-color: rgba(255, 116, 31, 0.65);
    box-shadow: 0 0 0 1px rgba(255, 116, 31, 0.12);
  }

  .rating-cards-grid__card-title {
    margin: 0 0 24px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .rating-cards-grid__columns {
    display: flex;
    gap: 15px;
  }

  .rating-cards-grid__column,
  .rating-cards-grid__list {
    flex: 1;
    min-width: 0;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .rating-cards-grid__column li,
  .rating-cards-grid__list li {
    margin: 0;
    padding: 0;
  }

  .rating-cards-grid__link {
    display: flex;
    align-items: flex-start;
    gap: 0;
    margin-bottom: 16px;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    text-decoration: none;
    transition: color 0.2s ease;
  }

  .rating-cards-grid__num {
    flex: 0 0 34px;
    padding-right: 4px;
    color: #757575;
    font-size: 14px;
    line-height: 20px;
    box-sizing: border-box;
  }

  .rating-cards-grid__label {
    flex: 1 1 auto;
    min-width: 0;
    padding-right: 21px;
  }

  .rating-cards-grid__label::after {
    content: '';
    display: inline-block;
    width: 29px;
    height: 13px;
    margin-right: -29px;
    vertical-align: middle;
  }

  @media (hover: hover) {
    .rating-cards-grid__link:hover,
    .rating-cards-grid__link:hover .rating-cards-grid__num,
    .rating-cards-grid__link:focus-visible,
    .rating-cards-grid__link:focus-visible .rating-cards-grid__num {
      color: #ff741f;
    }

    .rating-cards-grid__link:hover .rating-cards-grid__label::after,
    .rating-cards-grid__link:focus-visible .rating-cards-grid__label::after {
      background: url('https://top-mining.ru/wp-content/themes/top-mining/img/icon-arrow-link.svg')
        right center no-repeat;
    }
  }

  @media (max-width: 1439px) {
    .rating-cards-grid {
      gap: 20px;
    }
  }

  @media (max-width: 1050px) {
    .rating-cards-grid__card {
      margin-bottom: 0;
      padding: 20px 5px 20px 20px;
    }

    .rating-cards-grid__card-title {
      margin-bottom: 20px;
      font-size: 22px;
      line-height: 30px;
    }

    .rating-cards-grid__columns {
      flex-direction: column;
      gap: 0;
    }

    .rating-cards-grid__link {
      font-size: 14px;
      line-height: 24px;
    }

    .rating-cards-grid__num {
      flex-basis: 30px;
      font-size: 12px;
      line-height: 16px;
    }

    .rating-cards-grid__label::after {
      width: 21px;
      height: 13px;
      margin-right: -21px;
      background-size: 13px !important;
      margin-bottom: -3px;
    }
  }

  @media (max-width: 767px) {
    .rating-cards-grid {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .rating-cards-grid__card {
      padding: 20px 5px 20px 10px;
    }
  }
</style>
