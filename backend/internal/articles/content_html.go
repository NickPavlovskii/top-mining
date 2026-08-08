package articles

import (
	"bytes"
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
		case "list", "rich_list", "richList":
			var payload struct {
				Items []json.RawMessage `json:"items"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err != nil {
				continue
			}
			for _, raw := range payload.Items {
				var asString string
				if err := json.Unmarshal(raw, &asString); err == nil && asString != "" {
					b.WriteString("• ")
					b.WriteString(html.EscapeString(asString))
					b.WriteString("\n")
					continue
				}
				var asObj struct {
					Title string `json:"title"`
					Text  string `json:"text"`
				}
				if err := json.Unmarshal(raw, &asObj); err == nil && (asObj.Title != "" || asObj.Text != "") {
					b.WriteString("• ")
					b.WriteString(html.EscapeString(strings.TrimSpace(asObj.Title + " " + asObj.Text)))
					b.WriteString("\n")
				}
			}
			b.WriteString("\n")
		case "image":
			var payload struct {
				Src string `json:"src"`
				Alt string `json:"alt"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err != nil || payload.Src == "" {
				continue
			}
			fmt.Fprintf(
				&b,
				"\n\n<img src=%q alt=%q />\n\n",
				payload.Src,
				html.EscapeString(payload.Alt),
			)
		}
	}
	return strings.TrimSpace(b.String())
}

// BlocksHaveBody — есть ли в блоках текст/списки/картинки, а не только заголовки.
func BlocksHaveBody(blocks []Block) bool {
	for _, block := range blocks {
		switch block.Type {
		case "paragraph", "html", "list", "rich_list", "richList", "image", "stats", "pros_cons", "prosCons":
			if len(bytes.TrimSpace(block.Payload)) > 2 {
				return true
			}
		}
	}
	return false
}
