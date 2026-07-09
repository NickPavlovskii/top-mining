package ratings

type Item struct {
	Number string `json:"number"`
	Label  string `json:"label"`
	Href   string `json:"href"`
}

type Card struct {
	ID      string `json:"id"`
	Title   string `json:"title"`
	Items   []Item `json:"items"`
	Columns int    `json:"columns,omitempty"`
}
