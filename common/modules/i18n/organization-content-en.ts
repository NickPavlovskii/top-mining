/**
 * English organization detail copy keyed by slug.
 * Used when locale is `en`; Russian source remains in DB / migrations.
 */
export type OrganizationMiningHotelLocale = {
  pricePerKwhLabel?: string
  siteCities?: string
  minDevicesLabel?: string
  energyType?: string
  extras?: string[]
}

export type OrganizationPaymentTermsLocale = {
  paymentMethods?: string[]
  paymentFormats?: string[]
  extraTerms?: string[]
  contractForms?: string[]
}

export type OrganizationLegalProfileLocale = {
  legalName?: string
  primaryActivity?: string
  legalAddress?: string
  authorizedCapital?: string
  reliability?: string
  defendantCases?: string
  revenue?: string
  profit?: string
  taxDebt?: string
  inSanctionsLists?: string
  sanctionsRestrictions?: string
}

export type OrganizationContentLocale = {
  tagline?: string
  pageTitle?: string
  aboutHtml?: string
  miningHotel?: OrganizationMiningHotelLocale
  paymentTerms?: OrganizationPaymentTermsLocale
  legalProfile?: OrganizationLegalProfileLocale
  cardTags?: string[]
  cardFeatures?: string[]
}

export const organizationContentEn: Record<string, OrganizationContentLocale> = {
  '1-mining': {
    tagline: 'Mining container manufacturer and mining hotel',
    pageTitle: '1-MINING',
    aboutHtml: `
<p>1-MINING is a leading mining container manufacturer in Russia’s North-West, with an office and in-house production in Saint Petersburg. We design, build, and adapt containers for specific client needs and operating conditions — including industrial deployment, mobile farms, and custom projects. The lineup includes 10-, 20-, and 40-foot models with carefully engineered ventilation, power supply, and safety systems.</p>
<p>Our team offers flexible options: connection to our own capacity, leasing, and launch and maintenance consulting for the full lifecycle. 1-MINING is not just manufacturing — it is an engineering approach focused on real-world experience and practical reliability. The company’s containers have already proven effective across sites — from plants with surplus power to remote locations.</p>
`.trim(),
    miningHotel: {
      pricePerKwhLabel: 'from 5 RUB incl. VAT',
      siteCities: 'Leningrad Region',
      minDevicesLabel: 'from 300 kW',
      energyType: 'Own gas-piston generation on main gas',
    },
    paymentTerms: {
      paymentMethods: ['Cash', 'Bank transfer'],
      extraTerms: ['Partial prepayment'],
      contractForms: ['Contract with LLC'],
    },
    legalProfile: {
      legalName: 'LLC "Profstandart"',
      primaryActivity:
        'Manufacture of structural metal products, parts and components (25.11)',
      legalAddress:
        '191036, Saint Petersburg, 3rd Sovetskaya St., bld. 32 letter A, premises 2N, office 1',
      authorizedCapital: '20,000 RUB',
      reliability: 'HIGH',
      revenue: '47 million RUB for 2024',
      profit: '2.3 million RUB for 2024',
    },
    cardTags: [
      'Price per kWh: from 5 RUB incl. VAT',
      'Site capacity: 19 MW',
    ],
    cardFeatures: ['20 min from SPb', 'Gas generation', 'From 300 kW'],
  },
}
