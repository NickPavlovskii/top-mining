package main

import (
	"context"
	"encoding/json"
	"log"
	"os"

	"niklad/backend/internal/catalog"
	"niklad/backend/internal/envfile"
)

// Утилита для проверки: загружает каталог из PostgreSQL и печатает JSON.
// Запуск: go run ./cmd/fetch
func main() {
	envfile.Load(".env", "../.env")

	ctx := context.Background()

	pool, err := catalog.Connect(ctx)
	if err != nil {
		log.Fatalf("database: %v", err)
	}
	defer pool.Close()

	data, err := catalog.FetchCatalog(ctx, pool)
	if err != nil {
		log.Fatalf("fetch catalog: %v", err)
	}

	encoder := json.NewEncoder(os.Stdout)
	encoder.SetIndent("", "  ")
	if err := encoder.Encode(data); err != nil {
		log.Fatalf("encode json: %v", err)
	}
}
