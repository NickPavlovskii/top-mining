package leads

type CreateInput struct {
	Source  string
	Name    string
	Contact string
	Message string
	Payload []byte
	PagePath string
}

type Lead struct {
	ID        int64  `json:"id"`
	Source    string `json:"source"`
	Name      string `json:"name"`
	Contact   string `json:"contact"`
	Message   string `json:"message"`
	PagePath  string `json:"pagePath"`
	CreatedAt string `json:"createdAt"`
}
