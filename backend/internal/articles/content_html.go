package articles

import (
	"encoding/json"
	"fmt"
	"html"
	"strings"
)

func AssembleContentFromBlocks(blocks []Block) string {
	var b strings.Builder
	for _, block := range blocks {
		switch block.Type {
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
			fmt.Fprintf(&b, "\n\n<h%d>%s</h%d>\n\n", level, html.EscapeString(payload.Text), level)
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
				b.WriteString("\n\n")
			} else if payload.Text != "" {
				b.WriteString(html.EscapeString(payload.Text))
				b.WriteString("\n\n")
			}
		}
	}
	return strings.TrimSpace(b.String())
}
