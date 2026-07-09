/**
 * GraphQL-запросы к Go-бэкенду (POST http://localhost:8080/graphql).
 *
 * Зачем отдельный файл:
 * - строки запросов не размазаны по server/api/*.get.ts;
 * - один список полей для карточки статьи (ARTICLE_PREVIEW_FIELDS);
 * - при смене схемы на Go правим запросы в одном месте.
 *
 * Цепочка данных:
 *   Vue (useFetch) → Nuxt BFF (/api/*) → fetchGraphQL() → Go GraphQL → PostgreSQL
 *   при ошибке BFF отдаёт fallback из common/modules/*
 */

/** Поля превью статьи — карточка в ленте (hero / featured / list). */
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

/** Полная статья для страницы /articles/[slug]. */
export const ARTICLE_QUERY = `
  query Article($slug: String!) {
    article(slug: $slug) {
      ${ARTICLE_PREVIEW_FIELDS}
      content
    }
  }
`

/** Каталог организаций на главной и в разделе каталога. */
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
          rating
          reviewCount
          href
          foundedYear
          hasPublicRating
          verification {
            contracts
            legalEntity
            miningRegistry
          }
          cardTags
          cardFeatures
          officeCity
          siteCity
        }
      }
    }
  }
`

/** Профиль организации для /sale_asic/[slug] и аналогичных страниц. */
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
      aboutHtml
      rating
      reviewCount
      hasPublicRating
      foundedYear
      website
      email
      workHours
      verification {
        contracts
        legalEntity
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

/** Полный список рейтингов для страницы /rating. */
export const RATINGS_QUERY = `
  query Ratings {
    ratings {
      ${RATING_CARD_FIELDS}
    }
  }
`

/** Сокращённый набор карточек для главной. */
export const RATINGS_HOME_QUERY = `
  query RatingsHome {
    ratingsHome {
      ${RATING_CARD_FIELDS}
    }
  }
`
