
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
export const ARTICLES_FEED_QUERY = `
  query ArticlesFeed($topic: String, $locale: String) {
    articlesFeed(topic: $topic, locale: $locale) {
      hasMore
      hero { ${ARTICLE_PREVIEW_FIELDS} }
      featured { ${ARTICLE_PREVIEW_FIELDS} }
      list { ${ARTICLE_PREVIEW_FIELDS} }
    }
  }
`

export const ARTICLES_CATALOG_QUERY = `
  query ArticlesCatalog($topic: String, $locale: String) {
    articlesCatalog(topic: $topic, locale: $locale) {
      ${ARTICLE_PREVIEW_FIELDS}
    }
  }
`
export const ARTICLE_QUERY = `
  query Article($slug: String!, $locale: String) {
    article(slug: $slug, locale: $locale) {
      ${ARTICLE_PREVIEW_FIELDS}
      content
      usesBlocks
      viewCount
      blocks {
        id
        position
        type
        payload
        anchor
      }
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

export const CALCULATOR_HARDWARE_QUERY = `
  query CalculatorHardware {
    calculatorHardware {
      asic {
        name
        models {
          id
          name
          brand
          algorithm
          hashrate
          hashrateUnit
          powerW
          slug
        }
      }
      gpu {
        name
        models {
          id
          name
          brand
          algorithm
          hashrate
          hashrateUnit
          powerW
          slug
        }
      }
      cpu {
        name
        models {
          id
          name
          brand
          algorithm
          hashrate
          hashrateUnit
          powerW
          slug
        }
      }
    }
  }
`

export const CALCULATOR_COINS_QUERY = `
  query CalculatorCoins {
    calculatorCoins {
      asic {
        id
        symbol
        name
        algorithm
        difficulty
        blockReward
        exchangeRateUsdt
        netHash
        stepen
        dualCoin
        iconUrl
        sort
      }
      gpu {
        id
        symbol
        name
        algorithm
        difficulty
        blockReward
        exchangeRateUsdt
        netHash
        stepen
        dualCoin
        iconUrl
        sort
      }
      gpuAlgorithms
      defaultUsdtRub
    }
  }
`

export const PODBOR_PLACEMENT_OFFERS_QUERY = `
  query PodborPlacementOffers {
    podborPlacementOffers {
      id
      title
      capacityTitle
      priceLabel
      priceValue
      location
      image
    }
  }
`

export const PODBOR_SALE_OFFERS_QUERY = `
  query PodborSaleOffers {
    podborSaleOffers {
      id
      title
      capacityTitle
      priceLabel
      priceValue
      location
      image
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

export const INCREMENT_ARTICLE_VIEW_MUTATION = `
  mutation IncrementArticleView($slug: String!) {
    incrementArticleView(slug: $slug) {
      viewCount
    }
  }
`

export const CREATE_LEAD_MUTATION = `
  mutation CreateLead(
    $source: String!
    $contact: String!
    $name: String
    $message: String
    $payload: String
    $pagePath: String
  ) {
    createLead(
      source: $source
      contact: $contact
      name: $name
      message: $message
      payload: $payload
      pagePath: $pagePath
    ) {
      id
      source
      createdAt
    }
  }
`
