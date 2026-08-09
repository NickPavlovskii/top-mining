SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Top 10 cloud mining platforms: 2026 ranking$tmj$,
       $tmj$Skip noisy farms and heavy CapEx вЂ” cloud mining rankings for investors who want remote hashrate.$tmj$,
       $tmj$Cloud mining data centers$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining has traditionally been associated with noisy farms and high hardware and maintenance costs. However, with the development of technology, more and more investors are choosing cloud mining - a way to mine digital assets without the need to own their own hardware. This model is especially attractive to beginners and those who want to participate in the crypto market with minimal technical difficulties.","text":"Cryptocurrency mining has traditionally been associated with noisy farms and high hardware and maintenance costs. However, with the development of technology, more and more investors are choosing cloud mining - a way to mine digital assets without the need to own their own hardware. This model is especially attractive to beginners and those who want to participate in the crypto market with minimal technical difficulties."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In this article we will look at what cloud mining is, its pros and cons, which platforms you should pay attention to and how to choose a reliable provider.","text":"In this article we will look at what cloud mining is, its pros and cons, which platforms you should pay attention to and how to choose a reliable provider."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is cloud mining?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cloud mining is the rental of computing power from specialized data centers. The user pays for the hashrate, and the income from the mined coins goes to his wallet. All operations with the equipment (cooling, configuration, maintenance) are undertaken by the provider. This allows you to mine without purchasing equipment, setting up farms or spending on electricity. A person simply purchases a contract, specifies a wallet for payments, and receives income in proportion to the purchased power.","text":"Cloud mining is the rental of computing power from specialized data centers. The user pays for the hashrate, and the income from the mined coins goes to his wallet. All operations with the equipment (cooling, configuration, maintenance) are undertaken by the provider. This allows you to mine without purchasing equipment, setting up farms or spending on electricity. A person simply purchases a contract, specifies a wallet for payments, and receives income in proportion to the purchased power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cloud mining - data centers in the clouds","src":"/images/articles/cloud-mining/what-is-cloud.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages of cloud mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Ease of entry. No technical knowledge is required - just register, select a tariff and pay for the contract;","Lack of equipment. The user does not purchase or maintain the farm. No need to look for hosting, monitor ventilation or troubleshoot problems;","Flexibility. Contracts can be issued for different terms and algorithms. This makes it possible to test several approaches with minimal investment;","No noise or heat. The lack of physical equipment makes cloud mining convenient even in a city apartment."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Disadvantages and risks","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Risks of deception. There are many scammers on the market that imitate cloud mining. They often operate like financial pyramids, paying out вЂњincomeвЂќ at the expense of new investors;","Lack of control. The user does not have access to the equipment. It depends entirely on the integrity and competence of the provider;","Long payback period. Due to fees, market volatility and the constant increase in network complexity, actual returns may be lower than expected;","Freeze payments when the market falls. Some platforms may temporarily suspend payments when the coin exchange rate drops significantly, citing the unprofitability of mining."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a cloud mining platform?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When choosing a cloud mining platform, you should consider the following criteria:","text":"When choosing a cloud mining platform, you should consider the following criteria:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Reputation and duration of work - choose projects that have existed for several years, with reviews on independent forums and aggregators;","Transparency вЂ“ availability of real data centers, photographs, online monitoring, detailed information about tariffs and conditions;","Contracts and algorithms - see what coins are available for mining, what is the term and profitability of the contracts;","Hidden fees вЂ“ consider the cost of service, withdrawal fees and other fees;","Support and interface вЂ“ the platform should be understandable, with the ability to easily contact technical support."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How to choose a cloud mining platform","src":"/images/articles/cloud-mining/how-to-choose.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Secrets and subtleties of choosing a cloud mining provider","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Let's talk about recommendations from experienced users that will help you make the right choice:","text":"Let's talk about recommendations from experienced users that will help you make the right choice:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Check reviews on forums (Bitcointalk, Reddit). Reviews and experiences of other users will help you avoid mistakes and fakes;","Don't chase high returns. Exaggerated promises are a common sign of deception. Better less, but stable;","Follow the cryptocurrency rate. Abrupt changes in the market may affect the return on contracts;","Beware of platforms without public information. Lack of office, team and transparency is a red flag;","Start with small investments. Test the service at the minimum rate before increasing your investment."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Secrets of choosing a cloud mining provider","src":"/images/articles/cloud-mining/secrets.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Hashmart (Hashmart)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Hashmart cloud service allows you to mine only two coins - BTC mining and ETH staking. The platform is optimal for beginners, since launching is simple, which is also facilitated by the presence of a high-quality Russian-language interface. The project has existed since 2018, which is a beneficial advantage for cloud mining.","text":"The Hashmart cloud service allows you to mine only two coins - BTC mining and ETH staking. The platform is optimal for beginners, since launching is simple, which is also facilitated by the presence of a high-quality Russian-language interface. The project has existed since 2018, which is a beneficial advantage for cloud mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another distinctive feature of the Hashmart project is a powerful referral program, within which not only the inviter, but also the invitee receives a bonus. True, the referral link is carried out for only a year, which is a controversial decision.","text":"Another distinctive feature of the Hashmart project is a powerful referral program, within which not only the inviter, but also the invitee receives a bonus. True, the referral link is carried out for only a year, which is a controversial decision."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Hashmart - cloud mining","src":"/images/articles/cloud-mining/hashmart.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2018"},{"label":"Location","value":"Cyprus"},{"label":"Contract duration","value":"from 1 year"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mining only two cryptocurrencies;","The referral link is valid for 1 year."],"pros":["Easy start and ease of operation;","Favorable bonus program;","There are no commissions for withdrawing earnings;","Minimum entry threshold."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Hashshiny","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hong Kong cloud mining service, providing its services since 2018. One of the advantages of this tool is a good selection of cryptocurrencies for mining. The cost of Hashshiny services depends on the chosen coin; you can sign a contract for a period of 1 year, and in some cases the option of unlimited cooperation is available. In addition, Hashshaini has its own HST token, the ownership of which comes with various privileges and bonuses.","text":"Hong Kong cloud mining service, providing its services since 2018. One of the advantages of this tool is a good selection of cryptocurrencies for mining. The cost of Hashshiny services depends on the chosen coin; you can sign a contract for a period of 1 year, and in some cases the option of unlimited cooperation is available. In addition, Hashshaini has its own HST token, the ownership of which comes with various privileges and bonuses."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This cloud mining attracts users with its loyal commission fees, the presence of a mobile application, flexible settings, and a variety of replenishment methods. Among the shortcomings are poor-quality translation of the site into Russian and far from the fastest technical support for users.","text":"This cloud mining attracts users with its loyal commission fees, the presence of a mobile application, flexible settings, and a variety of replenishment methods. Among the shortcomings are poor-quality translation of the site into Russian and far from the fastest technical support for users."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Hashshiny - cloud mining","src":"/images/articles/cloud-mining/hashshiny.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2018"},{"label":"Location","value":"Hong Kong"},{"label":"Contract duration","value":"from 1 year"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Weak user support;","Poor quality translation into Russian."],"pros":["Several options for cryptocurrency mining;","Easy start and quick start;","Availability of your own token;","Attractive affiliate program;","Small commissions."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Hashing24 (Hashing 24)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are absolute record holders in the cloud mining segment in our rating, who were born even earlier than most exchanges, pools, wallets and equipment manufacturers. We are talking about the Hashing24 service, which has been operating since 2012. This lifespan in the crypto environment indicates a good reputation of the service, which is especially valuable for cloud mining. However, Hashing 24 recently limited the work opportunities of miners from Russia and Belarus, so interest in the project in the CIS is rapidly declining.","text":"There are absolute record holders in the cloud mining segment in our rating, who were born even earlier than most exchanges, pools, wallets and equipment manufacturers. We are talking about the Hashing24 service, which has been operating since 2012. This lifespan in the crypto environment indicates a good reputation of the service, which is especially valuable for cloud mining. However, Hashing 24 recently limited the work opportunities of miners from Russia and Belarus, so interest in the project in the CIS is rapidly declining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Irish service Hashing24 offers mining only BTC with a contract period of 1 year. The popularity of the project is complemented by the ability not only to mine, but also to trade earned assets, and a convenient calculator simplifies the work of users. Another important reputational asset of the site is its long-term partnership with Bitfury, a well-known blockchain company whose role in the world of digital assets cannot be overestimated.","text":"The Irish service Hashing24 offers mining only BTC with a contract period of 1 year. The popularity of the project is complemented by the ability not only to mine, but also to trade earned assets, and a convenient calculator simplifies the work of users. Another important reputational asset of the site is its long-term partnership with Bitfury, a well-known blockchain company whose role in the world of digital assets cannot be overestimated."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Hashing24 - cloud mining","src":"/images/articles/cloud-mining/hashing24.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2012"},{"label":"Location","value":"Ireland"},{"label":"Contract duration","value":"from 1 year"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Inability to work for users from Russia and Belarus;","Mining only one coin;","The need to pay a daily service fee;","Frequent lack of spare capacity."],"pros":["The oldest cloud mining service in the world;","Partnership with Bitfury;","Expanded functionality of the service through trading;","Quick start of production."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Genesis Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest cloud mining in our rating: Genesis Mining was born in 2013. Since then, the project has successfully solved user problems by providing production facilities for rent. The tool works with multiple cryptocurrencies, providing four pricing plans. Despite its age, the site is highly popular among miners - very often the offers do not have available mining options. You have to wait for free capacity for some time.","text":"One of the oldest cloud mining in our rating: Genesis Mining was born in 2013. Since then, the project has successfully solved user problems by providing production facilities for rent. The tool works with multiple cryptocurrencies, providing four pricing plans. Despite its age, the site is highly popular among miners - very often the offers do not have available mining options. You have to wait for free capacity for some time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite the fact that Genesis Mining is positioned as a multifunctional international platform, Russian-speaking users note some problems with the translation of sections of the site. This is compensated by the good work of the technical support service and a fairly transparent operating system. You can start cloud mining without unnecessary headaches, and a profitable bonus program allows you to generate passive income from referrals.","text":"Despite the fact that Genesis Mining is positioned as a multifunctional international platform, Russian-speaking users note some problems with the translation of sections of the site. This is compensated by the good work of the technical support service and a fairly transparent operating system. You can start cloud mining without unnecessary headaches, and a profitable bonus program allows you to generate passive income from referrals."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Genesis Mining - cloud mining","src":"/images/articles/cloud-mining/genesis.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2013"},{"label":"Location","value":"China"},{"label":"Contract duration","value":"from 1 year"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"yes (incomplete)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not the most impressive profitability among competitors;","There is often no spare capacity."],"pros":["Well-known cloud mining with a good reputation and history;","Several coins to mine;","Cooperation with manufacturers of mining equipment;","Easy registration, quick launch;","Good technical support;","Maximum transparency of work;","Bonus program."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: ECOS Cloud Mining (Ecos Cloud Mining)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another well-known cloud mining platform is ECOS Cloud Mining. This is part of an entire ecosystem located in the free economic zone of Armenia - in addition to mining, Ecos is an exchanger, wallet and seller of investment portfolios. The tool has a good reputation; there have been no high-profile scandals associated with the name ECOS Cloud Mining.","text":"Another well-known cloud mining platform is ECOS Cloud Mining. This is part of an entire ecosystem located in the free economic zone of Armenia - in addition to mining, Ecos is an exchanger, wallet and seller of investment portfolios. The tool has a good reputation; there have been no high-profile scandals associated with the name ECOS Cloud Mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This cloud mining offers the extraction of only one asset вЂ“ Bitcoin, which will be a disadvantage for some investors. Contracts with ECOS Cloud Mining are of long duration, and penalties for late payments are significant. The tool is more aimed at experienced miners, as the interface may not be clear to beginners.","text":"This cloud mining offers the extraction of only one asset вЂ“ Bitcoin, which will be a disadvantage for some investors. Contracts with ECOS Cloud Mining are of long duration, and penalties for late payments are significant. The tool is more aimed at experienced miners, as the interface may not be clear to beginners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ECOS Cloud Mining - cloud mining","src":"/images/articles/cloud-mining/ecos.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2017"},{"label":"Location","value":"Armenia"},{"label":"Contract duration","value":"from 24 months"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Long term contracts;","High minimum withdrawal amount вЂ“ from 0.01 BTC;","Mining of only one coin вЂ“ BTC;","An interface that can be difficult to use."],"pros":["Cloud mining ECOS Cloud Mining is part of a larger infrastructure;","Confident work without scandals and high-profile cases since 2017;","Low entry threshold вЂ“ from $150;","Daily earnings accrual;","Attractive promotions and profitable essay program."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: BeMine (BiMain)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known platform where you can purchase not only production facilities, but also equipment, as well as its part (share). The tool appeared in 2018 and has been operating successfully since then, offering the extraction of only one asset вЂ“ BTC. The system interface is simple and clear, there is support for the Russian language, as well as several mining formats.","text":"A well-known platform where you can purchase not only production facilities, but also equipment, as well as its part (share). The tool appeared in 2018 and has been operating successfully since then, offering the extraction of only one asset вЂ“ BTC. The system interface is simple and clear, there is support for the Russian language, as well as several mining formats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are also plenty of disadvantages - a high entry threshold, impressive withdrawal fees, and the impossibility of selling part of the purchased equipment. Users note the peculiar work of support, which does not always respond quickly and efficiently to requests. Also, many may be put off by long contracts - from 6 months.","text":"There are also plenty of disadvantages - a high entry threshold, impressive withdrawal fees, and the impossibility of selling part of the purchased equipment. Users note the peculiar work of support, which does not always respond quickly and efficiently to requests. Also, many may be put off by long contracts - from 6 months."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BeMine - cloud mining","src":"/images/articles/cloud-mining/bemine.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2018"},{"label":"Location","value":"Seychelles"},{"label":"Contract duration","value":"from 6 months"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High commissions;","Mining of only one token вЂ“ BTC;","There is no possibility of selling a previously acquired miner's share."],"pros":["Several tariff plans with different profitability and contract duration;","Possibility of purchasing not only power, but equipment (as well as its share);","Availability of your own PAWДЂ token, with which you can make purchases in the internal store;","Profitable affiliate program;","Simple interface with full support for the Russian language;","Lots of top up options."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: BitDeer (BitDir)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Chinese cloud service is supported by mining participants such as Bitmain, BTC.com, EXMO and Antpool, which is especially valued in this industry. Such big names in the list of partners indicate the possibility of secure cloud mining in a rather risky industry filled with scammers and pyramid schemes. Largely due to this reason, the BitDeer service ended up in the TOP 3 of our rating.","text":"The Chinese cloud service is supported by mining participants such as Bitmain, BTC.com, EXMO and Antpool, which is especially valued in this industry. Such big names in the list of partners indicate the possibility of secure cloud mining in a rather risky industry filled with scammers and pyramid schemes. Largely due to this reason, the BitDeer service ended up in the TOP 3 of our rating."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The site offers mining of several cryptocurrency options, however, the full list is not always available (probably due to the lack of free capacity). The service is quite simple and understandable; the main sections are translated into Russian, which simplifies working with the site. The terms of the contract are varied, and there is no possibility of early termination (like the vast majority of competitors).","text":"The site offers mining of several cryptocurrency options, however, the full list is not always available (probably due to the lack of free capacity). The service is quite simple and understandable; the main sections are translated into Russian, which simplifies working with the site. The terms of the contract are varied, and there is no possibility of early termination (like the vast majority of competitors)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BitDeer - cloud mining","src":"/images/articles/cloud-mining/bitdeer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2018"},{"label":"Location","value":"China"},{"label":"Contract duration","value":"30-360 days"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A complete list of mined coins is not always available;","There is no possibility of early termination of the contract."],"pros":["Support from well-known market participants;","Good reputation for reliable service;","Several coin options for mining;","Quite favorable commissions for the user;","Quick start;","Daily rewards."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Binance Cloud Mining (Binance Cloud Mining)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cloud mining service from the world's leading crypto exchange. The tool is part of a full-fledged Binance eco-system, which consists of an exchange, a pool and many other platforms, including cloud mining of cryptocurrencies. Belonging to the largest and most famous exchange is a key advantage of Binance Cloud Mining, which makes using the service reliable and safe.","text":"Cloud mining service from the world's leading crypto exchange. The tool is part of a full-fledged Binance eco-system, which consists of an exchange, a pool and many other platforms, including cloud mining of cryptocurrencies. Belonging to the largest and most famous exchange is a key advantage of Binance Cloud Mining, which makes using the service reliable and safe."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"By purchasing power on this site, the user automatically uses his own Binance pool, which is beneficial to the site. So Binance receives a double commission (both for cloud mining and pool services). However, the product took second place in our ranking largely due to its affiliation: there are many scammers in the cloud cryptocurrency mining segment, so being associated with a well-known market participant is an important advantage.","text":"By purchasing power on this site, the user automatically uses his own Binance pool, which is beneficial to the site. So Binance receives a double commission (both for cloud mining and pool services). However, the product took second place in our ranking largely due to its affiliation: there are many scammers in the cloud cryptocurrency mining segment, so being associated with a well-known market participant is an important advantage."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Binance Cloud Mining - cloud mining","src":"/images/articles/cloud-mining/binance.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2022"},{"label":"Location","value":"Cayman Islands"},{"label":"Contract duration","value":"from 30 days"},{"label":"Early termination","value":"No"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Ability to work with only one algorithm вЂ“ SHA-256 (BTC mining);","Double commission: 1.5% for cloud mining and 2.5% for using the internal pool;","Unclear prospects for work in the RU segment (the exchange has already limited work with Russian users);","Lack of anonymity - the account on Binance Cloud Mining is linked to the main account on Binance;","A young product - service appeared in 2022."],"pros":["Belonging to the most famous stock exchange in the world;","No separate verification (the account is linked to the account on Binance);","Daily income accrual."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: NiceHash (NiceHash)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The NiceHash service is often classified as a cloud mining tool, however, this is not entirely correct from a conceptual point of view. The fact is that NiceHash is a platform where production facilities are rented out not by equipment manufacturers or even intermediaries, but directly by private owners of ASICs, video cards and farms. This allows you to conclude contracts with a shorter period and have a more flexible approach to cooperation formats.","text":"The NiceHash service is often classified as a cloud mining tool, however, this is not entirely correct from a conceptual point of view. The fact is that NiceHash is a platform where production facilities are rented out not by equipment manufacturers or even intermediaries, but directly by private owners of ASICs, video cards and farms. This allows you to conclude contracts with a shorter period and have a more flexible approach to cooperation formats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"NiceHash is a popular platform with mining pool features - a brand known to any experienced miner who seeks to profitably operate in the cryptocurrency market in a variety of formats.","text":"NiceHash is a popular platform with mining pool features - a brand known to any experienced miner who seeks to profitably operate in the cryptocurrency market in a variety of formats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"NiceHash - cloud mining","src":"/images/articles/cloud-mining/nicehash.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year the site was founded","value":"2014"},{"label":"Location","value":"British Virgin Islands"},{"label":"Contract duration","value":"from 1 day"},{"label":"Early termination","value":"There is"},{"label":"Russification","value":"There is"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Payouts only in BTC;","Recorded cases of hacking of users."],"pros":["The oldest and proven site with a good reputation;","Format of work with individuals;","Possibility of early termination of the contract;","Flexible and dynamic cloud mining conditions;","Lots of coins to mine;","Fairly simple setup and quick start;","Detailed and detailed statistics;","Full support for the Russian language."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cloud mining is a convenient tool for mining cryptocurrency without the headaches associated with operating the equipment. It is especially relevant for those who want to participate in the market passively, with a minimum level of technical involvement.","text":"Cloud mining is a convenient tool for mining cryptocurrency without the headaches associated with operating the equipment. It is especially relevant for those who want to participate in the market passively, with a minimum level of technical involvement."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, it is important to remember: as with any cryptocurrency industry, there are many risks. Only careful selection of the platform, caution and control will help avoid losses and make cloud mining a stable source of income.","text":"However, it is important to remember: as with any cryptocurrency industry, there are many risks. Only careful selection of the platform, caution and control will help avoid losses and make cloud mining a stable source of income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Top 10 popular mining calculators: pros and cons$tmj$,
       $tmj$Not all mining calculators are equal вЂ” compare features, accuracy, and trade-offs so you can estimate earnings better.$tmj$,
       $tmj$Calculator and Bitcoin$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing a mining calculator is not only about finding a convenient tool вЂ” it is also a way to earn more from cryptocurrency mining. The features of tools that seem identical in purpose can differ seriously. In this article we review the capabilities of the most popular mining calculators and identify their pros and cons. Whattomine, Minerstat, Coinwarz, Cryptobot, Cryptocompare, Nicehash, BTC.com, Asicminervalue, 2cryptocalc, Mining Calculator вЂ” our list of analysis tools.","text":"Choosing a mining calculator is not only about finding a convenient tool вЂ” it is also a way to earn more from cryptocurrency mining. The features of tools that seem identical in purpose can differ seriously. In this article we review the capabilities of the most popular mining calculators and identify their pros and cons. Whattomine, Minerstat, Coinwarz, Cryptobot, Cryptocompare, Nicehash, BTC.com, Asicminervalue, 2cryptocalc, Mining Calculator вЂ” our list of analysis tools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Calculator and Bitcoin","src":"/images/articles/mining-calculators/calculator-bitcoin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a mining calculator and why do you need it?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining calculator is an online service or app that estimates potential cryptocurrency mining profitability considering many factors: hashrate, power consumption, current network difficulty, coin price, and electricity tariffs.","text":"A mining calculator is an online service or app that estimates potential cryptocurrency mining profitability considering many factors: hashrate, power consumption, current network difficulty, coin price, and electricity tariffs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Simply put, it is your personal financial analyst in the world of crypto mining.","text":"Simply put, it is your personal financial analyst in the world of crypto mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The calculatorвЂ™s goal is simple вЂ” assessing economic feasibility. It helps you understand:","text":"The calculatorвЂ™s goal is simple вЂ” assessing economic feasibility. It helps you understand:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Whether it is worth running a given miner;","Which cryptocurrency is more profitable to mine right now;","How much money will go to electricity;","When hardware investments will pay back."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A calculator also helps avoid typical mistakes: overestimating yield, choosing an outdated algorithm, or ignoring energy cost.","text":"A calculator also helps avoid typical mistakes: overestimating yield, choosing an outdated algorithm, or ignoring energy cost."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How do you use a mining calculator?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Most calculators have a simple form with several fields. A typical workflow:","text":"Most calculators have a simple form with several fields. A typical workflow:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Choose a coin or algorithm вЂ” for example Bitcoin (SHA-256), Ethereum Classic (Etchash), Kaspa (kHeavyHash);","Enter hashrate вЂ” the hardwareвЂ™s power;","Enter power consumption вЂ” in watts (W), usually from the deviceвЂ™s specs;","Set electricity cost вЂ” in rubles or dollars per kWh."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Extra parameters вЂ” pool fee, coin price, network difficulty (often filled automatically).","text":"Extra parameters вЂ” pool fee, coin price, network difficulty (often filled automatically)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"After you hit calculate, the calculator provides:","text":"After you hit calculate, the calculator provides:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Daily/monthly income;","Electricity cost;","Net profit;","Payback in days or months."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining calculator form","src":"/images/articles/mining-calculators/mining-calculator-ru.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What profitability calculator use cases exist?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Calculators are used in many situations:","text":"Calculators are used in many situations:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Before buying hardware вЂ” estimating a modelвЂ™s yield;","Comparing algorithms/coins вЂ” picking the most profitable coin right now;","Planning farm expansion вЂ” calculating total power and energy costs;","Accounting for seasonal electricity tariffs вЂ” especially relevant for home mining;","вЂњWhat ifвЂќ analysis вЂ” for example, вЂњwhat if the coin price drops 20%вЂќ."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What tasks do mining calculators solve?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Helps you avoid spending money blindly and make data-based decisions;","title":"Financial calculation"},{"text":"Understand which hardware works more efficiently on certain coins;","title":"Hardware optimization"},{"text":"Given difficulty dynamics and price swings, you can prepare for falling yield;","title":"Risk assessment"},{"text":"To build a long-term mining strategy.","title":"Strategic planning"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What differences exist between calculators?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are many calculators, each with its own traits. Main differences:","text":"There are many calculators, each with its own traits. Main differences:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["By supported coins вЂ” some are universal (e.g. WhatToMine), others target specific coins;","By data accuracy вЂ” more advanced services regularly update rates, network difficulty, and block rewards;","By interface вЂ” from minimal tables to detailed panels with charts and forecasts;","By ability to account for fees, pools, and cooling costs."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Mining Calculator mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A service by Russian developers that stays available regardless of blocks and sanctions вЂ” unlike other calculators owned by Western companies. No VPN is required, and ease of use is pleasantly surprising.","text":"A service by Russian developers that stays available regardless of blocks and sanctions вЂ” unlike other calculators owned by Western companies. No VPN is required, and ease of use is pleasantly surprising."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining CalculatorвЂ™s developers managed to combine simplicity with a rich set of inputs and outputs.","text":"Mining CalculatorвЂ™s developers managed to combine simplicity with a rich set of inputs and outputs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Today the Mining Calculator mining calculator has one of the most impressive feature sets among competitors.","text":"Today the Mining Calculator mining calculator has one of the most impressive feature sets among competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"And it is encouraging that this is a Russian product that absorbed all the experience of using Western analogues.","text":"And it is encouraging that this is a Russian product that absorbed all the experience of using Western analogues."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining Calculator","src":"/images/articles/mining-calculators/mining-calculator-result.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No calculation by popular pools (this feature exists only in some calculators, and calculation accuracy is questioned)."],"pros":["Basic and advanced parameters вЂ” not only coin/algorithm, ASIC model, electricity cost, but also pool fee, block reward, network hashrate, hardware power draw, and even difficulty increase;","Ability to calculate at the current BTC rate and work with forecast values (including the ruble-to-dollar rate);","Results in various currencies for different time periods;","Simple, intuitive interface."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: 2cryptocalc mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"2cryptocalcвЂ™s calculator interfaces somewhat resemble WhattomineвЂ™s look. Developers may have followed the logic of the best-known serviceвЂ™s creators, but the two products should be considered separately.","text":"2cryptocalcвЂ™s calculator interfaces somewhat resemble WhattomineвЂ™s look. Developers may have followed the logic of the best-known serviceвЂ™s creators, but the two products should be considered separately."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The 2cryptocalc mining service works with a limited set of coins, but process automation is clearly strong.","text":"The 2cryptocalc mining service works with a limited set of coins, but process automation is clearly strong."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Users also get two modes: choose a hardware model (specs fill automatically) or enter hashrate manually. The miner picks the approach based on preference вЂ” an important option not found in every calculator. 2cryptocalc is a welcome exception.","text":"Users also get two modes: choose a hardware model (specs fill automatically) or enter hashrate manually. The miner picks the approach based on preference вЂ” an important option not found in every calculator. 2cryptocalc is a welcome exception."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"2cryptocalc can be called a solid solution for most miners. But if you plan to work with extended statistics, look at alternatives.","text":"2cryptocalc can be called a solid solution for most miners. But if you plan to work with extended statistics, look at alternatives."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"2cryptocalc вЂ” coin comparison","src":"/images/articles/mining-calculators/profit-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited coin set;","Less extended statistics versus ranking leaders."],"pros":["Process automation via two interface modes;","A small coin set that simplifies finding what you need (from the most popular list);","A library listing the most profitable ASICs and cards."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Asicminervalue mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A product with strong capabilities and a minimal set of drawbacks is the Asicminervalue calculator. First, it is simple and clear even for beginners thanks to a clean interface not overloaded with features and distractions. It also has two modes вЂ” вЂњProfitabilityвЂќ and вЂњEfficiencyвЂќ вЂ” letting you view mining from two angles. First: a list of ASICs with maximum income (when electricity is cheapest). Second: options that avoid overpaying for the вЂњoutlet.вЂќ That distinctive Asicminervalue trait sets the tool apart from competitors.","text":"A product with strong capabilities and a minimal set of drawbacks is the Asicminervalue calculator. First, it is simple and clear even for beginners thanks to a clean interface not overloaded with features and distractions. It also has two modes вЂ” вЂњProfitabilityвЂќ and вЂњEfficiencyвЂќ вЂ” letting you view mining from two angles. First: a list of ASICs with maximum income (when electricity is cheapest). Second: options that avoid overpaying for the вЂњoutlet.вЂќ That distinctive Asicminervalue trait sets the tool apart from competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"You can conclude that Asicminervalue is a somewhat unusual miner tool. It is unlikely to be your main service; rather, it is an excellent add-on to any of the other sites we reviewed above.","text":"You can conclude that Asicminervalue is a somewhat unusual miner tool. It is unlikely to be your main service; rather, it is an excellent add-on to any of the other sites we reviewed above."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Asicminervalue","src":"/images/articles/mining-calculators/asicminervalue.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Few input fields;","No coin list: calculation is algorithm-only."],"pros":["Simple interface вЂ” nothing extra, just an info table of ASICs;","Two clear modes, especially useful for choosing an ASIC wisely;","Lists include the most popular miner models at the moment;","Ability to approach mining math not only by revenue but also by energy efficiency;","Hardware noise level info is included вЂ” a nice bonus."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: BTC.com mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another pool with its own calculator is the well-known BTC.com. Calling this product large-scale is hard, because features are limited to a few coins and basic functions. Still, for a sizable share of miners that is enough.","text":"Another pool with its own calculator is the well-known BTC.com. Calling this product large-scale is hard, because features are limited to a few coins and basic functions. Still, for a sizable share of miners that is enough."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The BTC.com calculator is a kind of balance between simplicity and accessibility. Advanced miners will clearly lack features, but small farm owners will be fine.","text":"The BTC.com calculator is a kind of balance between simplicity and accessibility. Advanced miners will clearly lack features, but small farm owners will be fine."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Overall, BTC.com is fairly simple, but in some cases the available features are clearly insufficient.","text":"Overall, BTC.com is fairly simple, but in some cases the available features are clearly insufficient."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BTC.com Mining Calculator","src":"/images/articles/mining-calculators/btc-calculator.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited hardware models in the library, complicating yield estimates for some devices;","Works with only 7 coins, which also constrains the miner using this calculator;","Among input settings вЂ” only electricity cost."],"pros":["Ease of use largely thanks to a simple interface and mobile optimization;","Detailed mining statistics that open decent analytics opportunities."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Nicehash mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Nicehash (also the NiceHash mining pool of the same name) is another fairly easy-to-learn product with a basic option set. The interface is intuitive, but in chasing simplicity the creators missed several important details.","text":"Nicehash (also the NiceHash mining pool of the same name) is another fairly easy-to-learn product with a basic option set. The interface is intuitive, but in chasing simplicity the creators missed several important details."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The key drawback is no coin selection for mining вЂ” a Nicehash user can only specify hardware and/or mining algorithm.","text":"The key drawback is no coin selection for mining вЂ” a Nicehash user can only specify hardware and/or mining algorithm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Overall, Nicehash is similar to many competing products: it lacks bright features and strong trump cards вЂ” unless you count automatic configuration detection, which is rarely needed in practice.","text":"Overall, Nicehash is similar to many competing products: it lacks bright features and strong trump cards вЂ” unless you count automatic configuration detection, which is rarely needed in practice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Cannot calculate yield for a specific coin;","Limited features due to a modest set of basic settings."],"pros":["Simple, clear interface that is easy to learn;","Mining yield calculation on three main device types вЂ” ASICs, GPUs, and CPUs;","Automatic mining configuration detection вЂ” a clear differentiator versus most competitors;","A solid volume of information вЂ” yield in national currencies, daily averages, and historical metrics."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Cryptocompare mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A simple tool with basic features that suits beginners or owners of small farms (or single mining devices) better.","text":"A simple tool with basic features that suits beginners or owners of small farms (or single mining devices) better."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocompare offers yield calculation for only six of the most popular coins, which is exactly why those who do not need broader features choose it.","text":"Cryptocompare offers yield calculation for only six of the most popular coins, which is exactly why those who do not need broader features choose it."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Simplicity is CryptocompareвЂ™s main distinguishing trait. If you seek a powerful tool with wide capabilities, you will need something else.","text":"Simplicity is CryptocompareвЂ™s main distinguishing trait. If you seek a powerful tool with wide capabilities, you will need something else."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocompare is perhaps the most contradictory yield service. Start from your tasks and miner experience: if you are just meeting the BTC world, the product will seem interesting. In other situations this calculatorвЂ™s features will clearly fall short.","text":"Cryptocompare is perhaps the most contradictory yield service. Start from your tasks and miner experience: if you are just meeting the BTC world, the product will seem interesting. In other situations this calculatorвЂ™s features will clearly fall short."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocompare","src":"/images/articles/mining-calculators/cryptocompare.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No ASIC library: you must enter hardware hashrate manually;","Limited coin set: BTC, ETC, XMR, ZEC, LTC, DASH. No ETH yield calculation;","Modest settings and options that constrain the user."],"pros":["Fast calculation thanks to a minimal set of settings and options;","Light, clear interface due to the serviceвЂ™s simplicity."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Cryptobot mining calculator bot","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Cryptobot Telegram bot is a broad toolkit often built on the well-known messenger platform. It can combine calculator, wallet, exchange, and other mining and crypto tools.","text":"The Cryptobot Telegram bot is a broad toolkit often built on the well-known messenger platform. It can combine calculator, wallet, exchange, and other mining and crypto tools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main thing to understand: crypto bots on non-specialized platforms are far from the most reliable way to work with BTC.","text":"The main thing to understand: crypto bots on non-specialized platforms are far from the most reliable way to work with BTC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptobot is safe to use for calculations, but buying, selling, and especially storing crypto assets there is strongly discouraged. There are no reliability or security guarantees: Telegram channels are created by the dozens (or hundreds) and shut down just as fast.","text":"Cryptobot is safe to use for calculations, but buying, selling, and especially storing crypto assets there is strongly discouraged. There are no reliability or security guarantees: Telegram channels are created by the dozens (or hundreds) and shut down just as fast."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Using crypto bots to calculate profit and yield is reasonable (while knowing data may be outdated). Using CryptobotвЂ™s extended features is unjustified risk that can lead to losing your assets.","text":"Using crypto bots to calculate profit and yield is reasonable (while knowing data may be outdated). Using CryptobotвЂ™s extended features is unjustified risk that can lead to losing your assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No guarantee of data accuracy: calculation may use an incorrect BTC rate;","If Cryptobot offers related functions (e.g. buying BTC, selling coins, swapping, storing) вЂ” that is a reason to worry about your assetsвЂ™ security;","Limited coins for calculation: usually BTC, ETH, and a few more."],"pros":["Built on a popular platform that is convenient to use: a Telegram bot is always at hand on your PC or phone;","Fast launch and quick calculation: as a rule the bot stores your chosen settings вЂ” ASIC model and electricity cost."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Coinwarz mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Next on our list is a less famous crypto product вЂ” Coinwarz. Its main distinctive feature is a record coin set for this product type: more than two hundred. If you plan to calculate mining on less popular crypto options, Coinwarz will be especially useful.","text":"Next on our list is a less famous crypto product вЂ” Coinwarz. Its main distinctive feature is a record coin set for this product type: more than two hundred. If you plan to calculate mining on less popular crypto options, Coinwarz will be especially useful."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is quite possible that a given mining coin exists only in this calculator, which sets it apart from competitors.","text":"It is quite possible that a given mining coin exists only in this calculator, which sets it apart from competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"CoinwarzвЂ™s only major drawback is no hardware library. You cannot quickly estimate BTC mining yield for a given ASIC: hashrate must be entered manually. Some will not see that as a Coinwarz drawback, because it lets you experiment with any values instead of sticking to presets.","text":"CoinwarzвЂ™s only major drawback is no hardware library. You cannot quickly estimate BTC mining yield for a given ASIC: hashrate must be entered manually. Some will not see that as a Coinwarz drawback, because it lets you experiment with any values instead of sticking to presets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No hardware library: hashrate must be entered manually."],"pros":["More than 200 coins for ASIC and GPU mining;","Difficulty and network hashrate charts that provide extended comparison, analytics, and forecasting;","Simple, clear interface adapted for mobile devices as well."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Minerstat mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another well-known tool among experienced miners: the Minerstat calculator with solid features and a friendly interface. The workflow is fairly simple, and the site is well adapted for mobile.","text":"Another well-known tool among experienced miners: the Minerstat calculator with solid features and a friendly interface. The workflow is fairly simple, and the site is well adapted for mobile."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This site suits mining calculation on ASICs and GPUs: features cover both algorithm types.","text":"This site suits mining calculation on ASICs and GPUs: features cover both algorithm types."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Minerstat calculator found an audience not only among Western farm owners but also Russian miners, which also adds weight to its advantages.","text":"The Minerstat calculator found an audience not only among Western farm owners but also Russian miners, which also adds weight to its advantages."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Minerstat","src":"/images/articles/mining-calculators/minerstat.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A modest settings set that somewhat limits data and user options."],"pros":["The service lets you choose from more than 120 coins вЂ” something not every calculator can claim;","Minerstat supports custom devices (beyond ASIC and GPU mining) by specifying device hashrate;","Build construction features. You must register on Minerstat вЂ” the function is only for authorized users;","Convenient Minerstat interface on PC and mobile."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Whattomine mining calculator","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest and perhaps best-known services letting a miner choose hardware and see yield. Whattomine (also known as Wattomine) has rich features for mining cryptocurrency on ASICs and GPUs. It resonates with crypto enthusiasts when choosing hardware and later during mining to optimize the process.","text":"One of the oldest and perhaps best-known services letting a miner choose hardware and see yield. Whattomine (also known as Wattomine) has rich features for mining cryptocurrency on ASICs and GPUs. It resonates with crypto enthusiasts when choosing hardware and later during mining to optimize the process."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Overall, Whattomine is a reference for those seeking a powerful helper in Bitcoin and its mining. But calling the service fully convenient is hard, even with extra tools such as a list of the most profitable and powerful ASICs at the moment.","text":"Overall, Whattomine is a reference for those seeking a powerful helper in Bitcoin and its mining. But calling the service fully convenient is hard, even with extra tools such as a list of the most profitable and powerful ASICs at the moment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"WhatToMine","src":"/images/articles/mining-calculators/whattomine.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A complex, overloaded interface that does not suit users with little mining hardware. Whattomine can be considered convenient for large farm owners;","Inconvenience on mobile devices вЂ” a problem stemming from the first drawback;","Mining calculation only on ASICs and GPUs."],"pros":["Detailed input configuration;","Works with more than 130 coins, from classic BTC to quite exotic options;","An impressive library of cards and ASICs for preliminary selection;","Features for dual (parallel) mining calculation. For example ETC + Kaspa, ETHW + ALPH, Ergo + Radiant on GPUs or LTC+DOGE on ASICs."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining calculators are not just a convenient tool but a key element of a smart approach to crypto mining. They help estimate yield, avoid losing decisions, compare options, and adapt to changing market conditions.","text":"Mining calculators are not just a convenient tool but a key element of a smart approach to crypto mining. They help estimate yield, avoid losing decisions, compare options, and adapt to changing market conditions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Use calculators before buying hardware, not after. Calculate, compare, and decide with numbers in hand вЂ” that is the path to sustainable, profitable mining.","text":"Use calculators before buying hardware, not after. Calculate, compare, and decide with numbers in hand вЂ” that is the path to sustainable, profitable mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Cheapest GPUs for mining: top 5 ranking and prices$tmj$,
       $tmj$Budget GPUs still work when power is cheap вЂ” models and prices that can stay profitable at low kWh rates.$tmj$,
       $tmj$Budget GPUs for mining$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Budget graphics cards for mining remain relevant when electricity is relatively cheap, even in 2024вЂ“2025. If a kilowatt-hour costs no more than five rubles, some budget models can still mine crypto at a positive return: below we look at which inexpensive GPUs can still be used for mining.","text":"Budget graphics cards for mining remain relevant when electricity is relatively cheap, even in 2024вЂ“2025. If a kilowatt-hour costs no more than five rubles, some budget models can still mine crypto at a positive return: below we look at which inexpensive GPUs can still be used for mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Budget graphics cards for mining","src":"/images/articles/cheap-gpus/intro-gpus-desk.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why are graphics cards still popular?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"GPU mining remains popular for several reasons:","text":"GPU mining remains popular for several reasons:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Flexibility. Graphics cards support multiple algorithms, so you can switch coins based on profitability;","Availability. GPUs can be bought retail or on the secondary market вЂ” easier than finding a current ASIC;","Versatility. Cards are not only for mining вЂ” they can be used for rendering, gaming, or AI compute;","Low barrier to entry. One or two cards and basic PC-building skills are enough to start;","Mobility and scalability. GPU farms are easier to move, upgrade, or scale as income grows."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"GPU for cryptocurrency mining","src":"/images/articles/cheap-gpus/gpu-smoke.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages of GPU mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Here is the full list of advantages of mining on graphics cards:","text":"Here is the full list of advantages of mining on graphics cards:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Ability to mine different coins. Unlike ASICs that run only one algorithm, GPUs can mine dozens of cryptocurrencies: Ethereum Classic (ETC), Kaspa, Ravencoin, Ergo, Conflux, Iron Fish, and others;","Easy upgrades. A miner can upgrade a farm by replacing only part of the hardware вЂ” no need to buy a whole new specialized device;","Liquidity and secondary use. When exiting mining, GPUs are easy to sell or use as intended, which lowers investment risk;","Lower noise and heat. Single cards or small GPU farms produce less noise and heat than ASICs, making them more convenient at home."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Drawbacks and limitations","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite the upsides, GPU mining has real limitations:","text":"Despite the upsides, GPU mining has real limitations:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Lower energy efficiency. GPUs lag ASICs on вЂњrevenue per watt,вЂќ so at the same power draw cards bring less profit;","High dependence on coin price. After Ethereum moved to Proof-of-Stake, the GPU mining market lost its main revenue coin. Alternatives are less profitable and more volatile;","More maintenance. Cards need care: watch temperatures, clean dust, and keep drivers and the OS stable;","Hardware wear. High load accelerates VRAM and fan degradation вЂ” especially on GDDR6X cards with unstable cooling;","Scalability limits. Home farms are capped by power (usually 3вЂ“5 kW), so large projects need hosting."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How GPU mining works","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"GPU mining runs graphics compute to help confirm blocks on crypto networks. Most miners use software such as TeamRedMiner, LolMiner, T-Rex, or NBMiner, configured via configs and auto-start. Profitability is checked on sites like WhatToMine, Hashrate.no, or niche calculators.","text":"GPU mining runs graphics compute to help confirm blocks on crypto networks. Most miners use software such as TeamRedMiner, LolMiner, T-Rex, or NBMiner, configured via configs and auto-start. Profitability is checked on sites like WhatToMine, Hashrate.no, or niche calculators."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The process often needs BIOS tweaks, firmware, and power optimization (undervolt) to maximize profit and extend hardware life.","text":"The process often needs BIOS tweaks, firmware, and power optimization (undervolt) to maximize profit and extend hardware life."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Radeon R9 380","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The oldest and one of the cheapest mining GPUs in our ranking. This card has only 4 GB of memory, which severely limits crypto mining. Modest performance allows mining only a handful of coins вЂ” a defining trait of this model. Low price partly offsets that weakness.","text":"The oldest and one of the cheapest mining GPUs in our ranking. This card has only 4 GB of memory, which severely limits crypto mining. Modest performance allows mining only a handful of coins вЂ” a defining trait of this model. Low price partly offsets that weakness."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Radeon R9 380 launched back in 2015, so finding a decent unit today is hard. Power draw is also high for this class вЂ” efficiency is far from ideal. Buying one specifically for mining is rarely worth it; it only makes sense if you already own the card.","text":"The Radeon R9 380 launched back in 2015, so finding a decent unit today is hard. Power draw is also high for this class вЂ” efficiency is far from ideal. Buying one specifically for mining is rarely worth it; it only makes sense if you already own the card."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Radeon R9 380","src":"/images/articles/cheap-gpus/r9-380.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2015"},{"label":"Chip","value":"AMD"},{"label":"Memory","value":"4 GB"},{"label":"Hashrate for Zhash","value":"16 MH/s"},{"label":"Power consumption","value":"110вЂ“150 W"},{"label":"Price","value":"from 5,000 rubles"},{"label":"Daily revenue","value":"about 10 cents"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Low hashrate;","Mediocre energy efficiency;","Limited number of mineable coins."],"pros":["Low price."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: GeForce GTX 1050 Ti","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Simple budget GPUs were once widely used for mining, but rising difficulty and network hashrate made many models obsolete. One example still on the edge of profitability is the GeForce GTX 1050 Ti. Launched in 2016, it stayed popular with gamers and miners thanks to low price, solid efficiency, and relatively cool running вЂ” a GeForce trademark.","text":"Simple budget GPUs were once widely used for mining, but rising difficulty and network hashrate made many models obsolete. One example still on the edge of profitability is the GeForce GTX 1050 Ti. Launched in 2016, it stayed popular with gamers and miners thanks to low price, solid efficiency, and relatively cool running вЂ” a GeForce trademark."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Today only a small share of miners still run the GTX 1050 Ti, because profitable mining on it needs skill. First, overclock to raise hashrate. Second, constantly monitor coins for a profitable pair. Otherwise mining on this model becomes barely viable.","text":"Today only a small share of miners still run the GTX 1050 Ti, because profitable mining on it needs skill. First, overclock to raise hashrate. Second, constantly monitor coins for a profitable pair. Otherwise mining on this model becomes barely viable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"GeForce GTX 1050 Ti","src":"/images/articles/cheap-gpus/gtx-1050-ti.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2016"},{"label":"Chip","value":"NVIDIA"},{"label":"Memory","value":"4 GB"},{"label":"Hashrate for Zhash","value":"19 MH/s"},{"label":"Hashrate for kHeavyHash","value":"110 MH/s"},{"label":"Power consumption","value":"50вЂ“80 W"},{"label":"Price","value":"from 10,000 rubles"},{"label":"Daily revenue","value":"about 10 cents"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest performance;","Small memory;","Limited mineable coins;","Relatively high price."],"pros":["Comfortable operating temperatures;","Good energy efficiency."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: GeForce GTX 1660","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This inexpensive budget GPU can mine only some coins at a positive return. The reason is modest hashrate and memory. It sits at the profitability threshold, so the GTX 1660 is not widely used for mining today. The generation has two other versions, but they cost more.","text":"This inexpensive budget GPU can mine only some coins at a positive return. The reason is modest hashrate and memory. It sits at the profitability threshold, so the GTX 1660 is not widely used for mining today. The generation has two other versions, but they cost more."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Specs match the class вЂ” nothing standout in performance, hashrate, heat, or noise. Buying it specifically for mining is not recommended; it only makes sense if the GPU was already used for gaming.","text":"Specs match the class вЂ” nothing standout in performance, hashrate, heat, or noise. Buying it specifically for mining is not recommended; it only makes sense if the GPU was already used for gaming."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"GeForce GTX 1660","src":"/images/articles/cheap-gpus/gtx-1660.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2019"},{"label":"Chip","value":"NVIDIA"},{"label":"Memory","value":"6 GB"},{"label":"Hashrate for Ethash","value":"24 MH/s"},{"label":"Hashrate for kHeavyHash","value":"240 MH/s"},{"label":"Power consumption","value":"70вЂ“100 W"},{"label":"Price","value":"from 6,000 rubles"},{"label":"Daily revenue","value":"about 17 cents"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest revenue;","Basic hashrate."],"pros":["Inexpensive entry-level card;","Decent energy efficiency;","No major flaws for its class."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: AMD Radeon RX 5500 XT 8GB","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A classic budget GPU popular with gamers and miners alike. At a relatively low price it offers solid performance, cooling headroom, and safe overclocking potential. For crypto mining the RX 5500 XT 8GB can beat some more famous and expensive cards, which draws miner interest.","text":"A classic budget GPU popular with gamers and miners alike. At a relatively low price it offers solid performance, cooling headroom, and safe overclocking potential. For crypto mining the RX 5500 XT 8GB can beat some more famous and expensive cards, which draws miner interest."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is not flawless вЂ” fairly high noise, modest hashrate, and immature software. On the plus side, power stays under 100 W even on вЂњheavyвЂќ coins. That makes it one of the best efficiency options in its class.","text":"It is not flawless вЂ” fairly high noise, modest hashrate, and immature software. On the plus side, power stays under 100 W even on вЂњheavyвЂќ coins. That makes it one of the best efficiency options in its class."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2019"},{"label":"Chip","value":"AMD"},{"label":"Memory","value":"8 GB"},{"label":"Hashrate for Ethash","value":"26 MH/s"},{"label":"Hashrate for kHeavyHash","value":"160 MH/s"},{"label":"Power consumption","value":"70вЂ“90 W"},{"label":"Price","value":"from 10,000 rubles"},{"label":"Daily revenue","value":"about 20 cents"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise;","Modest revenue;","Higher price than peers;","Low hashrate;","No optimization in the stock firmware."],"pros":["Popular for gaming and mining;","Low power draw;","Good cooling with overclocking headroom."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: AMD Radeon RX 580 8GB","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This GPU is well known вЂ” many gamers have used it since 2017. There are 4 GB and 8 GB versions; only the higher-memory model is suitable for mining today вЂ” one of the cheapest budget mining GPUs. In 2024 prices start around 4,000 rubles, with daily revenue near 20 cents.","text":"This GPU is well known вЂ” many gamers have used it since 2017. There are 4 GB and 8 GB versions; only the higher-memory model is suitable for mining today вЂ” one of the cheapest budget mining GPUs. In 2024 prices start around 4,000 rubles, with daily revenue near 20 cents."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Even overclocked, the RX 580 8GB hashrate is not ideal for mining вЂ” some older models and peers do better. Miners still like its strong cooling and spare fans included with some vendor kits, which leave room for overclocking in crypto mining.","text":"Even overclocked, the RX 580 8GB hashrate is not ideal for mining вЂ” some older models and peers do better. Miners still like its strong cooling and spare fans included with some vendor kits, which leave room for overclocking in crypto mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Radeon RX 580 8GB","src":"/images/articles/cheap-gpus/rx-580-msi.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2017"},{"label":"Chip","value":"AMD"},{"label":"Memory","value":"8 GB"},{"label":"Hashrate for Ethash","value":"30.5 MH/s"},{"label":"Hashrate for kHeavyHash","value":"200 MH/s"},{"label":"Power consumption","value":"110вЂ“150 W"},{"label":"Price","value":"from 4,000 rubles"},{"label":"Daily revenue","value":"about 20 cents"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest revenue;","Low hashrate;","4 GB version is obsolete;","High power draw for this segment."],"pros":["Cheapest mining GPU in 2024вЂ“2025;","Proven quality and reliability;","Excellent cooling;","Spare coolers included (some versions)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusion","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"GPU mining is a flexible way to mine crypto, especially for beginners or anyone who wants versatility and control. After Ethereum left PoW in 2022, the GPU mining market narrowed sharply. Profitability now depends on careful coin choice, hardware setup, and power rates.","text":"GPU mining is a flexible way to mine crypto, especially for beginners or anyone who wants versatility and control. After Ethereum left PoW in 2022, the GPU mining market narrowed sharply. Profitability now depends on careful coin choice, hardware setup, and power rates."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you see mining as a hobby or part of a diversified crypto portfolio, GPUs are a solid starting point. For a large-scale business with minimal cost of production, look at ASICs and hosting in regions with cheap electricity.","text":"If you see mining as a hobby or part of a diversified crypto portfolio, GPUs are a solid starting point. For a large-scale business with minimal cost of production, look at ASICs and hosting in regions with cheap electricity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Restoring a GPU after mining: myth or reality?$tmj$,
       $tmj$Can you revive a graphics card after mining вЂ” and is it worth it? Wear, diagnostics, cleaning, repair, and the economics of used GPUs.$tmj$,
       $tmj$GPU restoration after mining$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"After the era of active Ethereum mining ended and the coin moved to PoS, a huge number of used graphics cards appeared on the market. Just two or three years ago these models worked around the clock on farms, and now they are sold en masse online. For gamers and graphics professionals, this is a chance to buy powerful hardware cheaper than new. But there is a downside вЂ” wear after mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Cards that ran for months without a break often lose performance, start overheating, or behave unstably. That raises the main question: can you restore a graphics card after mining, and is it even worth it? To answer, you need to understand how mining affects the hardware and which steps can bring it back to life."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Restoring a graphics card after mining","src":"/images/articles/gpu-after-mining/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How does mining affect a graphics card?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining is not вЂњplaying for a couple of hours in the eveningвЂќ вЂ” it is round-the-clock work under high load. Imagine a car engine running 24/7 without breaks вЂ” sooner or later it will need a major overhaul. The situation with graphics cards is similar."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Main wear factors:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Overheating. Even with good cooling, GPU and memory temperatures stay high during mining. Thermal paste and thermal pads gradually dry out and lose effectiveness.","Memory degradation. When mining cryptocurrencies, memory is loaded harder than in ordinary games. Over time chips can lose stability, which shows up as artifacts or lower clocks.","Fan wear. Coolers run nonstop, and bearings start to make noise, develop play, or seize completely.","Dust buildup. Farms are often placed in rooms without proper ventilation, where equipment gets covered in dust that hinders cooling."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Example: on specialist forums users often share stories of cards that, after a year and a half of mining without maintenance, showed temperatures near 95 В°C and started shutting down. After a full clean and replacement of consumables, heat could be reduced by 20вЂ“25 В°C."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Can you restore a graphics card after mining?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It all depends on the specific situation. If the card is relatively fresh (worked less than a year and was maintained), the chance of successful restoration is very high. If the card ran for 2вЂ“3 years with poor cooling and without thermal paste replacement, restoration may not be worthwhile."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Success factors:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["cooling quality (farms with proper airflow suffer less),","owner care (cleaning, timely paste and pad replacement),","the modelвЂ™s original quality (some Nvidia and AMD lines handle long runs better)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Case: one minerвЂ™s RTX 3080 showed artifacts even in simple games after two years on a farm. Replacing thermal pads and reballing a couple of memory chips at a service shop cost $180, and the card ran stably again. In another case it was cheaper simply to buy a used equivalent without problems."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to restore a graphics card after mining?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Now to the practical part вЂ” how to restore a graphics card after mining step by step:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Before any work, run stress tests (3DMark, FurMark, OCCT) to check temperatures and stability. This will show which components are problematic.","title":"Diagnostics"},{"text":"Disassemble the card, remove all dust, replace thermal paste and thermal pads. Often this step alone gives +10вЂ“20% stability.","title":"Deep cleaning"},{"text":"Many farmers flash the BIOS to optimize for mining. To restore stability, it is recommended to flash the factory version and reset all overclocks.","title":"BIOS and clocks"},{"text":"Lowering core/memory clocks and limiting power draw can extend the cardвЂ™s life.","title":"Tuning operation"},{"text":"If fans are noisy or memory is unstable, it is better to leave repairs to a service center вЂ” DIY soldering almost always ends badly.","title":"Component replacement"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Example: after cleaning and replacing pads on an RX 5700 XT, one user got stable FPS in games, although before that the card froze every 20 minutes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How to restore a graphics card after mining","src":"/images/articles/gpu-after-mining/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is it worth restoring it yourself?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"At home you can do a lot:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["disassemble the card and remove dust,","replace thermal paste and pads,","check clocks with MSI Afterburner."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"But serious repairs (memory soldering, power circuits, recovering BIOS after a failure) require equipment and experience. A mistake can turn the card into a вЂњbrick.вЂќ"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Tip: if the card is expensive (RTX 3090, 4080), it is better to go straight to a trusted service. For older budget models it is sometimes more profitable to buy another used card than to invest in complex repairs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Economic feasibility","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The financial question is often decisive. For example, replacing paste and pads costs $10вЂ“20. Service memory repair is $80вЂ“150. A used RTX 3070 on the market is about $250вЂ“300."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Takeaway: if repair costs more than 50% of the price of a similar card on the secondary market, it is better to consider a replacement."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Tips for choosing a used graphics card after mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If you decide to buy a card privately, pay attention to:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Run stress tests and check temperatures. If the core is above 85 В°C вЂ” that is a warning sign.","Check the fans: noise, grinding, or vibration indicate wear.","Inspect the board for soldering marks or signs of overheating.","Ask the seller where the card was used: on a farm or in a home PC."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If artifacts appear on screen, the card freezes, or it gets very hot even without load вЂ” it is better to walk away from the purchase."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Tips for choosing a used graphics card after mining","src":"/images/articles/gpu-after-mining/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Restoring a graphics card after mining is possible, but it requires a comprehensive approach. To the question вЂњcan you restore a graphics card after miningвЂќ the answer is yes вЂ” but success depends on the deviceвЂ™s condition and the effort invested."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The main rule: the earlier cleaning and consumable replacement are done, the higher the chance of extending service life. In simple cases, replacing thermal paste and resetting the overclock is enough; in complex ones вЂ” go to a service shop."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If you are unsure how to restore a graphics card after mining without risk, start with diagnostics and basic maintenance. For serious faults, leave the work to professionals вЂ” that will save money and keep the device in working condition."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- vyvod-deneg-s-majning-fermy-na-kartu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Withdrawing mining-farm earnings to a bank card$tmj$,
       $tmj$Pool в†’ wallet/exchange в†’ exchanger or P2P: paths to cash out, plus cash-out pros and risks.$tmj$,
       $tmj$Withdraw mining earnings to a card$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining digital assets is a clear example of modern business. Ultimately, every investorвЂ™s goal is financial return, so withdrawing earnings into fiat currency is very important. Remember that Bitcoin and altcoins are only virtual assets that, at the final stage, can be converted into real money. LetвЂ™s look at how withdrawing money from a mining farm works: we will examine the mechanisms, cover the nuances, and analyze individual workflows."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Withdrawing mining earnings: the workflow","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Most miners have a set of material and technical tools needed for the job: the farm itself, a pool account, a cold or hot wallet, and a crypto exchange profile. Without at least one of these links, working with digital assets becomes difficult. All of these tools are involved in the classic withdrawal workflow:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Accumulating funds on the pool;","Withdrawing the asset from the pool to an exchange (or wallet);","P2P exchange to a card or direct cash withdrawal."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As a rule, these three steps are enough for a successful withdrawal of earned funds."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining earnings withdrawal workflow","src":"/images/articles/withdraw-mining-to-card/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Each stage should be reviewed separately for a deeper analysis."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Step 1: Accumulating cryptocurrency in the pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Solo mining is more the exception than the rule, so many industry participants use joint mining services. So-called pools let you connect quickly and receive a share proportional to the hashrate you provide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Despite similar functionality, pools differ from one another вЂ” each tool has its own features and individual fees."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"You can keep earned funds in the pool account, but accumulating large amounts there is not recommended. Not every platform has a proper level of protection, not to mention the risk that a project may shut down. Such cases happen in practice when a miner chooses an unreliable pool and faces the risk of losing funds."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We dedicated a separate article to a full review of popular pools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Step 2: Withdrawing funds from the pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It is recommended to withdraw funds from the pool periodically, or to set up automatic capital export вЂ” many tools offer this feature."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"During withdrawal, the user may face fees. For example, the popular ViaBTC service charges 0.000248 BTC, which is a fairly substantial amount."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Withdrawing funds from the pool","src":"/images/articles/withdraw-mining-to-card/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is a life hack: first withdraw funds to the partner exchange CoinEx (with no fee), and only then from the exchange to the desired address. There are several options for withdrawing from the pool:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Cold (hardware) wallet;","Hot (software) wallet;","Exchange."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The choice depends on the crypto investorвЂ™s tactics and goals. The export mechanism is simple: specify the recipient address and make the transaction. After some time, funds will arrive in the account (wallet or exchange). For extra protection, use every available mechanism вЂ” passwords, two-factor authentication, transaction confirmation, and so on."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Step 3: Withdrawing mining farm earnings to a card via exchangers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Receiving funds on a bank card is possible through specialized services вЂ” exchangers. These are niche websites that offer withdrawal services for a fee. The workflow with such tools is as follows:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Choose the cryptocurrency to withdraw;","Choose the currency and bank card to receive funds;","Transfer the asset to the exchangerвЂ™s account;","Receive funds on the plastic card."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Working with such projects is always a risk, because an exchanger can cease to exist at any moment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Withdrawal via exchangers to a card","src":"/images/articles/withdraw-mining-to-card/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is why you should only use verified tools: we covered the most popular services in a dedicated article."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is also an alternative exchanger format where the site does not hold its own liquidity and instead acts as an intermediary between exchange participants."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For example, a miner wants to sell BTC and receive rubles on a bank card, while an investor wants to buy Bitcoin and pay with a plastic card. The process is organized on an exchange service that acts as guarantor and regulator. Risks remain here as well, because besides the intermediary (exchanger) there is also a counterparty whose reliability and background are largely unknown."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What else to keep in mind when working with exchange services:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Any incoming transactions to your card carry risks. First of all, you receive assets from strangers who may be fraudsters and appear on bank blacklists;","Payment comments are under financial regulatorsвЂ™ scrutiny. If they mention cryptocurrency, the card may be blocked;","Third, you must observe limits, otherwise there is a high chance of account blocking with a requirement to prove the legality of the funds. In the digital asset environment, that is not always possible;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Even working with the best-known and most trusted exchange services always involves risks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In the crypto world there are known cases of fraud even by the largest players in a given sector. That is why you should also know about another format вЂ” P2P systems from major exchanges. Here the guarantor and intermediary is not a local tool, but a full-fledged service that may be well known not only to miners but to other cryptocurrency industry participants as well."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Alternative: cash withdrawal of mining earnings","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Besides transfers to a card, there is another way to withdraw cryptocurrency вЂ” exchanging for cash. On one hand, this format avoids several drawbacks of using a plastic card (transactions happen outside the banking sector), but other risks appear. For example, the need to visit an exchange point in person, and receiving and transporting a large amount of cash."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The situation recalls currency exchanges in the 1990s, when вЂњgrayвЂќ exchangers and private speculators were widespread."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Companies with a good reputation know about this perception drawback in the market. That is why successful organizations try in various ways to reduce the negativity:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Offering mining farm cash-out without visiting the office вЂ” a courier comes to you;","Renting an armored vehicle for large clients;","Locating in safe, trusted places. For example, in the capital region вЂ” the Moscow City complex."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"When working with cash, you need to assess all possible risks and account for the nuances of safely handling both digital and traditional assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Sooner or later every investor faces the task of withdrawing mining earnings to a card. This is needed to lock in profit, buy new equipment, or make any other purchase. Exporting funds is fairly simple: first digital assets are withdrawn from the pool to a wallet or exchange, and then sent to the userвЂ™s card via exchange services or a P2P system. You can also exchange for traditional cash вЂ” for that, choose trusted services with a good reputation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$vyvod-deneg-s-majning-fermy-na-kartu$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- whatsminer-m70-line-review
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$New Whatsminer M70 generation: full line review$tmj$,
       $tmj$Hashrate, energy efficiency, and payback scenarios for the new MicroBT lineup.$tmj$,
       $tmj$Whatsminer M70$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Introduction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The premiere of the Whatsminer M70 series became one of the most anticipated events in the Bitcoin mining hardware industry. For the first time in two years, MicroBT presented a major update that not only expands the model range but also changes the manufacturerвЂ™s approach to positioning devices."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The M70 line shows the companyвЂ™s strategic shift from universal solutions to a clear split by energy efficiency and infrastructure needs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"While previous Whatsminer generations differed mainly by higher hashrate, the M70 series focuses on energy efficiency, lower operating costs, and higher placement density. Below is a detailed breakdown of the full line covering cooling options, technical metrics, target scenarios, and market implications."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Air-cooled ASIC miners","src":"/images/articles/whatsminer-m70/farm-air.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Whatsminer M70: whatвЂ™s interesting?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining in 2026 is at a point where hardware technology development directly affects profitability. After the halving, infrastructure load rose sharply, and the share of income dependent on fees remains variable. That means the winners are not those who grow capacity, but those who lower the cost of computation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It is at this moment that MicroBT releases the M70 generation, betting on:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["energy efficiency as the main competitiveness parameter","splitting equipment into classes so buyers can choose devices for electricity cost, cooling modes, and placement density","lower infrastructure costs thanks to higher hashrate per device","versatility вЂ” different cooling formats without losing stability"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This approach aims to make an equipment fleet more resilient and economically attractive over the long term."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer MicroBT","src":"/images/articles/whatsminer-m70/whatsminer-classic.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Whatsminer M70 line: three energy efficiency classes","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Unlike previous generations, the M70 series is divided not just by model numbers but by energy efficiency classes. This is a key difference that shapes a convenient selection logic."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Class 14.5 J/T вЂ” stability, predictability, low entry price. This group includes: <a href=\"/calculator/?model=microbt-whatsminer-m70-236-th-s\">Whatsminer M70</a>, <a href=\"/calculator/?model=microbt-whatsminer-m72-246-th-s\">Whatsminer M72</a>, <a href=\"/calculator/?hashrate=260&amp;power=3770\">Whatsminer M73</a>, <a href=\"/calculator/?hashrate=275&amp;power=3988\">Whatsminer M76</a>, <a href=\"/calculator/?hashrate=290&amp;power=4205\">Whatsminer M78</a>, <a href=\"/calculator/?hashrate=300&amp;power=4350\">Whatsminer M79</a>.","text":"Class 14.5 J/T вЂ” stability, predictability, low entry price. This group includes: Whatsminer M70, Whatsminer M72, Whatsminer M73, Whatsminer M76, Whatsminer M78, Whatsminer M79."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Model character:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["an optimal option for large fleets with moderate electricity costs","high reliability with stable performance metrics","no requirements for complex infrastructure","an ideal choice for those who have been operating for years and seek a balance of price and power"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This class can be called the вЂњworkhorseвЂќ of the series вЂ” it scales best and suits large farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Class 13.5 J/T вЂ” the golden mean and optimization for data centers. This group includes: <a href=\"/calculator/?hashrate=250&amp;power=3375\">Whatsminer M70S</a>, <a href=\"/calculator/?hashrate=260&amp;power=3510\">Whatsminer M72S</a>, <a href=\"/calculator/?hashrate=270&amp;power=3645\">Whatsminer M73S</a>, <a href=\"/calculator/?hashrate=280&amp;power=3780\">Whatsminer M76S</a>, <a href=\"/calculator/?hashrate=290&amp;power=3915\">Whatsminer M78S</a>, <a href=\"/calculator/?hashrate=300&amp;power=4050\">Whatsminer M79S</a>.","text":"Class 13.5 J/T вЂ” the golden mean and optimization for data centers. This group includes: Whatsminer M70S, Whatsminer M72S, Whatsminer M73S, Whatsminer M76S, Whatsminer M78S, Whatsminer M79S."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages of this class:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["higher energy efficiency","often used by mining hotels and data center operators thanks to a favorable ratio of electricity cost to performance","suitable for any cooling schemes"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This class will become the most mass-market because it combines high economy with a moderate price."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Class 12.5 J/T вЂ” maximum efficiency on the market. Top models of the series: <a href=\"/calculator/?hashrate=250&amp;power=3125\">Whatsminer M70S+</a>, <a href=\"/calculator/?hashrate=270&amp;power=3375\">Whatsminer M73S+</a>, <a href=\"/calculator/?hashrate=290&amp;power=3625\">Whatsminer M76S+</a>.","text":"Class 12.5 J/T вЂ” maximum efficiency on the market. Top models of the series: Whatsminer M70S+, Whatsminer M73S+, Whatsminer M76S+."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The goal is to deliver minimal consumption per 1 TH at high hashrate density. These are direct competitors to Bitmain flagships."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Who it suits:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["regions with high electricity costs","data centers operating with dense placement","investors for whom a long hardware lifecycle and low OPEX matter"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These devices clearly show MicroBTвЂ™s technological leap вЂ” for the first time Whatsminer reaches metrics that previously were available only in Antminer models."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Rack-mounted Whatsminer","src":"/images/articles/whatsminer-m70/whatsminer-m66s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Cooling: three formats for different tasks","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"One of the key advantages of the M70 series was the expanded placement options. Now every energy efficiency class has models in different cooling formats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Air cooling, advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["low deployment cost","simple maintenance","minimal infrastructure requirements","power range: 214вЂ“300 TH/s"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Immersion cooling, advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["overclocking capability","lower noise level","high placement density","power range: 336вЂ“522 TH/s"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Hydro cooling, advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["stable operation even under maximum load","record performance вЂ” up to 930вЂ“1040 TH/s for M79S","convenient installation in rack data centers","one of the most powerful models in the world"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Hydro-cooled Whatsminer","src":"/images/articles/whatsminer-m70/whatsminer-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Technological features of the M70 series","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Beyond energy efficiency and cooling options, the devices received:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["an updated board architecture that dissipates heat better and ensures stable operation","an improved power system with surge protection","a modular design that simplifies repairs","higher density of next-generation chips"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"MicroBT is betting on minimizing losses and raising technological reliability вЂ” that is what determines an ASICвЂ™s service life after the halving."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How will the M70 update affect the industry?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The new line will change the market in several directions at once:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Competition with Bitmain will intensify. 12.5 J/T metrics will let MicroBT reclaim positions in the premium segment Bitmain dominated for the past two years.","Bitcoin network hashrate will grow. Models like the M79S effectively replace clusters of 2вЂ“3 previous-generation devices.","Operators will accelerate fleet upgrades. Especially after electricity cost increases in a number of regions.","Infrastructure costs will fall. Thanks to high power per chassis.","Data center structure will change. The focus on density will push sites toward immersion or hydro cooling."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer MicroBT","src":"/images/articles/whatsminer-m70/whatsminer-side.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The new MicroBT line is not just another update вЂ” it is a pivot of the companyвЂ™s entire product strategy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The M70 series:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["is for the first time split by energy efficiency (14.5 / 13.5 / 12.5 J/T)","offers a full set of cooling formats (air, immersion, hydro)","lets operators choose devices for electricity cost","emphasizes minimizing OPEX","brings MicroBT to competition with Bitmain flagships","sets a new hashrate density bar вЂ” up to 1 PH/s"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This generation will become the foundation for mining infrastructure for the next 2вЂ“3 years and set a new vector for ASIC market development. Calculate profitability in the <a href=\"/calculator/?model=microbt-whatsminer-m70-236-th-s\">mining calculator</a>.","text":"This generation will become the foundation for mining infrastructure for the next 2вЂ“3 years and set a new vector for ASIC market development. Calculate profitability in the mining calculator."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$whatsminer-m70-line-review$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- meta-only best-asic-miners-2026
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining ASICs: smart service, mature ecosystem$tmj$,
       $tmj$How to choose an ASIC in 2026: hardware, service, logistics, and transparent hosting terms.$tmj$,
       $tmj$Best ASIC miners$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$best-asic-miners-2026$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only crypto-market-outlook-2026
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Crash or rally? Crypto market at the start of 2026$tmj$,
       $tmj$Key factors for Bitcoin and altcoins: liquidity, halving cycle, and institutional demand.$tmj$,
       $tmj$Crypto market 2026$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$crypto-market-outlook-2026$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only blockchain-life-2025-afterparty
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Blockchain Life 2025 вЂ” the main CIS event$tmj$,
       $tmj$Conference takeaways, afterparty, and key announcements for the mining community.$tmj$,
       $tmj$Blockchain Life 2025$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$blockchain-life-2025-afterparty$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only the-trends-conference
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$THE TRENDS: industry technologies and trends$tmj$,
       $tmj$A short overview of the agenda and themes that set the tone for the fall.$tmj$,
       $tmj$THE TRENDS$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$the-trends-conference$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only top-mining-ecosystem
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$TOP MINING ecosystem: one platform for miners, investors, and business$tmj$,
       $tmj$Calculator, catalog, ratings, and services вЂ” how the platform tools connect.$tmj$,
       $tmj$TOP MINING ecosystem$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-mining-ecosystem$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-consulting-services
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining consulting: support from idea to launch$tmj$,
       $tmj$Audit, hardware selection, legal and technical questions вЂ” what consulting includes.$tmj$,
       $tmj$Mining consulting$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-consulting-services$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only hosting-with-discount
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$How to choose discounted hosting: criteria and pitfalls$tmj$,
       $tmj$What to check when picking a site: rate, uptime, repairs, and transparent stats.$tmj$,
       $tmj$Discounted hosting$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$hosting-with-discount$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only tools-build-mining-site
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$We build a mining site: full turnkey cycle$tmj$,
       $tmj$Design, installation, commissioning, and service for an industrial mining facility.$tmj$,
       $tmj$Building a mining site$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$tools-build-mining-site$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only buy-asic-below-market
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Buy ASICs below market: how to find good deals$tmj$,
       $tmj$Where to look for promotions, how to verify a supplier, and avoid overpaying for logistics.$tmj$,
       $tmj$Buy ASICs below market$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$buy-asic-below-market$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only best-time-to-buy-asic
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Why now is the best time to buy ASICs?$tmj$,
       $tmj$Market factors, hardware prices, and the payback window for investors.$tmj$,
       $tmj$Buying ASICs$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$best-time-to-buy-asic$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-on-gas-russia
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining on gas: how to launch a farm on natural or associated gas in Russia$tmj$,
       $tmj$Power, equipment, and legal aspects of hosting on gas generators.$tmj$,
       $tmj$Mining on gas$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-on-gas-russia$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only bitcoin-as-investment-asset
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Bitcoin as an investment asset: miningвЂ™s role in a portfolio$tmj$,
       $tmj$How to combine buying BTC and mining for a long-term strategy.$tmj$,
       $tmj$Bitcoin as investment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$bitcoin-as-investment-asset$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-datacenter-investment
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Investing in a mining data center: models and returns$tmj$,
       $tmj$When it makes sense to invest in infrastructure, not only in hardware.$tmj$,
       $tmj$Data center investment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-datacenter-investment$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only asic-payback-forecast-2026
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$ASIC payback in 2026: calculation and investor outlook$tmj$,
       $tmj$How to estimate return time with rate, tariff, and uptime in mind.$tmj$,
       $tmj$ASIC payback$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$asic-payback-forecast-2026$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-datacenter-guide
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$How a modern mining data center works$tmj$,
       $tmj$Monitoring, security, and service processes at an industrial site.$tmj$,
       $tmj$Mining data center$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-datacenter-guide$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only asic-hardware-overview
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Industrial ASIC overview: what matters when buying$tmj$,
       $tmj$Form factor, cooling, and logistics when shipping a batch of equipment.$tmj$,
       $tmj$Industrial ASICs$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$asic-hardware-overview$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only top-mining-pools-2026
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining pools 2026: top 11 by profitability$tmj$,
       $tmj$Comparing fees, payout stability, and monitoring convenience for miners.$tmj$,
       $tmj$Top mining pools$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-mining-pools-2026$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only top-mining-articles-knowledge
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining articles from TOP MINING: knowledge as a profit tool$tmj$,
       $tmj$A selection of materials for those who want to understand the industry systematically.$tmj$,
       $tmj$Mining articles$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$top-mining-articles-knowledge$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only where-to-buy-asic
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Where to buy ASICs вЂ” a trusted resource$tmj$,
       $tmj$Criteria for a reliable supplier and how to compare market offers.$tmj$,
       $tmj$Where to buy ASICs$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$where-to-buy-asic$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-investment-entry
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Investing in mining: where a private investor should start$tmj$,
       $tmj$Minimum budget, choosing a model, and first steps without unnecessary risk.$tmj$,
       $tmj$Investor start$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-investment-entry$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-sites-construction
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Building mining sites: where to start$tmj$,
       $tmj$Engineering, power supply, and infrastructure requirements for industrial hosting.$tmj$,
       $tmj$Building mining sites$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-sites-construction$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only whatsminer-m70-beginners
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Whatsminer M70 for beginners: getting to know the lineup$tmj$,
       $tmj$Basic specs, hosting conditions, and common questions at the start.$tmj$,
       $tmj$Whatsminer M70 for beginners$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$whatsminer-m70-beginners$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
-- meta-only mining-basics-start
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining from scratch: first steps without typical mistakes$tmj$,
       $tmj$How to choose a model, a site, and not lose your budget early on.$tmj$,
       $tmj$Mining from scratch$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$mining-basics-start$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();
