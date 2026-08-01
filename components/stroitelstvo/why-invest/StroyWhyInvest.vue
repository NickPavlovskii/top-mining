<template>
  <section
    class="stroy-why"
    aria-labelledby="stroy-why-title"
  >
    <div class="stroy-why__inner">
      <h2
        id="stroy-why-title"
        class="stroy-why__title"
      >
        {{ copy.title }}
      </h2>

      <div class="stroy-why__groups">
        <div class="stroy-why__group">
          <h3 class="stroy-why__group-title">
            {{ copy.rent.title }}
          </h3>

          <div class="stroy-why__blocks">
            <article
              v-for="card in copy.rent.cards"
              :key="card.title"
              class="stroy-why__block"
            >
              <img
                class="stroy-why__icon"
                alt=""
                aria-hidden="true"
                :src="card.icon"
              >
              <h4 class="stroy-why__block-title">
                {{ card.title }}
              </h4>
              <p class="stroy-why__block-text">
                <template
                  v-for="(line, lineIndex) in card.text.split('\n')"
                  :key="`${card.title}-${lineIndex}`"
                >
                  <br v-if="lineIndex > 0">
                  {{ line }}
                </template>
              </p>
            </article>

            <article class="stroy-why__block stroy-why__block--earnings">
              <img
                class="stroy-why__icon"
                alt=""
                aria-hidden="true"
                :src="copy.rent.earnings.icon"
              >
              <h4 class="stroy-why__block-title">
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
                  <stroy-calc-link :href="copy.calculatorHref" />
                </template>
              </top-mining-compare-table>
            </article>
          </div>
        </div>

        <div class="stroy-why__group">
          <h3 class="stroy-why__group-title">
            {{ copy.mine.title }}
          </h3>

          <div class="stroy-why__blocks">
            <article
              v-for="(item, savingIndex) in copy.mine.savings"
              :key="item.title"
              class="stroy-why__block stroy-why__block--compare"
            >
              <img
                class="stroy-why__icon"
                :src="item.icon"
                alt=""
                aria-hidden="true"
              >
              <h4 class="stroy-why__block-title">
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
              class="stroy-why__block"
            >
              <img
                class="stroy-why__icon"
                alt=""
                aria-hidden="true"
                :src="item.icon"
              >
              <h4 class="stroy-why__block-title">
                {{ item.title }}
              </h4>

              <div class="stroy-why__compare-scroll">
                <div class="stroy-why__compare">
                  <div
                    v-for="(header, headerIndex) in item.headers"
                    :key="`${item.title}-h-${headerIndex}`"
                    class="stroy-why__compare-card stroy-why__compare-card--top"
                    v-html="header"
                  />

                  <template
                    v-for="rowIndex in maxCompareRows(item.columns)"
                    :key="`${item.title}-row-${rowIndex}`"
                  >
                    <div
                      v-for="(column, columnIndex) in item.columns"
                      :key="`${item.title}-${columnIndex}-${rowIndex}`"
                      class="stroy-why__compare-card"
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
    STROITELSTVO_DATA_CZENTROV_PAGE,
    type StroyWhyCompareCell,
  } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import { toCompareTableRows } from '~/common/modules/top-mining/compare-table'
  import StroyCalcLink from '~/components/stroitelstvo/shared/StroyCalcLink.vue'
  import TopMiningCompareTable from '~/components/global/tables/TopMiningCompareTable.vue'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.whyInvest

  function maxCompareRows(
    columns: ReadonlyArray<ReadonlyArray<StroyWhyCompareCell>>,
  ): number {
    return Math.max(0, ...columns.map((column) => column.length))
  }
</script>

<style scoped>
  .stroy-why {
    background: #000;
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .stroy-why__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .stroy-why__title {
    margin: 0 0 32px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .stroy-why__groups {
    display: flex;
    flex-direction: column;
    gap: 60px;
  }

  .stroy-why__group {
    display: flex;
    flex-direction: column;
    gap: 40px;
    padding: 40px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
  }

  .stroy-why__blocks {
    display: flex;
    flex-direction: column;
    gap: 40px;
  }

  .stroy-why__group-title {
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

  .stroy-why__block {
    position: relative;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
    padding: 55px 40px 40px;
    overflow: hidden;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .stroy-why__icon {
    position: absolute;
    top: 40px;
    right: 40px;
    width: 60px;
    height: 60px;
    object-fit: contain;
  }

  .stroy-why__block-title {
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

  .stroy-why__block--earnings .stroy-why__block-title,
  .stroy-why__block--compare .stroy-why__block-title {
    margin-bottom: 55px;
  }

  .stroy-why__block-text {
    margin: 0;
    max-width: 900px;
    color: #757575;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
    text-transform: uppercase;
  }

  .stroy-why__compare-scroll {
    width: 100%;
    overflow-x: auto;
    padding-bottom: 8px;
  }

  .stroy-why__compare {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    min-width: 560px;
  }

  .stroy-why__compare-card {
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

  .stroy-why__compare-card--top {
    display: block;
    background: rgba(247, 247, 247, 0.06);
    border-color: rgba(247, 247, 247, 0.06);
  }

  .stroy-why__compare-card b {
    color: #fff;
    font-weight: 700;
  }

  .stroy-why__compare-card p {
    margin: 0;
  }

  .stroy-why__compare-card hr {
    width: 100%;
    margin: 0;
    border: 0;
    border-top: 1px solid rgba(247, 247, 247, 0.06);
  }

  @media (max-width: 1439px) {
    .stroy-why__group {
      gap: 20px;
      padding: 20px;
      border-radius: 25px;
    }

    .stroy-why__blocks {
      gap: 20px;
    }

    .stroy-why__block {
      gap: 20px;
      padding: 30px 20px;
      border-radius: 25px;
    }

    .stroy-why__icon {
      top: 20px;
      right: 20px;
      width: 48px;
      height: 48px;
    }

    .stroy-why__block-title {
      margin-right: 56px;
      margin-bottom: 0;
      font-size: 18px;
      line-height: 26px;
    }

    .stroy-why__block-text {
      font-size: 16px;
      line-height: 24px;
    }

    .stroy-why__group-title {
      font-size: 22px;
      line-height: 34px;
    }
  }

  @media (max-width: 767px) {
    .stroy-why__inner {
      padding: 0 16px;
    }

    .stroy-why__groups {
      gap: 30px;
    }

    .stroy-why__group {
      margin: 0 -6px;
      padding: 30px 10px;
      gap: 20px;
    }

    .stroy-why__blocks {
      gap: 20px;
    }

    .stroy-why__group-title {
      max-width: 220px;
      font-size: 14px;
      line-height: 20px;
    }

    .stroy-why__block-title {
      max-width: 262px;
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 20px;
    }

    .stroy-why__block-text {
      font-size: 14px;
      line-height: 20px;
    }

    .stroy-why__compare-card {
      padding: 10px 12px;
      font-size: 14px;
      line-height: 22px;
    }
  }
</style>
