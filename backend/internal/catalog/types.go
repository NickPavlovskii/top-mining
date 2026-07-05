package catalog

type OrganizationVerification struct {
  Contracts bool `json:"contracts"`
  LegalEntity bool `json:"legalEntity"`
  MiningRegistry bool `json:"miningRegistry,omitempty"`
}

// Organization — компания в каталоге.
type Organization struct {
  ID int `json:"id"`
  Name string `json:"name"`
  Slug string `json:"slug,omitempty"`
  LogoURL string `json:"logoUrl"`
  Description string `json:"description"`
  Rating float64 `json:"rating"`
  ReviewCount int `json:"reviewCount"`
  Href string `json:"href,omitempty"`
  FoundedYear *int `json:"foundedYear,omitempty"`
  HasPublicRating bool `json:"hasPublicRating"`
  Verification *OrganizationVerification `json:"verification,omitempty"`
  CardTags []string `json:"cardTags,omitempty"`
  CardFeatures []string `json:"cardFeatures,omitempty"`
  OfficeCity string `json:"officeCity,omitempty"`
  SiteCity string `json:"siteCity,omitempty"`
}

// Category — категория каталога с организациями.
type Category struct {
  ID int `json:"id"`
  Name string `json:"name"`
  Slug string `json:"slug"`
  Organizations []Organization `json:"organizations"`
}

// Meta — метаданные блока каталога.
type Meta struct {
  TotalReviews int `json:"totalReviews"`
  Subtitle string `json:"subtitle"`
}

// Data — полный ответ каталога из PostgreSQL.
type Data struct {
  Meta Meta `json:"meta"`
  Categories []Category `json:"categories"`
}
