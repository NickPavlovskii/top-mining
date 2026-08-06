package podbor

type PlacementOffer struct {
	ID            string `json:"id"`
	Title         string `json:"title"`
	CapacityTitle string `json:"capacityTitle"`
	PriceLabel    string `json:"priceLabel"`
	PriceValue    string `json:"priceValue"`
	Location      string `json:"location"`
	Image         string `json:"image"`
}
