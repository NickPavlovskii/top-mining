package graphql

import (
	"errors"
	"time"

	"github.com/graphql-go/graphql"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"

	"niklad/backend/internal/articles"
	"niklad/backend/internal/catalog"
	"niklad/backend/internal/organizations"
	"niklad/backend/internal/ratings"
)

func BuildSchema(pool *pgxpool.Pool) (graphql.Schema, error) {
	organizationType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Organization",
		Fields: graphql.Fields{
			"id":              &graphql.Field{Type: graphql.Int},
			"name":            &graphql.Field{Type: graphql.String},
			"slug":            &graphql.Field{Type: graphql.String},
			"logoUrl":         &graphql.Field{Type: graphql.String},
			"description":     &graphql.Field{Type: graphql.String},
			"rating":          &graphql.Field{Type: graphql.Float},
			"reviewCount":     &graphql.Field{Type: graphql.Int},
			"href":            &graphql.Field{Type: graphql.String},
			"foundedYear":     &graphql.Field{Type: graphql.Int},
			"hasPublicRating": &graphql.Field{Type: graphql.Boolean},
			"verification": &graphql.Field{
				Type: graphql.NewObject(graphql.ObjectConfig{
					Name: "OrganizationVerification",
					Fields: graphql.Fields{
						"contracts":      &graphql.Field{Type: graphql.Boolean},
						"legalEntity":    &graphql.Field{Type: graphql.Boolean},
						"miningRegistry": &graphql.Field{Type: graphql.Boolean},
					},
				}),
			},
			"cardTags":     &graphql.Field{Type: graphql.NewList(graphql.String)},
			"cardFeatures": &graphql.Field{Type: graphql.NewList(graphql.String)},
			"officeCity":   &graphql.Field{Type: graphql.String},
			"siteCity":     &graphql.Field{Type: graphql.String},
		},
	})

	categoryType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Category",
		Fields: graphql.Fields{
			"id":            &graphql.Field{Type: graphql.Int},
			"name":          &graphql.Field{Type: graphql.String},
			"slug":          &graphql.Field{Type: graphql.String},
			"organizations": &graphql.Field{Type: graphql.NewList(organizationType)},
		},
	})

	metaType := graphql.NewObject(graphql.ObjectConfig{
		Name: "CatalogMeta",
		Fields: graphql.Fields{
			"totalReviews": &graphql.Field{Type: graphql.Int},
			"subtitle":     &graphql.Field{Type: graphql.String},
		},
	})

	catalogType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Catalog",
		Fields: graphql.Fields{
			"meta":       &graphql.Field{Type: metaType},
			"categories": &graphql.Field{Type: graphql.NewList(categoryType)},
		},
	})

	articlePreviewType := graphql.NewObject(graphql.ObjectConfig{
		Name: "ArticlePreview",
		Fields: graphql.Fields{
			"id":              &graphql.Field{Type: graphql.Int},
			"slug":            &graphql.Field{Type: graphql.String},
			"title":           &graphql.Field{Type: graphql.String},
			"excerpt":         &graphql.Field{Type: graphql.String},
			"imageUrl":        &graphql.Field{Type: graphql.String},
			"imageAlt":        &graphql.Field{Type: graphql.String},
			"topicId":         &graphql.Field{Type: graphql.String},
			"readingTimeMin":  &graphql.Field{Type: graphql.Int},
			"publishedAt":     &graphql.Field{Type: graphql.String},
			"displayType":     &graphql.Field{Type: graphql.String},
		},
	})

	articleType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Article",
		Fields: graphql.Fields{
			"id":              &graphql.Field{Type: graphql.Int},
			"slug":            &graphql.Field{Type: graphql.String},
			"title":           &graphql.Field{Type: graphql.String},
			"excerpt":         &graphql.Field{Type: graphql.String},
			"imageUrl":        &graphql.Field{Type: graphql.String},
			"imageAlt":        &graphql.Field{Type: graphql.String},
			"topicId":         &graphql.Field{Type: graphql.String},
			"readingTimeMin":  &graphql.Field{Type: graphql.Int},
			"publishedAt":     &graphql.Field{Type: graphql.String},
			"displayType":     &graphql.Field{Type: graphql.String},
			"content":         &graphql.Field{Type: graphql.String},
		},
	})

	articlesFeedType := graphql.NewObject(graphql.ObjectConfig{
		Name: "ArticlesFeed",
		Fields: graphql.Fields{
			"hero":     &graphql.Field{Type: articlePreviewType},
			"featured": &graphql.Field{Type: graphql.NewList(articlePreviewType)},
			"list":     &graphql.Field{Type: graphql.NewList(articlePreviewType)},
			"hasMore":  &graphql.Field{Type: graphql.Boolean},
		},
	})

	organizationDetailVerificationType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationDetailVerification",
		Fields: graphql.Fields{
			"contracts":   &graphql.Field{Type: graphql.Boolean},
			"legalEntity": &graphql.Field{Type: graphql.Boolean},
		},
	})

	organizationAddressType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationAddress",
		Fields: graphql.Fields{
			"city":        &graphql.Field{Type: graphql.String},
			"addressLine": &graphql.Field{Type: graphql.String},
		},
	})

	organizationGalleryImageType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationGalleryImage",
		Fields: graphql.Fields{
			"imageUrl": &graphql.Field{Type: graphql.String},
			"imageAlt": &graphql.Field{Type: graphql.String},
		},
	})

	organizationEquipmentSalesType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationEquipmentSales",
		Fields: graphql.Fields{
			"equipmentType":      &graphql.Field{Type: graphql.String},
			"equipmentCondition": &graphql.Field{Type: graphql.String},
			"salesVolume":        &graphql.Field{Type: graphql.String},
			"availability":       &graphql.Field{Type: graphql.String},
			"extras":             &graphql.Field{Type: graphql.NewList(graphql.String)},
		},
	})

	organizationMiningHotelType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationMiningHotel",
		Fields: graphql.Fields{
			"pricePerKwhFrom":   &graphql.Field{Type: graphql.Float},
			"pricePerKwhLabel":  &graphql.Field{Type: graphql.String},
			"sitesCount":        &graphql.Field{Type: graphql.Int},
			"totalCapacityMw":   &graphql.Field{Type: graphql.Float},
			"siteCities":        &graphql.Field{Type: graphql.String},
			"minDevicesLabel":   &graphql.Field{Type: graphql.String},
			"energyType":        &graphql.Field{Type: graphql.String},
		},
	})

	organizationPaymentTermsType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationPaymentTerms",
		Fields: graphql.Fields{
			"paymentMethods":  &graphql.Field{Type: graphql.NewList(graphql.String)},
			"paymentFormats":  &graphql.Field{Type: graphql.NewList(graphql.String)},
			"extraTerms":      &graphql.Field{Type: graphql.NewList(graphql.String)},
			"contractForms":   &graphql.Field{Type: graphql.NewList(graphql.String)},
		},
	})

	organizationLegalProfileType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationLegalProfile",
		Fields: graphql.Fields{
			"legalName":             &graphql.Field{Type: graphql.String},
			"primaryActivity":       &graphql.Field{Type: graphql.String},
			"ogrn":                  &graphql.Field{Type: graphql.String},
			"inn":                   &graphql.Field{Type: graphql.String},
			"registeredAt":          &graphql.Field{Type: graphql.String},
			"legalAddress":          &graphql.Field{Type: graphql.String},
			"authorizedCapital":     &graphql.Field{Type: graphql.String},
			"reliability":           &graphql.Field{Type: graphql.String},
			"defendantCases":        &graphql.Field{Type: graphql.String},
			"revenue":               &graphql.Field{Type: graphql.String},
			"profit":                &graphql.Field{Type: graphql.String},
			"taxDebt":               &graphql.Field{Type: graphql.String},
			"inSanctionsLists":      &graphql.Field{Type: graphql.String},
			"sanctionsRestrictions": &graphql.Field{Type: graphql.String},
		},
	})

	organizationReviewType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationReview",
		Fields: graphql.Fields{
			"id":            &graphql.Field{Type: graphql.Int},
			"authorName":    &graphql.Field{Type: graphql.String},
			"rating":        &graphql.Field{Type: graphql.Int},
			"content":       &graphql.Field{Type: graphql.String},
			"source":        &graphql.Field{Type: graphql.String},
			"likesCount":    &graphql.Field{Type: graphql.Int},
			"dislikesCount": &graphql.Field{Type: graphql.Int},
			"publishedAt":   &graphql.Field{Type: graphql.String},
		},
	})

	organizationReviewStatsType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationReviewStats",
		Fields: graphql.Fields{
			"rating":          &graphql.Field{Type: graphql.Float},
			"reviewCount":     &graphql.Field{Type: graphql.Int},
			"hasPublicRating": &graphql.Field{Type: graphql.Boolean},
		},
	})

	organizationReviewsResultType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationReviewsResult",
		Fields: graphql.Fields{
			"reviews": &graphql.Field{Type: graphql.NewList(organizationReviewType)},
			"stats":   &graphql.Field{Type: organizationReviewStatsType},
		},
	})

	createOrganizationReviewResultType := graphql.NewObject(graphql.ObjectConfig{
		Name: "CreateOrganizationReviewResult",
		Fields: graphql.Fields{
			"review": &graphql.Field{Type: organizationReviewType},
			"stats":  &graphql.Field{Type: organizationReviewStatsType},
		},
	})

	organizationDetailType := graphql.NewObject(graphql.ObjectConfig{
		Name: "OrganizationDetail",
		Fields: graphql.Fields{
			"id":              &graphql.Field{Type: graphql.Int},
			"slug":            &graphql.Field{Type: graphql.String},
			"name":            &graphql.Field{Type: graphql.String},
			"categorySlug":    &graphql.Field{Type: graphql.String},
			"categoryName":    &graphql.Field{Type: graphql.String},
			"tagline":         &graphql.Field{Type: graphql.String},
			"pageTitle":       &graphql.Field{Type: graphql.String},
			"logoUrl":         &graphql.Field{Type: graphql.String},
			"detailLogoUrl":   &graphql.Field{Type: graphql.String},
			"aboutHtml":       &graphql.Field{Type: graphql.String},
			"rating":          &graphql.Field{Type: graphql.Float},
			"reviewCount":     &graphql.Field{Type: graphql.Int},
			"hasPublicRating": &graphql.Field{Type: graphql.Boolean},
			"foundedYear":     &graphql.Field{Type: graphql.Int},
			"website":         &graphql.Field{Type: graphql.String},
			"phone":           &graphql.Field{Type: graphql.String},
			"email":           &graphql.Field{Type: graphql.String},
			"workHours":       &graphql.Field{Type: graphql.String},
			"verification":    &graphql.Field{Type: organizationDetailVerificationType},
			"addresses":       &graphql.Field{Type: graphql.NewList(organizationAddressType)},
			"gallery":         &graphql.Field{Type: graphql.NewList(organizationGalleryImageType)},
			"equipmentSales":  &graphql.Field{Type: organizationEquipmentSalesType},
			"miningHotel":     &graphql.Field{Type: organizationMiningHotelType},
			"paymentTerms":    &graphql.Field{Type: organizationPaymentTermsType},
			"legalProfile":    &graphql.Field{Type: organizationLegalProfileType},
			"cardTags":        &graphql.Field{Type: graphql.NewList(graphql.String)},
			"cardFeatures":    &graphql.Field{Type: graphql.NewList(graphql.String)},
			"showGallery":     &graphql.Field{Type: graphql.Boolean},
			"showArticleBlock": &graphql.Field{Type: graphql.Boolean},
		},
	})

	ratingItemType := graphql.NewObject(graphql.ObjectConfig{
		Name: "RatingItem",
		Fields: graphql.Fields{
			"number": &graphql.Field{Type: graphql.String},
			"label":  &graphql.Field{Type: graphql.String},
			"href":   &graphql.Field{Type: graphql.String},
		},
	})

	ratingCardType := graphql.NewObject(graphql.ObjectConfig{
		Name: "RatingCard",
		Fields: graphql.Fields{
			"id":      &graphql.Field{Type: graphql.String},
			"title":   &graphql.Field{Type: graphql.String},
			"columns": &graphql.Field{Type: graphql.Int},
			"items":   &graphql.Field{Type: graphql.NewList(ratingItemType)},
		},
	})

	rootQuery := graphql.NewObject(graphql.ObjectConfig{
		Name: "Query",
		Fields: graphql.Fields{
			"catalog": &graphql.Field{
				Type: catalogType,
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					data, err := catalog.FetchCatalog(params.Context, pool)
					if err != nil {
						return nil, err
					}

					return map[string]interface{}{
						"meta": map[string]interface{}{
							"totalReviews": data.Meta.TotalReviews,
							"subtitle":     data.Meta.Subtitle,
						},
						"categories": toGraphQLCategories(data.Categories),
					}, nil
				},
			},
			"articlesFeed": &graphql.Field{
				Type: articlesFeedType,
				Args: graphql.FieldConfigArgument{
					"topic": &graphql.ArgumentConfig{Type: graphql.String},
				},
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					topic, _ := params.Args["topic"].(string)
					feed, err := articles.FetchFeed(params.Context, pool, topic)
					if err != nil {
						return nil, err
					}

					return toGraphQLArticlesFeed(feed), nil
				},
			},
			"article": &graphql.Field{
				Type: articleType,
				Args: graphql.FieldConfigArgument{
					"slug": &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
				},
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					slug, _ := params.Args["slug"].(string)
					article, err := articles.FetchBySlug(params.Context, pool, slug)
					if errors.Is(err, pgx.ErrNoRows) {
						return nil, nil
					}
					if err != nil {
						return nil, err
					}

					return toGraphQLArticle(article), nil
				},
			},
			"organization": &graphql.Field{
				Type: organizationDetailType,
				Args: graphql.FieldConfigArgument{
					"slug": &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
				},
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					slug, _ := params.Args["slug"].(string)
					detail, err := organizations.FetchBySlug(params.Context, pool, slug)
					if errors.Is(err, pgx.ErrNoRows) {
						return nil, nil
					}
					if err != nil {
						return nil, err
					}

					return toGraphQLOrganizationDetail(detail), nil
				},
			},
			"ratings": &graphql.Field{
				Type: graphql.NewList(ratingCardType),
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					cards, err := ratings.FetchCards(params.Context, pool)
					if err != nil {
						return nil, err
					}

					return toGraphQLRatingCards(cards), nil
				},
			},
			"ratingsHome": &graphql.Field{
				Type: graphql.NewList(ratingCardType),
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					cards, err := ratings.FetchHomeCards(params.Context, pool)
					if err != nil {
						return nil, err
					}

					return toGraphQLRatingCards(cards), nil
				},
			},
			"organizationReviews": &graphql.Field{
				Type: organizationReviewsResultType,
				Args: graphql.FieldConfigArgument{
					"slug": &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
					"sort": &graphql.ArgumentConfig{Type: graphql.String},
				},
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					slug, _ := params.Args["slug"].(string)
					sort, _ := params.Args["sort"].(string)

					reviews, stats, err := organizations.FetchReviews(
						params.Context,
						pool,
						slug,
						sort,
					)
					if errors.Is(err, pgx.ErrNoRows) {
						return nil, nil
					}
					if err != nil {
						return nil, err
					}

					return map[string]interface{}{
						"reviews": toGraphQLOrganizationReviews(reviews),
						"stats":   toGraphQLOrganizationReviewStats(stats),
					}, nil
				},
			},
		},
	})

	rootMutation := graphql.NewObject(graphql.ObjectConfig{
		Name: "Mutation",
		Fields: graphql.Fields{
			"createOrganizationReview": &graphql.Field{
				Type: createOrganizationReviewResultType,
				Args: graphql.FieldConfigArgument{
					"organizationSlug": &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
					"authorName":       &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
					"authorEmail":      &graphql.ArgumentConfig{Type: graphql.String},
					"authorPhone":      &graphql.ArgumentConfig{Type: graphql.String},
					"rating":           &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.Int)},
					"content":          &graphql.ArgumentConfig{Type: graphql.NewNonNull(graphql.String)},
				},
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					organizationSlug, _ := params.Args["organizationSlug"].(string)
					authorName, _ := params.Args["authorName"].(string)
					authorEmail, _ := params.Args["authorEmail"].(string)
					authorPhone, _ := params.Args["authorPhone"].(string)
					rating, _ := params.Args["rating"].(int)
					content, _ := params.Args["content"].(string)

					result, err := organizations.CreateReview(params.Context, pool, organizations.CreateReviewInput{
						OrganizationSlug: organizationSlug,
						AuthorName:       authorName,
						AuthorEmail:      authorEmail,
						AuthorPhone:      authorPhone,
						Rating:           rating,
						Content:          content,
					})
					if err != nil {
						return nil, err
					}

					return map[string]interface{}{
						"review": toGraphQLOrganizationReview(result.Review),
						"stats":  toGraphQLOrganizationReviewStats(result.Stats),
					}, nil
				},
			},
		},
	})

	return graphql.NewSchema(graphql.SchemaConfig{
		Query:    rootQuery,
		Mutation: rootMutation,
	})
}

func toGraphQLCategories(categories []catalog.Category) []map[string]interface{} {
	result := make([]map[string]interface{}, 0, len(categories))

	for _, category := range categories {
		organizations := make([]map[string]interface{}, 0, len(category.Organizations))
		for _, org := range category.Organizations {
			entry := map[string]interface{}{
				"id":              org.ID,
				"name":            org.Name,
				"slug":            org.Slug,
				"logoUrl":         org.LogoURL,
				"description":     org.Description,
				"rating":          org.Rating,
				"reviewCount":     org.ReviewCount,
				"href":            org.Href,
				"hasPublicRating": org.HasPublicRating,
				"cardTags":        org.CardTags,
				"cardFeatures":    org.CardFeatures,
				"officeCity":      org.OfficeCity,
				"siteCity":        org.SiteCity,
			}

			if org.FoundedYear != nil {
				entry["foundedYear"] = *org.FoundedYear
			}

			if org.Verification != nil {
				entry["verification"] = map[string]interface{}{
					"contracts":      org.Verification.Contracts,
					"legalEntity":    org.Verification.LegalEntity,
					"miningRegistry": org.Verification.MiningRegistry,
				}
			}

			organizations = append(organizations, entry)
		}

		result = append(result, map[string]interface{}{
			"id":            category.ID,
			"name":          category.Name,
			"slug":          category.Slug,
			"organizations": organizations,
		})
	}

	return result
}

func toGraphQLArticlePreview(preview articles.Preview) map[string]interface{} {
	entry := map[string]interface{}{
		"id":           preview.ID,
		"slug":         preview.Slug,
		"title":        preview.Title,
		"excerpt":      preview.Excerpt,
		"imageUrl":     preview.ImageURL,
		"imageAlt":     preview.ImageAlt,
		"topicId":      preview.TopicID,
		"publishedAt":  preview.PublishedAt,
		"displayType":  preview.DisplayType,
	}

	if preview.ReadingTimeMin != nil {
		entry["readingTimeMin"] = *preview.ReadingTimeMin
	}

	return entry
}

func toGraphQLArticle(article *articles.Article) map[string]interface{} {
	entry := toGraphQLArticlePreview(article.Preview)
	entry["content"] = article.Content
	return entry
}

func toGraphQLArticlesFeed(feed *articles.Feed) map[string]interface{} {
	result := map[string]interface{}{
		"hasMore":  feed.HasMore,
		"featured": make([]map[string]interface{}, 0, len(feed.Featured)),
		"list":     make([]map[string]interface{}, 0, len(feed.List)),
	}

	if feed.Hero != nil {
		hero := toGraphQLArticlePreview(*feed.Hero)
		result["hero"] = hero
	}

	for _, item := range feed.Featured {
		result["featured"] = append(result["featured"].([]map[string]interface{}), toGraphQLArticlePreview(item))
	}

	for _, item := range feed.List {
		result["list"] = append(result["list"].([]map[string]interface{}), toGraphQLArticlePreview(item))
	}

	return result
}

func toGraphQLOrganizationDetail(detail *organizations.Detail) map[string]interface{} {
	entry := map[string]interface{}{
		"id":              detail.ID,
		"slug":            detail.Slug,
		"name":            detail.Name,
		"categorySlug":    detail.CategorySlug,
		"categoryName":    detail.CategoryName,
		"tagline":         detail.Tagline,
		"pageTitle":       detail.PageTitle,
		"logoUrl":         detail.LogoURL,
		"detailLogoUrl":   detail.DetailLogoURL,
		"aboutHtml":       detail.AboutHTML,
		"rating":          detail.Rating,
		"reviewCount":     detail.ReviewCount,
		"hasPublicRating": detail.HasPublicRating,
		"website":         detail.Website,
		"phone":           detail.Phone,
		"email":           detail.Email,
		"workHours":       detail.WorkHours,
		"verification": map[string]interface{}{
			"contracts":   detail.Verification.Contracts,
			"legalEntity": detail.Verification.LegalEntity,
		},
		"cardTags":     detail.CardTags,
		"cardFeatures": detail.CardFeatures,
		"showGallery":  detail.ShowGallery,
		"showArticleBlock": detail.ShowArticleBlock,
	}

	if detail.FoundedYear != nil {
		entry["foundedYear"] = *detail.FoundedYear
	}

	if len(detail.Addresses) > 0 {
		addresses := make([]map[string]interface{}, 0, len(detail.Addresses))
		for _, item := range detail.Addresses {
			addresses = append(addresses, map[string]interface{}{
				"city":        item.City,
				"addressLine": item.AddressLine,
			})
		}
		entry["addresses"] = addresses
	}

	if len(detail.Gallery) > 0 {
		gallery := make([]map[string]interface{}, 0, len(detail.Gallery))
		for _, item := range detail.Gallery {
			gallery = append(gallery, map[string]interface{}{
				"imageUrl": item.ImageURL,
				"imageAlt": item.ImageAlt,
			})
		}
		entry["gallery"] = gallery
	}

	if detail.EquipmentSales != nil {
		entry["equipmentSales"] = map[string]interface{}{
			"equipmentType":      detail.EquipmentSales.EquipmentType,
			"equipmentCondition": detail.EquipmentSales.EquipmentCondition,
			"salesVolume":        detail.EquipmentSales.SalesVolume,
			"availability":       detail.EquipmentSales.Availability,
			"extras":             detail.EquipmentSales.Extras,
		}
	}

	if detail.MiningHotel != nil {
		hotel := map[string]interface{}{
			"pricePerKwhLabel": detail.MiningHotel.PricePerKwhLabel,
			"siteCities":       detail.MiningHotel.SiteCities,
			"minDevicesLabel":  detail.MiningHotel.MinDevicesLabel,
			"energyType":       detail.MiningHotel.EnergyType,
		}
		if detail.MiningHotel.PricePerKwhFrom != nil {
			hotel["pricePerKwhFrom"] = *detail.MiningHotel.PricePerKwhFrom
		}
		if detail.MiningHotel.SitesCount != nil {
			hotel["sitesCount"] = *detail.MiningHotel.SitesCount
		}
		if detail.MiningHotel.TotalCapacityMw != nil {
			hotel["totalCapacityMw"] = *detail.MiningHotel.TotalCapacityMw
		}
		entry["miningHotel"] = hotel
	}

	if detail.PaymentTerms != nil {
		entry["paymentTerms"] = map[string]interface{}{
			"paymentMethods": detail.PaymentTerms.PaymentMethods,
			"paymentFormats": detail.PaymentTerms.PaymentFormats,
			"extraTerms":     detail.PaymentTerms.ExtraTerms,
			"contractForms":  detail.PaymentTerms.ContractForms,
		}
	}

	if detail.LegalProfile != nil {
		legal := map[string]interface{}{
			"legalName":             detail.LegalProfile.LegalName,
			"primaryActivity":       detail.LegalProfile.PrimaryActivity,
			"ogrn":                  detail.LegalProfile.OGRN,
			"inn":                   detail.LegalProfile.INN,
			"legalAddress":          detail.LegalProfile.LegalAddress,
			"authorizedCapital":     detail.LegalProfile.AuthorizedCapital,
			"reliability":           detail.LegalProfile.Reliability,
			"defendantCases":        detail.LegalProfile.DefendantCases,
			"revenue":               detail.LegalProfile.Revenue,
			"profit":                detail.LegalProfile.Profit,
			"taxDebt":               detail.LegalProfile.TaxDebt,
			"inSanctionsLists":      detail.LegalProfile.InSanctionsLists,
			"sanctionsRestrictions": detail.LegalProfile.SanctionsRestrictions,
		}
		if detail.LegalProfile.RegisteredAt != nil {
			legal["registeredAt"] = *detail.LegalProfile.RegisteredAt
		}
		entry["legalProfile"] = legal
	}

	return entry
}

func toGraphQLRatingCards(cards []ratings.Card) []map[string]interface{} {
	result := make([]map[string]interface{}, 0, len(cards))

	for _, card := range cards {
		items := make([]map[string]interface{}, 0, len(card.Items))
		for _, item := range card.Items {
			items = append(items, map[string]interface{}{
				"number": item.Number,
				"label":  item.Label,
				"href":   item.Href,
			})
		}

		entry := map[string]interface{}{
			"id":    card.ID,
			"title": card.Title,
			"items": items,
		}

		if card.Columns > 0 {
			entry["columns"] = card.Columns
		}

		result = append(result, entry)
	}

	return result
}

func toGraphQLOrganizationReview(review organizations.Review) map[string]interface{} {
	return map[string]interface{}{
		"id":            review.ID,
		"authorName":    review.AuthorName,
		"rating":        review.Rating,
		"content":       review.Content,
		"source":        review.Source,
		"likesCount":    review.LikesCount,
		"dislikesCount": review.DislikesCount,
		"publishedAt":   review.PublishedAt.UTC().Format(time.RFC3339),
	}
}

func toGraphQLOrganizationReviews(reviews []organizations.Review) []map[string]interface{} {
	result := make([]map[string]interface{}, 0, len(reviews))
	for _, review := range reviews {
		result = append(result, toGraphQLOrganizationReview(review))
	}
	return result
}

func toGraphQLOrganizationReviewStats(stats organizations.ReviewStats) map[string]interface{} {
	return map[string]interface{}{
		"rating":          stats.Rating,
		"reviewCount":     stats.ReviewCount,
		"hasPublicRating": stats.HasPublicRating,
	}
}
