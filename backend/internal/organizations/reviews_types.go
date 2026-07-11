package organizations

import "time"

type Review struct {
	ID            int       `json:"id"`
	AuthorName    string    `json:"authorName"`
	Rating        int       `json:"rating"`
	Content       string    `json:"content"`
	Source        string    `json:"source"`
	LikesCount    int       `json:"likesCount"`
	DislikesCount int       `json:"dislikesCount"`
	PublishedAt   time.Time `json:"publishedAt"`
}

type ReviewStats struct {
	Rating          float64 `json:"rating"`
	ReviewCount     int     `json:"reviewCount"`
	HasPublicRating bool    `json:"hasPublicRating"`
}

type CreateReviewInput struct {
	OrganizationSlug string
	AuthorName       string
	AuthorEmail      string
	AuthorPhone      string
	Rating           int
	Content          string
}

type CreateReviewResult struct {
	Review Review      `json:"review"`
	Stats  ReviewStats `json:"stats"`
}
