package hardware

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5/pgxpool"
)

const pickerQuery = `
SELECT
    k.slug AS kind_slug,
    v.title AS brand_name,
    hkv.sort_order AS brand_sort,
    hm.slug AS model_slug,
    hm.name AS model_name,
    hm.sort_order AS model_sort,
    a.title AS algorithm,
    hma.hashrate::float8 AS hashrate,
    hma.hashrate_unit AS hashrate_unit,
    hma.power_watts::float8 AS power_watts
FROM hardware_models hm
JOIN hardware_kinds k
    ON k.id = hm.kind_id AND k.is_active = TRUE
JOIN hardware_vendors v
    ON v.id = hm.vendor_id AND v.is_active = TRUE
JOIN hardware_kind_vendors hkv
    ON hkv.kind_id = k.id AND hkv.vendor_id = v.id
JOIN hardware_model_algorithms hma
    ON hma.model_id = hm.id AND hma.is_primary = TRUE
JOIN hardware_algorithms a
    ON a.id = hma.algorithm_id AND a.is_active = TRUE
WHERE hm.is_published = TRUE
  AND k.slug IN ('asic', 'gpu', 'cpu')
ORDER BY k.sort_order, hkv.sort_order, v.title, hm.sort_order, hm.name;
`

type pickerRow struct {
	kindSlug     string
	brandName    string
	brandSort    int
	modelSlug    string
	modelName    string
	modelSort    int
	algorithm    string
	hashrate     float64
	hashrateUnit string
	powerWatts   float64
}

func FetchCalculatorCatalog(ctx context.Context, pool *pgxpool.Pool) (Catalog, error) {
	rows, err := pool.Query(ctx, pickerQuery)
	if err != nil {
		return EmptyCatalog(), fmt.Errorf("query calculator hardware: %w", err)
	}
	defer rows.Close()

	catalog := EmptyCatalog()
	brandIndexByKind := map[string]map[string]int{
		"asic": {},
		"gpu":  {},
		"cpu":  {},
	}

	for rows.Next() {
		var row pickerRow
		if err := rows.Scan(
			&row.kindSlug,
			&row.brandName,
			&row.brandSort,
			&row.modelSlug,
			&row.modelName,
			&row.modelSort,
			&row.algorithm,
			&row.hashrate,
			&row.hashrateUnit,
			&row.powerWatts,
		); err != nil {
			return EmptyCatalog(), fmt.Errorf("scan calculator hardware: %w", err)
		}

		brandsPtr := brandsForKind(&catalog, row.kindSlug)
		if brandsPtr == nil {
			continue
		}

		indexMap := brandIndexByKind[row.kindSlug]
		brandIdx, ok := indexMap[row.brandName]
		if !ok {
			*brandsPtr = append(*brandsPtr, Brand{
				Name:   row.brandName,
				Models: []Model{},
			})
			brandIdx = len(*brandsPtr) - 1
			indexMap[row.brandName] = brandIdx
		}

		(*brandsPtr)[brandIdx].Models = append((*brandsPtr)[brandIdx].Models, Model{
			ID:           row.modelSlug,
			Name:         row.modelName,
			Brand:        row.brandName,
			Algorithm:    row.algorithm,
			Hashrate:     row.hashrate,
			HashrateUnit: row.hashrateUnit,
			PowerW:       row.powerWatts,
			Slug:         row.modelSlug,
		})
	}

	if err := rows.Err(); err != nil {
		return EmptyCatalog(), fmt.Errorf("iterate calculator hardware: %w", err)
	}

	return catalog, nil
}

func brandsForKind(catalog *Catalog, kind string) *[]Brand {
	switch kind {
	case "asic":
		return &catalog.Asic
	case "gpu":
		return &catalog.Gpu
	case "cpu":
		return &catalog.Cpu
	default:
		return nil
	}
}
