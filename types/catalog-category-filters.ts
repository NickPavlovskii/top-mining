export interface CatalogSidebarFilterOption {
  id: string
  label: string
  children?: CatalogSidebarFilterOption[]
}

export interface CatalogSidebarFilterGroup {
  id: string
  title: string
  searchable?: boolean
  options: CatalogSidebarFilterOption[]
}
