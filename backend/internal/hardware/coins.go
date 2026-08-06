package hardware

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/jackc/pgx/v5/pgxpool"
)

const coinsQuery = `
SELECT
    CASE
        WHEN hc.slug = 'alph-gpu' THEN 'ALPH-GPU'
        ELSE hc.ticker
    END AS id,
    hc.ticker AS symbol,
    hc.title AS name,
    a.title AS algorithm,
    COALESCE(ms.difficulty, 0)::float8 AS difficulty,
    COALESCE(ms.block_reward, 0)::float8 AS block_reward,
    COALESCE(ms.price_usdt, 0)::float8 AS price_usdt,
    COALESCE(ms.network_hashrate, hc.net_hash, 0)::float8 AS net_hash,
    COALESCE(hc.stepen, '0') AS stepen,
    COALESCE(hc.dual_coin, FALSE) AS dual_coin,
    COALESCE(hc.icon_url, '') AS icon_url,
    hc.sort_order AS sort_order,
    hc.scope AS scope
FROM hardware_coins hc
JOIN hardware_algorithms a
    ON a.id = hc.algorithm_id AND a.is_active = TRUE
LEFT JOIN market_stats ms
    ON ms.coin_id = hc.id
WHERE hc.is_active = TRUE
  AND hc.scope IN ('asic', 'gpu')
ORDER BY hc.scope, hc.sort_order, hc.title;
`

const gpuAlgorithmsQuery = `
SELECT value_json
FROM calculator_settings
WHERE key = 'gpu_algorithms'
LIMIT 1;
`

const usdtRubQuery = `
SELECT COALESCE(
    (SELECT rate::float8 FROM fx_rates WHERE pair = 'USDT-RUB' LIMIT 1),
    (SELECT (value_json->>'usdt_rub')::float8
     FROM calculator_settings
     WHERE key = 'defaults'
     LIMIT 1),
    79.2
);
`

func FetchCalculatorCoins(ctx context.Context, pool *pgxpool.Pool) (CoinsCatalog, error) {
	catalog := EmptyCoinsCatalog()

	rows, err := pool.Query(ctx, coinsQuery)
	if err != nil {
		return EmptyCoinsCatalog(), fmt.Errorf("query calculator coins: %w", err)
	}
	defer rows.Close()

	for rows.Next() {
		var (
			coin  Coin
			scope string
		)
		if err := rows.Scan(
			&coin.ID,
			&coin.Symbol,
			&coin.Name,
			&coin.Algorithm,
			&coin.Difficulty,
			&coin.BlockReward,
			&coin.ExchangeRateUsdt,
			&coin.NetHash,
			&coin.Stepen,
			&coin.DualCoin,
			&coin.IconURL,
			&coin.Sort,
			&scope,
		); err != nil {
			return EmptyCoinsCatalog(), fmt.Errorf("scan calculator coin: %w", err)
		}

		switch scope {
		case "asic":
			catalog.Asic = append(catalog.Asic, coin)
		case "gpu":
			catalog.Gpu = append(catalog.Gpu, coin)
		}
	}

	if err := rows.Err(); err != nil {
		return EmptyCoinsCatalog(), fmt.Errorf("iterate calculator coins: %w", err)
	}

	algorithms, err := fetchGpuAlgorithms(ctx, pool)
	if err != nil {
		return EmptyCoinsCatalog(), err
	}
	catalog.GpuAlgorithms = algorithms

	usdtRub, err := fetchDefaultUsdtRub(ctx, pool)
	if err != nil {
		return EmptyCoinsCatalog(), err
	}
	catalog.DefaultUsdtRub = usdtRub

	return catalog, nil
}

func fetchGpuAlgorithms(ctx context.Context, pool *pgxpool.Pool) ([]string, error) {
	var raw []byte
	err := pool.QueryRow(ctx, gpuAlgorithmsQuery).Scan(&raw)
	if err != nil {
		return []string{}, nil
	}

	var algorithms []string
	if err := json.Unmarshal(raw, &algorithms); err != nil {
		return nil, fmt.Errorf("parse gpu_algorithms: %w", err)
	}
	if algorithms == nil {
		return []string{}, nil
	}
	return algorithms, nil
}

func fetchDefaultUsdtRub(ctx context.Context, pool *pgxpool.Pool) (float64, error) {
	var rate float64
	if err := pool.QueryRow(ctx, usdtRubQuery).Scan(&rate); err != nil {
		return 79.2, nil
	}
	return rate, nil
}
