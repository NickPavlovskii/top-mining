package organizations

import (
	"context"
	"strings"
	"time"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

func FetchBySlug(ctx context.Context, pool *pgxpool.Pool, slug string) (*Detail, error) {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return nil, pgx.ErrNoRows
	}

  var detail Detail
  var foundedYear *int

  err := pool.QueryRow(ctx, `
		SELECT
			o.id,
			o.slug,
			o.name,
			c.slug,
			c.name,
			o.tagline,
			o.page_title,
			o.logo_url,
			o.about_html,
			o.rating,
			o.review_count,
			o.has_public_rating,
			o.founded_year,
			o.website,
			o.email,
			o.work_hours,
			o.verified_contracts,
			o.verified_legal_entity
		FROM catalog_organizations o
		JOIN catalog_categories c ON c.id = o.category_id
		WHERE o.slug = $1 AND o.is_published = TRUE
	`, slug).Scan(
		&detail.ID,
		&detail.Slug,
		&detail.Name,
		&detail.CategorySlug,
		&detail.CategoryName,
		&detail.Tagline,
		&detail.PageTitle,
		&detail.LogoURL,
		&detail.AboutHTML,
		&detail.Rating,
		&detail.ReviewCount,
		&detail.HasPublicRating,
		&foundedYear,
		&detail.Website,
		&detail.Email,
		&detail.WorkHours,
		&detail.Verification.Contracts,
		&detail.Verification.LegalEntity,
	)
	if err != nil {
		return nil, err
	}

	detail.FoundedYear = foundedYear
	detail.Addresses = fetchAddresses(ctx, pool, detail.ID)
	detail.Gallery = fetchGallery(ctx, pool, detail.ID)
	detail.EquipmentSales = fetchEquipmentSales(ctx, pool, detail.ID)
	detail.MiningHotel = fetchMiningHotel(ctx, pool, detail.ID)
	detail.PaymentTerms = fetchPaymentTerms(ctx, pool, detail.ID)
	detail.LegalProfile = fetchLegalProfile(ctx, pool, detail.ID)
	detail.CardTags, detail.CardFeatures = buildCardMeta(detail.EquipmentSales)

	return &detail, nil
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
		SELECT image_url, image_alt
		FROM organization_gallery_images
		WHERE organization_id = $1
		ORDER BY sort_order, id
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
