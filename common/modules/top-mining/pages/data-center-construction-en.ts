/**
 * English content for the Data Center Construction landing.
 * Structure mirrors DATA_CENTER_CONSTRUCTION_PAGE (RU source of truth for types).
 */
import heroContainer from '~/assets/images/data-center-construction/hero-container.png'
import investIconNoRisk from '~/assets/images/data-center-construction/invest/invest-wrap-icon-1.svg'
import investIconStableIncome from '~/assets/images/data-center-construction/invest/invest-wrap-icon-2.svg'
import investIconEarnings from '~/assets/images/data-center-construction/invest/invest-wrap-icon-3.svg'
import investIconNoEntryFee from '~/assets/images/data-center-construction/invest/invest-wrap-icon-4.svg'
import investIconEnergySave from '~/assets/images/data-center-construction/invest/invest-wrap-icon-5.svg'
import investIconNoDeposit from '~/assets/images/data-center-construction/invest/invest-wrap-icon-6.svg'
import investIconScale from '~/assets/images/data-center-construction/invest/invest-wrap-icon-7.svg'
import investIconControl from '~/assets/images/data-center-construction/invest/invest-wrap-icon-8.svg'
import {
  DATA_CENTER_CALCULATOR_HREF,
  type DataCenterBusinessModelItem,
  type DataCenterPowerCompareColumn,
  type DataCenterStageItem,
} from './data-center-construction'

export const DATA_CENTER_CALC_FOOTNOTE_EN =
  'Calculations use Bitmain Antminer S21 Pro 234 Th/s ASIC miner, power 3.51 kW/h, price 310,000 ₽, 1427 units (5 MW), BTC-USDT rate 100,000 USDT, USDT-RUB rate 100 ₽.'

export const DATA_CENTER_CTA_FORM_DEFAULTS_EN = {
  phonePlaceholder: 'Phone',
  honeypotLabel: 'Leave this field empty.',
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
  privacyHref: '/privacy',
} as const

export const DATA_CENTER_CONSTRUCTION_PAGE_EN = {
  breadcrumb: 'Data Center Construction',
  seoTitle: 'Turnkey Mining Data Center Construction | TOP MINING',
  seoDescription:
    'We design and build turnkey modern mining data centers with yields from 70% per year. Investments from 125M RUB, payback from 17 mo.',
  hero: {
    title: 'TURNKEY MINING DATA CENTER CONSTRUCTION',
    titleAccent: 'WITH YIELDS FROM 70% PER YEAR',
    subtitle: 'FULL CYCLE FROM IDEA TO LAUNCH',
    text: 'We design and build modern data centers of any complexity, delivering the entire project from initial audits and engineering calculations to commissioning and operational handover.',
    image: heroContainer,
    imageAlt: 'Containerized modular data center with the TOP MINING logo',
    investmentLabel: 'Investment amount',
    investmentValue: 'from 125M RUB',
    paybackLabel: 'Payback period',
    paybackValue: 'from 17 mo.',
    ctaLabel: 'SUBMIT REQUEST',
    ctaHref: '#data-center-offer',
    info: 'The terms “data center,” “mining hotel,” “DPC,” and “hosting” mean the same thing: a place to host ASIC miners.',
  },
  advantages: {
    title: 'ADVANTAGES OF INVESTING IN A DATA CENTER',
    items: [
      {
        index: '01',
        title: 'CONSTRUCTION IS A SIMPLE BUSINESS',
        text: 'You do not need mining expertise. With business models 1–3, you do not need to mine to generate income: you earn by selling the site or leasing it out.',
      },
      {
        index: '02',
        title: 'NOT TIED TO BTC OR USD EXCHANGE RATES',
        text: 'The data center construction business is not tied to cryptocurrency or dollar exchange rates. You do not need to mine to generate income: you earn by selling the site or leasing it out.',
      },
      {
        index: '03',
        title: 'MINING INVESTMENTS ARE LOW-RISK INVESTMENTS',
        text: 'All infrastructure is your property, and you can sell the data center and exit the business at any time.\n\nDuring construction, your mining site grows in value thanks to this asset’s market liquidity; once complete, it is already worth 20% more.',
      },
    ],
  },
  discuss: {
    id: 'data-center-discuss',
    title: 'READY TO DISCUSS CONSTRUCTION OF YOUR DATA CENTER?',
    text: 'Submit a request and we will provide a free preliminary assessment: calculate capacity, determine the right format, and propose an indicative budget tailored to your objectives.',
    submitLabel: 'SEND',
    ...DATA_CENTER_CTA_FORM_DEFAULTS_EN,
  },
  offer: {
    title: 'OUR OFFER',
    lead: 'Buy energy-sector real estate, secure low-cost electricity, and sell it at a premium.',
    beforeAccent: 'The uniqueness of our offer is the opportunity to buy electricity',
    accent: 'at 3 RUB per kWh.',
    afterAccent: 'Learn how',
    phonePlaceholder: 'Phone',
    submitLabel: 'LEARN HOW',
    honeypotLabel: 'Leave this field empty.',
    privacyPrefix: 'By continuing, you agree to the',
    privacyLinkLabel: 'Privacy Policy',
    privacyHref: '/privacy',
  },
  models: {
    title: 'WHAT REVENUE MODELS ARE AVAILABLE FOR TURNKEY DATA CENTER CONSTRUCTION?',
    calculatorHref: DATA_CENTER_CALCULATOR_HREF,
    ctaLabel: 'GET BUSINESS MODEL',
    formSubmitLabel: 'SEND',
    phonePlaceholder: 'Phone',
    honeypotLabel: 'Leave this field empty.',
    privacyPrefix: 'By continuing, you agree to the',
    privacyLinkLabel: 'Privacy Policy',
    privacyHref: '/privacy',
    businessModelModal: {
      downloadPromptPrefix: 'Leave your contact details to download',
      submitLabel: 'DOWNLOAD',
      phonePlaceholder: 'Phone',
      phoneLabel: 'Phone',
      honeypotLabel: 'Leave this field empty.',
      privacyPrefix: 'By continuing, you agree to the',
      privacyLinkLabel: 'Privacy Policy',
      privacyHref: '/privacy',
      closeLabel: 'Close',
    },
    calcFootnote: DATA_CENTER_CALC_FOOTNOTE_EN,
    scenarioLabels: ['Optimal model', 'Optimistic model', 'Pessimistic model'] as const,
    rowLabels: [
      'Investment',
      'Electricity purchase rate',
      'Electricity sales rate',
      'Data center payback period',
    ] as const,
    items: [
      {
        id: 'model-1',
        label: 'Business model No. 1',
        title: 'BUILD A DATA CENTER YOU OWN (WITHOUT BUYING ASIC MINERS)',
        invested: 'Invested 125M RUB',
        resultHighlight: 'After 17 months',
        resultText: 'the data center has paid for itself, and you continue earning',
        kind: 'grid',
        highlightColumn: 1,
        columns: [
          ['125M RUB', '3.0 RUB', '4.7 RUB', '20.26 mo.'],
          ['125M RUB', '3.0 RUB', '4.7 RUB', '17.22 mo.'],
          ['125M RUB', '3.0 RUB', '4.7 RUB', '14.35 mo.'],
        ],
      },
      {
        id: 'model-2',
        label: 'Business model No. 2',
        title: 'BUILD IT — THEN SELL IT IMMEDIATELY FOR 20% MORE',
        invested: 'Invested 125M RUB',
        resultHighlight: 'After 4 months',
        resultText: 'sold it for 150M RUB',
        kind: 'text',
        paragraphs: [
          { html: 'Investment — <b>from 125M RUB.</b>' },
          {
            html: 'By the time site construction is complete, you can already sell it for 20% more than you paid, thanks to the asset’s natural appreciation and market liquidity.',
          },
          {
            html: 'Your goal is to find a buyer for the data center.<br>TOP MINING will help you find one. <a href="/consulting/" target="_blank" rel="noopener noreferrer">Learn more</a>',
          },
        ],
      },
      {
        id: 'model-3',
        label: 'Business model No. 3',
        title: 'BUILD A MINING DATA CENTER (WITH ASIC MINERS)',
        invested: 'Invested 567M RUB',
        resultHighlight: 'After 14 months',
        resultText: 'the data center and ASIC miners have paid for themselves, and you continue earning',
        kind: 'dual',
        miniTables: [
          {
            title: 'Data center payback period',
            rows: [
              { label: 'Data center construction investment', value: '125M RUB' },
              { label: 'Electricity purchase rate', value: '3.0 RUB' },
              { label: 'Data center payback period', value: '3.19 mo.', accent: true },
            ],
          },
          {
            title: 'ASIC payback period',
            rows: [
              { label: 'ASIC purchase investment', value: '442.37M RUB' },
              { label: 'Electricity purchase rate', value: '3.0 RUB' },
              { label: 'ASIC payback period', value: '11.08 mo.', accent: true },
            ],
          },
        ],
      },
      {
        id: 'model-4',
        label: 'Business model No. 4',
        title: 'BUILD A DATA CENTER TO LEASE FOR 7 YEARS',
        invested: 'Invested 62.5M RUB',
        resultHighlight: 'After 17 months',
        resultText: 'you have recouped your investment, and you continue earning',
        kind: 'grid',
        highlightColumn: 1,
        columns: [
          ['62.5M RUB', '4.0 RUB', '4.7 RUB', '24.6 mo.'],
          ['62.5M RUB', '4.0 RUB', '5.0 RUB', '17.22 mo.'],
          ['62.5M RUB', '4.0 RUB', '5.4 RUB', '12.3 mo.'],
        ],
      },
    ] satisfies readonly DataCenterBusinessModelItem[],
  },
  whyInvest: {
    title: 'WHY IS IT PROFITABLE TO INVEST IN BUILDING YOUR OWN MINING SITE?',
    calculatorHref: DATA_CENTER_CALCULATOR_HREF,
    calcFootnote: DATA_CENTER_CALC_FOOTNOTE_EN,
    rent: {
      title: 'If you lease out the data center',
      cards: [
        {
          title: 'No financial risks',
          text: 'All infrastructure is your property.\nYou can sell the data center and exit the business at any time.',
          icon: investIconNoRisk,
        },
        {
          title: 'Stable data center income',
          text: 'You are not tied to BTC or USD exchange rates and do not need to mine.\nYou do not need any mining expertise.\nBuild a data center and lease it out.',
          icon: investIconStableIncome,
        },
      ],
      earnings: {
        title:
          'You earn from 7M RUB per month on the tariff spread with a 125M RUB investment (optimal model)',
        icon: investIconEarnings,
        highlightColumn: 1,
        scenarioLabels: [
          'Pessimistic model',
          'Optimal model',
          'Optimistic model',
        ] as const,
        rowLabels: [
          'Electricity purchase rate',
          'Electricity sales rate',
          'Electricity tariff spread',
          'Your net profit',
        ] as const,
        columns: [
          ['3.0 RUB', '4.7 RUB', '1.7 RUB', '6.17M RUB / mo.'],
          ['3.0 RUB', '5.0 RUB', '2.0 RUB', '7,26M RUB / mo.'],
          ['3.0 RUB', '5.4 RUB', '2.4 RUB', '8.71M RUB / mo.'],
        ],
      },
    },
    mine: {
      title: 'If you mine yourself',
      savings: [
        {
          title:
            'You save from 14M RUB upfront because you do not pay a hosting entry fee',
          icon: investIconNoEntryFee,
          headers: [
            'Hosting <b>in your own</b> data center',
            'Hosting in <b>Company X’s</b> data center',
          ],
          rows: [
            {
              label: 'Entry fee',
              labelDetail: 'for hosting',
              values: ['0 RUB', '~10,000 RUB / 1 ASIC'],
            },
            {
              label: 'Total ASIC miners',
              values: [
                '1427 (total power consumption: 5 MW)',
                '1427 (total power consumption: 5 MW)',
              ],
              mobileValues: ['1427 units', '1427 units'],
            },
            {
              label: 'Total fee',
              values: ['0 RUB', '14.27M RUB'],
              accent: true,
            },
          ],
        },
        {
          title: 'You save from 7M RUB per month on electricity',
          icon: investIconEnergySave,
          headers: [
            'Hosting <b>in your own</b> data center',
            'Hosting in <b>Company X’s</b> data center',
          ],
          rows: [
            {
              label: 'Electricity rate',
              values: ['3,0 RUB per 1 kWh', '5,0 RUB per 1 kWh'],
            },
            {
              label: 'Total hosting cost per month',
              values: ['10.89M RUB / mo.', '18.15M RUB / mo.'],
              accent: true,
            },
          ],
        },
        {
          title: 'You do not freeze 40M RUB at the start',
          icon: investIconNoDeposit,
          headers: [
            'Hosting <b>in your own</b> data center',
            'Hosting in <b>Company X’s</b> data center',
          ],
          rows: [
            {
              label: 'Deposit (rent for the first and last month)',
              values: [
                '0 RUB for 5 MW',
                '40M RUB for 5 MW (8M RUB for 1 MW)',
              ],
              accent: true,
            },
          ],
        },
      ],
      comparisons: [
        {
          title:
            'You can scale your capacity and save on electricity',
          icon: investIconScale,
          headers: [
            'Hosting <b>in your own</b> data center',
            'Hosting in Company X’s data center',
          ],
          columns: [
            [
              {
                title: 'Flexibility and scalability',
                paragraphs: [
                  'Your own data center is an asset that can be easily expanded: add new racks, increase power input, and scale cooling without rebuilding the entire infrastructure.',
                  'One of our clients scaled a 1 MW data center to 2.5 MW within six months without interrupting operations.',
                ],
              },
              {
                title: 'Lower electricity and maintenance costs',
                paragraphs: [
                  'Scale through substantial electrification capacity and by optimizing your own grids and connections.',
                ],
              },
            ],
            [
              {
                title: 'High occupancy',
                paragraphs: [
                  'Most sites operate at full capacity, making it impossible to increase the number of a client’s active devices.',
                  'You may need to wait for a resolution to your issue (breakdown, maintenance, warranty claim) because service teams are overloaded.',
                ],
              },
              {
                title: 'Unfavorable hosting terms',
                paragraphs: [
                  'You may be unable to retain your previous rate when scaling: favorable offers are often limited.',
                ],
              },
            ],
          ],
        },
        {
          title: 'You have complete control over your equipment',
          icon: investIconControl,
          headers: [
            'Hosting <b>in your own</b> data center',
            'Hosting in Company X’s data center',
          ],
          columns: [
            [
              {
                title: 'Complete control',
                paragraphs: [
                  'You alone manage the equipment and networks.',
                  'There is no dependence on a third-party operator’s policies: you determine security levels, access, and operating rules.',
                  'You can flexibly configure and upgrade the system without approvals.',
                  'When you host equipment at your own site, you have full control over every aspect of its management.',
                  'You can better manage operating conditions, security, and access to the equipment.',
                ],
              },
            ],
            [
              {
                title: 'Risks',
                paragraphs: [
                  'Objective risks (fire, theft) affect all ASIC miners on the farm, including yours.',
                  'If any participant violates the law, equipment may be seized at the hosting site, affecting the hardware of any tenant.',
                  'Even the most reliable site can turn fraudulent and steal your equipment.',
                  'Remote control is difficult, and you may be unable to resolve issues promptly on your own.',
                  'Communication risks (IP telephony failures, internet access interruptions, etc.) can leave you without contact with technical support for an indefinite period.',
                ],
              },
            ],
          ],
        },
      ],
    },
  },
  stages: {
    title: 'KEY STAGES OF MINING SITE CONSTRUCTION',
    items: [
      {
        title: '1. Analytics and technical design',
        intro: 'Every successful project begins with in-depth analysis. At this stage:',
        points: [
          '<b>1. The planned IT load is assessed:</b> number of servers, power consumption, cooling needs, network bandwidth, and more.',
          '<b>2. Available power resources,</b> communication channels, and infrastructure at the proposed site are audited.',
          '<b>3. The data center architecture is developed:</b> resilience level, redundancy model, cooling system, uninterruptible power supplies, and more are defined.',
        ],
        example:
          'For one of our clients, we designed a 30 MW data center distributed across six modules, each of which can be serviced independently.',
      },
      {
        title: '2. Site selection and negotiations',
        points: [
          '<b>1. We select a site that meets your requirements (choosing a location with the optimal combination of land cost, utility availability, and logistics).</b>',
          '<b>2. We conduct negotiations</b> and, if needed, obtain technical specifications and a technical connection agreement.',
        ],
      },
      {
        title: '3. Project delivery and construction work',
        intro:
          'We hire and organize a technical service team to maintain the site, then proceed with delivery:',
        points: [
          '<b>1. Construction of a building or modular structures</b> adapted for the required temperature range, anti-static protection, and physical security.',
          '<b>2. Installation of fire suppression systems</b> (gas or powder), <b>climate and access monitoring systems</b> (ACS).',
          '<b>3. Deployment of power infrastructure:</b> dedicated transformers, diesel generators, UPS units, and distribution boards.',
        ],
        example:
          'In one project in Siberia, we delivered a data center based on containerized solutions, reducing construction time by 40% and simplifying equipment logistics.',
      },
      {
        title: '4. Site commissioning',
        intro:
          'After construction is complete, we equip, commission, and test the site:',
        points: [
          '<b>1. Server and communication equipment is installed:</b> racks, patch panels, routers, and servers.',
          '<b>2. Engineering systems are integrated:</b> cooling (in-row, free cooling, immersion), power supply, and backup power systems.',
          '<b>3. Load testing is performed</b> for fault tolerance, temperature conditions, emergency shutdown, and recovery scenarios.',
        ],
        example:
          'One of our data centers successfully passed load testing at an ambient temperature of +35°C, demonstrating stable operation of all systems at 100% capacity.',
      },
      {
        title: 'Turnkey site filling',
        intro:
          'At your request, we will fill the site with clients on a turnkey basis in the shortest possible time.',
        introLast: true,
      },
    ] satisfies readonly DataCenterStageItem[],
  },
  lead: {
    id: 'data-center-lead',
    title: 'WE WILL DEVELOP A CUSTOM PROJECT FOR YOUR INFRASTRUCTURE',
    text: 'Submit a request and our specialists will prepare a tailored business model for your budget and objectives.',
    submitLabel: 'SEND',
    ...DATA_CENTER_CTA_FORM_DEFAULTS_EN,
  },
  consult: {
    id: 'data-center-consult',
    title: 'WE BUILD DATA CENTERS OF ANY TYPE.\nNEED A CONSULTATION?',
    text: 'Submit a request and we will help you choose.',
    submitLabel: 'SUBMIT REQUEST',
    ...DATA_CENTER_CTA_FORM_DEFAULTS_EN,
  },
  powerCompare: {
    title: 'COMPARING DATA CENTERS WITH DIFFERENT POWER SOURCES',
    columns: [
      {
        id: 'gas',
        title: 'Gas',
        icon: 'gaz',
        items: [
          {
            label: 'Land cost',
            text: 'Land with deposits is more expensive because natural resources are located underground.',
          },
          {
            label: 'Required investment amount',
            text: 'A substantial investment is required not only to purchase or lease the land, but also to acquire and subsequently launch generation capacity.',
          },
          {
            label: 'Electricity cost',
            text: 'The lowest electricity cost, significantly below average market rates.',
          },
          {
            label: 'Noise level',
            text: 'High noise levels due to the specific nature of gas infrastructure operations.',
            align: 'gaz-4',
          },
          {
            label: 'Up-time',
            text: 'Uninterrupted operation depends on the quality of the gas infrastructure and maintenance schedules for the generation capacity.',
          },
          {
            label: 'Resale prospects',
            text: 'Selling the land is more difficult due to the specialized nature of the real estate and a narrow demand segment.',
            align: 'gaz-6',
          },
          {
            label: 'Registry inclusion',
            text: 'There may be difficulties with registry inclusion due to the specifics of this investment format.',
          },
          {
            label: 'Maintenance and support',
            text: 'A substantial team of specialists is required for both mining operations and electrical engineering support.',
          },
        ],
      },
      {
        id: 'grid',
        title: 'Power grid',
        icon: 'el',
        items: [
          {
            label: 'Land cost',
            text: 'Land is less expensive: prices are based on traditional commercial real estate.',
          },
          {
            label: 'Required investment amount',
            text: 'Investment volume is significantly lower because there is no need for your own generation capacity.',
            align: 'row-2',
          },
          {
            label: 'Electricity cost',
            text: 'Electricity costs are higher and directly depend on the region and tariff at the selected location.',
            align: 'row-3',
          },
          {
            label: 'Noise level',
            text: 'The standard noise level for mining farms, without the negative impact of additional sources.',
          },
          {
            label: 'Up-time',
            text: 'A more stable power option thanks to uninterrupted electricity supply from the utility company.',
          },
          {
            label: 'Resale prospects',
            text: 'Easier resale due to stable demand without technical complexities and the impact of specialized features.',
          },
          {
            label: 'Registry inclusion',
            text: 'A straightforward, regulated path to registry inclusion backed by numerous successful cases.',
            align: 'row-7',
          },
          {
            label: 'Maintenance and support',
            text: 'Only a team supporting farm operations is required, without power plant maintenance.',
          },
        ],
      },
    ] satisfies readonly DataCenterPowerCompareColumn[],
  },
} as const

export type DataCenterConstructionPageEn = typeof DATA_CENTER_CONSTRUCTION_PAGE_EN
