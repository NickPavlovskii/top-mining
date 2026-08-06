import type {
  BuyAsicClientProblemReview,
  BuyAsicClientProblemTab,
} from './client-problems'

function review(
  id: string,
  nameBars: number,
  timeAgo: string,
  text: string,
  source?: string,
): BuyAsicClientProblemReview {
  return { id, nameBars, timeAgo, rating: 1, parts: [{ text }], source }
}

export const BUY_ASIC_CLIENT_PROBLEMS_EN = {
  titleLead: 'COMMON CLIENT',
  titleAccent: 'PROBLEMS',
  replyLabel: 'Reply',
  iconSrc: '/images/podbor-majning-otelya/marquee-icon.png',
  tabs: [
    {
      id: 'prices',
      label: 'Rate and price increases',
      reviews: [
        review('prices-1', 8, '3 years ago', 'I sent a Whatsminer M21 in for repair. They repaired two boards without approval and charged 36,000. A month later, the same boards failed again. There is no warranty. Money wasted.', 'Yandex Maps'),
        review('prices-2', 12, '3 years ago', 'Terrible company. I placed ten working units with them. They immediately said that eight machines were faulty and needed repair. I paid for service. They worked on them for three months, fixed nothing, and still charged the full hosting fee. I ended up losing money and collected every unit in non-working condition, with burned boards and power supplies. If you value your money and peace of mind, avoid them.', 'Yandex Maps'),
        review('prices-3', 16, '5 months ago', 'I do not know where my previous review went, so here is the short version: an awful company. Do not deal with them. The administrator cannot resolve a single issue, and the technician is rude and dishonest. They deceive people.', 'vsyapravda.net'),
        review('prices-4', 7, '2 years ago', 'They breach contract terms and raise electricity prices without notice — twice in two months, although the agreement allows only one increase per year. You log into your account, see a negative balance, and your devices are switched off. Want them running? Pay.', 'Yandex Maps'),
        review('prices-5', 7, '2 years ago', 'Late payments, delivery delays, price hikes, rude managers, and disrespectful treatment of customers — these are the company’s drawbacks. I found places where GPUs are 20% cheaper. There are better options for buying, renting capacity, or hosting equipment; just search around.', 'finotzyvy.com'),
      ],
    },
    {
      id: 'repair',
      label: 'Repairs',
      reviews: [
        review('repair-1', 16, '9 months ago', 'I do not recommend this service center. Three days after I dropped off a device, they said it was ready. I installed it and it did not work or connect to my pool and worker. I reset it and returned it the next day under the 14-day warranty. The technician said the fan and power supply had failed and required an extra payment. They blamed me for breaking it and could not prove it had worked at their site. I had to pay extra to collect it. Poor customer service.'),
        review('repair-2', 7, '9 months ago', 'I completely agree with the previous review. The company’s service is nonexistent. Sales managers are somewhat customer-oriented, but hosting is a disaster. They promise connection within 10 days; almost a month passes and nothing happens. They answer messages every three days, usually just saying “wait.” Look for other options.', 'Yandex Maps'),
        review('repair-3', 11, '2 years ago', 'Avoid them and do not waste your time. They say many smart things over the phone, but reading the hosting agreement makes everything clear: they offer no guarantees, impose penalties and extra costs on you, and can unilaterally raise the fee.', 'Yandex Maps'),
        review('repair-4', 7, '2 years ago', 'The company did not meet expectations. I received an attractive equipment quote, transferred the agreed amount, and was later sent prices far higher than the original offer. They said another customer had bought my batch, so they had to order it at different rates. I had planned to invest several more million rubles, but I no longer want to work with them.', 'finotzyvy.com'),
      ],
    },
    {
      id: 'delivery',
      label: 'Delivery times',
      reviews: [
        review('delivery-1', 13, '3 years ago', 'These people do not care about customers; they profit from mining. Stay away from their hosting hotel: it is unstable, outages are constant, support is extremely slow, and they unilaterally raise service rates almost every month. They do not honor contracts and are not concerned about lawsuits.', 'Yandex Maps'),
        review('delivery-2', 5, '2 years ago', 'I am an experienced investor, but this company managed to deceive me. One million rubles disappeared. The equipment purchase never happened, prices turned out much higher, and the company did not send quality certificates or product photos despite my request.', 'vsyapravda.net'),
        review('delivery-3', 13, '9 months ago', 'Awful company. They never meet supply contract terms. The first time they cited force majeure and I believed them. On the second delivery, they are already three months late and provide no information. We are preparing a lawsuit.', 'vsyapravda.net'),
      ],
    },
    {
      id: 'service',
      label: 'Service',
      reviews: [
        review('service-1', 5, '3 years ago', 'They deceive customers and provided neither a certificate nor a license. It is unclear on what basis they operate. I signed a six-month hosting agreement and still have not received my returns.', 'vsyapravda.net'),
        review('service-2', 10, '2 years ago', 'In the morning, they doubled the price of an item reserved the previous evening. Website prices do not match reality.', 'vsyapravda.net'),
        review('service-3', 6, '1 year ago', 'It is impossible to get through by phone. Why do they offer hosting services at all?'),
        review('service-4', 17, '1 year ago', 'I asked my manager to sell two ASIC miners hosted with them. The manager disappeared along with the miners, or perhaps the money. Everything had been fine for nearly a year, but now they say the manager no longer works there. The company refused to resolve the problem.', 'vsyapravda.net'),
        review('service-5', 10, '1 year ago', 'Awful company. You will lose money. More than half of your devices will not work under various pretexts.', 'vsyapravda.net'),
        review('service-6', 8, '3 years ago', 'Very poor company. They do not honor their agreements and take a long time to answer any question. Technical support works only from 10:00 to 18:00, not 24 hours as the website says. If your equipment goes offline overnight, they say it is your problem.', 'Yandex Maps'),
      ],
    },
    {
      id: 'hosting',
      label: 'Hosting',
      reviews: [
        review('hosting-1', 9, '1 month ago', 'They constantly switch off equipment under various pretexts, but in reality redirect it for their own needs. They also disable monitoring, then reflash devices after reconnecting so no trace remains. They tell the customer it is a technical issue. We lost around three months of income per year; in effect, they deceive clients and steal capacity.', 'top-mining.ru'),
        review('hosting-2', 17, '7 months ago', 'Awful company. They delivered equipment in six months instead of the 40 days stated in the contract. Every time they made up an excuse. They only started acting after a pre-trial claim was filed. I do not recommend dealing with them: you will spend a great deal of time and stress and risk losing your money.', 'Yandex Maps'),
        review('hosting-3', 13, '2 years ago', 'We ordered devices that were promised in two weeks but waited two months. There was no proper pre-sale inspection, and the devices failed after two weeks. They refused to repair or replace them at their expense, would not compromise, and provide only a five-day repair warranty. I do not recommend this company.', 'Yandex Maps'),
        review('hosting-4', 4, '10 days ago', 'Awful company; all negative reviews are true. The equipment not only stays offline for long periods and constantly burns out, but I believe it is deliberately made to work for another wallet under various pretexts. Anyone willing to seek justice, please leave your contacts below my review.', 'Yandex Maps'),
      ],
    },
  ] satisfies readonly BuyAsicClientProblemTab[],
} as const
