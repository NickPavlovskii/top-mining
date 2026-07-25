package articles

import (
	"encoding/json"
	"fmt"
	"html"
	"strings"
)

// AssembleContentFromBlocks собирает упрощённый HTML из блоков.
// Это слой представления, не доступа к БД: text экранируется,
// html из payload считается доверенным (санитизация — при сохранении).
func AssembleContentFromBlocks(blocks []Block) string {
	var b strings.Builder
	for _, block := range blocks {
		switch block.Type {
		case "html", "paragraph":
			var payload struct {
				HTML string `json:"html"`
				Text string `json:"text"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err != nil {
				continue
			}
			if payload.HTML != "" {
				b.WriteString(payload.HTML)
				b.WriteByte('\n')
			} else if payload.Text != "" {
				b.WriteString(html.EscapeString(payload.Text))
				b.WriteByte('\n')
			}
		case "heading":
			var payload struct {
				Level int    `json:"level"`
				Text  string `json:"text"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err != nil || payload.Text == "" {
				continue
			}
			level := payload.Level
			if level < 2 {
				level = 2
			}
			if level > 4 {
				level = 4
			}
			fmt.Fprintf(&b, "<h%d>%s</h%d>\n", level, html.EscapeString(payload.Text), level)
		}
	}
	return strings.TrimSpace(b.String())
}
