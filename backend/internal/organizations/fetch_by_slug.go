package organizations

import (
	"context"
	"strings"
	"time"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

// Имена profile_block из catalog_categories (миграция 016).
const (
	ProfileBlockEquipmentSales = "equipment_sales"
	ProfileBlockMiningHotel    = "mining_hotel"
	ProfileBlockMiningPool     = "mining_pool"
	ProfileBlockCryptoExchange = "crypto_exchange"
	ProfileBlockCryptoWallet   = "crypto_wallet"
)

func FetchBySlug(ctx context.Context, pool *pgxpool.Pool, slug string) (*Detail, error) {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return nil, pgx.ErrNoRows
	}

	var detail Detail
	var foundedYear *int
	var domainRegisteredAt *time.Time
	var profileBlock *string
	var cardTags []string
	var cardFeatures []string

	err := pool.QueryRow(ctx, `
		SELECT
			o.id,
			o.slug,
			o.name,
			c.slug,
			c.name,
			c.profile_block,
			o.tagline,
			o.page_title,
			COALESCE(logo_m.path, NULLIF(o.logo_url, ''), ''),
			COALESCE(detail_m.path, NULLIF(o.detail_logo_url, ''), ''),
			o.about_html,
			o.rating,
			o.review_count,
			o.has_public_rating,
			o.founded_year,
			o.website,
			o.phone,
			o.email,
			o.work_hours,
			o.domain_registered_at,
			o.referral_program_url,
			o.referral_promo_text,
			o.verified_contracts,
			o.verified_legal_entity,
			o.verified_data_center,
			o.verified_mining_registry,
			o.show_gallery,
			o.show_article_block,
			COALESCE(o.card_tags, '{}'),
			COALESCE(o.card_features, '{}')
		FROM catalog_organizations o
		JOIN catalog_categories c ON c.id = o.category_id
		LEFT JOIN media_assets logo_m ON logo_m.id = o.logo_media_id
		LEFT JOIN media_assets detail_m ON detail_m.id = o.detail_logo_media_id
		WHERE o.slug = $1 AND o.is_published = TRUE
	`, slug).Scan(
		&detail.ID,
		&detail.Slug,
		&detail.Name,
		&detail.CategorySlug,
		&detail.CategoryName,
		&profileBlock,
		&detail.Tagline,
		&detail.PageTitle,
		&detail.LogoURL,
		&detail.DetailLogoURL,
		&detail.AboutHTML,
		&detail.Rating,
		&detail.ReviewCount,
		&detail.HasPublicRating,
		&foundedYear,
		&detail.Website,
		&detail.Phone,
		&detail.Email,
		&detail.WorkHours,
		&domainRegisteredAt,
		&detail.ReferralProgramURL,
		&detail.ReferralPromoText,
		&detail.Verification.Contracts,
		&detail.Verification.LegalEntity,
		&detail.Verification.DataCenter,
		&detail.Verification.MiningRegistry,
		&detail.ShowGallery,
		&detail.ShowArticleBlock,
		&cardTags,
		&cardFeatures,
	)
	if err != nil {
		return nil, err
	}

	if profileBlock != nil {
		detail.ProfileBlock = *profileBlock
	}

	detail.FoundedYear = foundedYear
	if domainRegisteredAt != nil {
		value := domainRegisteredAt.Format("2006-01-02")
		detail.DomainRegisteredAt = &value
	}

	detail.Addresses = fetchAddresses(ctx, pool, detail.ID)
	detail.Gallery = fetchGallery(ctx, pool, detail.ID)
	detail.PaymentTerms = fetchPaymentTerms(ctx, pool, detail.ID)
	detail.LegalProfile = fetchLegalProfile(ctx, pool, detail.ID)

	loadTypedProfileBlocks(ctx, pool, &detail)

	if len(cardTags) > 0 {
		detail.CardTags = cardTags
	}
	if len(cardFeatures) > 0 {
		detail.CardFeatures = cardFeatures
	}
	if len(detail.CardTags) == 0 && len(detail.CardFeatures) == 0 {
		detail.CardTags, detail.CardFeatures = buildCardMeta(detail.EquipmentSales)
	}

	return &detail, nil
}

// loadTypedProfileBlocks загружает дочерние блоки по profile_block категории.
// Для asic-sales дополнительно подтягивает mining_hotel (часто совмещают продажу и хостинг).
func loadTypedProfileBlocks(ctx context.Context, pool *pgxpool.Pool, detail *Detail) {
	block := detail.ProfileBlock

	switch block {
	case ProfileBlockEquipmentSales:
		detail.EquipmentSales = fetchEquipmentSales(ctx, pool, detail.ID)
		detail.MiningHotel = fetchMiningHotel(ctx, pool, detail.ID)
	case ProfileBlockMiningHotel:
		detail.MiningHotel = fetchMiningHotel(ctx, pool, detail.ID)
	case ProfileBlockMiningPool:
		detail.MiningPool = fetchMiningPool(ctx, pool, detail.ID)
	case ProfileBlockCryptoExchange:
		detail.CryptoExchange = fetchCryptoExchange(ctx, pool, detail.ID)
	case ProfileBlockCryptoWallet:
		detail.CryptoWallet = fetchCryptoWallet(ctx, pool, detail.ID)
	default:
		// Производители / ремонт / без блока — пробуем всё, что есть (без хардкода slug).
		detail.EquipmentSales = fetchEquipmentSales(ctx, pool, detail.ID)
		detail.MiningHotel = fetchMiningHotel(ctx, pool, detail.ID)
		detail.MiningPool = fetchMiningPool(ctx, pool, detail.ID)
		detail.CryptoExchange = fetchCryptoExchange(ctx, pool, detail.ID)
		detail.CryptoWallet = fetchCryptoWallet(ctx, pool, detail.ID)
	}
}

func fetchAddresses(ctx context.Context, pool *pgxpool.Pool, orgID int) []Address {
	rows, err := pool.Query(ctx, `
		SELECT city, address_line
		FROM organization_addresses
		WHERE organization_id = $1
		ORDER BY sort_order, id
	`, orgID)
	if err != nil {
		return nil
	}
	defer rows.Close()

	items := make([]Address, 0, 2)
	for rows.Next() {
		var item Address
		if err := rows.Scan(&item.City, &item.AddressLine); err != nil {
			return items
		}
		items = append(items, item)
	}

	return items
}

func fetchGallery(ctx context.Context, pool *pgxpool.Pool, orgID int) []GalleryImage {
	rows, err := pool.Query(ctx, `
		SELECT
			COALESCE(m.path, NULLIF(g.image_url, ''), ''),
			COALESCE(NULLIF(m.alt, ''), NULLIF(g.image_alt, ''), '')
		FROM organization_gallery_images g
		LEFT JOIN media_assets m ON m.id = g.media_id
		WHERE g.organization_id = $1
		ORDER BY g.sort_order, g.id
	`, orgID)
	if err != nil {
		return nil
	}
	defer rows.Close()

	items := make([]GalleryImage, 0, 4)
	for rows.Next() {
		var item GalleryImage
		if err := rows.Scan(&item.ImageURL, &item.ImageAlt); err != nil {
			return items
		}
		items = append(items, item)
	}

	return items
}

func fetchEquipmentSales(ctx context.Context, pool *pgxpool.Pool, orgID int) *EquipmentSales {
	var item EquipmentSales
	err := pool.QueryRow(ctx, `
		SELECT equipment_type, equipment_condition, sales_volume, availability, extras
		FROM organization_equipment_sales
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.EquipmentType,
		&item.EquipmentCondition,
		&item.SalesVolume,
		&item.Availability,
		&item.Extras,
	)
	if err != nil {
		return nil
	}

	return &item
}

func fetchMiningHotel(ctx context.Context, pool *pgxpool.Pool, orgID int) *MiningHotel {
	var item MiningHotel
	err := pool.QueryRow(ctx, `
		SELECT price_per_kwh_from, price_per_kwh_label, sites_count,
		       total_capacity_mw, site_cities, min_devices_label, energy_type
		FROM organization_mining_hotels
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.PricePerKwhFrom,
		&item.PricePerKwhLabel,
		&item.SitesCount,
		&item.TotalCapacityMw,
		&item.SiteCities,
		&item.MinDevicesLabel,
		&item.EnergyType,
	)
	if err != nil {
		return nil
	}

	return &item
}

func fetchMiningPool(ctx context.Context, pool *pgxpool.Pool, orgID int) *MiningPool {
	var item MiningPool
	err := pool.QueryRow(ctx, `
		SELECT mobile_app, referral_program, total_hashrate, reward_distribution,
		       pool_commission, min_payout, payout_frequency, mined_coins
		FROM organization_mining_pools
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.MobileApp,
		&item.ReferralProgram,
		&item.TotalHashrate,
		&item.RewardDistribution,
		&item.PoolCommission,
		&item.MinPayout,
		&item.PayoutFrequency,
		&item.MinedCoins,
	)
	if err != nil {
		return nil
	}

	return &item
}

func fetchCryptoExchange(ctx context.Context, pool *pgxpool.Pool, orgID int) *CryptoExchange {
	var item CryptoExchange
	err := pool.QueryRow(ctx, `
		SELECT trading_pairs_label, coins_count_label, verification_type,
		       liquidity_coefficient, spot_markets, supported_currencies,
		       maker_fee, taker_fee, derivative_markets, extras
		FROM organization_crypto_exchanges
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.TradingPairsLabel,
		&item.CoinsCountLabel,
		&item.VerificationType,
		&item.LiquidityCoefficient,
		&item.SpotMarkets,
		&item.SupportedCurrencies,
		&item.MakerFee,
		&item.TakerFee,
		&item.DerivativeMarkets,
		&item.Extras,
	)
	if err != nil {
		return nil
	}

	return &item
}

func fetchCryptoWallet(ctx context.Context, pool *pgxpool.Pool, orgID int) *CryptoWallet {
	var item CryptoWallet
	err := pool.QueryRow(ctx, `
		SELECT supported_coins, platform, commission, commission_calculation, extras
		FROM organization_crypto_wallets
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.SupportedCoins,
		&item.Platform,
		&item.Commission,
		&item.CommissionCalculation,
		&item.Extras,
	)
	if err != nil {
		return nil
	}

	if item.Extras == nil {
		item.Extras = []string{}
	}

	return &item
}

func fetchPaymentTerms(ctx context.Context, pool *pgxpool.Pool, orgID int) *PaymentTerms {
	var item PaymentTerms
	err := pool.QueryRow(ctx, `
		SELECT payment_methods, payment_formats, extra_terms, contract_forms
		FROM organization_payment_terms
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.PaymentMethods,
		&item.PaymentFormats,
		&item.ExtraTerms,
		&item.ContractForms,
	)
	if err != nil {
		return nil
	}

	if item.PaymentMethods == nil {
		item.PaymentMethods = []string{}
	}
	if item.PaymentFormats == nil {
		item.PaymentFormats = []string{}
	}
	if item.ExtraTerms == nil {
		item.ExtraTerms = []string{}
	}
	if item.ContractForms == nil {
		item.ContractForms = []string{}
	}

	return &item
}

func fetchLegalProfile(ctx context.Context, pool *pgxpool.Pool, orgID int) *LegalProfile {
	var item LegalProfile
	var registeredAt *time.Time
	err := pool.QueryRow(ctx, `
		SELECT legal_name, primary_activity, ogrn, inn, registered_at,
		       legal_address, authorized_capital, reliability,
		       defendant_cases, revenue, profit, tax_debt,
		       in_sanctions_lists, sanctions_restrictions
		FROM organization_legal_profiles
		WHERE organization_id = $1
	`, orgID).Scan(
		&item.LegalName,
		&item.PrimaryActivity,
		&item.OGRN,
		&item.INN,
		&registeredAt,
		&item.LegalAddress,
		&item.AuthorizedCapital,
		&item.Reliability,
		&item.DefendantCases,
		&item.Revenue,
		&item.Profit,
		&item.TaxDebt,
		&item.InSanctionsLists,
		&item.SanctionsRestrictions,
	)
	if err != nil {
		return nil
	}

	if registeredAt != nil {
		value := registeredAt.Format("2006-01-02")
		item.RegisteredAt = &value
	}

	return &item
}

func buildCardMeta(sales *EquipmentSales) ([]string, []string) {
	if sales == nil {
		return nil, nil
	}

	tags := []string{
		"Счет на оплату: С НДС",
		"Состояние: " + sales.EquipmentCondition,
		"Объем продаж: " + sales.SalesVolume,
		"Наличие: " + sales.Availability,
	}

	features := make([]string, 0, 3)
	for _, extra := range sales.Extras {
		switch extra {
		case "Напрямую от производителей",
			"Официальный импорт с НДС",
			"При покупке у нас — 0 ₽ за размещение":
			features = append(features, extra)
		}
		if len(features) >= 3 {
			break
		}
	}

	return tags, features
}
