
export const ARTICLE_PREVIEW_FIELDS = `
  id
  slug
  title
  excerpt
  imageUrl
  imageAlt
  topicId
  readingTimeMin
  publishedAt
  displayType
`

/**
 * Лента статей на главной и /articles.
 * Переменная topic: all | news | mining | … — фильтр по вкладке.
 * Ответ: hero (1 шт.), featured (до 4), list (до 8), hasMore.
 */
export const ARTICLES_FEED_QUERY = `
  query ArticlesFeed($topic: String) {
    articlesFeed(topic: $topic) {
      hasMore
      hero { ${ARTICLE_PREVIEW_FIELDS} }
      featured { ${ARTICLE_PREVIEW_FIELDS} }
      list { ${ARTICLE_PREVIEW_FIELDS} }
    }
  }
`
export const ARTICLE_QUERY = `
  query Article($slug: String!) {
    article(slug: $slug) {
      ${ARTICLE_PREVIEW_FIELDS}
      content
    }
  }
`
export const CATALOG_QUERY = `
  query Catalog {
    catalog {
      meta {
        totalReviews
        subtitle
      }
      categories {
        id
        name
        slug
        organizations {
          id
          name
          slug
          logoUrl
          logoTheme
          rating
          reviewCount
          href
          foundedYear
          hasPublicRating
          verification {
            contracts
            legalEntity
            dataCenter
            miningRegistry
          }
          cardTags
          cardFeatures
          cardPromo
          officeCity
          siteCity
        }
      }
    }
  }
`
export const ORGANIZATION_QUERY = `
  query Organization($slug: String!) {
    organization(slug: $slug) {
      id
      slug
      name
      categorySlug
      categoryName
      tagline
      pageTitle
      logoUrl
      detailLogoUrl
      aboutHtml
      rating
      reviewCount
      hasPublicRating
      foundedYear
      website
      phone
      email
      workHours
      domainRegisteredAt
      verification {
        contracts
        legalEntity
        dataCenter
        miningRegistry
      }
      addresses {
        city
        addressLine
      }
      gallery {
        imageUrl
        imageAlt
      }
      equipmentSales {
        equipmentType
        equipmentCondition
        salesVolume
        availability
        extras
      }
      miningHotel {
        pricePerKwhFrom
        pricePerKwhLabel
        sitesCount
        totalCapacityMw
        siteCities
        minDevicesLabel
        energyType
      }
      miningPool {
        mobileApp
        referralProgram
        totalHashrate
        rewardDistribution
        poolCommission
        minPayout
        payoutFrequency
        minedCoins
      }
      cryptoExchange {
        tradingPairsLabel
        coinsCountLabel
        verificationType
        liquidityCoefficient
        spotMarkets
        supportedCurrencies
        makerFee
        takerFee
        derivativeMarkets
        extras
      }
      cryptoWallet {
        supportedCoins
        platform
        commission
        commissionCalculation
        extras
      }
      referralProgramUrl
      referralPromoText
      paymentTerms {
        paymentMethods
        paymentFormats
        extraTerms
        contractForms
      }
      legalProfile {
        legalName
        primaryActivity
        ogrn
        inn
        registeredAt
        legalAddress
        authorizedCapital
        reliability
        defendantCases
        revenue
        profit
        taxDebt
        inSanctionsLists
        sanctionsRestrictions
      }
      cardTags
      cardFeatures
      showGallery
      showArticleBlock
    }
  }
`

const RATING_CARD_FIELDS = `
  id
  title
  columns
  items {
    number
    label
    href
  }
`
export const RATINGS_QUERY = `
  query Ratings {
    ratings {
      ${RATING_CARD_FIELDS}
    }
  }
`

export const RATINGS_HOME_QUERY = `
  query RatingsHome {
    ratingsHome {
      ${RATING_CARD_FIELDS}
    }
  }
`

const ORGANIZATION_REVIEW_FIELDS = `
  id
  authorName
  rating
  content
  source
  likesCount
  dislikesCount
  publishedAt
`

const ORGANIZATION_REVIEW_STATS_FIELDS = `
  rating
  reviewCount
  hasPublicRating
`

export const ORGANIZATION_REVIEWS_QUERY = `
  query OrganizationReviews($slug: String!, $sort: String) {
    organizationReviews(slug: $slug, sort: $sort) {
      reviews {
        ${ORGANIZATION_REVIEW_FIELDS}
      }
      stats {
        ${ORGANIZATION_REVIEW_STATS_FIELDS}
      }
    }
  }
`

export const CREATE_ORGANIZATION_REVIEW_MUTATION = `
  mutation CreateOrganizationReview(
    $organizationSlug: String!
    $authorName: String!
    $authorEmail: String
    $authorPhone: String
    $rating: Int!
    $content: String!
  ) {
    createOrganizationReview(
      organizationSlug: $organizationSlug
      authorName: $authorName
      authorEmail: $authorEmail
      authorPhone: $authorPhone
      rating: $rating
      content: $content
    ) {
      review {
        ${ORGANIZATION_REVIEW_FIELDS}
      }
      stats {
        ${ORGANIZATION_REVIEW_STATS_FIELDS}
      }
    }
  }
`
