package articles

import (
	"encoding/json"
	"fmt"

	"github.com/jackc/pgx/v5"
)

func scanBlocks(rows pgx.Rows) ([]Block, error) {
	items := make([]Block, 0, 8)
	for rows.Next() {
		var item Block
		var payload []byte
		if err := rows.Scan(&item.ID, &item.Position, &item.Type, &payload, &item.Anchor); err != nil {
			return nil, fmt.Errorf("scan article block: %w", err)
		}
		item.Payload = json.RawMessage(payload)
		items = append(items, item)
	}
	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate article blocks: %w", err)
	}
	return items, nil
}
