package catalog

// Organization — компания в каталоге.
type Organization struct {
	ID          int     `json:"id"`
	Name        string  `json:"name"`
	LogoURL     string  `json:"logoUrl"`
	Description string  `json:"description"`
	Rating      float64 `json:"rating"`
	ReviewCount int     `json:"reviewCount"`
}

// Category — категория каталога с организациями.
type Category struct {
	ID            int            `json:"id"`
	Name          string         `json:"name"`
	Slug          string         `json:"slug"`
	Organizations []Organization `json:"organizations"`
}

// Meta — метаданные блока каталога.
type Meta struct {
	TotalReviews int    `json:"totalReviews"`
	Subtitle     string `json:"subtitle"`
}

// Data — полный ответ каталога из PostgreSQL.
type Data struct {
	Meta       Meta       `json:"meta"`
	Categories []Category `json:"categories"`
}
