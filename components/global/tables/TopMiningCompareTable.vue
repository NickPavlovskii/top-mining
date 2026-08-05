<template>
  <div :class="['tm-compare-table', `tm-compare-table--cols-${columnCount}`]">
    <div class="tm-compare-table__desktop">
      <div class="tm-compare-table__head">
        <div />
        <div
          v-for="(header, columnIndex) in headers"
          :key="`${tableId}-head-${columnIndex}`"
          :class="[
            'tm-compare-table__head-cell',
            isHighlightedColumn(columnIndex) &&
              'tm-compare-table__head-cell--accent',
          ]"
          v-html="header"
        />
      </div>

      <div class="tm-compare-table__body">
        <div class="tm-compare-table__labels">
          <div
            v-for="(row, rowIndex) in rows"
            :key="`${tableId}-label-${rowIndex}`"
            class="tm-compare-table__cell"
          >
            {{ row.label }}
            <span
              v-if="row.labelDetail"
              class="tm-compare-table__muted"
            >
              {{ ' ' }}{{ row.labelDetail }}
            </span>
          </div>
        </div>

        <div
          v-for="(_, columnIndex) in headers"
          :key="`${tableId}-col-${columnIndex}`"
          :class="[
            'tm-compare-table__col',
            isHighlightedColumn(columnIndex) &&
              'tm-compare-table__col--accent',
          ]"
        >
          <div
            v-for="(row, rowIndex) in rows"
            :key="`${tableId}-${columnIndex}-${rowIndex}`"
            :class="[
              'tm-compare-table__cell',
              isAccentRow(row, rowIndex) && 'tm-compare-table__cell--accent',
            ]"
          >
            <span class="tm-compare-table__desktop-value">
              {{ row.values[columnIndex] }}
            </span>
            <span class="tm-compare-table__mobile-value">
              {{ row.mobileValues?.[columnIndex] ?? row.values[columnIndex] }}
            </span>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="useMobileTabs"
      class="tm-compare-table__mobile"
    >
      <div
        class="tm-compare-table__tabs"
        role="tablist"
      >
        <button
          v-for="(header, columnIndex) in headers"
          :key="`${tableId}-tab-${columnIndex}`"
          type="button"
          role="tab"
          :class="[
            'tm-compare-table__tab',
            activeTab === columnIndex && 'tm-compare-table__tab--active',
            isHighlightedColumn(columnIndex) &&
              'tm-compare-table__tab--accent',
          ]"
          :aria-selected="activeTab === columnIndex"
          @click="activeTab = columnIndex"
          v-html="header"
        />
      </div>

      <div class="tm-compare-table__mobile-table">
        <div class="tm-compare-table__labels">
          <div
            v-for="(row, rowIndex) in rows"
            :key="`${tableId}-m-label-${rowIndex}`"
            class="tm-compare-table__cell"
          >
            {{ row.label }}
            <span
              v-if="row.labelDetail"
              class="tm-compare-table__muted"
            >
              {{ ' ' }}{{ row.labelDetail }}
            </span>
          </div>
        </div>

        <div
          :class="[
            'tm-compare-table__col',
            isHighlightedColumn(activeTab) && 'tm-compare-table__col--accent',
          ]"
        >
          <div
            v-for="(row, rowIndex) in rows"
            :key="`${tableId}-mval-${rowIndex}`"
            :class="[
              'tm-compare-table__cell',
              isAccentRow(row, rowIndex) && 'tm-compare-table__cell--accent',
            ]"
          >
            {{ row.mobileValues?.[activeTab] ?? row.values[activeTab] }}
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="footnote || $slots.footer"
      class="tm-compare-table__footer"
    >
      <p v-if="footnote">
        {{ footnote }}
      </p>
      <slot name="footer" />
    </div>
  </div>
</template>

<script setup lang="ts">
  import type { TopMiningCompareTableProps, TopMiningCompareTableRow } from '~/common/modules/top-mining/ui/compare-table'

  const props = withDefaults(
    defineProps<TopMiningCompareTableProps>(),
    {
      highlightColumn: null,
      accentLastRow: false,
      footnote: '',
      id: 'compare',
    },
  )

  const tableId = computed(() => props.id)
  const columnCount = computed(() => props.headers.length)
  const useMobileTabs = computed(() => columnCount.value >= 3)

  const activeTab = ref(
    props.highlightColumn != null ? props.highlightColumn : 0,
  )

  watch(
    () => props.highlightColumn,
    (value) => {
      if (value != null) {
        activeTab.value = value
      }
    },
  )

  function isHighlightedColumn(columnIndex: number) {
    return (
      props.highlightColumn != null && columnIndex === props.highlightColumn
    )
  }

  function isAccentRow(row: TopMiningCompareTableRow, rowIndex: number) {
    if (row.accent != null) {
      return row.accent
    }
    return props.accentLastRow && rowIndex === props.rows.length - 1
  }
</script>

<style scoped>
  .tm-compare-table {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
  }

  .tm-compare-table__desktop {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
    overflow-x: auto;
  }

  .tm-compare-table__head,
  .tm-compare-table__body {
    display: grid;
    gap: 10px;
    min-width: 560px;
  }

  .tm-compare-table--cols-2 .tm-compare-table__head,
  .tm-compare-table--cols-2 .tm-compare-table__body {
    grid-template-columns: minmax(160px, 1fr) repeat(2, minmax(160px, 1fr));
  }

  .tm-compare-table--cols-3 .tm-compare-table__head,
  .tm-compare-table--cols-3 .tm-compare-table__body {
    grid-template-columns: minmax(180px, 514px) repeat(3, minmax(140px, 341px));
    min-width: 720px;
  }

  .tm-compare-table__head-cell {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 56px;
    padding: 12px 20px;
    border-radius: 15px;
    background: rgba(247, 247, 247, 0.06);
    color: #f6f6f6;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    text-align: center;
  }

  .tm-compare-table__head-cell :deep(b) {
    font-weight: 700;
  }

  .tm-compare-table__head-cell--accent {
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    color: #fff;
  }

  .tm-compare-table__labels {
    padding: 5px 20px;
    border-radius: 20px;
    background: rgba(247, 247, 247, 0.06);
  }

  .tm-compare-table__col {
    padding: 5px 20px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 20px;
  }

  .tm-compare-table__col--accent {
    border-color: #ff741f;
  }

  .tm-compare-table__cell {
    display: flex;
    align-items: center;
    min-height: 48px;
    padding: 10px 0;
    color: #f6f6f6;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    line-height: 24px;
    border-bottom: 1px solid rgba(247, 247, 247, 0.06);
  }

  .tm-compare-table__labels .tm-compare-table__cell {
    color: #757575;
  }

  .tm-compare-table__cell:last-child {
    border-bottom: 0;
  }

  .tm-compare-table__cell--accent {
    font-weight: 600;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .tm-compare-table__muted {
    opacity: 0.7;
  }

  .tm-compare-table__mobile-value {
    display: none;
  }

  .tm-compare-table__mobile {
    display: none;
  }

  .tm-compare-table__footer {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 20px;
    margin-top: 20px;
  }

  .tm-compare-table__footer p {
    margin: 0;
    max-width: 920px;
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 20px;
  }

  @media (max-width: 1439px) {
    .tm-compare-table--cols-3 .tm-compare-table__head,
    .tm-compare-table--cols-3 .tm-compare-table__body {
      grid-template-columns: 192px 151px 151px 151px;
      gap: 5px;
      min-width: 660px;
    }

    .tm-compare-table__head-cell {
      padding: 10px 12px;
      font-size: 14px;
      line-height: 20px;
    }

    .tm-compare-table__cell {
      font-size: 14px;
      line-height: 20px;
    }
  }

  @media (max-width: 1099px) {
    .tm-compare-table--cols-3 .tm-compare-table__desktop {
      display: none;
    }

    .tm-compare-table--cols-3 .tm-compare-table__mobile {
      display: block;
    }

    .tm-compare-table__tabs {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-bottom: 14px;
    }

    .tm-compare-table__tab {
      flex: 1 1 auto;
      padding: 10px 12px;
      border: 1px solid rgba(247, 247, 247, 0.15);
      border-radius: 10px;
      background: transparent;
      color: #757575;
      font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
      font-size: 13px;
      cursor: pointer;
    }

    .tm-compare-table__tab--active {
      color: #fff;
      border-color: #ff741f;
    }

    .tm-compare-table__tab--active.tm-compare-table__tab--accent {
      background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
      border-color: transparent;
      color: #fff;
    }

    .tm-compare-table__mobile-table {
      display: grid;
      grid-template-columns: 1.2fr 1fr;
      gap: 8px;
    }

    .tm-compare-table__labels,
    .tm-compare-table__col {
      min-width: 0;
    }
  }

  @media (max-width: 767px) {
    .tm-compare-table__desktop-value {
      display: none;
    }

    .tm-compare-table__mobile-value {
      display: inline;
    }

    .tm-compare-table__footer {
      flex-direction: column;
      gap: 12px;
    }

    .tm-compare-table__footer p {
      font-size: 10px;
      line-height: 14px;
    }
  }
</style>
