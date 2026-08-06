package hardware

type Model struct {
	ID           string  `json:"id"`
	Name         string  `json:"name"`
	Brand        string  `json:"brand"`
	Algorithm    string  `json:"algorithm"`
	Hashrate     float64 `json:"hashrate"`
	HashrateUnit string  `json:"hashrateUnit"`
	PowerW       float64 `json:"powerW"`
	Slug         string  `json:"slug"`
}

type Brand struct {
	Name   string  `json:"name"`
	Models []Model `json:"models"`
}

type Catalog struct {
	Asic []Brand `json:"asic"`
	Gpu  []Brand `json:"gpu"`
	Cpu  []Brand `json:"cpu"`
}

func EmptyCatalog() Catalog {
	return Catalog{
		Asic: []Brand{},
		Gpu:  []Brand{},
		Cpu:  []Brand{},
	}
}

type Coin struct {
	ID               string  `json:"id"`
	Symbol           string  `json:"symbol"`
	Name             string  `json:"name"`
	Algorithm        string  `json:"algorithm"`
	Difficulty       float64 `json:"difficulty"`
	BlockReward      float64 `json:"blockReward"`
	ExchangeRateUsdt float64 `json:"exchangeRateUsdt"`
	NetHash          float64 `json:"netHash"`
	Stepen           string  `json:"stepen"`
	DualCoin         bool    `json:"dualCoin"`
	IconURL          string  `json:"iconUrl"`
	Sort             int     `json:"sort"`
}

type CoinsCatalog struct {
	Asic           []Coin   `json:"asic"`
	Gpu            []Coin   `json:"gpu"`
	GpuAlgorithms  []string `json:"gpuAlgorithms"`
	DefaultUsdtRub float64  `json:"defaultUsdtRub"`
}

func EmptyCoinsCatalog() CoinsCatalog {
	return CoinsCatalog{
		Asic:           []Coin{},
		Gpu:            []Coin{},
		GpuAlgorithms:  []string{},
		DefaultUsdtRub: 79.2,
	}
}
