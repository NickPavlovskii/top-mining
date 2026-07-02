export type DesignTokenSwatch = {
  token: string
  hex: string
  note?: string
  gradient?: string
}

export type DesignTokenGroup = {
  id: string
  title: string
  swatches: DesignTokenSwatch[]
}
