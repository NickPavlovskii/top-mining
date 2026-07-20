package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/jackc/pgx/v5/pgxpool"

	"niklad/backend/internal/catalog"
	"niklad/backend/internal/envfile"
)

func main() {
	envfile.Load(".env", "../.env")

	migrationsDir := "migrations"
	if _, err := os.Stat(migrationsDir); err != nil {
		migrationsDir = filepath.Join("..", "migrations")
	}

	files, err := filepath.Glob(filepath.Join(migrationsDir, "*.sql"))
	if err != nil {
		log.Fatalf("list migrations: %v", err)
	}

	var toApply []string
	for _, f := range files {
		base := filepath.Base(f)
		if strings.HasPrefix(base, "000_") {
			continue
		}
		if len(base) < 3 || base[0] != '0' {
			continue
		}
		toApply = append(toApply, f)
	}
	sort.Strings(toApply)

	if len(toApply) == 0 {
		log.Fatal("no migration files found")
	}

	ctx := context.Background()
	pool, err := catalog.Connect(ctx)
	if err != nil {
		log.Fatalf("database: %v", err)
	}
	defer pool.Close()

	if _, err := pool.Exec(ctx, `
CREATE TABLE IF NOT EXISTS schema_migrations (
    filename TEXT PRIMARY KEY,
    applied_at TIMESTAMPTZ NOT NULL DEFAULT now()
)`); err != nil {
		log.Fatalf("schema_migrations: %v", err)
	}

	applied, err := loadApplied(ctx, pool)
	if err != nil {
		log.Fatalf("list applied: %v", err)
	}

	if err := bootstrapPartialHistory(ctx, pool, toApply, applied); err != nil {
		log.Fatalf("bootstrap: %v", err)
	}

	n := 0
	for _, path := range toApply {
		base := filepath.Base(path)
		if applied[base] {
			log.Printf("skip %s (already applied)", base)
			continue
		}

		sqlBytes, err := os.ReadFile(path)
		if err != nil {
			log.Fatalf("read %s: %v", base, err)
		}

		sql := stripPSQLMeta(string(sqlBytes))
		log.Printf(">>> %s", base)

		tx, err := pool.Begin(ctx)
		if err != nil {
			log.Fatalf("begin %s: %v", base, err)
		}

		results := tx.Conn().PgConn().Exec(ctx, sql)
		if _, err = results.ReadAll(); err != nil {
			_ = tx.Rollback(ctx)
			log.Fatalf("%s failed: %v", base, err)
		}

		if _, err = tx.Exec(ctx, `INSERT INTO schema_migrations (filename) VALUES ($1)`, base); err != nil {
			_ = tx.Rollback(ctx)
			log.Fatalf("record %s: %v", base, err)
		}
		if err = tx.Commit(ctx); err != nil {
			log.Fatalf("commit %s: %v", base, err)
		}
		log.Printf("ok  %s", base)
		applied[base] = true
		n++
	}

	if n == 0 {
		fmt.Println("migrations up to date")
	} else {
		fmt.Printf("migrations applied: %d\n", n)
	}
}

func loadApplied(ctx context.Context, pool *pgxpool.Pool) (map[string]bool, error) {
	applied := map[string]bool{}
	rows, err := pool.Query(ctx, `SELECT filename FROM schema_migrations`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var name string
		if err := rows.Scan(&name); err != nil {
			return nil, err
		}
		applied[name] = true
	}
	return applied, rows.Err()
}

func bootstrapPartialHistory(ctx context.Context, pool *pgxpool.Pool, toApply []string, applied map[string]bool) error {
	if len(applied) > 0 {
		return nil
	}

	var hasOrgs bool
	err := pool.QueryRow(ctx, `
SELECT EXISTS (
  SELECT 1 FROM information_schema.tables
  WHERE table_schema = 'public' AND table_name = 'organizations'
)`).Scan(&hasOrgs)
	if err != nil {
		return err
	}
	if !hasOrgs {
		return nil
	}

	for _, path := range toApply {
		base := filepath.Base(path)
		if base >= "005_" {
			break
		}
		if _, err := pool.Exec(ctx, `INSERT INTO schema_migrations (filename) VALUES ($1) ON CONFLICT DO NOTHING`, base); err != nil {
			return err
		}
		applied[base] = true
		log.Printf("bootstrap mark %s as applied", base)
	}
	return nil
}

func stripPSQLMeta(sql string) string {
	var b strings.Builder
	for _, line := range strings.Split(sql, "\n") {
		trim := strings.TrimSpace(line)
		if strings.HasPrefix(trim, "\\") {
			continue
		}
		b.WriteString(line)
		b.WriteByte('\n')
	}
	return b.String()
}
