<template>
  <section
    class="data-center-why"
    aria-labelledby="data-center-why-title"
  >
    <div class="data-center-why__inner">
      <h2
        id="data-center-why-title"
        class="data-center-why__title"
      >
        {{ copy.title }}
      </h2>

      <div class="data-center-why__groups">
        <div class="data-center-why__group">
          <h3 class="data-center-why__group-title">
            {{ copy.rent.title }}
          </h3>

          <div class="data-center-why__blocks">
            <article
              v-for="card in copy.rent.cards"
              :key="card.title"
              class="data-center-why__block"
            >
              <img
                class="data-center-why__icon"
                alt=""
                aria-hidden="true"
                :src="card.icon"
              >
              <h4 class="data-center-why__block-title">
                {{ card.title }}
              </h4>
              <p class="data-center-why__block-text">
                <template
                  v-for="(line, lineIndex) in card.text.split('\n')"
                  :key="`${card.title}-${lineIndex}`"
                >
                  <br v-if="lineIndex > 0">
                  {{ line }}
                </template>
              </p>
            </article>

            <article class="data-center-why__block data-center-why__block--earnings">
              <img
                class="data-center-why__icon"
                alt=""
                aria-hidden="true"
                :src="copy.rent.earnings.icon"
              >
              <h4 class="data-center-why__block-title">
                {{ copy.rent.earnings.title }}
              </h4>

              <top-mining-compare-table
                id="why-earnings"
                :headers="copy.rent.earnings.scenarioLabels"
                :rows="
                  toCompareTableRows(
                    copy.rent.earnings.rowLabels,
                    copy.rent.earnings.columns,
                    { accentLastRow: true },
                  )
                "
                :highlight-column="copy.rent.earnings.highlightColumn"
                :footnote="copy.calcFootnote"
              >
                <template #footer>
                  <data-center-calc-link :href="copy.calculatorHref" />
                </template>
              </top-mining-compare-table>
            </article>
          </div>
        </div>

        <div class="data-center-why__group">
          <h3 class="data-center-why__group-title">
            {{ copy.mine.title }}
          </h3>

          <div class="data-center-why__blocks">
            <article
              v-for="(item, savingIndex) in copy.mine.savings"
              :key="item.title"
              class="data-center-why__block data-center-why__block--compare"
            >
              <img
                class="data-center-why__icon"
                :src="item.icon"
                alt=""
                aria-hidden="true"
              >
              <h4 class="data-center-why__block-title">
                {{ item.title }}
              </h4>

              <top-mining-compare-table
                :id="`why-save-${savingIndex}`"
                :headers="item.headers"
                :rows="item.rows"
              />
            </article>

            <article
              v-for="item in copy.mine.comparisons"
              :key="item.title"
              class="data-center-why__block"
            >
              <img
                class="data-center-why__icon"
                alt=""
                aria-hidden="true"
                :src="item.icon"
              >
              <h4 class="data-center-why__block-title">
                {{ item.title }}
              </h4>

              <div class="data-center-why__compare-scroll">
                <div class="data-center-why__compare">
                  <div
                    v-for="(header, headerIndex) in item.headers"
                    :key="`${item.title}-h-${headerIndex}`"
                    class="data-center-why__compare-card data-center-why__compare-card--top"
                    v-html="header"
                  />

                  <template
                    v-for="rowIndex in maxCompareRows(item.columns)"
                    :key="`${item.title}-row-${rowIndex}`"
                  >
                    <div
                      v-for="(column, columnIndex) in item.columns"
                      :key="`${item.title}-${columnIndex}-${rowIndex}`"
                      class="data-center-why__compare-card"
                    >
                      <template v-if="column[rowIndex - 1]">
                        <b>{{ column[rowIndex - 1]!.title }}</b>
                        <template
                          v-for="(paragraph, paragraphIndex) in column[
                            rowIndex - 1
                          ]!.paragraphs"
                          :key="`${item.title}-p-${columnIndex}-${rowIndex}-${paragraphIndex}`"
                        >
                          <hr v-if="paragraphIndex > 0">
                          <p>{{ paragraph }}</p>
                        </template>
                      </template>
                    </div>
                  </template>
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    DATA_CENTER_CONSTRUCTION_PAGE,
    type DataCenterWhyCompareCell,
  } from '~/common/modules/top-mining/data-center-construction-page'
  import { toCompareTableRows } from '~/common/modules/top-mining/compare-table'
  import DataCenterCalcLink from '~/components/data-center-construction/shared/DataCenterCalcLink.vue'
  import TopMiningCompareTable from '~/components/global/tables/TopMiningCompareTable.vue'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.whyInvest

  function maxCompareRows(
    columns: ReadonlyArray<ReadonlyArray<DataCenterWhyCompareCell>>,
  ): number {
    return Math.max(0, ...columns.map((column) => column.length))
  }
</script>

<style scoped>
  .data-center-why {
    background: #000;
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .data-center-why__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-why__title {
    margin: 0 0 32px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .data-center-why__groups {
    display: flex;
    flex-direction: column;
    gap: 60px;
  }

  .data-center-why__group {
    display: flex;
    flex-direction: column;
    gap: 40px;
    padding: 40px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
  }

  .data-center-why__blocks {
    display: flex;
    flex-direction: column;
    gap: 40px;
  }

  .data-center-why__group-title {
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 26px;
    font-weight: 400;
    line-height: 32px;
    text-transform: uppercase;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .data-center-why__block {
    position: relative;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
    padding: 55px 40px 40px;
    overflow: hidden;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .data-center-why__icon {
    position: absolute;
    top: 40px;
    right: 40px;
    width: 60px;
    height: 60px;
    object-fit: contain;
  }

  .data-center-why__block-title {
    margin: 0 80px 20px 0;
    max-width: 744px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .data-center-why__block--earnings .data-center-why__block-title,
  .data-center-why__block--compare .data-center-why__block-title {
    margin-bottom: 55px;
  }

  .data-center-why__block-text {
    margin: 0;
    max-width: 900px;
    color: #757575;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
    text-transform: uppercase;
  }

  .data-center-why__compare-scroll {
    width: 100%;
    overflow-x: auto;
    padding-bottom: 8px;
  }

  .data-center-why__compare {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    min-width: 560px;
  }

  .data-center-why__compare-card {
    display: flex;
    flex-direction: column;
    gap: 10px;
    box-sizing: border-box;
    width: calc(50% - 5px);
    padding: 15px 20px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 15px;
    color: rgba(255, 255, 255, 0.8);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-why__compare-card--top {
    display: block;
    background: rgba(247, 247, 247, 0.06);
    border-color: rgba(247, 247, 247, 0.06);
  }

  .data-center-why__compare-card b {
    color: #fff;
    font-weight: 700;
  }

  .data-center-why__compare-card p {
    margin: 0;
  }

  .data-center-why__compare-card hr {
    width: 100%;
    margin: 0;
    border: 0;
    border-top: 1px solid rgba(247, 247, 247, 0.06);
  }

  @media (max-width: 1439px) {
    .data-center-why__group {
      gap: 20px;
      padding: 20px;
      border-radius: 25px;
    }

    .data-center-why__blocks {
      gap: 20px;
    }

    .data-center-why__block {
      gap: 20px;
      padding: 30px 20px;
      border-radius: 25px;
    }

    .data-center-why__icon {
      top: 20px;
      right: 20px;
      width: 48px;
      height: 48px;
    }

    .data-center-why__block-title {
      margin-right: 56px;
      margin-bottom: 0;
      font-size: 18px;
      line-height: 26px;
    }

    .data-center-why__block-text {
      font-size: 16px;
      line-height: 24px;
    }

    .data-center-why__group-title {
      font-size: 22px;
      line-height: 34px;
    }
  }

  @media (max-width: 767px) {
    .data-center-why__inner {
      padding: 0 16px;
    }

    .data-center-why__groups {
      gap: 30px;
    }

    .data-center-why__group {
      margin: 0 -6px;
      padding: 30px 10px;
      gap: 20px;
    }

    .data-center-why__blocks {
      gap: 20px;
    }

    .data-center-why__group-title {
      max-width: 220px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-why__block-title {
      max-width: 262px;
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-why__block-text {
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-why__compare-card {
      padding: 10px 12px;
      font-size: 14px;
      line-height: 22px;
    }
  }
</style>
