package organizations

type Address struct {
  City string `json:"city"`
  AddressLine string `json:"addressLine"`
}

type GalleryImage struct {
  ImageURL string `json:"imageUrl"`
  ImageAlt string `json:"imageAlt"`
}

type EquipmentSales struct {
  EquipmentType string `json:"equipmentType"`
  EquipmentCondition string `json:"equipmentCondition"`
  SalesVolume string `json:"salesVolume"`
  Availability string `json:"availability"`
  Extras []string `json:"extras"`
}

type MiningHotel struct {
  PricePerKwhFrom *float64 `json:"pricePerKwhFrom"`
  PricePerKwhLabel string `json:"pricePerKwhLabel"`
  SitesCount *int `json:"sitesCount"`
  TotalCapacityMw *float64 `json:"totalCapacityMw"`
  SiteCities string `json:"siteCities"`
  MinDevicesLabel string `json:"minDevicesLabel"`
  EnergyType string `json:"energyType"`
}

type PaymentTerms struct {
  PaymentMethods []string `json:"paymentMethods"`
  PaymentFormats []string `json:"paymentFormats"`
  ExtraTerms []string `json:"extraTerms"`
  ContractForms []string `json:"contractForms"`
}

type LegalProfile struct {
  LegalName string `json:"legalName"`
  PrimaryActivity string `json:"primaryActivity"`
  OGRN string `json:"ogrn"`
  INN string `json:"inn"`
  RegisteredAt *string `json:"registeredAt"`
  LegalAddress string `json:"legalAddress"`
  AuthorizedCapital string `json:"authorizedCapital"`
  Reliability string `json:"reliability"`
  DefendantCases string `json:"defendantCases"`
  Revenue string `json:"revenue"`
  Profit string `json:"profit"`
  TaxDebt string `json:"taxDebt"`
  InSanctionsLists string `json:"inSanctionsLists"`
  SanctionsRestrictions string `json:"sanctionsRestrictions"`
}

type Verification struct {
  Contracts bool `json:"contracts"`
  LegalEntity bool `json:"legalEntity"`
}

type Detail struct {
  ID int `json:"id"`
  Slug string `json:"slug"`
  Name string `json:"name"`
  CategorySlug string `json:"categorySlug"`
  CategoryName string `json:"categoryName"`
  Tagline string `json:"tagline"`
  PageTitle string `json:"pageTitle"`
  LogoURL string `json:"logoUrl"`
  DetailLogoURL string `json:"detailLogoUrl"`
  AboutHTML string `json:"aboutHtml"`
  Rating float64 `json:"rating"`
  ReviewCount int `json:"reviewCount"`
  HasPublicRating bool `json:"hasPublicRating"`
  FoundedYear *int `json:"foundedYear"`
  Website string `json:"website"`
  Phone string `json:"phone"`
  Email string `json:"email"`
  WorkHours string `json:"workHours"`
  Verification Verification `json:"verification"`
  Addresses []Address `json:"addresses"`
  Gallery []GalleryImage `json:"gallery"`
  EquipmentSales *EquipmentSales `json:"equipmentSales"`
  MiningHotel *MiningHotel `json:"miningHotel"`
  PaymentTerms *PaymentTerms `json:"paymentTerms"`
  LegalProfile *LegalProfile `json:"legalProfile"`
  CardTags []string `json:"cardTags"`
  CardFeatures []string `json:"cardFeatures"`
  ShowGallery bool `json:"showGallery"`
  ShowArticleBlock bool `json:"showArticleBlock"`
}
