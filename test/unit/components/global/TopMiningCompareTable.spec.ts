import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import {
  toCompareTableRows,
  type TopMiningCompareTableProps,
  type TopMiningCompareTableRow,
} from '~/common/modules/top-mining/compare-table'
import TopMiningCompareTable from '~/components/global/tables/TopMiningCompareTable.vue'

const headers3 = ['A', 'B', 'C'] as const

const rows3 = toCompareTableRows(
  ['Метрика 1', 'Метрика 2', 'Итого'],
  [
    ['10', '20', '30'],
    ['11', '21', '31'],
    ['12', '22', '32'],
  ],
  { accentLastRow: true },
)

const headers2 = [
  'Свой ЦОД',
  'Чужой ЦОД',
] as const

const rows2: TopMiningCompareTableRow[] = [
  {
    label: 'Комиссия',
    labelDetail: 'на вход',
    values: ['0 ₽', '10 000 ₽'],
  },
  {
    label: 'Итого',
    values: ['0 ₽', '14 млн ₽'],
    accent: true,
  },
]

describe('toCompareTableRows', () => {
  it('maps column arrays into rows', () => {
    expect(
      toCompareTableRows(['x', 'y'], [['1', '2'], ['3', '4']]),
    ).toEqual([
      { label: 'x', values: ['1', '3'], accent: false },
      { label: 'y', values: ['2', '4'], accent: false },
    ])
  })

  it('marks last row when accentLastRow is set', () => {
    const rows = toCompareTableRows(['a', 'b'], [['1', '2']], {
      accentLastRow: true,
    })

    expect(rows[0]?.accent).toBe(false)
    expect(rows[1]?.accent).toBe(true)
  })
})

describe('TopMiningCompareTable', () => {
  function mountTable(
    props: Partial<TopMiningCompareTableProps> = {},
    slots: { footer?: string } = {},
  ) {
    return mount(TopMiningCompareTable, {
      props: {
        headers: [...headers3],
        rows: rows3,
        highlightColumn: 1,
        id: 'test-table',
        ...props,
      },
      slots,
    })
  }

  it('renders headers and row labels', () => {
    const wrapper = mountTable()

    expect(wrapper.classes()).toContain('tm-compare-table--cols-3')
    expect(wrapper.text()).toContain('Метрика 1')
    expect(wrapper.text()).toContain('Итого')
    expect(wrapper.findAll('.tm-compare-table__head-cell')).toHaveLength(3)
  })

  it('highlights the selected column', () => {
    const wrapper = mountTable({ highlightColumn: 1 })

    expect(
      wrapper.findAll('.tm-compare-table__head-cell--accent'),
    ).toHaveLength(1)
    expect(wrapper.findAll('.tm-compare-table__col--accent').length).toBeGreaterThan(
      0,
    )
  })

  it('applies accent from row data', () => {
    const wrapper = mountTable({
      headers: [...headers2],
      rows: rows2,
      highlightColumn: null,
    })

    expect(wrapper.classes()).toContain('tm-compare-table--cols-2')
    expect(wrapper.text()).toContain('на вход')
    expect(wrapper.findAll('.tm-compare-table__cell--accent').length).toBeGreaterThan(
      0,
    )
  })

  it('renders footnote and footer slot', () => {
    const wrapper = mountTable(
      { footnote: 'Источник расчётов' },
      { footer: '<a class="calc-stub" href="/calculator/">Калькулятор</a>' },
    )

    expect(wrapper.find('.tm-compare-table__footer').exists()).toBe(true)
    expect(wrapper.text()).toContain('Источник расчётов')
    expect(wrapper.find('.calc-stub').attributes('href')).toBe('/calculator/')
  })

  it('exposes mobile tabs for 3+ columns', () => {
    const wrapper = mountTable()
    const tabs = wrapper.findAll('.tm-compare-table__tab')

    expect(wrapper.find('.tm-compare-table__mobile').exists()).toBe(true)
    expect(tabs).toHaveLength(3)
    expect(tabs[1]?.attributes('aria-selected')).toBe('true')
  })

  it('switches active mobile tab on click', async () => {
    const wrapper = mountTable()
    const tabs = wrapper.findAll('.tm-compare-table__tab')

    await tabs[2]?.trigger('click')

    expect(tabs[2]?.attributes('aria-selected')).toBe('true')
    expect(tabs[1]?.attributes('aria-selected')).toBe('false')
  })

  it('does not render mobile tabs for 2 columns', () => {
    const wrapper = mountTable({
      headers: [...headers2],
      rows: rows2,
      highlightColumn: null,
    })

    expect(wrapper.find('.tm-compare-table__mobile').exists()).toBe(false)
  })
})
