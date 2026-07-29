<template>
  <div :class="cardWrapClass">
    <article
      :id="cardRootId"
      :class="cardRootClass"
    >
      <div class="consulting-management-card__content">
      <div class="consulting-management-card__left">
        <h3 class="consulting-management-card__title">
          {{ card.title }}
        </h3>
      </div>

      <div :class="rightColumnClass">
        <div
          v-if="card.descriptionHtml"
          class="consulting-management-card__description-row"
        >
          <div
            class="consulting-management-card__element"
            v-html="card.descriptionHtml"
          />
        </div>

        <template v-else-if="card.listItems?.length">
          <div
            v-for="(item, index) in primaryListItems"
            :key="`${card.id}-primary-${index}`"
            :class="getPrimaryRowClass(index)"
          >
            <div
              v-if="item.html"
              class="consulting-management-card__element"
              v-html="item.html"
            />
            <div
              v-else
              class="consulting-management-card__element"
            >
              {{ item.text }}
            </div>

            <button
              v-if="isPrimaryToggleRow(index)"
              type="button"
              class="consulting-management-card__toggle"
              @click="isExpanded = true"
            >
              Показать еще
            </button>
          </div>

          <div
            v-show="isExpanded"
            class="consulting-management-card__more-block"
          >
            <div
              v-for="(item, index) in moreListItems"
              :key="`${card.id}-more-${index}`"
              :class="getMoreRowClass(index)"
            >
              <div
                v-if="item.html"
                class="consulting-management-card__element"
                v-html="item.html"
              />
              <div
                v-else
                class="consulting-management-card__element"
              >
                {{ item.text }}
              </div>

              <button
                v-if="isLastMoreRow(index)"
                type="button"
                class="consulting-management-card__toggle"
                @click="isExpanded = false"
              >
                Скрыть
              </button>
            </div>
          </div>
        </template>

        <consulting-management-construction-forms
          v-if="isConstructionCard"
          variant="inline"
        />
      </div>
    </div>

    <consulting-management-price-block
      v-if="isConstructionCard"
      class="consulting-management-card__price consulting-management-card__price--mobile"
      v-bind="priceBlockProps"
    />

      <consulting-management-price-block
        :class="desktopPriceClass"
        v-bind="priceBlockProps"
      />
    </article>

    <consulting-management-construction-forms
      v-if="isConstructionCard"
      variant="mobile"
    />
  </div>
</template>

<script setup lang="ts">
  import type { ConsultingManagementCard } from '~/common/modules/top-mining/consulting-management'
  import ConsultingManagementConstructionForms from '~/components/consulting/ConsultingManagementConstructionForms.vue'
  import ConsultingManagementPriceBlock from '~/components/consulting/ConsultingManagementPriceBlock.vue'

  const props = defineProps<{
    card: ConsultingManagementCard
  }>()

  const isExpanded = ref(false)

  const isConstructionCard = computed(() => props.card.id === 'construction')

  const visibleListCount = computed(
    () => props.card.visibleListCount ?? props.card.listItems?.length ?? 0,
  )

  const listItems = computed(() => props.card.listItems ?? [])

  const hasExpandableList = computed(
    () => listItems.value.length > visibleListCount.value,
  )

  const primaryListItems = computed(() =>
    hasExpandableList.value
      ? listItems.value.slice(0, visibleListCount.value)
      : listItems.value,
  )

  const moreListItems = computed(() =>
    hasExpandableList.value
      ? listItems.value.slice(visibleListCount.value)
      : [],
  )

  const cardRootId = computed(() =>
    isConstructionCard.value ? 'consalt-stroika' : undefined,
  )

  const cardRootClass = computed(() => [
    'consulting-management-card',
    isConstructionCard.value && 'consulting-management-card--construction',
  ])

  const cardWrapClass = computed(() => [
    'consulting-management-card-wrap',
    isConstructionCard.value && 'consulting-management-card-wrap--construction',
  ])

  const rightColumnClass = computed(() => [
    'consulting-management-card__right',
    hasExpandableList.value && 'consulting-management-card__tag-wrap',
    hasExpandableList.value && 'consulting-management-card__tag-wrap--more',
  ])

  const desktopPriceClass = computed(() => [
    'consulting-management-card__price',
    isConstructionCard.value && 'consulting-management-card__price--desktop',
  ])

  const detailsVariant = computed(() =>
    props.card.detailsLabel ? 'trans' as const : undefined,
  )

  const priceBlockProps = computed(() => ({
    priceLabel: props.card.priceLabel,
    priceValue: props.card.priceValue,
    ctaLabel: props.card.ctaLabel,
    ctaHref: props.card.ctaHref,
    detailsLabel: props.card.detailsLabel,
    detailsHref: props.card.detailsHref,
    detailsVariant: detailsVariant.value,
  }))

  function isPrimaryToggleRow(index: number) {
    return hasExpandableList.value
      && !isExpanded.value
      && index === primaryListItems.value.length - 1
  }

  function isLastMoreRow(index: number) {
    return index === moreListItems.value.length - 1
  }

  function getPrimaryRowClass(index: number) {
    return [
      'consulting-management-card__tag-row',
      isPrimaryToggleRow(index) && 'consulting-management-card__tag-row--relative',
    ]
  }

  function getMoreRowClass(index: number) {
    return [
      'consulting-management-card__tag-row',
      isLastMoreRow(index) && 'consulting-management-card__tag-row--relative',
    ]
  }
</script>

<style scoped>
  .consulting-management-card-wrap {
    margin-bottom: 16px;
  }

  .consulting-management-card-wrap:last-child {
    margin-bottom: 0;
  }

  .consulting-management-card-wrap .consulting-management-card {
    margin-bottom: 0;
  }

  .consulting-management-card {
    padding: 64px;
    border-radius: 64px;
    background: #fff;
    box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    color: var(--tm-page-bg);
  }

  .consulting-management-card__content {
    display: flex;
    flex-direction: row;
    gap: 40px;
    justify-content: space-between;
    align-items: flex-start;
  }

  .consulting-management-card--construction .consulting-management-card__left {
    flex: 0 1 535px;
    max-width: 535px;
    padding: 0;
    margin: 0;
  }

  .consulting-management-card--construction .consulting-management-card__right {
    flex: 0 1 974px;
    max-width: 974px;
  }

  .consulting-management-card__left {
    flex: 0 1 535px;
    min-width: 0;
  }

  .consulting-management-card__title {
    margin: 0;
    max-width: 500px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 38px;
    font-weight: 500;
    line-height: 1;
    text-align: left;
    text-transform: uppercase;
  }

  .consulting-management-card__right {
    flex: 1 1 auto;
    max-width: 974px;
    min-width: 0;
  }

  .consulting-management-card__tag-wrap {
    position: relative;
    display: flex;
    flex-direction: column;
    max-width: 974px;
  }

  .consulting-management-card__tag-wrap--more {
    margin-bottom: 20px;
  }

  .consulting-management-card__description-row,
  .consulting-management-card__tag-row {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    padding: 18px 0 20px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  }

  .consulting-management-card__description-row {
    padding-top: 0;
  }

  .consulting-management-card__tag-wrap .consulting-management-card__tag-row:first-child {
    padding-top: 0;
  }

  .consulting-management-card__tag-row--relative {
    position: relative;
  }

  .consulting-management-card__element {
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 20.08px;
  }

  .consulting-management-card__element :deep(b) {
    font-weight: 700;
  }

  .consulting-management-card__toggle {
    position: absolute;
    right: 0;
    bottom: -9px;
    padding: 0 0 0 10px;
    border: 0;
    background: #fff;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 300;
    line-height: 22px;
    text-transform: uppercase;
    cursor: pointer;
  }

  .consulting-management-card__toggle:hover {
    color: var(--tm-page-bg);
  }

  .consulting-management-card__price--mobile {
    display: none;
    width: 100%;
  }

  .consulting-management-card__price--mobile :deep(.consulting-management-price) {
    margin-top: 0;
    width: 100%;
    box-sizing: border-box;
  }

  .consulting-management-card__price--desktop {
    display: block;
    width: 100%;
  }

  @media (max-width: 1400px) {
    .consulting-management-card {
      padding: 40px;
    }

    .consulting-management-card__title {
      max-width: 490px;
      font-size: 32px;
      line-height: 39.68px;
    }

    .consulting-management-card--construction .consulting-management-card__tag-wrap {
      padding: 20px 10px;
      border-radius: 24px;
      background: #fff;
      box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    }

    .consulting-management-card--construction .consulting-management-card__toggle {
      background: #fff;
      bottom: -19px;
    }

    #consalt-stroika.consulting-management-card--construction {
      margin-bottom: 20px;
    }
  }

  @media (max-width: 1299px) {
    .consulting-management-card {
      padding: 20px;
      border-radius: 24px;
    }

    .consulting-management-card__content {
      flex-direction: column;
      gap: 20px;
    }

    .consulting-management-card--construction .consulting-management-card__content {
      flex-direction: row;
      gap: 40px;
    }

    .consulting-management-card__left {
      flex-basis: auto;
      max-width: none;
    }

    .consulting-management-card--construction .consulting-management-card__left {
      flex: 0 1 364px;
      max-width: 364px;
      padding: 0;
      margin: 0;
    }

    .consulting-management-card--construction .consulting-management-card__right {
      flex: 1 1 auto;
      max-width: none;
    }

    .consulting-management-card--construction .consulting-management-card__tag-wrap {
      padding: 20px 10px;
      border-radius: 24px;
      background: #fff;
      box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    }

    .consulting-management-card--construction .consulting-management-card__toggle {
      background: #fff;
    }

    .consulting-management-card__title {
      max-width: none;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .consulting-management-card__element {
      font-size: 14px;
      line-height: 20px;
    }

    .consulting-management-card__toggle {
      position: static;
      margin-top: 10px;
      padding: 0;
      font-size: 12px;
      line-height: 22px;
    }

    .consulting-management-card__tag-row--relative {
      flex-direction: column;
      align-items: flex-start;
    }

    .consulting-management-card__price--mobile {
      display: block;
      margin-top: 20px;
    }

    .consulting-management-card__price--desktop {
      display: none;
    }
  }

  @media (max-width: 767px) {
    .consulting-management-card--construction .consulting-management-card__content {
      flex-direction: column;
      gap: 20px;
    }

    .consulting-management-card--construction .consulting-management-card__left {
      flex: none;
      max-width: none;
    }
  }
</style>
