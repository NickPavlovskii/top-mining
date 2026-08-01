export type TopMiningCompareTableRow = {
  label: string
  labelDetail?: string
  values: readonly string[]
  mobileValues?: readonly string[]
  /** Оранжевая подсветка значений в этой строке */
  accent?: boolean
}

export type ToCompareTableRowsOptions = {
  accentLastRow?: boolean
}

export type TopMiningCompareTableProps = {
  headers: readonly string[]
  rows: readonly TopMiningCompareTableRow[]
  highlightColumn?: number | null
  accentLastRow?: boolean
  footnote?: string
  id?: string
}

/** Преобразует колоночный формат (labels + columns) в rows для TopMiningCompareTable */
export function toCompareTableRows(
  rowLabels: readonly string[],
  columns: readonly (readonly string[])[],
  options?: ToCompareTableRowsOptions,
): TopMiningCompareTableRow[] {
  const accentLastRow = options?.accentLastRow ?? false
  return rowLabels.map((label, rowIndex) => ({
    label,
    values: columns.map((column) => column[rowIndex] ?? ''),
    accent: accentLastRow && rowIndex === rowLabels.length - 1,
  }))
}
