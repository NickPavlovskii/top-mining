SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining companies in Russia: top 10 for ASIC sales and hosting$tmj$,
       $tmj$A mining company as a full-cycle business: hardware sales, hosting, and related services вЂ” who leads the Russian market.$tmj$,
       $tmj$Mining data center$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
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
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining company in Russia is a full business professionally engaged in crypto mining with specialized hardware. Such companies offer a full service cycle вЂ” from hardware sales to turnkey investments. Amid high competition and technical complexity, they play a key role helping private and corporate clients enter the industry with minimal risk and time cost.","text":"A mining company in Russia is a full business professionally engaged in crypto mining with specialized hardware. Such companies offer a full service cycle вЂ” from hardware sales to turnkey investments. Amid high competition and technical complexity, they play a key role helping private and corporate clients enter the industry with minimal risk and time cost."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What do Russian mining companies do?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining company in Russia is not just a hardware seller but a full partner that helps clients enter crypto mining with minimal risk. Looking at the full range of possible services, the main directions are:","text":"A mining company in Russia is not just a hardware seller but a full partner that helps clients enter crypto mining with minimal risk. Looking at the full range of possible services, the main directions are:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Mining companies partner with major suppliers and manufacturers (Bitmain, MicroBT, and others) and offer clients current ASIC models with a warranty. That simplifies purchasing and lowers the risk of buying fakes from shady sellers;","title":"Sales of crypto-mining hardware"},{"text":"A client can buy a device and host it in the companyвЂ™s data center вЂ” useful if home mining is not feasible. The service includes connection, maintenance, and temperature/stability control;","title":"Hosting client ASICs"},{"text":"Reliable companies provide repairs and preventive maintenance. Specialists and spare parts on hand let them fix issues quickly without long downtime;","title":"Repair and technical service"},{"text":"Containers are full farms with ventilation, electrics, and miner racks. They can be installed in regions with cheap power: many mining companies design, assemble, and sell such turnkey solutions;","title":"Sales of containers for hosting hardware"},{"text":"Some companies offer passive income вЂ” you invest, and the company buys, hosts, and manages the hardware. Profit is shared under a preset scheme: a fit for those who want mining exposure without the technical details.","title":"Mining investments"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining data center","src":"/images/articles/mining-companies/intro-datacenter.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"LetвЂ™s look at which mining companies exist in Russia, what they do, and what services they offer investors: a TOP-10 ranking of the largest and best-known market players.","text":"LetвЂ™s look at which mining companies exist in Russia, what they do, and what services they offer investors: a TOP-10 ranking of the largest and best-known market players."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Uminers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Uminers is one of the largest international mining-market players (hardware sales and hosting). The project has a separate unit for Russian users: the site is in Krasnoyarsk with substantial power potential. Minimum partnership terms вЂ” from 5 devices, each drawing at least 5 kW.","text":"Uminers is one of the largest international mining-market players (hardware sales and hosting). The project has a separate unit for Russian users: the site is in Krasnoyarsk with substantial power potential. Minimum partnership terms вЂ” from 5 devices, each drawing at least 5 kW."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"UminersвЂ™ store and hosting have a solid reputation and many reviews that help form an overall view of product quality and service. The company succeeds not only in Russia but abroad, making it a notable player in mining capacity and global hashrate.","text":"UminersвЂ™ store and hosting have a solid reputation and many reviews that help form an overall view of product quality and service. The company succeeds not only in Russia but abroad, making it a notable player in mining capacity and global hashrate."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Uminers вЂ” mining company","src":"/images/articles/mining-companies/uminers.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"Krasnoyarsk Territory"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"20 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"no data"},{"label":"Website","value":"uminers.com"},{"label":"Domain registration date","value":"2017"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"no data"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"29"},{"label":"Office address","value":"Moscow, Khodynsky Boulevard, 11"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lack of detailed hosting information on the website."],"pros":["An international-format project well known in Russia and abroad;","ASIC hosting from a brand with a strong sales reputation;","Backed by an international structure that includes Uminers;","A separate division for Russia."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Umnus","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Umnus offers not just mining-hardware sales but a full service range including professional hosting. Clients have several data centers in Moscow, Krasnoyarsk, and Kaspiysk. Total infrastructure capacity reaches 46 MW, making the company one of the notable Russian market players. All sites have CCTV security, and maintenance is done by their own service center.","text":"Umnus offers not just mining-hardware sales but a full service range including professional hosting. Clients have several data centers in Moscow, Krasnoyarsk, and Kaspiysk. Total infrastructure capacity reaches 46 MW, making the company one of the notable Russian market players. All sites have CCTV security, and maintenance is done by their own service center."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Umnus claims up to 97.5% uptime вЂ” a figure that looks lower than some competitorsвЂ™, but clients say it matches reality, which builds trust. Users have two payment options: a fixed per-device rate or a metered plan. The first already includes maintenance, which is especially convenient. A turnkey partnership format is also available, simplifying investment tasks.","text":"Umnus claims up to 97.5% uptime вЂ” a figure that looks lower than some competitorsвЂ™, but clients say it matches reality, which builds trust. Users have two payment options: a fixed per-device rate or a metered plan. The first already includes maintenance, which is especially convenient. A turnkey partnership format is also available, simplifying investment tasks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Umnus вЂ” industrial mining operator","src":"/images/articles/mining-companies/umnus.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"Smart Devices LLC"},{"label":"Revenue","value":"в‚Ѕ246 million"},{"label":"Litigation","value":"Plaintiff: won 0%, lost 100%"},{"label":"Years on the market","value":"more than 4"},{"label":"Charter capital","value":"в‚Ѕ8.5 million"},{"label":"Hosting location","value":"Moscow, Krasnoyarsk, Kaspiysk"},{"label":"Number of hosted devices","value":"more than 1,500"},{"label":"Served capacity","value":"46 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"from в‚Ѕ11,000 per month per device"},{"label":"Website","value":"umnus.ru"},{"label":"Domain registration date","value":"2019"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"4,7"},{"label":"Number of reviews, Yandex","value":"35"},{"label":"Office address","value":"Moscow, Nagorny Proezd, 10, bldg. 2, structure 3"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The company assumes no financial liability when any pools other than EMCD are used."],"pros":["Full service: hardware, hosting, and maintenance in one place;","Hosting geography: four sites across Russia;","Own repair center independent of contractors;","Flexible pricing: fixed rate or metered use;","Honest uptime confirmed by users;","Maintenance included in one of the plans;","Hosting in their own containers is available;","Preferential hosting terms when choosing a reduced reliability level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Getasic","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Getasic is a notable mining-hardware player offering not only sales but hosting in its own data center. Like several competitors, its official site lacks detailed hosting information. Potential clients get only general descriptions вЂ” without specific partnership terms.","text":"Getasic is a notable mining-hardware player offering not only sales but hosting in its own data center. Like several competitors, its official site lacks detailed hosting information. Potential clients get only general descriptions вЂ” without specific partnership terms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"From what is published on the site we only know the data center is 40 MW, and listed advantages include: official hosting status, primary and backup connectivity, remote monitoring, and an own service center.","text":"From what is published on the site we only know the data center is 40 MW, and listed advantages include: official hosting status, primary and backup connectivity, remote monitoring, and an own service center."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Still, key parameters such as site geography, uptime, and pricing structure are not disclosed. Those details come only in a personal consultation with a manager, which may put off audiences looking for fast, transparent information.","text":"Still, key parameters such as site geography, uptime, and pricing structure are not disclosed. Those details come only in a personal consultation with a manager, which may put off audiences looking for fast, transparent information."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Getasic вЂ” ASIC sales and hosting","src":"/images/articles/mining-companies/getasic.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"no data"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"no data"},{"label":"Available capacity","value":"40 MW"},{"label":"Hosting cost","value":"no data"},{"label":"Website","value":"miningmoon.ru"},{"label":"Domain registration date","value":"2017"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"83"},{"label":"Office address","value":"Moscow, Ostapovsky Proezd, 3, bldg. 29"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Key hosting specs are missing on the site вЂ” no region, availability, rates, or other metrics."],"pros":["Hosting from a trusted hardware seller вЂ” convenient and reliable;","Own service center available;","Enhanced security вЂ” CCTV and a panic button;","Hardware insurance available."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Mining Cluster","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining Cluster has operated since 2016 and offers a full mining service range: from hardware sales to hosting and support. It has its own data centers and an online store. Despite positive client reviews, their number is small, which makes objective service-quality assessment harder.","text":"Mining Cluster has operated since 2016 and offers a full mining service range: from hardware sales to hosting and support. It has its own data centers and an online store. Despite positive client reviews, their number is small, which makes objective service-quality assessment harder."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining ClusterвЂ™s official channels offer little specifics. Exact hosting rates are not disclosed, precise data-center geolocation is missing (infographics suggest Kirishi, Tula, Murmansk, and Udomlya), and there is no scale data вЂ” client or device counts. Details are shared individually during consultation based on budget and goals.","text":"Mining ClusterвЂ™s official channels offer little specifics. Exact hosting rates are not disclosed, precise data-center geolocation is missing (infographics suggest Kirishi, Tula, Murmansk, and Udomlya), and there is no scale data вЂ” client or device counts. Details are shared individually during consultation based on budget and goals."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Besides hosting, the company offers leasing for legal entities, mining-container sales, repair and monitoring services, and a turnkey mining solution. Claimed uptime is 99.8%, and tech support responds to equipment outages within 5 minutes.","text":"Besides hosting, the company offers leasing for legal entities, mining-container sales, repair and monitoring services, and a turnkey mining solution. Claimed uptime is 99.8%, and tech support responds to equipment outages within 5 minutes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining Cluster вЂ” mining data centers","src":"/images/articles/mining-companies/mining-cluster.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"Kirishi, Tula, Murmansk, Udomlya"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"no data"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"no data"},{"label":"Website","value":"cluster-mining.com"},{"label":"Domain registration date","value":"2021"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Store rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"16"},{"label":"Office address","value":"Moscow, Presnenskaya Embankment, 10, bldg. 2, room 181"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Insufficient transparency on the website: no rates, site locations, or scale data;","A small number of reviews makes an objective reputation assessment harder."],"pros":["A wide service set: hardware, hosting, containers, data-center construction, and investment solutions;","Several own data centers;","Leasing available for business;","Fast tech support and high uptime."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Gis Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Gis Mining hosts mining hardware next to Kalinin NPP (Tver Region, northern area). All units sit in isolated containers meeting Rosenergoatom safety standards. Fire protection uses modern sensors, and specialized fire-service response is just 2 minutes. Strict pass-based access applies across the site, with monitoring via more than 700 cameras.","text":"Gis Mining hosts mining hardware next to Kalinin NPP (Tver Region, northern area). All units sit in isolated containers meeting Rosenergoatom safety standards. Fire protection uses modern sensors, and specialized fire-service response is just 2 minutes. Strict pass-based access applies across the site, with monitoring via more than 700 cameras."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The company claims 99.9% uptime plus a convenient monitoring system and favorable service terms. Each client gets 1 year of free repairs, with faults fixed within 10 business days. If delayed, temporary replacement hardware is provided. Site tours are available so you can see storage and operating conditions in person.","text":"The company claims 99.9% uptime plus a convenient monitoring system and favorable service terms. Each client gets 1 year of free repairs, with faults fixed within 10 business days. If delayed, temporary replacement hardware is provided. Site tours are available so you can see storage and operating conditions in person."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Gis Mining вЂ” hosting near Kalinin NPP","src":"/images/articles/mining-companies/gis-mining.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"Global Information Systems LLC"},{"label":"Revenue","value":"в‚Ѕ406.3 million"},{"label":"Litigation","value":"No"},{"label":"Years on the market","value":"more than 3"},{"label":"Charter capital","value":"в‚Ѕ1.9 million"},{"label":"Hosting location","value":"Kalinin NPP (Tver Region)"},{"label":"Number of hosted devices","value":"more than 19,000"},{"label":"Served capacity","value":"70 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"from в‚Ѕ3.99 per kWh"},{"label":"Website","value":"gis-mining.ru"},{"label":"Domain registration date","value":"2021"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"68"},{"label":"Office address","value":"Moscow, Varshavskoye Highway, 1s1-2"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A young company вЂ” operating since 2021;","A modest number of hardware brands in the catalog."],"pros":["Cheap electricity from a nuclear power plant;","Own store and service center available;","One-year warranty with fast repair or hardware replacement;","Ability to visit the site in person;","24/7 customer support;","Established logistics вЂ” partnerships with reliable carriers;","No negative reviews and a solid reputation;","A вЂњready-made businessвЂќ format is offered for investors."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Intelion Data Systems","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Intelion Data Systems is a recognizable mining-hardware sales player offering not only gear but hosting. It has two hosting sites: one in Tver Region near Kalinin NPP (32 MW) and another at the Tulachermet JSC data center. Exact specs of the second site, plus client and device counts, are not disclosed.","text":"Intelion Data Systems is a recognizable mining-hardware sales player offering not only gear but hosting. It has two hosting sites: one in Tver Region near Kalinin NPP (32 MW) and another at the Tulachermet JSC data center. Exact specs of the second site, plus client and device counts, are not disclosed."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite limited information, Intelion claims a reliable security system, uptime up to 99.4%, 24/7 support, and the option to insure hardware. The company also lets you tour the site in person before hosting вЂ” you can book a visit.","text":"Despite limited information, Intelion claims a reliable security system, uptime up to 99.4%, 24/7 support, and the option to insure hardware. The company also lets you tour the site in person before hosting вЂ” you can book a visit."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intelion Data Systems вЂ” hardware and hosting","src":"/images/articles/mining-companies/intelion.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"Intelion Mine LLC"},{"label":"Revenue","value":"в‚Ѕ1 billion"},{"label":"Litigation","value":"Plaintiff: won 28%, lost 29%, other 43%. Defendant: lost 33%, other 67%"},{"label":"Years on the market","value":"more than 6"},{"label":"Charter capital","value":"в‚Ѕ2 million"},{"label":"Hosting location","value":"Tver and Tula regions"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"32 MW (data for the Tver Region site only)"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"no data"},{"label":"Website","value":"intelionmine.ru"},{"label":"Domain registration date","value":"2018"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"25"},{"label":"Office address","value":"Moscow, Verkhniy Mikhaylovskiy 2nd Proezd, 9"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Insufficient website transparency: no data on service prices, second-site specs, or total hosting volume."],"pros":["Hosting from a well-known hardware seller with a solid reputation;","Two independent ASIC hosting sites in different regions;","Financial liability and equipment insurance;","Ability to visit data centers before signing a contract;","24/7 support and security with access control."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Sibmain","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Sibmain combines an online hardware store and a hosting provider, offering services on one of the countryвЂ™s most powerful data centers. The site is in Krasnoyarsk with impressive potential вЂ” up to 80 MW. That makes it one of the largest industrial mining facilities.","text":"Sibmain combines an online hardware store and a hosting provider, offering services on one of the countryвЂ™s most powerful data centers. The site is in Krasnoyarsk with impressive potential вЂ” up to 80 MW. That makes it one of the largest industrial mining facilities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The data center provides a full service range: from tech support and repairs in its own service center to facility tours. Claimed uptime is 99%, and issues are fixed within 7 minutes. Infrastructure includes remote monitoring, air filters, and 24/7 security.","text":"The data center provides a full service range: from tech support and repairs in its own service center to facility tours. Claimed uptime is 99%, and issues are fixed within 7 minutes. Infrastructure includes remote monitoring, air filters, and 24/7 security."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Pricing is flexible and depends on time of day: day and night rates. The company also claims financial liability for hardware damaged through staff fault.","text":"Pricing is flexible and depends on time of day: day and night rates. The company also claims financial liability for hardware damaged through staff fault."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Sibmain вЂ” data center in Krasnoyarsk","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"Krasnoyarsk"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"80 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"from в‚Ѕ4 per kWh"},{"label":"Website","value":"sibmain.ru"},{"label":"Domain registration date","value":"2021"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"17"},{"label":"Office address","value":"Moscow, Kaluzhskaya Square, 1/1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No information on client count or installed ASICs;","A single Siberia location may complicate logistics for remote regions."],"pros":["Integrated model: hardware sales + hosting;","One of the most powerful sites in Russia (80 MW);","Flexible electricity rates;","Ability to visit the facility in person;","Financial guarantees if hardware is lost due to the host."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: IBMM Technology","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"IBMM Technology is a large ecosystem combining hardware sales and hosting for mining farms. It offers several locations for gear: Mineralnye Vody, Perm, Penza, and Siberia. That geographic spread lets clients pick the best region for logistics and rates.","text":"IBMM Technology is a large ecosystem combining hardware sales and hosting for mining farms. It offers several locations for gear: Mineralnye Vody, Perm, Penza, and Siberia. That geographic spread lets clients pick the best region for logistics and rates."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Starting hosting prices are among RussiaвЂ™s lowest, but that rate is for large clients with farms of 50+ ASICs. The minimum partnership threshold is from 5 devices. Hosting includes official service paperwork and indoor placement with security and basic safety measures.","text":"Starting hosting prices are among RussiaвЂ™s lowest, but that rate is for large clients with farms of 50+ ASICs. The minimum partnership threshold is from 5 devices. Hosting includes official service paperwork and indoor placement with security and basic safety measures."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On IBMM TechnologyвЂ™s official site, hosting information is quite compressed вЂ” details come in a personal conversation with managers. Total hosted hardware is about 4,000 units, and clients often note good organization and service.","text":"On IBMM TechnologyвЂ™s official site, hosting information is quite compressed вЂ” details come in a personal conversation with managers. Total hosted hardware is about 4,000 units, and clients often note good organization and service."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IBMM Technology вЂ” sales and hosting","src":"/images/articles/mining-companies/ibmm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"Mineralnye Vody, Perm, Penza, Siberia"},{"label":"Number of hosted devices","value":"more than 4,000"},{"label":"Served capacity","value":"100 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"from в‚Ѕ4.2 per kWh"},{"label":"Website","value":"ibmm.ru"},{"label":"Domain registration date","value":"2017"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"225"},{"label":"Office address","value":"Moscow, MKAD, 44 km, building 1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Entry threshold вЂ” from 5 ASICs, which may be inconvenient for beginners;","Limited information on the website вЂ” many details are available only in a personal conversation."],"pros":["One of RussiaвЂ™s leading mining hardware suppliers;","Five sites in different regions of the country;","Attractive rates for large miners;","Positive reviews and a high level of trust;","Official paperwork and indoor hosting."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Promminer","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Promminer, widely known as one of RussiaвЂ™s mining-hardware sales leaders, also offers hosting in its own data center. Yet the brandвЂ™s official site has limited information on exact partnership terms, which may raise questions for potential clients.","text":"Promminer, widely known as one of RussiaвЂ™s mining-hardware sales leaders, also offers hosting in its own data center. Yet the brandвЂ™s official site has limited information on exact partnership terms, which may raise questions for potential clients."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Promminer claims some of the lowest hosting prices, yet a review video on the same site shows a different cost. That mismatch between stated information and actual figures may undermine trust among potential partners.","text":"Promminer claims some of the lowest hosting prices, yet a review video on the same site shows a different cost. That mismatch between stated information and actual figures may undermine trust among potential partners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Claimed parameters include stable 99% uptime, 24/7 technical maintenance, online equipment monitoring, and insurance for hosted hardware. An extra plus: site security by Rosgvardiya, which adds confidence in asset safety.","text":"Claimed parameters include stable 99% uptime, 24/7 technical maintenance, online equipment monitoring, and insurance for hosted hardware. An extra plus: site security by Rosgvardiya, which adds confidence in asset safety."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Promminer вЂ” ASIC sales and hosting","src":"/images/articles/rating-countries/datacenter-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"Promminer LLC"},{"label":"Revenue","value":"в‚Ѕ121.2 million"},{"label":"Litigation","value":"no"},{"label":"Years on the market","value":"more than a year and a half; (likely a new LLC)"},{"label":"Charter capital","value":"в‚Ѕ500 thousand"},{"label":"Hosting location","value":"Kemerovo Region"},{"label":"Number of hosted devices","value":"no data"},{"label":"Served capacity","value":"40 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"from в‚Ѕ4.3 per kWh"},{"label":"Website","value":"promminer.ru"},{"label":"Domain registration date","value":"2019"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"90"},{"label":"Office address","value":"Moscow, Letnaya St., 99 st3, office 4"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lack of transparent information on the official site;","Inconsistencies in prices and terms between the site and videos;","Exact data-center specs and geography are not listed on the main page."],"pros":["Hosting hardware with one of RussiaвЂ™s top mining hardware distributors;","Client hardware risk insurance;","24/7 security by Rosgvardiya;","A positive reputation and many good reviews."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: BitRiver","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BitRiver is rightly seen as a leader in RussiaвЂ™s mining industry. With combined capacity over 300 MW, it ranks first among market players. Its scale is so large that the company came under US sanctions вЂ” due to its role in RussiaвЂ™s tech sector.","text":"BitRiver is rightly seen as a leader in RussiaвЂ™s mining industry. With combined capacity over 300 MW, it ranks first among market players. Its scale is so large that the company came under US sanctions вЂ” due to its role in RussiaвЂ™s tech sector."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Today BitRiver operates nine data centers across different regions of the country. More than 100,000 devices are hosted in its infrastructure, and more than 500 employees are on staff.","text":"Today BitRiver operates nine data centers across different regions of the country. More than 100,000 devices are hosted in its infrastructure, and more than 500 employees are on staff."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Note that BitRiver is not aimed at retail clients. Partnership terms imply an entry threshold from в‚Ѕ5 million, so services are available only to large investors and miners with big fleets. All details are discussed personally вЂ” no standard rates or terms are listed on the site.","text":"Note that BitRiver is not aimed at retail clients. Partnership terms imply an entry threshold from в‚Ѕ5 million, so services are available only to large investors and miners with big fleets. All details are discussed personally вЂ” no standard rates or terms are listed on the site."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BitRiver вЂ” largest data-center operator","src":"/images/articles/mining-companies/bitriver.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Litigation","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Charter capital","value":"no data"},{"label":"Hosting location","value":"9 data centers"},{"label":"Number of hosted devices","value":"more than 100,000"},{"label":"Served capacity","value":"300 MW"},{"label":"Available capacity","value":"no data"},{"label":"Hosting cost","value":"no data"},{"label":"Website","value":"lp-bitriver.ru"},{"label":"Domain registration date","value":"2023"},{"label":"Own hardware store","value":"yes"},{"label":"Own service center","value":"yes"},{"label":"Store rating, Yandex","value":"4,2"},{"label":"Number of reviews, Yandex","value":"23"},{"label":"Office address","value":"Moscow, Annenskaya St., 17"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Focused only on wholesale clients and large investors;","No detailed terms and rates in open access;","Conflicting reviews and media discussion of reputation."],"pros":["Leader in hosting volume in Russia вЂ” over 300 MW total capacity;","Wide geography вЂ” 9 data centers in different regions;","A thoughtful approach for investors вЂ” a turnkey business format;","A service center at each hosting site;","Ability to invest in mining for passive income;","International recognition вЂ” the company is known beyond Russia."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a mining company in Russia?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining in Russia is accelerating, and with it the number of companies offering hardware, hosting, and investment products. To choose well, account for your goals: buying gear, hosting equipment, or investing in mining.","text":"Mining in Russia is accelerating, and with it the number of companies offering hardware, hosting, and investment products. To choose well, account for your goals: buying gear, hosting equipment, or investing in mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"If your goal is buying hardware, choose a company with a proven reputation and transparent supply. Check assortment (different ASIC models), warranties and returns, buyer reviews, a service center, and legal deal paperwork. Strong fits: Promminer, Getasic, Intelion, IBMM;","title":"Buying hardware"},{"text":"If you need hosting, understand the data centerвЂ™s terms: electricity rates (day/night), uptime and response speed, location (logistics), security and monitoring, insurance and maintenance. Consider Sibmain, Gis Mining, BitRiver (for large volumes), Umnus;","title":"Hosting"},{"text":"If you want to invest in mining, some companies offer products: buying a data-center share, profit participation, or a ready business. Check scheme transparency, contracts, risks and payback, other investorsвЂ™ reviews and cases, and the minimum entry. Suitable for investors: BitRiver, Intelion, Mining Cluster.","title":"Mining investments"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Takeaways","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing a mining company depends directly on your goals and budget. For buying gear, stores with a good reputation and support fit well. For hosting вЂ” data centers with transparent terms and reliable infrastructure. For investments вЂ” only large players operating officially with proven experience. Analyze not only service cost but security, tech support, and community reviews.","text":"Choosing a mining company depends directly on your goals and budget. For buying gear, stores with a good reputation and support fit well. For hosting вЂ” data centers with transparent terms and reliable infrastructure. For investments вЂ” only large players operating officially with proven experience. Analyze not only service cost but security, tech support, and community reviews."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Choosing hosting with TOP MINING: simple, fast, and profitable","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Planning to scale a farm or just starting in mining? The first step is infrastructure.","text":"Planning to scale a farm or just starting in mining? The first step is infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"TOP MINING: RussiaвЂ™s first platform uniting verified mining sites. We are the largest mining-hosting aggregator in Russia and the CIS.","text":"TOP MINING: RussiaвЂ™s first platform uniting verified mining sites. We are the largest mining-hosting aggregator in Russia and the CIS."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"TOP MINING is RussiaвЂ™s first mining-site aggregator, where you can:","text":"TOP MINING is RussiaвЂ™s first mining-site aggregator, where you can:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Buy a mining site of any scale;","Sell a mining site quickly at market price;","Rent a mining site on flexible terms;","Combined site capacity in our database вЂ” over 150 MW;","Verified offers, legal clarity, and professional support;","Convenient search, filters by parameters, direct contact with owners."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Contact our manager to learn more.","text":"Contact our manager to learn more."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"More useful, up-to-date information is available in our Telegram channel. Subscribe to stay on top of the latest news.","text":"More useful, up-to-date information is available in our Telegram channel. Subscribe to stay on top of the latest news."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-puly-dlya-majninga-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining pools: top 10$tmj$,
       $tmj$ViaBTC, AntPool, Poolin, F2Pool, and more вЂ” fees, payouts, and what matters for CIS miners.$tmj$,
       $tmj$ViaBTC$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining is not just connecting hardware and waiting for profit. Modern industry realities require optimizing every element: from equipment choice to strategies for allocating computing power. One of the key components in the mining chain is mining pools. This is especially relevant for those who do not own huge farms and mine with a few ASICs or on GPUs. Joining a pool can raise the odds of regular income and simplify technical support of the process.","text":"Cryptocurrency mining is not just connecting hardware and waiting for profit. Modern industry realities require optimizing every element: from equipment choice to strategies for allocating computing power. One of the key components in the mining chain is mining pools. This is especially relevant for those who do not own huge farms and mine with a few ASICs or on GPUs. Joining a pool can raise the odds of regular income and simplify technical support of the process."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm and pools","src":"/images/articles/mining-pools-top10/asic-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a pool and what functions does it perform?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining pool is a group of miners working together to mine the same block. If the pool finds a block, the reward is distributed among all participants in proportion to their contribution (hashrate).","text":"A mining pool is a group of miners working together to mine the same block. If the pool finds a block, the reward is distributed among all participants in proportion to their contribution (hashrate)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"What is a mining pool","src":"/images/articles/mining-pools-top10/what-is-pool.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Pool functions:","text":"Pool functions:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"The pool server sends each participant a hashing task;","title":"Task distribution"},{"text":"The pool determines which shares (solutions) are accepted and which are not;","title":"Accepting and verifying solutions"},{"text":"Based on accepted solutions, the share of participation and income are calculated;","title":"Reward accrual"},{"text":"The user receives income to the specified wallet or account;","title":"Fund payouts"},{"text":"Participants can track device efficiency, income statistics, and activity.","title":"Analytics and reporting"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Pools themselves are usually server software with an interface for management, monitoring, and user support.","text":"Pools themselves are usually server software with an interface for management, monitoring, and user support."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pros and cons of pools","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages:","text":"Advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Regular payouts. Even with a small hashrate you can earn daily;","Reliability. Modern pools have backup servers and DDoS protection;","Convenience. No need to find blocks yourself or run your own blockchain node;","Monitoring. Detailed dashboards let you track equipment status in real time;","Flexible payout schemes. Some pools let you choose a reward algorithm depending on your preference for stability versus yield."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Disadvantages:","text":"Disadvantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Fee. For service and infrastructure the pool takes a small percentage (usually 1вЂ“3%);","Centralization. Many miners in one pool reduces network decentralization (harmful to blockchain ideology);","Dependence on the pool. Technical outages can temporarily pause income;","Lower potential reward. In theory a solo miner who finds a block gets the full reward, but that is unlikely without large capacity."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a mining pool?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing a pool is a critical step. It directly affects income stability and the reliability of the whole mining setup.","text":"Choosing a pool is a critical step. It directly affects income stability and the reliability of the whole mining setup."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Main criteria:","text":"Main criteria:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"The higher the total hashrate, the more often the pool finds blocks;","title":"Pool hashrate"},{"text":"PPS (Pay Per Share) вЂ” stable payouts for each accepted share; PPLNS (Pay Per Last N Shares) вЂ” depends on finding a block; FPPS вЂ” a hybrid model including fees and transaction income;","title":"Profit distribution method"},{"text":"Affects final profitability;","title":"Pool fee"},{"text":"The closer the pool server is to your farm, the lower the ping and the better the stability;","title":"Server geolocation"},{"text":"Reliable pools publish block stats, payouts, and online support;","title":"Transparency"},{"text":"Some pools focus on BTC, others on ETH, LTC, Kaspa, etc.;","title":"Coin support"},{"text":"Some pools auto-withdraw income to a wallet; others require manual withdrawal.","title":"Payout threshold and withdrawal methods"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pool specifics for CIS users","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Miners from CIS countries and the region should consider factors that may affect ability to work, safe launch, and income stability:","text":"Miners from CIS countries and the region should consider factors that may affect ability to work, safe launch, and income stability:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Russian-language interface. Convenience in setup and monitoring;","Servers closer to the region. This reduces latency and share loss;","Legal risks. Some pools (for example those working through US banks) may restrict access for RF citizens;","Payouts in USDT or directly in rubles via exchangers. Especially important for regular cash-outs;","Technical support. Ideally you can reach support in Russian via popular channels (Telegram, WhatsApp)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Now letвЂ™s look at the top 10 best mining pools in Russia and worldwide.","text":"Now letвЂ™s look at the top 10 best mining pools in Russia and worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: BTC.com","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another pool linked to Bitmain Tech Ltd вЂ” the platform was created in 2016, though the company originally started as a blockchain explorer. BTC.comвЂ™s core idea is a maximally simple product for mining major crypto assets. The authors delivered in practice, as the platformвЂ™s popularity is fairly high.","text":"Another pool linked to Bitmain Tech Ltd вЂ” the platform was created in 2016, though the company originally started as a blockchain explorer. BTC.comвЂ™s core idea is a maximally simple product for mining major crypto assets. The authors delivered in practice, as the platformвЂ™s popularity is fairly high."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BTC.com","src":"/images/articles/mining-pools-top10/btc-com.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unfortunately, Russian users can no longer enjoy BTC.comвЂ™s simplicity, because the service is blocked for RU-segment miners. The reason, as with other platforms, is sanctions compliance. Despite its eastern origins, the service is also unavailable to users from China.","text":"Unfortunately, Russian users can no longer enjoy BTC.comвЂ™s simplicity, because the service is blocked for RU-segment miners. The reason, as with other platforms, is sanctions compliance. Despite its eastern origins, the service is also unavailable to users from China."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"FPPS"},{"label":"Payout limits","value":"0.005 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"4%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Refusal to work with Russian miners","High commission fees","Impressive minimum withdrawal вЂ” 0.005 BTC"],"pros":["Simple, clear interface","High level of protection","Open source code","Qualified support service","Mining of key crypto assets","Many support languages"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Binance Pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The mining service from the worldвЂ™s largest exchange launched in 2020, so the platform is relatively young. As part of Binance infrastructure, it focuses heavily on SHA-256 (BTC and BCH mining), though other coins can also be mined. Service fees are standard вЂ” 2.5%. There is also a VIP format for clients with high hashrate, with various bonuses and extra benefits.","text":"The mining service from the worldвЂ™s largest exchange launched in 2020, so the platform is relatively young. As part of Binance infrastructure, it focuses heavily on SHA-256 (BTC and BCH mining), though other coins can also be mined. Service fees are standard вЂ” 2.5%. There is also a VIP format for clients with high hashrate, with various bonuses and extra benefits."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Binance Pool","src":"/images/articles/mining-pools-top10/binance-pool.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To start using Binance Pool you must register on the platform and complete identity verification. That can be an obstacle for the RU segment, as Binance gradually restricts Russian usersвЂ™ access to its tools.","text":"To start using Binance Pool you must register on the platform and complete identity verification. That can be an obstacle for the RU segment, as Binance gradually restricts Russian usersвЂ™ access to its tools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"FPPS"},{"label":"Payout limits","value":"no limits"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"2.5%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory identity verification required","Difficulties for the RU segment"],"pros":["Reliability thanks to belonging to Binance infrastructure","Daily earnings accrual","Hashrate displayed online","Additional tools to increase miner income","Ability to get VIP status and use its benefits","Support for most algorithms and coins","Round-the-clock tech support"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: KuCoin","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A вЂњpocketвЂќ mining pool of the well-known exchange of the same name. It is a very young platform launched in 2021, but working alongside the exchange it is simple and convenient. Ease of interface and high performance are the core of the service, which mines only two coins вЂ” BTC and BCH. Funds are credited the next day to the userвЂ™s linked KuCoin exchange account.","text":"A вЂњpocketвЂќ mining pool of the well-known exchange of the same name. It is a very young platform launched in 2021, but working alongside the exchange it is simple and convenient. Ease of interface and high performance are the core of the service, which mines only two coins вЂ” BTC and BCH. Funds are credited the next day to the userвЂ™s linked KuCoin exchange account."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"KuCoin Pool","src":"/images/articles/mining-pools-top10/kucoin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Miner costs are 2%, below the segment average. The platform features simple registration, setup, and launch. Support handles requests promptly and helps miners quickly; site interfaces are well translated into Russian.","text":"Miner costs are 2%, below the segment average. The platform features simple registration, setup, and launch. Support handles requests promptly and helps miners quickly; site interfaces are well translated into Russian."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"FPPS"},{"label":"Payout limits","value":"no limits"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"2%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only two coins for mining","In autumn 2023 the service was paused while moving to an updated platform. That hurt KuCoinвЂ™s reputation among experienced users"],"pros":["Tied to a well-known exchange","Accessibility and simplicity","Quality support","Convenient interface"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: 2miners","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In contrast to Braiins Pool, where you can mine only Bitcoin, 2miners mines many coins вЂ” and Bitcoin is not among them. The multi-currency platform with 20+ mining options targets the international community. Users choose the mining format themselves, which also affects the fee (1% for PPLNS and 1.5% for Solo).","text":"In contrast to Braiins Pool, where you can mine only Bitcoin, 2miners mines many coins вЂ” and Bitcoin is not among them. The multi-currency platform with 20+ mining options targets the international community. Users choose the mining format themselves, which also affects the fee (1% for PPLNS and 1.5% for Solo)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"2miners","src":"/images/articles/mining-pools-top10/2miners.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Reviews of 2miners are mixed. On one hand it is a modern tool with many coins to earn. On the other, support is not very effective, mining has glitches, and income does not always meet expectations. Still, the product has fans worldwide.","text":"Reviews of 2miners are mixed. On one hand it is a modern tool with many coins to earn. On the other, support is not very effective, mining has glitches, and income does not always meet expectations. Still, the product has fans worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"PPLNS, Solo"},{"label":"Payout limits","value":"0.1 ETC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"1% (PPLNS), 1.5% (Solo)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Platform operation is not very stable","BTC is not among mined coins","User complaints about support"],"pros":["Many coins for mining","Simple registration and fast start","Two operating formats","Bot and notification system for important events","Built-in calculator","Detailed statistics","Low commission fees","Support for many languages"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Braiins Pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The oldest mining pool, founded back in 2010 (formerly Slush Pool, created by the developers of the Trezor wallet). Braiins Pool is widely considered the best product for beginners because connection is simple and clear. It has a convenient mobile app, and interfaces are well translated into many languages including Russian. Another distinctive trait is maximum transparency via detailed stats and accurate data.","text":"The oldest mining pool, founded back in 2010 (formerly Slush Pool, created by the developers of the Trezor wallet). Braiins Pool is widely considered the best product for beginners because connection is simple and clear. It has a convenient mobile app, and interfaces are well translated into many languages including Russian. Another distinctive trait is maximum transparency via detailed stats and accurate data."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Braiins Pool","src":"/images/articles/mining-pools-top10/braiins-pool.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Interestingly, you can mine only Bitcoin here, because the authors recognize only the first cryptocurrency. For that reason many miners, after gaining basic experience on Braiins Pool, move to alternatives with a much larger coin list.","text":"Interestingly, you can mine only Bitcoin here, because the authors recognize only the first cryptocurrency. For that reason many miners, after gaining basic experience on Braiins Pool, move to alternatives with a much larger coin list."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"Score"},{"label":"Payout limits","value":"0.001 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"2%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only one currency for mining","Special Score reward system that also depends on account age","Minimum withdrawal вЂ” 0.001 Bitcoin (you can withdraw less, but with extra costs)"],"pros":["Good reputation thanks to age","Simplicity for beginners","Detailed real-time statistics","Quality 24/7 support","Daily payouts"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: OKX Pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another major exchangeвЂ™s own pool. It mines major cryptocurrencies, but OKX Pool became most popular among ETC miners. The platform is stable, protection mechanisms are strong, so you need not worry about asset safety. Daily reward accrual is convenient, as is the lack of a minimum withdrawal.","text":"Another major exchangeвЂ™s own pool. It mines major cryptocurrencies, but OKX Pool became most popular among ETC miners. The platform is stable, protection mechanisms are strong, so you need not worry about asset safety. Daily reward accrual is convenient, as is the lack of a minimum withdrawal."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main downside is mandatory verification вЂ” and in photo format: many miners want to stay anonymous, so this may be unacceptable. OKX Pool also has high fees вЂ” 4%, somewhat above the industry average.","text":"The main downside is mandatory verification вЂ” and in photo format: many miners want to stay anonymous, so this may be unacceptable. OKX Pool also has high fees вЂ” 4%, somewhat above the industry average."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"PPLNS"},{"label":"Payout limits","value":"no limits"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"4%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory photo verification","High commission fees"],"pros":["Miner income is shown in real time and accrued automatically","No minimum withdrawal limits","Support for major coins and mining algorithms","Solid 24/7 user support","Daily payouts"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: F2Pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the largest mining pools, operating since 2013 (at founding it was called Discus Fish). An old, proven platform trusted by millions of miners worldwide вЂ” it works globally and offers many interface and support languages, including Russian.","text":"One of the largest mining pools, operating since 2013 (at founding it was called Discus Fish). An old, proven platform trusted by millions of miners worldwide вЂ” it works globally and offers many interface and support languages, including Russian."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"F2Pool","src":"/images/articles/mining-pools-top10/f2pool.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"F2Pool offers extra earning features such as merged mining вЂ” participating in bonus coins mined alongside primary ones. That lets you earn more without increasing hardware hashrate. A downside is an unusual policy for inactive accounts: if you do not withdraw and stay active, the profile may be frozen and remaining funds donated to F2Pool development.","text":"F2Pool offers extra earning features such as merged mining вЂ” participating in bonus coins mined alongside primary ones. That lets you earn more without increasing hardware hashrate. A downside is an unusual policy for inactive accounts: if you do not withdraw and stay active, the profile may be frozen and remaining funds donated to F2Pool development."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"PPS+"},{"label":"Payout limits","value":"0.005 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"2.5%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Need for timely coin withdrawals","Importance of account activity to avoid blocking","Substantial minimum payout limits"],"pros":["Age and reputation","High account protection","Many coins for mining","Merged mining feature","Global recognition and popularity","Good support"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Poolin","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A relatively young crypto mining platform that quickly gained popularity. That was possible thanks to a set of advantages, chiefly merged mining. Depending on crypto prices, the system can mine several coins at once using the same hashrate. The feature works automatically without miner intervention.","text":"A relatively young crypto mining platform that quickly gained popularity. That was possible thanks to a set of advantages, chiefly merged mining. Depending on crypto prices, the system can mine several coins at once using the same hashrate. The feature works automatically without miner intervention."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Poolin","src":"/images/articles/mining-pools-top10/poolin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Users note a simple interface, fast registration, and daily payouts. Downsides include a high export limit вЂ” 0.005 Bitcoin. PoolinвЂ™s name is also tied to a high-profile lawsuit вЂ” because creators were Bitmain developers, the company sued for employment contract violations. The settlement was nearly $200,000.","text":"Users note a simple interface, fast registration, and daily payouts. Downsides include a high export limit вЂ” 0.005 Bitcoin. PoolinвЂ™s name is also tied to a high-profile lawsuit вЂ” because creators were Bitmain developers, the company sued for employment contract violations. The settlement was nearly $200,000."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"FPPS"},{"label":"Payout limits","value":"0.005 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"2.5%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High asset export amount вЂ” 0.005 BTC","Not all site sections are well translated into Russian"],"pros":["Simple account registration, easy connection, and fast start","Mining anonymity","Merged mining of several coins","Quality user support, including Telegram","Internal miner ranking","Own profitability calculator","Prompt hashrate change alerts"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: AntPool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest crypto mining pools, founded in 2014. It belongs to the famous mining hardware maker Bitmain Tech Ltd. AntPool long led the segment by users and total hashrate, and today still ranks in the top 10 most popular shared digital-asset mining services.","text":"One of the oldest crypto mining pools, founded in 2014. It belongs to the famous mining hardware maker Bitmain Tech Ltd. AntPool long led the segment by users and total hashrate, and today still ranks in the top 10 most popular shared digital-asset mining services."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AntPool","src":"/images/articles/mining-pools-top10/antpool.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Users get two reward distribution formats вЂ” FPPS (4% fee) and PPLNS (0%). Solo mining is also allowed for users with large hashrate. Payouts are daily, but there is a minimum export of 0.005 BTC.","text":"Users get two reward distribution formats вЂ” FPPS (4% fee) and PPLNS (0%). Solo mining is also allowed for users with large hashrate. Payouts are daily, but there is a minimum export of 0.005 BTC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"FPPS and PPLNS"},{"label":"Payout limits","value":"0.005 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"4% (FPPS), 0% (PPLNS)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High fees for FPPS (4%)","Setup difficulty for beginners","High starting withdrawal amount вЂ” 0.005 BTC"],"pros":["Status as the oldest and most reliable","Fast registration","No identity verification required","Daily payouts","Choice among several operating formats","Many settings","24/7 support","Basic coins available for mining","No fee for PPLNS","Many interface languages","User chat and forum communication"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: ViaBTC","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A Chinese platform that started in 2016. ViaBTC won users over with a simple interface, high reliability, and smart mining (auto-switching to a more profitable coin). The pool is part of an ecosystem that includes a wallet and the CoinEx exchange вЂ” convenient from an infrastructure standpoint.","text":"A Chinese platform that started in 2016. ViaBTC won users over with a simple interface, high reliability, and smart mining (auto-switching to a more profitable coin). The pool is part of an ecosystem that includes a wallet and the CoinEx exchange вЂ” convenient from an infrastructure standpoint."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ViaBTC","src":"/images/articles/mining-pools-top10/viabtc.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The platform lets you withdraw a minimum of 0.001 Bitcoin, and fee-free export may require extra steps. For example, first withdraw to CoinEx (0% fees), then send to third-party services (exchanges or wallets). ViaBTC also offers three mining formats вЂ” PPLNS, PPS+, and Solo (fees depend on the choice).","text":"The platform lets you withdraw a minimum of 0.001 Bitcoin, and fee-free export may require extra steps. For example, first withdraw to CoinEx (0% fees), then send to third-party services (exchanges or wallets). ViaBTC also offers three mining formats вЂ” PPLNS, PPS+, and Solo (fees depend on the choice)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Reward distribution method","value":"PPLNS, PPS+, Solo"},{"label":"Payout limits","value":"0.001 BTC"},{"label":"Accrual frequency","value":"daily"},{"label":"Fee","value":"4% (PPS+), 2% (PPLNS), 1% (Solo)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Minimum withdrawal amount вЂ” 0.001 BTC","High fees for PPS+ mining","Need for вЂњextraвЂќ transactions to withdraw without additional costs"],"pros":["Simple, clear interface (one of the best options for beginners)","Age and trustworthiness","Three mining formats","Smart mining feature","Mining of popular formats and cryptocurrencies","Part of a whole ecosystem","Convenient mobile app"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 80
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
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining pools are a necessary tool for most market participants. They raise the odds of stable income, simplify mining, and reduce technical risks.","text":"Mining pools are a necessary tool for most market participants. They raise the odds of stable income, simplify mining, and reduce technical risks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When choosing a pool, consider:","text":"When choosing a pool, consider:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Fees;","Reputation;","Geographic proximity of servers;","Payout methods;","Supported coins;","Russian-language support and transparent rules."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For CIS miners, choose platforms with clear terms, fast access, local-currency support, and convenient withdrawals. Joining a quality pool lets you focus on what matters вЂ” improving equipment efficiency and payback.","text":"For CIS miners, choose platforms with clear terms, fast access, local-currency support, and convenient withdrawals. Joining a quality pool lets you focus on what matters вЂ” improving equipment efficiency and payback."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-puly-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshij-asik-dlya-domashnego-majninga-v-2024-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best ASIC for home mining in 2026$tmj$,
       $tmj$From Goldshell Mini-DOGE to ElphaPex DG Home 1 вЂ” quiet, compact, efficient ASICs for home use.$tmj$,
       $tmj$ElphaPex DG Home 1$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
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
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Home cryptocurrency mining remains relevant for many: despite the halving and rising difficulty, thousands still prefer to mine at home. What challenges do crypto enthusiasts face, and what does the TOP-8 of the best home ASICs look like? We answer the key questions.","text":"Home cryptocurrency mining remains relevant for many: despite the halving and rising difficulty, thousands still prefer to mine at home. What challenges do crypto enthusiasts face, and what does the TOP-8 of the best home ASICs look like? We answer the key questions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Home mining in a living room","src":"/images/articles/home-asics-2026/intro-home-living.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What should a home mining ASIC be like?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If an investor struggles to find a dedicated site, a small farm can sit in residential property вЂ” apartments, dachas, or cottages. That is why mining gear must meet three basic requirements:","text":"If an investor struggles to find a dedicated site, a small farm can sit in residential property вЂ” apartments, dachas, or cottages. That is why mining gear must meet three basic requirements:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"A key home-mining condition, because not only residents but neighbors will notice the farm. A typical ASIC averages about 80вЂ“90 dB вЂ” like an industrial vacuum. Gear for living spaces must be quieter. An alternative is soundproof boxes, but their size eats a lot of free space;","title":"Low noise"},{"text":"A classic Bitcoin ASIC draws about 3.5 kW, while residential limits often stay near 15 kW. Just three BTC ASICs can exhaust the available power and block other appliances. Breakers will trip constantly and make living there miserable. The fix is lower-power ASICs вЂ” usually for altcoins, not Bitcoin;","title":"Power consumption"},{"text":"The third challenge for home farm owners is substantial heat output. An ASIC can heat a room, but that only helps in some seasons and regions. Owners must plan heat exhaust or look at вЂњcoolerвЂќ miner models.","title":"Heat output"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Industrial miners face the same issues, but solving them in apartments is harder.","text":"Industrial miners face the same issues, but solving them in apartments is harder."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"So when choosing the best home ASIC, weigh all three factors above. Below we review current models against those requirements.","text":"So when choosing the best home ASIC, weigh all three factors above. Below we review current models against those requirements."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Goldshell Mini-DOGE","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In residential spaces you can mine coins like LTC and DOGE on Scrypt, which does not need loud, hot, power-hungry gear. One example is the Goldshell Mini-DOGE, especially the third generation. It is compact and good-looking вЂ” easy to place in an apartment without hurting the interior or comfort. Noise stays under 35 dB, similar to a regular PC.","text":"In residential spaces you can mine coins like LTC and DOGE on Scrypt, which does not need loud, hot, power-hungry gear. One example is the Goldshell Mini-DOGE, especially the third generation. It is compact and good-looking вЂ” easy to place in an apartment without hurting the interior or comfort. Noise stays under 35 dB, similar to a regular PC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Goldshell Mini-DOGE","src":"/images/articles/home-asics-2026/goldshell-mini-doge.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"As for the assets the Mini-DOGE can mine, these coins rank high for reliability and market cap. Scrypt remains a popular, relevant format, so buying such ASICs is a reasonable home setup.","text":"As for the assets the Mini-DOGE can mine, these coins rank high for reliability and market cap. Scrypt remains a popular, relevant format, so buying such ASICs is a reasonable home setup."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Goldshell"},{"label":"Release year","value":"2023"},{"label":"Base hashrate","value":"700 MH/s"},{"label":"Power consumption","value":"400 W"},{"label":"Energy efficiency","value":"0.57 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Number of mineable coins","value":"22"},{"label":"Dimensions","value":"20 Г— 15 Г— 9.6 cm"},{"label":"Weight","value":"2.2 kg"},{"label":"Noise level","value":"35 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not the best-known manufacturer","A rare model with its own repair quirks"],"pros":["Runs on solid Scrypt: 20+ mineable coins including LTC and DOGE","Low noise","Excellent Scrypt energy efficiency","Compact, light, low power draw"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Goldshell KA Box Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"GoldshellвЂ™s KA Box Pro is also suited to residential use вЂ” it runs kHeavyHash. Unlike Scrypt above, this is riskier because only three assets are supported: Kaspa (KAS), Sedra (SDR), and Bugna (BGA). KAS is fairly known; the other two are newer, smaller-cap projects. High volatility adds clear risk.","text":"GoldshellвЂ™s KA Box Pro is also suited to residential use вЂ” it runs kHeavyHash. Unlike Scrypt above, this is riskier because only three assets are supported: Kaspa (KAS), Sedra (SDR), and Bugna (BGA). KAS is fairly known; the other two are newer, smaller-cap projects. High volatility adds clear risk."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Technically the KA Box Pro is a reasonable home unit вЂ” 600 W, modest heat, acceptable noise. kHeavyHash yields can beat some better-known formats, but the risks noted above remain.","text":"Technically the KA Box Pro is a reasonable home unit вЂ” 600 W, modest heat, acceptable noise. kHeavyHash yields can beat some better-known formats, but the risks noted above remain."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Goldshell"},{"label":"Release year","value":"2024"},{"label":"Base hashrate","value":"1,600 TH/s"},{"label":"Power consumption","value":"600 W"},{"label":"Energy efficiency","value":"0.375 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Dimensions","value":"37 Г— 19.6 Г— 29 cm"},{"label":"Weight","value":"3 kg"},{"label":"Noise level","value":"55 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Risk of mining low-cap altcoins","Lesser-known maker вЂ” harder repairs","New model with few real-user reviews"],"pros":["One of the strongest home-friendly kHeavyHash ASICs","Acceptable noise level","Modest power consumption","Compact size and low weight"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Canaan Avalon Mini 3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Canaan Avalon Mini 3 is one of the few Avalon models aimed at home use. Its main trait is a household-heater form factor. That lets you combine mining with heating the room. Heat is used productively instead of wasted вЂ” especially attractive in cold climates or winter.","text":"Canaan Avalon Mini 3 is one of the few Avalon models aimed at home use. Its main trait is a household-heater form factor. That lets you combine mining with heating the room. Heat is used productively instead of wasted вЂ” especially attractive in cold climates or winter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Canaan Avalon Mini 3","src":"/images/articles/home-asics-2026/canaan-avalon-mini-3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It runs popular SHA-256 and can mine Bitcoin. Noise is about 40 dB вЂ” like a PC or household fan. That lets you place the Avalon Mini 3 in an apartment, house, office, or small server room without much discomfort.","text":"It runs popular SHA-256 and can mine Bitcoin. Noise is about 40 dB вЂ” like a PC or household fan. That lets you place the Avalon Mini 3 in an apartment, house, office, or small server room without much discomfort."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Canaan"},{"label":"Model","value":"Avalon Mini 3"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"37.50 Th/s"},{"label":"Power draw","value":"800 W"},{"label":"Mineable coins","value":"BTC"},{"label":"Noise level","value":"40 dB"},{"label":"Dimensions","value":"250 Г— 180 Г— 120 mm"},{"label":"Weight","value":"4 kg"},{"label":"Release year","value":"2024"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only one algorithm (SHA-256)","Limited performance versus industrial ASICs","Limited market availability due to its niche design"],"pros":["Household heater form factor with heating function","Low noise вЂ” suitable for living spaces","Solid SHA-256 energy efficiency","Bitcoin mining support","Compact size and low weight"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Canaan Avalon Q","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Canaan Avalon Q is a home SHA-256 ASIC for Bitcoin and compatible assets. Hashrate is 90 TH/s at 1,675 W вЂ” attractive for miners who want stable returns and a balanced power profile.","text":"Canaan Avalon Q is a home SHA-256 ASIC for Bitcoin and compatible assets. Hashrate is 90 TH/s at 1,675 W вЂ” attractive for miners who want stable returns and a balanced power profile."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Canaan Avalon Q","src":"/images/articles/home-asics-2026/canaan-avalon-q.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite higher noise than compact home models, Avalon Q remains a versatile option for home use. Cooling is built for long loaded runs, reducing overheating risk and supporting long-term stability.","text":"Despite higher noise than compact home models, Avalon Q remains a versatile option for home use. Cooling is built for long loaded runs, reducing overheating risk and supporting long-term stability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Canaan Avalon"},{"label":"Model","value":"Avalon Q"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"90 Th/s"},{"label":"Power draw","value":"1,675 W"},{"label":"Mineable coins","value":"BTC"},{"label":"Noise level","value":"65 dB"},{"label":"Dimensions","value":"455 Г— 130.5 Г— 440 mm"},{"label":"Weight","value":"10.5 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Average efficiency versus top ASICs","Not the most popular format"],"pros":["Suitable for home use","Supports Bitcoin and other SHA-256 assets","Reliable cooling system","Simple setup and connection"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: IceRiver KS0 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On familiar kHeavyHash, the IceRiver KS0 Pro stands out for home use with Kaspa (KAS), Sedra (SDR), and Bugna (BGA). There are no fans: heat dissipates through a large heatsink (passive cooling). Modest power draw also lets you build whole farms of KS0 Pro units.","text":"On familiar kHeavyHash, the IceRiver KS0 Pro stands out for home use with Kaspa (KAS), Sedra (SDR), and Bugna (BGA). There are no fans: heat dissipates through a large heatsink (passive cooling). Modest power draw also lets you build whole farms of KS0 Pro units."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IceRiver KS0 Pro","src":"/images/articles/home-asics-2026/iceriver-ks0-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This format is truly 100% home-ready. It takes little space, runs silently, and uses about as much power as a TV. The downside remains investing in young coins whose reliability is not yet proven.","text":"This format is truly 100% home-ready. It takes little space, runs silently, and uses about as much power as a TV. The downside remains investing in young coins whose reliability is not yet proven."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IceRiver"},{"label":"Release year","value":"2023"},{"label":"Base hashrate","value":"200 GH/s"},{"label":"Power consumption","value":"100 W"},{"label":"Energy efficiency","value":"0.5 W per GH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Dimensions","value":"20 Г— 19.4 Г— 7.4 cm"},{"label":"Weight","value":"3.2 kg"},{"label":"Noise level","value":"25 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited to only three coins","Lower performance than traditional KAS gear","Lesser-known maker вЂ” possible repair and parts issues"],"pros":["One of the quietest ASICs on the market (fanless design)","Compact and lightweight","Low power consumption"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Jasminer X16-Q PRO","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Jasminer gear is a real find for home use. Units are fairly powerful without extreme power draw, noise, or heat. The ASIC looks like a regular PC tower, so a farm fits most interiors without spoiling the room design.","text":"Jasminer gear is a real find for home use. Units are fairly powerful without extreme power draw, noise, or heat. The ASIC looks like a regular PC tower, so a farm fits most interiors without spoiling the room design."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Jasminer X16-Q PRO","src":"/images/articles/home-asics-2026/jasminer-x16-q-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Worth noting: the Jasminer X16-Q PRO runs EtHash and EtcHash. That opens dozens of assets including Ethereum Classic (ETC). So buying such a farm looks both home-friendly and relatively solid for the mining niche.","text":"Worth noting: the Jasminer X16-Q PRO runs EtHash and EtcHash. That opens dozens of assets including Ethereum Classic (ETC). So buying such a farm looks both home-friendly and relatively solid for the mining niche."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Sunlune Technology"},{"label":"Release year","value":"2024"},{"label":"Base hashrate","value":"2,050 MH/s"},{"label":"Power consumption","value":"520 W"},{"label":"Energy efficiency","value":"0.25 W per MH"},{"label":"Algorithm","value":"EtHash and EtcHash"},{"label":"Number of mineable coins","value":"39"},{"label":"Dimensions","value":"44.5 Г— 13.2 Г— 44.3 cm"},{"label":"Weight","value":"10 kg"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young, unproven manufacturer","Rising Jasminer prices due to popularity"],"pros":["Solid efficiency (among the best in this format)","Low noise","Compact size","Runs on well-known algorithms"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: iPollo V1 Mini","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When the iPollo V1 line launched in 2022 it made a splash вЂ” it helped start the home-mining trend. Light, compact, fairly quiet units with Wi-Fi still define a strong home ASIC today. iPollo sales stay high despite competitors.","text":"When the iPollo V1 line launched in 2022 it made a splash вЂ” it helped start the home-mining trend. Light, compact, fairly quiet units with Wi-Fi still define a strong home ASIC today. iPollo sales stay high despite competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"iPollo V1 Mini","src":"/images/articles/home-asics-2026/ipollo-v1-mini.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is set for Ethash: owners can mine 30+ coins including Ethereum Classic (ETC). You can switch to alternatives when other assets rise and look more profitable.","text":"It is set for Ethash: owners can mine 30+ coins including Ethereum Classic (ETC). You can switch to alternatives when other assets rise and look more profitable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IPollo Miner"},{"label":"Release year","value":"2022"},{"label":"Base hashrate","value":"130вЂ“400 MH/s"},{"label":"Power consumption","value":"104вЂ“232 W"},{"label":"Energy efficiency","value":"0.58вЂ“0.8 W per MH"},{"label":"Algorithm","value":"EtHash and EtcHash"},{"label":"Number of mineable coins","value":"36"},{"label":"Dimensions","value":"from 17.9 Г— 14.3 Г— 9"},{"label":"Weight","value":"2.1 kg"},{"label":"Noise level","value":"from 55 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Fairly young manufacturer","Low efficiency on some models"],"pros":["Full lineup with different performance tiers","A proven home format for altcoin mining","Wi-Fi connectivity","Proven mining algorithm","Many mineable coins"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: ElphaPex DG Home 1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex DG Home 1 targets Scrypt mining. It delivers 4 GH/s at 960 W вЂ” popular with home miners who want low noise, compact size, and clean looks. Unlike industrial units, it is built for living spaces: about 50 dB, similar to a quiet desktop PC fan.","text":"ElphaPex DG Home 1 targets Scrypt mining. It delivers 4 GH/s at 960 W вЂ” popular with home miners who want low noise, compact size, and clean looks. Unlike industrial units, it is built for living spaces: about 50 dB, similar to a quiet desktop PC fan."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex DG Home 1","src":"/images/articles/home-asics-2026/elphapex-dg-home-1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It can mine Litecoin (LTC) and Dogecoin (DOGE), which suits miners who prefer stable, well-known assets. It works on most home power setups and only needs basic ventilation for heat exhaust.","text":"It can mine Litecoin (LTC) and Dogecoin (DOGE), which suits miners who prefer stable, well-known assets. It works on most home power setups and only needs basic ventilation for heat exhaust."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Model","value":"DG Home 1"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"4 GH/s"},{"label":"Power draw","value":"960 W"},{"label":"Mineable coins","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"300 Г— 150 Г— 200 mm"},{"label":"Weight","value":"7 kg"},{"label":"Release year","value":"2023"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lower power than industrial models","Scrypt only вЂ” not for BTC or other popular SHA-256 assets"],"pros":["Suitable for home mining","Supports popular Litecoin and Dogecoin","Modern design and compact size","Simple setup and operation","Moderate noise level"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Best home ASIC: alternatives","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Above we covered the TOP-8 miners best suited to home farms. With the right fixes, almost any ASIC can run in an apartment. You mainly need to solve the three issues named earlier:","text":"Above we covered the TOP-8 miners best suited to home farms. With the right fixes, almost any ASIC can run in an apartment. You mainly need to solve the three issues named earlier:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"A good soundproof box can nearly cut noise in half to acceptable levels. Around 40вЂ“50 dB is the threshold for apartments and homes. Do not chase silence at the cost of cooling вЂ” some boxes cause overheating;","title":"Noise"},{"text":"There is no universal fix, because powerful ASICs need serious power. In some Russian regions you can raise limits or install a private transformer, but both cost extra;","title":"Electricity"},{"text":"Proper intake/exhaust ventilation, a balcony farm venting outdoors, or integrating ASICs into home heating are three effective heat solutions. Sometimes you even save on utilities вЂ” a common approach in Irkutsk, RussiaвЂ™s mining heartland.","title":"Cooling"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Home mining station","src":"/images/articles/home-asics-2026/home-mining-office.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With enough experience and technical skill, almost any ASIC can be adapted for living spaces.","text":"With enough experience and technical skill, almost any ASIC can be adapted for living spaces."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Still, always model profitability: process optimization raises the bar and can make payback nearly impossible due to noticeable extra costs.","text":"Still, always model profitability: process optimization raises the bar and can make payback nearly impossible due to noticeable extra costs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Takeaways","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Which ASIC is best for home mining? With skills and extra spend, any unit can be adapted to living spaces. If you want a farm that works out of the box, look at optimized models: ElphaPex DG Home 1, iPollo V1 Mini, Jasminer X16-Q PRO, IceRiver KS0 Pro, Canaan Avalon Q, Canaan Avalon Mini 3, Goldshell KA Box Pro, and Goldshell Mini-DOGE.","text":"Which ASIC is best for home mining? With skills and extra spend, any unit can be adapted to living spaces. If you want a farm that works out of the box, look at optimized models: ElphaPex DG Home 1, iPollo V1 Mini, Jasminer X16-Q PRO, IceRiver KS0 Pro, Canaan Avalon Q, Canaan Avalon Mini 3, Goldshell KA Box Pro, and Goldshell Mini-DOGE."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-asik-dlya-domashnego-majninga-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best cold wallets for crypto: top 10$tmj$,
       $tmj$Crypto custody is on you: compare leading hardware cold wallets for secure long-term storage.$tmj$,
       $tmj$Cold wallet for cryptocurrency$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency, like any other value, requires reliable storage. If bank accounts are protected by a system of passwords, SMS and regulations, then cryptocurrencies are completely under the responsibility of the owner. There is no вЂњhelp deskвЂќ to help you regain access to your assets. Therefore, the issue of safety comes to the fore.","text":"Cryptocurrency, like any other value, requires reliable storage. If bank accounts are protected by a system of passwords, SMS and regulations, then cryptocurrencies are completely under the responsibility of the owner. There is no вЂњhelp deskвЂќ to help you regain access to your assets. Therefore, the issue of safety comes to the fore."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the most reliable ways to store cryptocurrencies is cold wallets. This article will help you understand what they are, why they are needed, how to choose the right cold wallet, what subtleties should be taken into account and what the TOP 10 best cold wallets for storing cryptocurrencies look like.","text":"One of the most reliable ways to store cryptocurrencies is cold wallets. This article will help you understand what they are, why they are needed, how to choose the right cold wallet, what subtleties should be taken into account and what the TOP 10 best cold wallets for storing cryptocurrencies look like."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cold wallet for cryptocurrency","src":"/images/articles/cold-wallets/wallet-hero.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a cold wallet and why is it needed?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A cold wallet is a method of storing cryptocurrencies in which the user's private keys never interact directly with the Internet. This is a key difference from hot wallets, which are always connected to the network and are therefore potentially vulnerable.","text":"A cold wallet is a method of storing cryptocurrencies in which the user's private keys never interact directly with the Internet. This is a key difference from hot wallets, which are always connected to the network and are therefore potentially vulnerable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main tasks of a cold wallet:","text":"The main tasks of a cold wallet:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Secure storage of private keys;","Protection against hacker attacks and viruses;","Ensuring the maximum level of control over assets."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Example: you have 2 BTC that you are not going to use in the coming months. It is best not to keep them on an exchange or online wallet, but to move them to a cold wallet - be it a hardware device or even a paper key.","text":"Example: you have 2 BTC that you are not going to use in the coming months. It is best not to keep them on an exchange or online wallet, but to move them to a cold wallet - be it a hardware device or even a paper key."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a cold wallet?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are many solutions on the market. The choice depends on the goals, budget and level of technical training of the user. Here are the main types of cold wallets:","text":"There are many solutions on the market. The choice depends on the goals, budget and level of technical training of the user. Here are the main types of cold wallets:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Devices that store private keys in an isolated environment. The most popular manufacturers: Ledger, Trezor, SafePal. Pros: high degree of protection, physical control by the user, support for many coins and tokens. Cons: costs some money, requires handling skills, the device can be lost or damaged;","title":"Hardware Wallets"},{"text":"A physically printed sheet with a private and public key. Stored in a safe or other protected place. Pros: free storage method, no digital footprints. Cons: easy to damage or lose, inconvenient to use, does not support modern tokens and standards;","title":"Paper Wallets"},{"text":"You can create a wallet on a completely isolated computer and store your keys on an offline USB drive. Suitable for advanced users who want to customize their security.","title":"Offline computers and flash media"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Subtleties and nuances of вЂњcoldвЂќ storage","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When using hardware wallets, there are some nuances that you should be aware of.","text":"When using hardware wallets, there are some nuances that you should be aware of."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"A cold wallet creates a seed phrase (usually 12вЂ“24 words). This is the master key to all your cryptocurrencies. Lost the phrase - lost the funds. Store it physically, in several places, and do not take pictures with your phone;","title":"Seed phrase вЂ“ all or nothing"},{"text":"You should only buy hardware wallets from official suppliers. There have been cases of вЂњrepackagedвЂќ Ledger and Trezor with malware being sold online;","title":"Check the originality of the device"},{"text":"The most secure wallet is useless if it is stolen with your PIN or seed phrase. Keep your wallet in a safe place, such as a safe;","title":"Physical access protection"},{"text":"Modern hardware wallets require updates to protect against new vulnerabilities. Don't ignore these notifications.","title":"Regular firmware updates"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages and disadvantages of cold wallets","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["More difficult to use вЂ“ especially for beginners;","Possibility of physical loss of the device or seed phrase;","Not suitable for frequent operations, such as trading or DeFi."],"pros":["Maximum security вЂ“ the lack of an Internet connection eliminates remote hacking;","Control is in the hands of the user - no one but you manages the assets;","Excellent for long-term storage."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Now letвЂ™s move on to the list of TOP 10 best cold wallets.","text":"Now letвЂ™s move on to the list of TOP 10 best cold wallets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Ellipal Titan","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The largest wallet in our rating is the Ellipal Titan cold storage, originally from Hong Kong. However, the Titan in the name represents not only the dimensions of the device, but also its functionality - it has almost everything for convenient and safe work with digital assets. The key feature of the wallet is the complete absence of classic connection options (no USB, no Wi-Fi, no Bluetooth, no NFC). All work is based on QR codes, which can be read both by the device itself and from its display using a mobile phone.","text":"The largest wallet in our rating is the Ellipal Titan cold storage, originally from Hong Kong. However, the Titan in the name represents not only the dimensions of the device, but also its functionality - it has almost everything for convenient and safe work with digital assets. The key feature of the wallet is the complete absence of classic connection options (no USB, no Wi-Fi, no Bluetooth, no NFC). All work is based on QR codes, which can be read both by the device itself and from its display using a mobile phone."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Ellipal Titan supports a large number of cryptocurrencies (over 10,000) and stores NFTs. Security is ensured by standard settings and the system of using QR codes already mentioned above. The cost of the device is high, but this is justified by the technological content and wallet capabilities.","text":"Ellipal Titan supports a large number of cryptocurrencies (over 10,000) and stores NFTs. Security is ensured by standard settings and the system of using QR codes already mentioned above. The cost of the device is high, but this is justified by the technological content and wallet capabilities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ellipal Titan","src":"/images/articles/cold-wallets/ellipal-titan.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"139$"},{"label":"Display","value":"3.97 inches (color)"},{"label":"Control","value":"sensory"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Bulky case, not suitable for everyone;","High cost;","No interaction with desktop platforms (mobile devices only);","Not the most famous manufacturer."],"pros":["Reliable asset protection system;","Working with NFTs;","A huge number of coins and blockchains;","Large touch display simplifies operation;","Built-in exchanger."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: SecuX V20","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The SecuX V20 cold wallet is not as popular as products from Ledger, Trezor or SafePal, but it is a very worthy tool from the Taiwanese manufacturer. From a visual point of view, the device looks bright and respectable - there is a large color display and an aluminum back cover. And the shape of the wallet itself is very unusual.","text":"The SecuX V20 cold wallet is not as popular as products from Ledger, Trezor or SafePal, but it is a very worthy tool from the Taiwanese manufacturer. From a visual point of view, the device looks bright and respectable - there is a large color display and an aluminum back cover. And the shape of the wallet itself is very unusual."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The SecuX filling offers even more interesting things: improved security for storing assets, a large number of supported blockchains and coins, interaction with NFTs, a capacious battery, support for Bluetooth connections, and storage of up to 500 addresses for work. The cost of SecuX V20 is higher than the market average, but this is quite justified: the appearance and functionality of the cold wallet inspire respect. If you are not put off by a far from well-known manufacturer, the purchase seems justified.","text":"The SecuX filling offers even more interesting things: improved security for storing assets, a large number of supported blockchains and coins, interaction with NFTs, a capacious battery, support for Bluetooth connections, and storage of up to 500 addresses for work. The cost of SecuX V20 is higher than the market average, but this is quite justified: the appearance and functionality of the cold wallet inspire respect. If you are not put off by a far from well-known manufacturer, the purchase seems justified."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"SecuX V20","src":"/images/articles/cold-wallets/secux-v20.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"139$"},{"label":"Display","value":"2.8 inches (color)"},{"label":"Control","value":"sensory"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost;","Not the most famous manufacturer."],"pros":["Supports more than 1,000 coins;","Ability to store NFTs;","High degree of protection and safety;","Stylish appearance;","Large touch screen;","Bluetooth support;","Sealing stickers on the body;","Software adapted for all devices and platforms;","Built-in battery and long operating time;","Supports up to 500 addresses."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: KeepKey","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Swiss development is the KeepKey cold wallet, which is an alternative to popular models from Ledger and Trezor. Compared to its competitors, this device has a stylish appearance - the device looks unusual and respectable (although some may find the body too bulky). There are several protection formats (including a PIN code and a seed recovery function), but in terms of the number of cryptocurrencies, the manufacturer clearly let us down - KeepKey only works with 40 tokens.","text":"The Swiss development is the KeepKey cold wallet, which is an alternative to popular models from Ledger and Trezor. Compared to its competitors, this device has a stylish appearance - the device looks unusual and respectable (although some may find the body too bulky). There are several protection formats (including a PIN code and a seed recovery function), but in terms of the number of cryptocurrencies, the manufacturer clearly let us down - KeepKey only works with 40 tokens."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There is only one button on the wallet body - this is to turn the device on and off. All other actions are performed on a mobile phone (here again there are restrictions on working with an iPhone).","text":"There is only one button on the wallet body - this is to turn the device on and off. All other actions are performed on a mobile phone (here again there are restrictions on working with an iPhone)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"KeepKey","src":"/images/articles/cold-wallets/keepkey.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"78$"},{"label":"Display","value":"3.12 inches (monochrome)"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Small number of supported coins;","It is not possible to work with NFTs;","No iPhone support."],"pros":["Pleasant appearance;","High degree of protection;","Large display (one of the most impressive on the entire market);","Low cost;","Working with QR codes (displayed on the screen);","Built-in battery for autonomous operation of the device."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Tangem Wallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The creators of Tangem Wallet decided to take an innovative approach to security policy when working with cold storage. There are no displays, buttons, wires, or seed phrases. The wallet consists of a card and an application on the phone: communication is carried out using the NFC module. If you lose your phone, no one will be able to use your account without a card. If the card itself is lost, then without a phone there is also no access to the account (access is restored by purchasing another card). If there is no access to both the card and the phone, the password will become an obstacle for the attacker.","text":"The creators of Tangem Wallet decided to take an innovative approach to security policy when working with cold storage. There are no displays, buttons, wires, or seed phrases. The wallet consists of a card and an application on the phone: communication is carried out using the NFC module. If you lose your phone, no one will be able to use your account without a card. If the card itself is lost, then without a phone there is also no access to the account (access is restored by purchasing another card). If there is no access to both the card and the phone, the password will become an obstacle for the attacker."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"According to statistics, the main problem of crypto enthusiasts when working with cold wallets is the loss of the seed phrase. Tangem Wallet allows you to solve this issue by offering a completely different operating principle for your device. True, to organize the operation of the entire complex you will need to buy two (or better yet three) cards, which increases the budget for organizing cold storage.","text":"According to statistics, the main problem of crypto enthusiasts when working with cold wallets is the loss of the seed phrase. Tangem Wallet allows you to solve this issue by offering a completely different operating principle for your device. True, to organize the operation of the entire complex you will need to buy two (or better yet three) cards, which increases the budget for organizing cold storage."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Tangem Wallet","src":"/images/articles/cold-wallets/tangem.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"$54.90 (for 2 cards)"},{"label":"Display","value":"No"},{"label":"Control","value":"from your phone"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The need to purchase several cards at once;","It is not possible to work with NFTs;","No interaction with desktop PC."],"pros":["A fundamentally different format for the wallet;","Small card size;","All you need is a card and a smartphone;","Quick setup and easy launch;","Physical reliability of the device - cards (there is nothing to break here);","Supports all major blockchains and cryptocurrencies;","IP68 protection."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Ledger Nano X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The most popular model today is from the French manufacturer Ledger, and indeed from the whole world of cold wallets in general. As a predecessor to the Ledger Nano S, the device allows you to store several thousand cryptocurrencies. The memory is also okay: the technical stuffing allows for the installation of up to hundreds of applications, which is more than enough for comfortable work with the wallet.","text":"The most popular model today is from the French manufacturer Ledger, and indeed from the whole world of cold wallets in general. As a predecessor to the Ledger Nano S, the device allows you to store several thousand cryptocurrencies. The memory is also okay: the technical stuffing allows for the installation of up to hundreds of applications, which is more than enough for comfortable work with the wallet."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device is equipped with a battery (up to 8 hours of operation), it can work with NFT and DeFi. When it comes to security, the Ledger Nano X boasts a basic encryption package as well as additional tools. Among the disadvantages are a small display and a fairly high cost for devices of this class - there are many cheaper analogues from no less famous manufacturers.","text":"The device is equipped with a battery (up to 8 hours of operation), it can work with NFT and DeFi. When it comes to security, the Ledger Nano X boasts a basic encryption package as well as additional tools. Among the disadvantages are a small display and a fairly high cost for devices of this class - there are many cheaper analogues from no less famous manufacturers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ledger Nano X","src":"/images/articles/cold-wallets/ledger-nano-x.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"124,17в‚¬"},{"label":"Display","value":"monochrome"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Small display;","High cost."],"pros":["Traditional Ledger ease of use;","Proven security protocols, including additional tools;","Possibility of pairing not only via cable, but also Bluetooth;","Large amount of memory (installation of up to 100 applications);","An impressive list of supported blockchains and cryptocurrencies;","Working with NFT and DeFi;","Built-in battery;","Convenient applications for a wide variety of devices;","iPhone support now available."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Ledger Nano S Plus","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The improved version of Ledger Nano S offers the user a more impressive amount of memory, which solves the key problem of the basic model - the inability to properly install third-party applications. The size of the case, the connection system (Type-C instead of Micro-USB) and the dimensions of the display have also changed slightly. This is where all the differences between the two indicated versions end.","text":"The improved version of Ledger Nano S offers the user a more impressive amount of memory, which solves the key problem of the basic model - the inability to properly install third-party applications. The size of the case, the connection system (Type-C instead of Micro-USB) and the dimensions of the display have also changed slightly. This is where all the differences between the two indicated versions end."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Ledger Nano S can still be purchased from the official store of the French brand. This is an important advantage, since purchasing cold wallets from dubious marketplaces always involves the risk of hacking and theft of your assets.","text":"The Ledger Nano S can still be purchased from the official store of the French brand. This is an important advantage, since purchasing cold wallets from dubious marketplaces always involves the risk of hacking and theft of your assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ledger Nano S Plus","src":"/images/articles/cold-wallets/ledger-nano-s-plus.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"65,83в‚¬"},{"label":"Display","value":"monochrome"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The need to purchase a special cable to connect to the phone;","Refusal to work with older platforms (for example, Android before version 8.0);","Inability to work with iPhone."],"pros":["More impressive memory capacity than its predecessor;","Type-C instead of Micro-USB;","Simplicity and accessibility;","Support for major cryptocurrencies;","Ability to store NFTs;","A high-quality application for desktop operating systems."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Ledger Nano S","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cold wallet from the French manufacturer Ledger. This is the oldest model of the brand, which is no longer sold in the official Ledger store, but many cryptocurrency holders still actively use the device despite its obsolescence. Weaknesses include a small amount of memory, compatibility not with all platforms, and not the most impressive reliability. The service life of such a solution is 3вЂ“5 years, depending on the intensity of use.","text":"Cold wallet from the French manufacturer Ledger. This is the oldest model of the brand, which is no longer sold in the official Ledger store, but many cryptocurrency holders still actively use the device despite its obsolescence. Weaknesses include a small amount of memory, compatibility not with all platforms, and not the most impressive reliability. The service life of such a solution is 3вЂ“5 years, depending on the intensity of use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages include ease of use, low cost, and convenient application for desktop operating systems. By the way, Ledger Nano S does not support iPhone phones, and difficulties with purchasing may lead to the purchase of a wallet from criminals - it is still recommended to choose the manufacturerвЂ™s official stores for devices of this kind.","text":"Advantages include ease of use, low cost, and convenient application for desktop operating systems. By the way, Ledger Nano S does not support iPhone phones, and difficulties with purchasing may lead to the purchase of a wallet from criminals - it is still recommended to choose the manufacturerвЂ™s official stores for devices of this kind."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ledger Nano S","src":"/images/articles/cold-wallets/ledger-nano-s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"official sales stopped"},{"label":"Display","value":"0.91\" (monochrome)"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Outdated device;","Limited service life;","The need to purchase a special cable to connect to the phone;","Limited memory capacity;","Refusal to work with older platforms (for example, Android before version 8.0);","Inability to work with iPhone."],"pros":["Simplicity and accessibility;","Support for major cryptocurrencies;","A high-quality application for desktop operating systems."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: SafePal S1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The SafePal S1 Hardware Wallet cold wallet was developed with the support of the world's leading crypto exchange Binance. On the one hand, this is a tangible advantage, since the Binance ecosystem has key positions in the digital gold segment - the support of the leader is always an advantage. But on the other hand, Binance has recently had a specific attitude towards crypto enthusiasts from Russia. There is no direct threat to storing tokens on the SafePal S1 wallet, but if you are concerned about this factor, it is better to give preference to another storage facility.","text":"The SafePal S1 Hardware Wallet cold wallet was developed with the support of the world's leading crypto exchange Binance. On the one hand, this is a tangible advantage, since the Binance ecosystem has key positions in the digital gold segment - the support of the leader is always an advantage. But on the other hand, Binance has recently had a specific attitude towards crypto enthusiasts from Russia. There is no direct threat to storing tokens on the SafePal S1 wallet, but if you are concerned about this factor, it is better to give preference to another storage facility."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The S1 model is distinguished by its low cost, the presence of a color display, and an impressive number of supported blockchains (more than 30) and cryptocurrencies (more than 10,000). The reliability of the security system is not in doubt, as is the ease of use of Hardware Wallet. Work with the hardware wallet is carried out through a mobile application, and the presence of a rechargeable battery allows SafePal S1 to work offline for up to 5 hours.","text":"The S1 model is distinguished by its low cost, the presence of a color display, and an impressive number of supported blockchains (more than 30) and cryptocurrencies (more than 10,000). The reliability of the security system is not in doubt, as is the ease of use of Hardware Wallet. Work with the hardware wallet is carried out through a mobile application, and the presence of a rechargeable battery allows SafePal S1 to work offline for up to 5 hours."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"SafePal S1","src":"/images/articles/cold-wallets/safepal-s1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"49,99$"},{"label":"Display","value":"1.3 inches (color)"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Cooperation with Binance poses a risk for Russian users;","Interaction only through the phone (without the participation of a computer)."],"pros":["Low cost - this is one of the most affordable wallets on the market;","Huge number of supported tokens;","Color display;","Original security system without using Wi-Fi, Bluetooth and NFC;","EAL 5+ security chip with private key support;","Random number generator;","Use of QR codes and built-in camera;","Built-in battery;","Constant updating (new cryptocurrencies are added)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Trezor Model T","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A more advanced version of the basic solution from the Czech manufacturer Trezor. An expanded list of supported blockchains and cryptocurrencies, a large touch display, advanced security tools and the same high quality from a trusted European brand. Only the high cost can scare you off, but if you care about the safety of the asset and plan to store a rich portfolio, the Trezor Model T will be an excellent option for a cold wallet.","text":"A more advanced version of the basic solution from the Czech manufacturer Trezor. An expanded list of supported blockchains and cryptocurrencies, a large touch display, advanced security tools and the same high quality from a trusted European brand. Only the high cost can scare you off, but if you care about the safety of the asset and plan to store a rich portfolio, the Trezor Model T will be an excellent option for a cold wallet."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device is complemented by a password manager and the Shamir Backup security system, and the presence of a slot for a MicroSD memory card will allow you to store the seed phrase on this storage medium. The packaging is reliable and has additional protection in the form of a hologram вЂ“ another safety element from the Czech brand.","text":"The device is complemented by a password manager and the Shamir Backup security system, and the presence of a slot for a MicroSD memory card will allow you to store the seed phrase on this storage medium. The packaging is reliable and has additional protection in the form of a hologram вЂ“ another safety element from the Czech brand."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Trezor Model T","src":"/images/articles/cold-wallets/trezor-model-t.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"179$"},{"label":"Display","value":"1.54 inches (color)"},{"label":"Control","value":"sensory"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost;","Inability to work with the iPhone mobile platform;","A more complex operating format, which is not suitable for beginners."],"pros":["Support for an impressive number of blockchains and cryptocurrencies (more than 1,000);","Color touch display;","Additional security features вЂ“ password manager and Shamir Backup system;","Availability of a slot for MicroSD;","Supports most platforms вЂ“ Windows, Linux, MacOS, Android;","Reliable packaging."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Trezor Model One","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the most inexpensive cold wallets, characterized by simplicity and the availability of basic services. It has everything you need to accumulate digital assets without unnecessary functionality or overpayments. The manufacturer is a well-known Czech brand, which is famous throughout the world for the quality and reliability of its products. Add to this the presence of a small display, reliable packaging and a high-quality cryptocurrency protection system.","text":"One of the most inexpensive cold wallets, characterized by simplicity and the availability of basic services. It has everything you need to accumulate digital assets without unnecessary functionality or overpayments. The manufacturer is a well-known Czech brand, which is famous throughout the world for the quality and reliability of its products. Add to this the presence of a small display, reliable packaging and a high-quality cryptocurrency protection system."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Trezor Model One cold wallet is a kind of mandatory minimum for storing digital gold outside of the exchange. Supports major tokens and basic blockchains, however, the functionality may not be enough for advanced users and experienced crypto enthusiasts.","text":"The Trezor Model One cold wallet is a kind of mandatory minimum for storing digital gold outside of the exchange. Supports major tokens and basic blockchains, however, the functionality may not be enough for advanced users and experienced crypto enthusiasts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Trezor Model One","src":"/images/articles/cold-wallets/trezor-model-one.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"59$"},{"label":"Display","value":"0.96\" (monochrome)"},{"label":"Control","value":"push-button"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited number of supported coins and blockchains, making it difficult to manage a diversified portfolio. For example, there is no support for the Cardano platform and the ADA token;","There is no interaction with the iPhone mobile platform."],"pros":["Inexpensive solution at the lowest market price;","Simple setup and easy operation, which is convenient not only for beginners;","Interaction with major platforms вЂ“ Windows, Linux, MacOS, Android;","The wallet is securely packaged, including the hologram. This allows you to be sure that the packaging has not been opened and the device has not been reflashed before it reaches you."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 77
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
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cold wallets are the gold standard of security in the world of cryptocurrencies. If you plan to store significant amounts or not use assets on a daily basis, such a wallet is a must.","text":"Cold wallets are the gold standard of security in the world of cryptocurrencies. If you plan to store significant amounts or not use assets on a daily basis, such a wallet is a must."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Here are key tips for users:","text":"Here are key tips for users:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Choose proven brands;","Don't skimp on security - a fake can cost you everything;","Do not share the seed phrase even with those closest to you;","Combine cold storage with hot storage for convenience."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"No matter how the crypto market changes, one rule remains: вЂњnot your keys - not your cryptocurrency.вЂќ And a cold wallet makes those keys truly yours.","text":"No matter how the crypto market changes, one rule remains: вЂњnot your keys - not your cryptocurrency.вЂќ And a cold wallet makes those keys truly yours."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshij-majning-otel-top-10-hostingov-dlya-majninga
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining hotels: top 10 hosting providers$tmj$,
       $tmj$Why ASIC owners move gear from apartments to mining hotels вЂ” noise, heat, and often better economics.$tmj$,
       $tmj$Mining data center$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
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
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With the growing popularity of mining, more and more owners of ASIC equipment are thinking about placing it not at home, but in specialized mining hotels. This not only helps reduce noise and temperature in the apartment, but is also often more beneficial in terms of energy costs, stability and safety. However, choosing the right hosting is not an easy task. Let's look at the key criteria that you should pay attention to when choosing a mining hotel, and also get acquainted with the rating of the best hosting in Russia.","text":"With the growing popularity of mining, more and more owners of ASIC equipment are thinking about placing it not at home, but in specialized mining hotels. This not only helps reduce noise and temperature in the apartment, but is also often more beneficial in terms of energy costs, stability and safety. However, choosing the right hosting is not an easy task. Let's look at the key criteria that you should pay attention to when choosing a mining hotel, and also get acquainted with the rating of the best hosting in Russia."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Data center for mining","src":"/images/articles/mining-hotels/datacenter-aisle.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a mining hotel?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing a mining hotel is not just a matter of price. It is important to take into account the entire ecosystem of the service: from the electricity tariff to the quality of support and the level of security. Before placing the equipment, be sure to read the instructions, which are based on an analysis of key requirements:","text":"Choosing a mining hotel is not just a matter of price. It is important to take into account the entire ecosystem of the service: from the electricity tariff to the quality of support and the level of security. Before placing the equipment, be sure to read the instructions, which are based on an analysis of key requirements:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"One of the first and most important issues is price. Typically, the cost of placement is calculated in rubles or dollars per kW/h and depends on several factors. This includes the electricity tariff and additional services (for example, maintenance, prevention, remote monitoring). Most hotels offer a flat fee per kilowatt based on their electricity meters. Check in advance whether the price includes service and support or if all this is paid separately;","title":"Cost of placement"},{"text":"Location affects several factors at once: electricity tariffs, climate (in the northern regions there are lower costs for cooling equipment), distance from you (if you want to personally visit the farm or pick up equipment if necessary, logistics matter). Hotels in cold regions (eg Siberia) are often more profitable in terms of cooling and energy savings;","title":"Geographical location"},{"text":"ASICS are expensive equipment and must be protected. This includes physical security of the facility (video surveillance, alarm, 24/7 security), and fire safety systems. Check whether the equipment is insured against fire, theft, and power surges. This may indicate a serious approach by the company;","title":"Security: investment protection"},{"text":"A reliable mining hotel is not only the place where your ASIC is located, but also the team that maintains it. Work includes prevention and dust removal, temperature and hashrate monitoring, prompt elimination of failures and overheating, checking the operation of fans, boards and power supplies. Find out who is doing the maintenance: it could be in-house specialists or third-party contractors. The more transparent the work system, the better;","title":"Equipment Maintenance"},{"text":"A good reputation always means reliability, which becomes the key to long and productive cooperation. Study customer reviews on the Internet (on forums, in Telegram groups, on aggregator sites), ask the company for case studies, examples of clients, photo/video farms, check the life of the business - the longer it operates, the more stable the company. Reliable hotels are always open to dialogue, show real statistics and are ready to arrange a tour;","title":"Company reputation"},{"text":"High-quality technical support is one of the main factors of peace of mind; for example, having a telegram bot or a personal account where you can see the current status of the miner is welcome. The ability to quickly contact technical specialists is important. DonвЂ™t forget about support in matters of choosing a pool, setting up equipment, and ASIC firmware. The easier and faster you can solve any problem, the less downtime and losses;","title":"Support and communication"},{"text":"A big plus is the fact that the mining hotel has its own store, through which you can buy an ASIC with a guarantee and immediately send it to the hosting, receive technical support for setup and startup, return used equipment for exchange or diagnostics, and also check the equipment before purchasing.","title":"Having your own store selling ASICs"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"All of these factors must be taken into account when choosing the best hotel for mining in Russia. We have compiled complete information for you below to make your selection process easier and more productive.","text":"All of these factors must be taken into account when choosing the best hotel for mining in Russia. We have compiled complete information for you below to make your selection process easier and more productive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Getasic","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known store with its own data center for hosting equipment is Getasic. Unfortunately, the brand, like many other competitors, lacks detailed hosting data on its own official website. Potential clients have to be limited to modest information and general formulations without any precise terms of cooperation. All that the resource provides is the hotelвЂ™s power (40 MW) and a list of advantages (official accommodation format, the presence of main and backup communication channels, remote control, the presence of its own service center).","text":"A well-known store with its own data center for hosting equipment is Getasic. Unfortunately, the brand, like many other competitors, lacks detailed hosting data on its own official website. Potential clients have to be limited to modest information and general formulations without any precise terms of cooperation. All that the resource provides is the hotelвЂ™s power (40 MW) and a list of advantages (official accommodation format, the presence of main and backup communication channels, remote control, the presence of its own service center)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Before posting, the user does not know the hosting region, up-time, or cost of services. All this information is provided upon request during personal communication with the manager - a factor that can scare away many owners of cryptocurrency mining equipment.","text":"Before posting, the user does not know the hosting region, up-time, or cost of services. All this information is provided upon request during personal communication with the manager - a factor that can scare away many owners of cryptocurrency mining equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Getasic","src":"/images/articles/mining-hotels/getasic.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"no data"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"no data"},{"label":"Free capacity","value":"40 MWh"},{"label":"Cost of placement","value":"no data"},{"label":"Website","value":"miningmoon.ru"},{"label":"Domain registration date","value":"2017"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"83"},{"label":"Office address","value":"Moscow, Ostapovsky proezd, 3, building 29"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A modest amount of information on the site (no key metrics and values)."],"pros":["Own data center of a well-known store (convenient for customers);","Availability of a service center;","Effective security system (panic button and video surveillance);","Equipment insurance."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Uminers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The list of services of the store selling Uminers mining equipment is supplemented by a partner data center for hosting ASICs. The site is located in Krasnoyarsk, the maximum power is 20 MW, the facility is ready to cooperate with clients by providing at least 5 units of equipment with a capacity of at least 5 kW each. These values вЂ‹вЂ‹limit all information about Uminers hosting, which forces many potential clients to look for alternatives.","text":"The list of services of the store selling Uminers mining equipment is supplemented by a partner data center for hosting ASICs. The site is located in Krasnoyarsk, the maximum power is 20 MW, the facility is ready to cooperate with clients by providing at least 5 units of equipment with a capacity of at least 5 kW each. These values вЂ‹вЂ‹limit all information about Uminers hosting, which forces many potential clients to look for alternatives."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Uminers equipment store has a good reputation and a sufficient number of reviews to form a basic idea about the company. Unfortunately, the same cannot be said about hosting: it seems that Uminers provides hosting services in an accompanying format, focusing specifically on the sale of ASICs and components.","text":"The Uminers equipment store has a good reputation and a sufficient number of reviews to form a basic idea about the company. Unfortunately, the same cannot be said about hosting: it seems that Uminers provides hosting services in an accompanying format, focusing specifically on the sale of ASICs and components."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Uminers","src":"/images/articles/mining-hotels/uminers.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"Krasnoyarsk region"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"20 MW/h"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"no data"},{"label":"Website","value":"uminers.com"},{"label":"Domain registration date","value":"2017"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"no data"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"29"},{"label":"Office address","value":"Moscow, Khodynsky Boulevard, 11"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There is a clear lack of data on the site;","Few reviews about hosting."],"pros":["Hosting from a well-known mining equipment store;","Support of the international group of companies to which the Uminers brand belongs."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining Cluster","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Mining Cluster company has existed since 2016, implementing an integrated approach to mining (there is a store and several data centers). Reviews of cooperation are generally positive, but their number is small. There is not enough information on the companyвЂ™s official resources to form a detailed idea of вЂ‹вЂ‹the terms of cooperation. There is no data on the cost of hosting, the exact location of hosting sites (judging by the published infographics, these are probably Kirishi, Tula, Murmansk and Udomlya), the number of clients and ASICs. This information can be obtained during a consultation with a manager, talking about your budgets and goals.","text":"The Mining Cluster company has existed since 2016, implementing an integrated approach to mining (there is a store and several data centers). Reviews of cooperation are generally positive, but their number is small. There is not enough information on the companyвЂ™s official resources to form a detailed idea of вЂ‹вЂ‹the terms of cooperation. There is no data on the cost of hosting, the exact location of hosting sites (judging by the published infographics, these are probably Kirishi, Tula, Murmansk and Udomlya), the number of clients and ASICs. This information can be obtained during a consultation with a manager, talking about your budgets and goals."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining Cluster offers leasing for legal entities, as well as the sale of ready-made containers, service center services, monitoring service and turnkey mining format. The declared up-time when hosting a Mining Cluster is 99.8%, and the response speed to disconnecting the device does not exceed 5 minutes.","text":"Mining Cluster offers leasing for legal entities, as well as the sale of ready-made containers, service center services, monitoring service and turnkey mining format. The declared up-time when hosting a Mining Cluster is 99.8%, and the response speed to disconnecting the device does not exceed 5 minutes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"Kirishi, Tula, Murmansk, Udomlya"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"no data"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"no data"},{"label":"Website","value":"cluster-mining.com"},{"label":"Domain registration date","value":"2021"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Store rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"16"},{"label":"Office address","value":"Moscow, Presnenskaya embankment, 10, building 2, room No. 181"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lack of information on the website about the conditions for placing equipment;","A small number of reviews, which prevents the formation of a complete impression about the company."],"pros":["An impressive list of services: sale of equipment, hotel accommodation, service center, sale of containers, construction of data centers, investments;","Several sites for placing equipment;","Leasing for legal entities."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"BitRiver","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The largest mining company in Russia, with more than 300 megawatts of capacity, which is the absolute maximum among its competitors. The scale of BitRiverвЂ™s activities is evidenced by the fact that this organization even managed to fall under US sanctions with the wording вЂњfor activities in the technology sector of the economy.вЂќ BitRiver has nine data centers in different parts of Russia (the largest is based in Bratsk, Irkutsk region), hosting more than 100,000 devices, and the companyвЂ™s staff exceeds 500 people.","text":"The largest mining company in Russia, with more than 300 megawatts of capacity, which is the absolute maximum among its competitors. The scale of BitRiverвЂ™s activities is evidenced by the fact that this organization even managed to fall under US sanctions with the wording вЂњfor activities in the technology sector of the economy.вЂќ BitRiver has nine data centers in different parts of Russia (the largest is based in Bratsk, Irkutsk region), hosting more than 100,000 devices, and the companyвЂ™s staff exceeds 500 people."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is important to understand that cooperation with BitRiver is not available to everyone: the company is only interested in large miners, so the minimum budget for purchasing equipment is 5,000,000 rubles. Work with investors is carried out individually, so the terms of placement are presented during a dialogue with a potential client.","text":"It is important to understand that cooperation with BitRiver is not available to everyone: the company is only interested in large miners, so the minimum budget for purchasing equipment is 5,000,000 rubles. Work with investors is carried out individually, so the terms of placement are presented during a dialogue with a potential client."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BitRiver","src":"/images/articles/mining-hotels/bitriver.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"9 data centers, including the main one - the city of Bratsk, Irkutsk region"},{"label":"Number of placed devices","value":"more than 100,000"},{"label":"Served power","value":"300 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"no data"},{"label":"Website","value":"lp-bitriver.ru"},{"label":"Domain registration date","value":"2023"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Store rating, Yandex","value":"4,2"},{"label":"Number of reviews, Yandex","value":"23"},{"label":"Office address","value":"Moscow, st. Annenskaya, 17"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Work only with large investors;","Lack of information on the official website;","Conflicting reviews with a certain amount of negativity."],"pros":["The largest mining data center in Russia with its own store;","Investment format of turnkey cooperation;","Option for a ready-made business with passive income;","Fame not only in Russia, but also abroad;","9 data centers all over Russia at once;","Service center in each mining hotel;","Record production capacity."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Intelion Data Systems","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known store selling mining equipment, also offering hotel services. Intelion Data Systems has at its disposal two sites for placing ASICs - the Tver region (Kalinin NPP) and the data center of Tulachermet JSC. The potential of the first facility is 32 MW, the values вЂ‹вЂ‹for the second are not given. The number of existing clients and the number of installed ASICs is also unknown - the hosting does not provide this information, as well as the cost of its own services.","text":"A well-known store selling mining equipment, also offering hotel services. Intelion Data Systems has at its disposal two sites for placing ASICs - the Tver region (Kalinin NPP) and the data center of Tulachermet JSC. The potential of the first facility is 32 MW, the values вЂ‹вЂ‹for the second are not given. The number of existing clients and the number of installed ASICs is also unknown - the hosting does not provide this information, as well as the cost of its own services."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Intelion Data Systems provides a reliable equipment security system, up-time up to 99.4%, 24/7 support and the ability to insure equipment. In addition, if desired, the client can sign up for a tour of the facility to see the accommodation format with his own eyes.","text":"Intelion Data Systems provides a reliable equipment security system, up-time up to 99.4%, 24/7 support and the ability to insure equipment. In addition, if desired, the client can sign up for a tour of the facility to see the accommodation format with his own eyes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intelion Data Systems","src":"/images/articles/mining-hotels/intelion.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"INTELION MINE\""},{"label":"Revenue","value":"1 billion rubles"},{"label":"Courts","value":"Plaintiff: won - 28%, lost - 29%, others - 43%. Defendant: lost - 33%, others - 67%"},{"label":"Years on the market","value":"more than 6"},{"label":"Authorized capital","value":"2 million в‚Ѕ"},{"label":"Hosting location","value":"Tver and Tula region"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"32 MWh (data only for the site in the Tver region)"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"no data"},{"label":"Website","value":"intelionmine.ru"},{"label":"Domain registration date","value":"2018"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"25"},{"label":"Office address","value":"Moscow, Verkhniy Mikhailovsky 2nd passage, building 9"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lack of important information on the site (cost of placement, capacity of the second site, number of clients and hosted ASICs)."],"pros":["Own hosting of a large store with a good reputation;","Two sites at once in different regions of Russia;","Equipment insurance and full financial liability of the hotel to farm owners;","Excursions to ASIC accommodation facilities."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Gis mining (Gis Mining)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Gis mining company offers hosting services for reliable and profitable placement of equipment near the Kalinin NPP (northern part of the Tver region). The farms are located in separate containers that comply with Rosenergoatom safety standards. Fire sensors are responsible for monitoring fires (the response time of a specialized fire department to emergency situations is 2 minutes). There is a access control system on the territory, the number of surveillance cameras exceeds 700 units.","text":"The Gis mining company offers hosting services for reliable and profitable placement of equipment near the Kalinin NPP (northern part of the Tver region). The farms are located in separate containers that comply with Rosenergoatom safety standards. Fire sensors are responsible for monitoring fires (the response time of a specialized fire department to emergency situations is 2 minutes). There is a access control system on the territory, the number of surveillance cameras exceeds 700 units."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Gis mining claims at least 99.9% up-time, a convenient monitoring system and favorable warranty conditions: a year of free repairs with a maximum problem resolution time of up to 10 days (if deadlines are missed, replacement equipment is provided). If the client wishes, excursions are held at the hosting site to familiarize himself with the conditions for placing equipment.","text":"Gis mining claims at least 99.9% up-time, a convenient monitoring system and favorable warranty conditions: a year of free repairs with a maximum problem resolution time of up to 10 days (if deadlines are missed, replacement equipment is provided). If the client wishes, excursions are held at the hosting site to familiarize himself with the conditions for placing equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Gis mining","src":"/images/articles/mining-hotels/gis-mining.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"GLOBAL INFORMATION SYSTEMS\""},{"label":"Years on the market","value":"more than 3"},{"label":"Revenue","value":"406.3 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Authorized capital","value":"1.9 million в‚Ѕ"},{"label":"Hosting location","value":"Kalinin NPP (Tver region)"},{"label":"Number of placed devices","value":"more than 19,000"},{"label":"Served power","value":"70 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"from 3.99 в‚Ѕ per kW"},{"label":"Website","value":"gis-mining.ru"},{"label":"Domain registration date","value":"2021"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"68"},{"label":"Office address","value":"Moscow, Varshavskoe highway, 1c1-2"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":[],"pros":["Inexpensive electricity from nuclear power plants;","Own store and service center;","Favorable terms of warranty service;","Hosting tours;","Client support 24/7;","Cooperation with leading transport companies for the transfer of equipment;","Good reputation and no negative reviews;","Possibility of cooperation in the вЂњReady BusinessвЂќ format."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Umnus (Umnus)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Umnus company specializes in an integrated approach to mining in Russia: this means that here you can not only buy equipment, but also place it on specialized sites. Four data centers are available to customers in Moscow, Krasnoyarsk, Irkutsk and Kaspiysk. The total production capacity of Umnus is 46 MW, the equipment is serviced by specialists from its own service center, and a professional security system with video surveillance takes care of the protection of the equipment.","text":"The Umnus company specializes in an integrated approach to mining in Russia: this means that here you can not only buy equipment, but also place it on specialized sites. Four data centers are available to customers in Moscow, Krasnoyarsk, Irkutsk and Kaspiysk. The total production capacity of Umnus is 46 MW, the equipment is serviced by specialists from its own service center, and a professional security system with video surveillance takes care of the protection of the equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Umnus hosting claims 97.5% up-time, which is slightly lower than most competitors. However, as practice shows, this value is more objective, which is noted by many users. The data center offers two charging formats - a fixed amount per unit of equipment per month, as well as payment by meter. The first option involves bonus technical maintenance of ASICs - the service is already included in the price.","text":"Umnus hosting claims 97.5% up-time, which is slightly lower than most competitors. However, as practice shows, this value is more objective, which is noted by many users. The data center offers two charging formats - a fixed amount per unit of equipment per month, as well as payment by meter. The first option involves bonus technical maintenance of ASICs - the service is already included in the price."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Umnus","src":"/images/articles/mining-hotels/umnus.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"SMART DEVICES\""},{"label":"Revenue","value":"246 million в‚Ѕ"},{"label":"Courts","value":"Plaintiff: won - 0%, lost - 100%"},{"label":"Years on the market","value":"more than 4"},{"label":"Authorized capital","value":"8.5 million в‚Ѕ"},{"label":"Hosting location","value":"Moscow, Krasnoyarsk, Irkutsk and Kaspiysk"},{"label":"Number of placed devices","value":"more than 1,500"},{"label":"Served power","value":"46 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"from 11,000 в‚Ѕ per month per device"},{"label":"Website","value":"umnus.ru"},{"label":"Domain registration date","value":"2019"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"4,7"},{"label":"Number of reviews, Yandex","value":"35"},{"label":"Office address","value":"Moscow, Nagorny proezd, building 10, building 2, building 3"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No financial liability of the hoster when using any pool other than EMCD."],"pros":["An integrated approach to mining: store and data center;","Four hostings in different regions of Russia;","Own service center;","Two tariff formats - per unit of operating equipment and by meter;","Real declared up-time;","Maintenance is included in one of the accommodation rates;","Organized excursions to hotels;","Possibility of placing equipment in your own container;","There is a preferential rate for accommodation with a lower up-time."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Sibmain (Sibmain)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The hardware store and hosting Sibmain is one of the most powerful hotels for mining in Russia - the volume is 80 MW. Located in Krasnoyarsk, the data center offers a full range of services, ranging from excursions to the work of service center specialists. The declared up-time is 99%, and the response time to turning off ASICs does not exceed 7 minutes.","text":"The hardware store and hosting Sibmain is one of the most powerful hotels for mining in Russia - the volume is 80 MW. Located in Krasnoyarsk, the data center offers a full range of services, ranging from excursions to the work of service center specialists. The declared up-time is 99%, and the response time to turning off ASICs does not exceed 7 minutes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The facility has 24-hour security, a remote monitoring system and air filters. Tariffing is based on the cost of electricity depending on the time of day: day tariff - from 5 rubles per kW, night tariff - from 4 rubles per kW (16 hours on weekdays, 24 hours on weekends and holidays). Sibmain guarantees compensation for the cost of equipment loss if the cause is the fault of hosting employees.","text":"The facility has 24-hour security, a remote monitoring system and air filters. Tariffing is based on the cost of electricity depending on the time of day: day tariff - from 5 rubles per kW, night tariff - from 4 rubles per kW (16 hours on weekdays, 24 hours on weekends and holidays). Sibmain guarantees compensation for the cost of equipment loss if the cause is the fault of hosting employees."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Sibmain","src":"/images/articles/mining-hotels/sibmain.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"Krasnoyarsk"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"80 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"from 4 в‚Ѕ per kW"},{"label":"Website","value":"sibmain.ru"},{"label":"Domain registration date","value":"2021"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"17"},{"label":"Office address","value":"Moscow, Kaluzhskaya square, 1/1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There is no data on the number of clients and ASICs;","Only one hotel - in Siberia (possible difficulties with logistics)."],"pros":["Complex format of work: equipment sales store and hosting;","Tangible production capacity;","Favorable accommodation rates;","Possibility of visiting excursions."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"IBMM Technology (IBM Technology)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A large group of companies providing services both in the field of equipment sales and placement of mining devices. IBMM Technology offers five options for launching customer equipment in various parts of Russia: Mineralnye Vody, Perm, Penza, Irkutsk and Buryatia. The cost of hosting services starts at 4.2 rubles per kW - this tariff is available when commissioning an impressive fleet of ASICs, starting from 50 units. The minimum farm volume for cooperation with IBMM Technology is 5 units.","text":"A large group of companies providing services both in the field of equipment sales and placement of mining devices. IBMM Technology offers five options for launching customer equipment in various parts of Russia: Mineralnye Vody, Perm, Penza, Irkutsk and Buryatia. The cost of hosting services starts at 4.2 rubles per kW - this tariff is available when commissioning an impressive fleet of ASICs, starting from 50 units. The minimum farm volume for cooperation with IBMM Technology is 5 units."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unfortunately, not all detailed information about hosting is presented on the official website of the site - it is suggested that you find out the details during direct communication with managers. It is known that clientsвЂ™ ASICs are located indoors, there is a reliable security system, and cooperation is formalized. Currently, IBMM Technology placement volumes amount to about 4,000 units of customer equipment.","text":"Unfortunately, not all detailed information about hosting is presented on the official website of the site - it is suggested that you find out the details during direct communication with managers. It is known that clientsвЂ™ ASICs are located indoors, there is a reliable security system, and cooperation is formalized. Currently, IBMM Technology placement volumes amount to about 4,000 units of customer equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IBMM Technology","src":"/images/articles/mining-hotels/ibmm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Hosting location","value":"Mineralnye Vody, Perm, Penza, Irkutsk and Buryatia"},{"label":"Number of placed devices","value":"more than 4,000"},{"label":"Served power","value":"100 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"from 4.2 в‚Ѕ per kW"},{"label":"Website","value":"ibmm.ru"},{"label":"Domain registration date","value":"2017"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"225"},{"label":"Office address","value":"Moscow, MKAD, 44 km., building 1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There is a minimum hosting threshold вЂ“ from 5 ASICs;","Lack of information about the hotel on the official website."],"pros":["One of the largest sellers of mining equipment, which increases the reputation of the hosting;","There are five sites at once in different parts of Russia;","Favorable terms of cooperation for large miners;","Good reviews and rating."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Promminer","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the largest stores selling mining equipment in Russia also provides data center services to host clientsвЂ™ equipment. Unfortunately, for unknown reasons, the companyвЂ™s website does not contain detailed information about the conditions for placing the equipment. Promminer only claims that it provides one of the minimum prices for placement (from 5.2 rubles per kW), but in practice this is far from the most advantageous offer among competitors. The declared up-time is standard - 99%, service is provided around the clock, 7 days a week, an online monitoring system is indicated. Among the striking advantages of Promminer hosting are insurance of clientsвЂ™ equipment and security of the facility by the Russian National Guard.","text":"One of the largest stores selling mining equipment in Russia also provides data center services to host clientsвЂ™ equipment. Unfortunately, for unknown reasons, the companyвЂ™s website does not contain detailed information about the conditions for placing the equipment. Promminer only claims that it provides one of the minimum prices for placement (from 5.2 rubles per kW), but in practice this is far from the most advantageous offer among competitors. The declared up-time is standard - 99%, service is provided around the clock, 7 days a week, an online monitoring system is indicated. Among the striking advantages of Promminer hosting are insurance of clientsвЂ™ equipment and security of the facility by the Russian National Guard."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Upon closer examination of the site, it becomes clear that the site contains a review video with an overview of hosting. The video makes it clear that the hotel is located in the Kemerovo region, and the cost of accommodation starts at 4.3 rubles per kW (inconsistency with the figures on the website). Such a policy seems strange, to say the least.","text":"Upon closer examination of the site, it becomes clear that the site contains a review video with an overview of hosting. The video makes it clear that the hotel is located in the Kemerovo region, and the cost of accommodation starts at 4.3 rubles per kW (inconsistency with the figures on the website). Such a policy seems strange, to say the least."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Promminer","src":"/images/articles/mining-hotels/promminer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"PROMMINER LLC"},{"label":"Revenue","value":"121.2 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Years on the market","value":"more than a year and a half (probably a new LLC)"},{"label":"Authorized capital","value":"500 thousand в‚Ѕ"},{"label":"Hosting location","value":"Kemerovo region"},{"label":"Number of placed devices","value":"no data"},{"label":"Served power","value":"40 MWh"},{"label":"Free capacity","value":"no data"},{"label":"Cost of placement","value":"from 4.3 в‚Ѕ per kW"},{"label":"Website","value":"promminer.ru"},{"label":"Domain registration date","value":"2019"},{"label":"Own equipment store","value":"Yes"},{"label":"Own service center","value":"Yes"},{"label":"Site rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"90"},{"label":"Office address","value":"Moscow, st. Letnaya, 99 st3, office 4"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A small amount of information on the site;","Inconsistency between the information on the website and the data in the promotional video."],"pros":["Hosting of one of the largest equipment stores;","Availability of an equipment insurance system;","Reliable hotel security system;","Good rating and a large number of positive reviews."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a hotel for mining: conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To summarize: to make a final decision, follow the instructions from practicing miners.","text":"To summarize: to make a final decision, follow the instructions from practicing miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Please pay attention to the following steps:","text":"Please pay attention to the following steps:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Study our rating, where all the necessary information is collected;","Compare several offers;","Read real reviews;","Check the contract and return conditions;","Chat with technical support."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"And remember: even the most favorable tariff will not pay off if your equipment is idle or burns out from dust and overheating. Look not just for cheap hosting, but for a reliable partner for the long term.","text":"And remember: even the most favorable tariff will not pay off if your equipment is idle or burns out from dust and overheating. Look not just for cheap hosting, but for a reliable partner for the long term."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Looking for the best mining hotel? The TOP MINING team will select hosting where you can place ASICs at 15% cheaper than the market. 39 mining hotels from our list will compete for you, offering the best rate:","text":"Looking for the best mining hotel? The TOP MINING team will select hosting where you can place ASICs at 15% cheaper than the market. 39 mining hotels from our list will compete for you, offering the best rate:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["We are No. 1 in aggregator of mining hotels;","We will save 100+ hours of time on selection, contracts, repairs;","We will agree on a minimum rate for accommodation;","With us, your ASICs and investments are safe."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Contact our manager for details.","text":"Contact our manager for details."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Even more useful and relevant information can be found in our Telegram channel. Subscribe to stay up to date with the latest news.","text":"Even more useful and relevant information can be found in our Telegram channel. Subscribe to stay up to date with the latest news."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Accommodation in a data center","src":"/images/articles/mining-hotels/promminer-price.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshij-majning-otel-top-10-hostingov-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
