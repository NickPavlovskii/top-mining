package articles

// Preview — карточка статьи для ленты.
type Preview struct {
	ID             int     `json:"id"`
	Slug           string  `json:"slug"`
	Title          string  `json:"title"`
	Excerpt        string  `json:"excerpt"`
	ImageURL       string  `json:"imageUrl"`
	ImageAlt       string  `json:"imageAlt"`
	TopicID        string  `json:"topicId"`
	ReadingTimeMin *int    `json:"readingTimeMin"`
	PublishedAt    string  `json:"publishedAt"`
	DisplayType    string  `json:"displayType"`
}

// Article — полная статья для отдельной страницы.
type Article struct {
	Preview
	Content string `json:"content"`
}

// Feed — блок статей на главной.
type Feed struct {
	Hero     *Preview  `json:"hero"`
	Featured []Preview `json:"featured"`
	List     []Preview `json:"list"`
	HasMore  bool      `json:"hasMore"`
}
