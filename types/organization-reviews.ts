export interface OrganizationReview {
  id: number
  authorName: string
  rating: number
  content: string
  source: string
  likesCount: number
  dislikesCount: number
  publishedAt: string
}

export interface OrganizationReviewStats {
  rating: number
  reviewCount: number
  hasPublicRating: boolean
}

export interface OrganizationReviewsResponse {
  source: 'graphql' | 'fallback'
  updatedAt: string
  reviews: OrganizationReview[]
  stats: OrganizationReviewStats
}

export interface CreateOrganizationReviewBody {
  authorName: string
  authorEmail?: string
  authorPhone: string
  rating: number
  content: string
}

export interface CreateOrganizationReviewResponse {
  source: 'graphql'
  review: OrganizationReview
  stats: OrganizationReviewStats
}

export type OrganizationReviewSort =
  | 'newest'
  | 'oldest'
  | 'rating-desc'
  | 'rating-asc'
