/**
 * English article preview copy keyed by slug.
 * Used when locale is `en`; Russian source remains in API/DB.
 */
export type ArticleContentLocale = {
  title: string
  excerpt: string
  imageAlt?: string
}

export const articleContentEn: Record<string, ArticleContentLocale> = {
  'blockchain-forum-2026-moscow': {
    title:
      'Blockchain Forum 2026: The Global Crypto Industry Returns to Moscow, April 14–15',
    excerpt:
      'April 14–15, 2026 in Moscow: Blockchain Forum 2026 unites CIS and global crypto markets. Promo code TOPMINING — 10% off.',
    imageAlt: 'Blockchain Forum 2026 April',
  },
  'whatsminer-m70-line-review': {
    title: 'New Whatsminer M70 generation: full line review',
    excerpt:
      'Hashrate, energy efficiency, and payback scenarios for the new MicroBT lineup.',
    imageAlt: 'Whatsminer M70',
  },
  'best-asic-miners-2026': {
    title: 'Best mining ASICs: smart service, mature ecosystem',
    excerpt:
      'How to choose an ASIC in 2026: hardware, service, logistics, and transparent hosting terms.',
    imageAlt: 'Best ASIC miners',
  },
  'crypto-market-outlook-2026': {
    title: 'Crash or rally? Crypto market at the start of 2026',
    excerpt:
      'Key factors for Bitcoin and altcoins: liquidity, halving cycle, and institutional demand.',
    imageAlt: 'Crypto market 2026',
  },
  'blockchain-life-2025-afterparty': {
    title: 'Blockchain Life 2025 — the main CIS event',
    excerpt:
      'Conference takeaways, afterparty, and key announcements for the mining community.',
    imageAlt: 'Blockchain Life 2025',
  },
  'the-trends-conference': {
    title: 'THE TRENDS: industry technologies and trends',
    excerpt:
      'A short overview of the agenda and themes that set the tone for the fall.',
    imageAlt: 'THE TRENDS',
  },
  'top-mining-ecosystem': {
    title:
      'TOP MINING ecosystem: one platform for miners, investors, and business',
    excerpt:
      'Calculator, catalog, ratings, and services — how the platform tools connect.',
    imageAlt: 'TOP MINING ecosystem',
  },
  'mining-consulting-services': {
    title: 'Mining consulting: support from idea to launch',
    excerpt:
      'Audit, hardware selection, legal and technical questions — what consulting includes.',
    imageAlt: 'Mining consulting',
  },
  'hosting-with-discount': {
    title: 'How to choose discounted hosting: criteria and pitfalls',
    excerpt:
      'What to check when picking a site: rate, uptime, repairs, and transparent stats.',
    imageAlt: 'Discounted hosting',
  },
  'tools-build-mining-site': {
    title: 'We build a mining site: full turnkey cycle',
    excerpt:
      'Design, installation, commissioning, and service for an industrial mining facility.',
    imageAlt: 'Building a mining site',
  },
  'buy-asic-below-market': {
    title: 'Buy ASICs below market: how to find good deals',
    excerpt:
      'Where to look for promotions, how to verify a supplier, and avoid overpaying for logistics.',
    imageAlt: 'Buy ASICs below market',
  },
  'best-time-to-buy-asic': {
    title: 'Why now is the best time to buy ASICs?',
    excerpt:
      'Market factors, hardware prices, and the payback window for investors.',
    imageAlt: 'Buying ASICs',
  },
  'mining-on-gas-russia': {
    title:
      'Mining on gas: how to launch a farm on natural or associated gas in Russia',
    excerpt:
      'Power, equipment, and legal aspects of hosting on gas generators.',
    imageAlt: 'Mining on gas',
  },
  'bitcoin-as-investment-asset': {
    title: 'Bitcoin as an investment asset: mining’s role in a portfolio',
    excerpt:
      'How to combine buying BTC and mining for a long-term strategy.',
    imageAlt: 'Bitcoin as investment',
  },
  'mining-datacenter-investment': {
    title: 'Investing in a mining data center: models and returns',
    excerpt:
      'When it makes sense to invest in infrastructure, not only in hardware.',
    imageAlt: 'Data center investment',
  },
  'asic-payback-forecast-2026': {
    title: 'ASIC payback in 2026: calculation and investor outlook',
    excerpt:
      'How to estimate return time with rate, tariff, and uptime in mind.',
    imageAlt: 'ASIC payback',
  },
  'mining-datacenter-guide': {
    title: 'How a modern mining data center works',
    excerpt:
      'Monitoring, security, and service processes at an industrial site.',
    imageAlt: 'Mining data center',
  },
  'asic-hardware-overview': {
    title: 'Industrial ASIC overview: what matters when buying',
    excerpt:
      'Form factor, cooling, and logistics when shipping a batch of equipment.',
    imageAlt: 'Industrial ASICs',
  },
  'top-mining-pools-2026': {
    title: 'Best mining pools 2026: top 11 by profitability',
    excerpt:
      'Comparing fees, payout stability, and monitoring convenience for miners.',
    imageAlt: 'Top mining pools',
  },
  'top-mining-articles-knowledge': {
    title: 'Mining articles from TOP MINING: knowledge as a profit tool',
    excerpt:
      'A selection of materials for those who want to understand the industry systematically.',
    imageAlt: 'Mining articles',
  },
  'where-to-buy-asic': {
    title: 'Where to buy ASICs — a trusted resource',
    excerpt:
      'Criteria for a reliable supplier and how to compare market offers.',
    imageAlt: 'Where to buy ASICs',
  },
  'mining-investment-entry': {
    title: 'Investing in mining: where a private investor should start',
    excerpt:
      'Minimum budget, choosing a model, and first steps without unnecessary risk.',
    imageAlt: 'Investor start',
  },
  'mining-sites-construction': {
    title: 'Building mining sites: where to start',
    excerpt:
      'Engineering, power supply, and infrastructure requirements for industrial hosting.',
    imageAlt: 'Building mining sites',
  },
  'whatsminer-m70-beginners': {
    title: 'Whatsminer M70 for beginners: getting to know the lineup',
    excerpt:
      'Basic specs, hosting conditions, and common questions at the start.',
    imageAlt: 'Whatsminer M70 for beginners',
  },
  'mining-basics-start': {
    title: 'Mining from scratch: first steps without typical mistakes',
    excerpt: 'How to choose a model, a site, and not lose your budget early on.',
    imageAlt: 'Mining from scratch',
  },
}
