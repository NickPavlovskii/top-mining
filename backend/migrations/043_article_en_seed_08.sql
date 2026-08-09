SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Most powerful Bitcoin mining ASICs$tmj$,
       $tmj$Rising BTC difficulty pushes vendors to ship ever stronger machines вЂ” a ranking of top hashrate ASICs.$tmj$,
       $tmj$Bitcoin and mining equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
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
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite hundreds and even thousands of digital assets, Bitcoin remains the worldвЂ™s most reliable and popular cryptocurrency. BTC mining difficulty rises fast, forcing ASIC makers to build new, more powerful and efficient models. What does a TOP-10 of the most powerful Bitcoin machines look like? Meet the 2024вЂ“2025 leaders.","text":"Despite hundreds and even thousands of digital assets, Bitcoin remains the worldвЂ™s most reliable and popular cryptocurrency. BTC mining difficulty rises fast, forcing ASIC makers to build new, more powerful and efficient models. What does a TOP-10 of the most powerful Bitcoin machines look like? Meet the 2024вЂ“2025 leaders."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcoin and mining hardware","src":"/images/articles/powerful-btc-asics/intro-btc.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why mine on powerful ASICs?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are three key reasons to use high-performance crypto-mining hardware:","text":"There are three key reasons to use high-performance crypto-mining hardware:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Mining networks, especially Bitcoin, regularly raise difficulty. With every new participant, competition for blocks grows. A powerful ASIC lets you stay in the game, mine blocks, and earn rewards even as competition rises;","title":"Network difficulty keeps rising"},{"text":"High performance means more hashrate вЂ” and more potential income on a growing market. With proper setup and reasonable electricity cost, a powerful ASIC can pay back much faster than a weak or outdated one;","title":"Fast payback"},{"text":"Modern powerful ASICs often have improved cooling, overheat protection, and better efficiency, which makes operation more stable and predictable.","title":"Higher stability"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages of powerful miners:","text":"Advantages of powerful miners:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["High hashrate is the main advantage. For example, the Antminer S21 delivers up to 200вЂ“250 TH/s, and Hydro models reach 800+ TH/s;","Energy efficiency вЂ” top models run about 20вЂ“30% more efficiently than older or weaker peers;","Fewer devices вЂ” easier maintenance. One powerful ASIC can replace three or four outdated units, simplifying farm logistics and management;","Long-term relevance вЂ” such models stay profitable longer as difficulty rises and crypto prices change."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Drawbacks of powerful ASIC miners:","text":"Drawbacks of powerful ASIC miners:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["High starting price вЂ” top models can cost from $3,000 to $10,000 and up;","High power draw вЂ” despite efficiency, total consumption can reach 3вЂ“6 kW per unit;","Noise and heat вЂ” especially on air-cooled models. Living-space placement is difficult;","Infrastructure needs вЂ” stable power, ventilation or water cooling, and overload protection."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Alternatives to powerful ASICs","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"What if you cannot choose ASIC mining? Here are alternatives worth considering:","text":"What if you cannot choose ASIC mining? Here are alternatives worth considering:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Older or less powerful units. Cheaper to buy, but they age faster and earn less. Often used where electricity is cheap or free;","GPU mining. Flexible, especially for ASIC-resistant algorithms. Needs more technical skill and yields less profit at the same hardware cost;","Cloud mining. Renting capacity from data centers. No hardware purchase, but risks are high: opaque terms to outright fraud;","CPU farms. Rare today, better for experiments or niche algorithms."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Antminer S21 XP IMM","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The only air-cooled ASIC near the bottom of our ranking вЂ” the classic Antminer S21 XP at 270 TH/s is one of the most powerful air-cooled miners. That is telling: makers struggle with traditional cooling given modern hardwareвЂ™s phenomenal power.","text":"The only air-cooled ASIC near the bottom of our ranking вЂ” the classic Antminer S21 XP at 270 TH/s is one of the most powerful air-cooled miners. That is telling: makers struggle with traditional cooling given modern hardwareвЂ™s phenomenal power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S21 XP uses BitmainвЂ™s traditional vertical form factor with two fan pairs. Connectors, setup, and maintenance are familiar to any Bitcoin ASIC miner. Mining the worldвЂ™s first cryptocurrency on this model needs no new skills. The task is simple and clear.","text":"The Antminer S21 XP uses BitmainвЂ™s traditional vertical form factor with two fan pairs. Connectors, setup, and maintenance are familiar to any Bitcoin ASIC miner. Mining the worldвЂ™s first cryptocurrency on this model needs no new skills. The task is simple and clear."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 XP IMM","src":"/images/articles/powerful-btc-asics/antminer-s21-xp-imm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"270 TH/s"},{"label":"Power consumption","value":"3,645 W"},{"label":"Energy efficiency","value":"13.5 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Serious heat intensity;","Impressive price;","High noise level."],"pros":["The most powerful air-cooled Bitcoin ASIC of 2024;","Excellent energy-efficiency figure;","Well-known manufacturer."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Whatsminer M66S","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"310 TH/s was not enough for the top three most powerful ASICs of 2024. Yet it was enough for the maker to abandon traditional air cooling. MicroBTвЂ™s Whatsminer M66S is designed for immersion-fluid dunking вЂ” that is how its boards are cooled.","text":"310 TH/s was not enough for the top three most powerful ASICs of 2024. Yet it was enough for the maker to abandon traditional air cooling. MicroBTвЂ™s Whatsminer M66S is designed for immersion-fluid dunking вЂ” that is how its boards are cooled."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another distinctive trait is substantial current draw вЂ” 5,580 W. Still, efficiency is excellent вЂ” that is the future of Bitcoin ASIC mining. The model opens a new era of mining the worldвЂ™s first cryptocurrency: the process is more complex and requires new overheating-control skills. On the other hand, immersion cooling is already familiar to many farm owners, for example in Siberia, where even ordinary ASICs are adapted for immersion fluid.","text":"Another distinctive trait is substantial current draw вЂ” 5,580 W. Still, efficiency is excellent вЂ” that is the future of Bitcoin ASIC mining. The model opens a new era of mining the worldвЂ™s first cryptocurrency: the process is more complex and requires new overheating-control skills. On the other hand, immersion cooling is already familiar to many farm owners, for example in Siberia, where even ordinary ASICs are adapted for immersion fluid."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M66S","src":"/images/articles/powerful-btc-asics/whatsminer-m66s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"310 TH/s"},{"label":"Power consumption","value":"from 5,580 W"},{"label":"Energy efficiency","value":"18 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"20 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Extra cost to set up immersion cooling;","Need to learn immersion technology;","Impressive power draw (serious wiring requirements);","Three-phase power."],"pros":["Nearly silent operation;","Option to use the mining farm as home heating;","Solid energy-efficiency figures;","Well-known manufacturer."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: WhatsMiner M53S++","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"MicroBTвЂ™s powerful 320 TH/s ASIC comes in a server form factor with water cooling. Unlike immersion, the WhatsMiner M53S++ need not be dunked in special fluid. You need a different add-on kit for comfortable temperatures вЂ” radiators and a pump. Simply put, chips transfer heat to water that a pump sends to a radiator for dissipation.","text":"MicroBTвЂ™s powerful 320 TH/s ASIC comes in a server form factor with water cooling. Unlike immersion, the WhatsMiner M53S++ need not be dunked in special fluid. You need a different add-on kit for comfortable temperatures вЂ” radiators and a pump. Simply put, chips transfer heat to water that a pump sends to a radiator for dissipation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The WhatsMiner M53S++ is further proof that Bitcoin miningвЂ™s future rests on alternative cooling, not air. That approach costs extra (at least $1,000), but it is the only way to cool ultra-high-performance BTC hardware.","text":"The WhatsMiner M53S++ is further proof that Bitcoin miningвЂ™s future rests on alternative cooling, not air. That approach costs extra (at least $1,000), but it is the only way to cool ultra-high-performance BTC hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"WhatsMiner M53S++","src":"/images/articles/powerful-btc-asics/whatsminer-m53s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"320 TH/s"},{"label":"Power consumption","value":"7,040 W"},{"label":"Energy efficiency","value":"22 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"20 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Phenomenal power consumption;","Three-phase power;","Extra cost to organize cooling;","Not the best efficiency among modern models."],"pros":["Impressive performance;","Native integration into home heating: the miner heats the medium even if internet fails;","Low noise level;","Proven manufacturer."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Whatsminer M63S","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A more advanced next-gen version of the M53S++ is the Whatsminer M63S. An even more productive ASIC reaching 406 TH/s. MicroBT engineers optimized efficiency, slightly raising consumption while seriously boosting ASIC power.","text":"A more advanced next-gen version of the M53S++ is the Whatsminer M63S. An even more productive ASIC reaching 406 TH/s. MicroBT engineers optimized efficiency, slightly raising consumption while seriously boosting ASIC power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cooling uses the familiar water approach that fits a country-house heating system вЂ” solving two tasks at once. Besides earning from mining digital assets, you also cut utility bills. Drawbacks match the previous generation вЂ” extra cooling costs and serious electrical requirements for the premises.","text":"Cooling uses the familiar water approach that fits a country-house heating system вЂ” solving two tasks at once. Besides earning from mining digital assets, you also cut utility bills. Drawbacks match the previous generation вЂ” extra cooling costs and serious electrical requirements for the premises."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M63S","src":"/images/articles/powerful-btc-asics/whatsminer-m63s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"406 TH/s"},{"label":"Power consumption","value":"7,308 W"},{"label":"Energy efficiency","value":"18 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"20 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Unprecedented wiring requirements;","380 V power;","Need to add cooling (radiators and pump)."],"pros":["The most powerful Whatsminer from proven MicroBT;","Convenient home-heating integration;","Solid efficiency values;","Impressive performance;","Low noise level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Antminer S23 Imm","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 Immersion 442 TH/s is a powerful 2025 Bitmain ASIC built solely for immersion cooling. It targets large mining sites where efficiency, stability, and cooling savings matter.","text":"The Antminer S23 Immersion 442 TH/s is a powerful 2025 Bitmain ASIC built solely for immersion cooling. It targets large mining sites where efficiency, stability, and cooling savings matter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At 442 TH/s and 12 J/TH, this miner is among the most productive SHA-256 solutions. Without fans it runs nearly silent, does not overheat, and sustains 24/7 load without performance loss.","text":"At 442 TH/s and 12 J/TH, this miner is among the most productive SHA-256 solutions. Without fans it runs nearly silent, does not overheat, and sustains 24/7 load without performance loss."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For data centers, mining farms, and large investors, the Antminer S23 Imm is an industrial tool вЂ” durable, economical, and built for long work in an endless compute marathon.","text":"For data centers, mining farms, and large investors, the Antminer S23 Imm is an industrial tool вЂ” durable, economical, and built for long work in an endless compute marathon."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Immersion","src":"/images/articles/powerful-btc-asics/antminer-s23-imm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S23 Imm"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"442 TH/s"},{"label":"Power draw","value":"5,304 W"},{"label":"Energy efficiency","value":"12 J/TH"},{"label":"Coin","value":"BTC"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not suitable for home use;","Immersion system required вЂ” extra investment;","High power consumption."],"pros":["High hashrate, among the best in class;","Efficiency lowers mining cost;","Immersion cooling вЂ” fully silent operation;","Optimized for industrial mining farms and data centers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Antminer S21 XP Hydro 473 Th/s","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BITMAINвЂ™s Antminer S21 XP Hydro shows phenomenal performance metrics вЂ” 473 TH/s. Water cooling lets the model show its best qualities.","text":"BITMAINвЂ™s Antminer S21 XP Hydro shows phenomenal performance metrics вЂ” 473 TH/s. Water cooling lets the model show its best qualities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"As with Whatsminer peers, the Antminer needs radiators and a pump, or the farm can act as a private-home boiler вЂ” all with extra cost. Analyze efficiency and it is clear this is a phenomenal device for mining BTC at maximum efficiency.","text":"As with Whatsminer peers, the Antminer needs radiators and a pump, or the farm can act as a private-home boiler вЂ” all with extra cost. Analyze efficiency and it is clear this is a phenomenal device for mining BTC at maximum efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 XP Hydro","src":"/images/articles/powerful-btc-asics/antminer-s21-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"473 TH/s"},{"label":"Power consumption","value":"5,676 W"},{"label":"Energy efficiency","value":"12 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"20 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price;","Extra costs fitting a heating system;","Three-phase connection."],"pros":["Record figures in two categories at once: power and efficiency;","Low noise level;","Can be used within a home heating system;","Well-known manufacturer;","Less demanding electrification thanks to acceptable power draw."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: SealMiner A2 Pro Hyd","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The SealMiner A2 Pro Hyd is a powerful engineering machine built for long, stable work that can stay profitable even when crypto-market economics shift. A next-gen industrial ASIC for those building serious Bitcoin mining infrastructure. At 500 TH/s it unlocks high, stable yield, and hydro cooling lets it sustain 24/7 loads without overheating or performance loss.","text":"The SealMiner A2 Pro Hyd is a powerful engineering machine built for long, stable work that can stay profitable even when crypto-market economics shift. A next-gen industrial ASIC for those building serious Bitcoin mining infrastructure. At 500 TH/s it unlocks high, stable yield, and hydro cooling lets it sustain 24/7 loads without overheating or performance loss."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Efficiency is 14.9 J/TH, competitive among 2025 devices. At 7,450 W draw it needs serious electrification вЂ” especially on industrial farms and corporate data centers.","text":"Efficiency is 14.9 J/TH, competitive among 2025 devices. At 7,450 W draw it needs serious electrification вЂ” especially on industrial farms and corporate data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"SealMiner A2 Pro Hyd","src":"/images/articles/powerful-btc-asics/sealminer-a2-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"SealMiner"},{"label":"Model","value":"A2 Pro Hyd"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"500 TH/s"},{"label":"Power draw","value":"7,450 W"},{"label":"Energy efficiency","value":"14,9 J/TH"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"482 Г— 665 Г— 86 mm"},{"label":"Weight","value":"20.5 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Hydro cooling required вЂ” extra cost;","High power consumption;","Weight and size need industrial placement;","Not suitable for home or household use;","Higher electrical-infrastructure requirements."],"pros":["High hashrate вЂ” 500 TH/s;","Advanced hydro cooling;","Predictable performance under 24/7 load;","Optimized for industrial mining complexes;","Balanced power-to-efficiency ratio."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer S23 Hyd","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 Hydro is another Bitmain step toward compute-performance limits. Built for industrial mining amid rising competition and harder Bitcoin mining. At 580 TH/s and 9.5 J/TH it firmly ranks among 2025вЂ™s most advanced solutions.","text":"The Antminer S23 Hydro is another Bitmain step toward compute-performance limits. Built for industrial mining amid rising competition and harder Bitcoin mining. At 580 TH/s and 9.5 J/TH it firmly ranks among 2025вЂ™s most advanced solutions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The secret of stable work is water cooling, which avoids overheating, extends chip life, and minimizes performance loss under 24/7 load. At 5,510 W it is surprisingly economical for this hashrate вЂ” especially versus prior generations.","text":"The secret of stable work is water cooling, which avoids overheating, extends chip life, and minimizes performance loss under 24/7 load. At 5,510 W it is surprisingly economical for this hashrate вЂ” especially versus prior generations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 Hydro is not just a miner but a scalable industrial solution for large farms, data centers, and future Bitcoin-mining infrastructure.","text":"The Antminer S23 Hydro is not just a miner but a scalable industrial solution for large farms, data centers, and future Bitcoin-mining infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Hydro","src":"/images/articles/powerful-btc-asics/antminer-s23-hyd.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer S23 Hydro"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"580 TH/s"},{"label":"Power draw","value":"5,510 W"},{"label":"Energy efficiency","value":"9.5 J/TH"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"410 x 170 x 209 mm"},{"label":"Weight","value":"13.5 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["External water-cooling system required;","High infrastructure entry barrier;","Not intended for home use;","Extra hydro-system maintenance costs."],"pros":["One of the highest hashrates on the market;","Best efficiency in the water-cooled class;","Water cooling reduces hardware wear;","Suitable for large mining centers and dense installs."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer S21E XP Hydro 3U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain keeps setting the mining-industry pace with ever higher performance and efficiency. One novelty is the Antminer S21E XP Hydro вЂ” a next-gen water ASIC aimed at industrial farms and data centers.","text":"Bitmain keeps setting the mining-industry pace with ever higher performance and efficiency. One novelty is the Antminer S21E XP Hydro вЂ” a next-gen water ASIC aimed at industrial farms and data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S21E XP Hydro can deliver up to 860 TH/s, making it one of the most powerful SHA-256 mining devices on the market.","text":"The Antminer S21E XP Hydro can deliver up to 860 TH/s, making it one of the most powerful SHA-256 mining devices on the market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A key advantage is efficiency вЂ” 13 W/TH, much lower than prior generations. That cuts operating costs and makes the unit more profitable long term, especially with expensive electricity. The S21E XP Hydro uses liquid cooling to remove heat effectively under high load.","text":"A key advantage is efficiency вЂ” 13 W/TH, much lower than prior generations. That cuts operating costs and makes the unit more profitable long term, especially with expensive electricity. The S21E XP Hydro uses liquid cooling to remove heat effectively under high load."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Thanks to that, the device runs more stably, does not overheat, and is nearly silent unlike traditional air-cooled models.","text":"Thanks to that, the device runs more stably, does not overheat, and is nearly silent unlike traditional air-cooled models."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It ships in a compact 3U form factor for server racks. Note that full operation needs external water cooling, raising total install and maintenance costs.","text":"It ships in a compact 3U form factor for server racks. Note that full operation needs external water cooling, raising total install and maintenance costs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21E XP Hydro 3U","src":"/images/articles/powerful-btc-asics/antminer-s21e-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Starting price","value":"from в‚Ѕ1,400,000"},{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Base hashrate","value":"860 TH/s"},{"label":"Power consumption","value":"11,180 W"},{"label":"Energy efficiency","value":"13 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"90 x 48 x 13 cm"},{"label":"Mass","value":"14 kg"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price;","Water cooling."],"pros":["Record power;","Excellent energy efficiency;","Headroom for several years ahead."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer U3S23H","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer U3S23H is the most powerful ASIC in BitmainвЂ™s line, built for industrial Bitcoin mining as network difficulty rises. At 1,160 TH/s it clearly surpasses prior generations and sets a new efficiency standard in the SHA-256 segment.","text":"The Antminer U3S23H is the most powerful ASIC in BitmainвЂ™s line, built for industrial Bitcoin mining as network difficulty rises. At 1,160 TH/s it clearly surpasses prior generations and sets a new efficiency standard in the SHA-256 segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It has advanced water cooling and moisture/dust protection for stable 24/7 work without performance loss. Real-time monitoring is supported вЂ” track hashrate, temperature, and equipment status without delay, which matters for large farms and data centers.","text":"It has advanced water cooling and moisture/dust protection for stable 24/7 work without performance loss. Real-time monitoring is supported вЂ” track hashrate, temperature, and equipment status without delay, which matters for large farms and data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer U3S23H is for professional use and needs prepared infrastructure: a strong electrical grid, heat rejection, and space for hydro-cooling modules.","text":"The Antminer U3S23H is for professional use and needs prepared infrastructure: a strong electrical grid, heat rejection, and space for hydro-cooling modules."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U3S23H","src":"/images/articles/powerful-btc-asics/antminer-u3s23h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer U3S23H"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"1160 TH/s"},{"label":"Power draw","value":"11,020 W (В±10%)"},{"label":"Energy efficiency","value":"вЂ”"},{"label":"Coins","value":"BTC, FB"},{"label":"Cooling","value":"Water"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"900 Г— 482.6 Г— 130 mm"},{"label":"Weight","value":"48 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Needs a strong electrical grid and extra infrastructure;","Significant power consumption;","Industrial placement only;","Extra cooling-system maintenance costs."],"pros":["The highest hashrate on the market;","Water cooling reduces wear and extends lifespan;","Dust and moisture protection for stable operation;","Real-time hashrate monitoring support;","Built for large mining clusters and data centers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 78
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
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Powerful ASICs today are a tool for serious mining aimed at long-term profit. They deliver high income and resilience to rising difficulty, but need large investment and thoughtful infrastructure. If you can invest in hardware and have access to cheap electricity вЂ” such devices become the foundation of profitable mining. Otherwise consider alternatives or entering the market from more modest positions.","text":"Powerful ASICs today are a tool for serious mining aimed at long-term profit. They deliver high income and resilience to rising difficulty, but need large investment and thoughtful infrastructure. If you can invest in hardware and have access to cheap electricity вЂ” such devices become the foundation of profitable mining. Otherwise consider alternatives or entering the market from more modest positions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- samye-populyarnye-asiki-dlya-majninga-top-5
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Most popular mining ASICs$tmj$,
       $tmj$Which ASIC models miners choose most often вЂ” and why specialized hardware still dominates crypto mining.$tmj$,
       $tmj$Mining farm with ASIC equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
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
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The cryptocurrency market keeps growing, and mining remains one of the key ways to obtain digital assets. Among mining hardware, ASICs hold a special place вЂ” specialized devices built solely to mine specific cryptocurrencies. Unlike GPUs and CPUs, ASICs deliver exceptional compute power and energy efficiency. That performance made them industry favorites. But which ones deserve attention today, and how do you choose wisely among many models?","text":"The cryptocurrency market keeps growing, and mining remains one of the key ways to obtain digital assets. Among mining hardware, ASICs hold a special place вЂ” specialized devices built solely to mine specific cryptocurrencies. Unlike GPUs and CPUs, ASICs deliver exceptional compute power and energy efficiency. That performance made them industry favorites. But which ones deserve attention today, and how do you choose wisely among many models?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm with ASIC hardware","src":"/images/articles/popular-asics/mining-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How do certain ASICs become popular?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Not every ASIC becomes popular вЂ” the market is full of both successes and clear failures. Devices that make the popularity TOP share key traits that make them profitable and reliable in use.","text":"Not every ASIC becomes popular вЂ” the market is full of both successes and clear failures. Devices that make the popularity TOP share key traits that make them profitable and reliable in use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"ASIC leaders deliver high hashrate at moderate or low power draw. That is critical: even a high-performance unit that uses too much electricity quickly becomes unprofitable;","title":"Optimal hashrate-to-efficiency ratio"},{"text":"A minerвЂ™s popularity is tied directly to the coin it mines. For example, the Antminer S21 is popular because it runs SHA-256 for Bitcoin вЂ” the most capitalized and stable cryptocurrency. Likewise, the Antminer L9 is popular thanks to rising interest in Dogecoin and Litecoin;","title":"Algorithm and coin relevance"},{"text":"TOP ASICs have вЂњheadroomвЂќ and often stay relevant for several years. Users prefer such models because they remain profitable even as network difficulty rises;","title":"Resistance to obsolescence"},{"text":"Most popular models come from major brands вЂ” Bitmain, MicroBT, Goldshell (reliable logistics, tech support, regular firmware updates). That gives buyers confidence in stable operation;","title":"Wide availability and maker support"},{"text":"Hit ASICs have large communities. That means optimized firmwares (e.g. Hiveon, Braiins OS), overclocking guides, and cooling/repair tips вЂ” especially important for beginners;","title":"Strong community and firmware/mods"},{"text":"TOP models often have a convenient web UI, auto pool connect, and fast integration. Users вЂ” especially beginners вЂ” choose gear you can launch almost out of the box;","title":"Easy install and setup"},{"text":"Popular ASICs show medium or fast payback even at current crypto and power prices. That attracts solo miners and large farms alike.","title":"Price and payback"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"That is the list of seven key parameters that drive popularity for a given model.","text":"That is the list of seven key parameters that drive popularity for a given model."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose an ASIC miner wisely?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A short checklist for buying a truly current, durable mining machine:","text":"A short checklist for buying a truly current, durable mining machine:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Choice depends on which cryptocurrency you want to mine: SHA-256 for Bitcoin and Bitcoin Cash, Scrypt for Litecoin and Dogecoin, Ethash / Etchash for Ethereum Classic, and so on;","title":"Mining algorithm"},{"text":"That is miner power, measured in TH/s or GH/s. Higher means faster block solving. But a higher number is not always better if it comes with huge power draw;","title":"Hashrate"},{"text":"Measured in J/TH (joules per terahash). Energy cost is a key profit factor. Prefer the lowest value with a solid hashrate;","title":"Energy efficiency"},{"text":"Compare device price, current network difficulty, and yield. Use ROI calculators and account for your regionвЂ™s electricity price;","title":"Cost and payback"},{"text":"Reliable brands with good service вЂ” Bitmain (Antminer), MicroBT (Whatsminer), iPollo, Goldshell. Avoid little-known makers without reputation or reviews.","title":"Support and manufacturer"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Every field has bestsellers вЂ” cars, books, and mining too.","text":"Every field has bestsellers вЂ” cars, books, and mining too."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Crypto mining with ASICs has its own ranking: here are the most popular mining ASICs вЂ” a TOP-8 of devices crypto enthusiasts choose most often. They are very different units that share one trait вЂ” these models are far more popular than competing designs.","text":"Crypto mining with ASICs has its own ranking: here are the most popular mining ASICs вЂ” a TOP-8 of devices crypto enthusiasts choose most often. They are very different units that share one trait вЂ” these models are far more popular than competing designs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: iPollo V1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This brand appeared recently вЂ” the model launched in 2022 and quickly won many home miners. The concept is the reason: a compact, nearly silent ASIC ideal for home crypto mining. The iPollo V1 also does not heat up heavily, which helps when running this farm in living spaces.","text":"This brand appeared recently вЂ” the model launched in 2022 and quickly won many home miners. The concept is the reason: a compact, nearly silent ASIC ideal for home crypto mining. The iPollo V1 also does not heat up heavily, which helps when running this farm in living spaces."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unfortunately, the iPollo V1 line is not for Bitcoin. The ASIC runs EtHash for altcoins such as Ethereum Classic (ETC). That is unsurprising: the worldвЂ™s first cryptocurrency is demanding on miner internals, which causes heat, high power draw, and loud noise. The iPollo V1 avoids those drawbacks by mining alts. It is an optimal format for home mining and for getting started.","text":"Unfortunately, the iPollo V1 line is not for Bitcoin. The ASIC runs EtHash for altcoins such as Ethereum Classic (ETC). That is unsurprising: the worldвЂ™s first cryptocurrency is demanding on miner internals, which causes heat, high power draw, and loud noise. The iPollo V1 avoids those drawbacks by mining alts. It is an optimal format for home mining and for getting started."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"iPollo V1","src":"/images/articles/popular-asics/ipollo-v1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IPollo Miner"},{"label":"Release year","value":"2022"},{"label":"Base hashrate","value":"130вЂ“3,600 MH/s"},{"label":"Power consumption","value":"104вЂ“3,100 W"},{"label":"Energy efficiency","value":"0.58вЂ“0.96 W per MH"},{"label":"Algorithm","value":"EtHash and EtcHash"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"from 17.9 x 14.3 x 9 to 31.4 x 19.4 x 29 cm"},{"label":"Weight","value":"from 2.1 to 13 kg"},{"label":"Noise level","value":"from 55 to 70 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest income level;","A fairly young, less-known manufacturer."],"pros":["Compact вЂ” the miner does not take much space;","Low noise while running;","Low power consumption;","Low heat output;","Ideal first miner and for home use."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Whatsminer M50","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The MicroBT Whatsminer M50 is a direct rival to the Antminer S19: similar specs and similar price. Choosing between the two makers is conceptual вЂ” like Apple vs Samsung, Toyota vs BMW, Pepsi vs Coca-Cola.","text":"The MicroBT Whatsminer M50 is a direct rival to the Antminer S19: similar specs and similar price. Choosing between the two makers is conceptual вЂ” like Apple vs Samsung, Toyota vs BMW, Pepsi vs Coca-Cola."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Look closer and small differences remain. Whatsminer ships in a horizontal single-deck form factor with only two fans. Antminer units are two-deck miners with four coolers. That does not matter much, so MicroBT vs Antminer is not a make-or-break choice.","text":"Look closer and small differences remain. Whatsminer ships in a horizontal single-deck form factor with only two fans. Antminer units are two-deck miners with four coolers. That does not matter much, so MicroBT vs Antminer is not a make-or-break choice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M50","src":"/images/articles/popular-asics/whatsminer-m50.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2022"},{"label":"Base hashrate","value":"114вЂ“126 TH/s"},{"label":"Power consumption","value":"3,276вЂ“3,306 W"},{"label":"Energy efficiency","value":"26вЂ“29 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"43 x 22 x 15.5 cm"},{"label":"Weight","value":"11.7 kg"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["After the halving, Whatsminer M50 mining profitability dropped sharply;","Unclear outlook: if difficulty keeps rising fast, the Whatsminer M50 may soon lose relevance."],"pros":["A line that stayed relevant even after the halving (for sites with cheap power);","Some see Whatsminer products as a quality and reliability benchmark;","Popular maker and model вЂ” repairs are not hard;","Relevant on the secondary market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Antminer L9","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If earlier Scrypt miner generations were standard workhorses, the Antminer L9 is already a heavy industrial crypto-mining system. Surpassing the popular L7, this ASIC became the new benchmark for Litecoin and Dogecoin mining.","text":"If earlier Scrypt miner generations were standard workhorses, the Antminer L9 is already a heavy industrial crypto-mining system. Surpassing the popular L7, this ASIC became the new benchmark for Litecoin and Dogecoin mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer L9 shows strong performance at standard power draw and remains one of the most powerful Scrypt ASICs on the market. Its efficiency balances compute power and electricity cost вЂ” important for home enthusiasts and industrial farms.","text":"The Antminer L9 shows strong performance at standard power draw and remains one of the most powerful Scrypt ASICs on the market. Its efficiency balances compute power and electricity cost вЂ” important for home enthusiasts and industrial farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"Up to 17,600 Mh/s"},{"label":"Power draw","value":"3,360 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"400 Г— 195 Г— 290 mm"},{"label":"Weight","value":"14.1 kg"},{"label":"Release year","value":"2024"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise level;","High starting price versus less powerful peers."],"pros":["Top performance among Scrypt ASIC miners;","More powerful than the previous L7;","High energy efficiency;","Classic air cooling;","Suitable for merged mining of several coins."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Antminer L7","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Even with newer, more powerful models, the Antminer L7 remains one of the most popular Scrypt ASICs. It is valued for proven reliability, efficiency, and a balanced mix of power, noise, and consumption. For a long time it was the Litecoin and Dogecoin benchmark and is still used on large farms and small private setups.","text":"Even with newer, more powerful models, the Antminer L7 remains one of the most popular Scrypt ASICs. It is valued for proven reliability, efficiency, and a balanced mix of power, noise, and consumption. For a long time it was the Litecoin and Dogecoin benchmark and is still used on large farms and small private setups."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer L7 delivers up to 9,500 Mh/s at 3,425 W, making it an effective tool for stable long-term mining. It combines working power and efficiency and stays profitable even after 2025.","text":"The Antminer L7 delivers up to 9,500 Mh/s at 3,425 W, making it an effective tool for stable long-term mining. It combines working power and efficiency and stays profitable even after 2025."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"Up to 9,500 Mh/s"},{"label":"Power draw","value":"3,425 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"180 Г— 225 Г— 320 mm"},{"label":"Weight","value":"15 kg"},{"label":"Release year","value":"2021"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Noise around 75 dB вЂ” not suitable for living spaces without soundproofing;","Competition with newer ASICs lengthens payback."],"pros":["One of the most popular Scrypt ASICs;","Stability and reliability proven in use;","Solid performance at moderate power draw;","Supports profitable coins: LTC and DOGE;","Stays relevant even as new powerful models appear."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Antminer S9","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An outdated unit relevant only with a вЂњfreeвЂќ outlet made our ranking thanks to legend status. The reason is simple вЂ” this model is a true mining legend from early days. Hundreds of thousands of Antminer S9s were made; many saw several owners. Miners were overclocked, repaired, upgraded, and given water cooling (S9 Hydro). Many crypto enthusiasts started mining digital assets on this model.","text":"An outdated unit relevant only with a вЂњfreeвЂќ outlet made our ranking thanks to legend status. The reason is simple вЂ” this model is a true mining legend from early days. Hundreds of thousands of Antminer S9s were made; many saw several owners. Miners were overclocked, repaired, upgraded, and given water cooling (S9 Hydro). Many crypto enthusiasts started mining digital assets on this model."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Today using the legend is not fully justified, even with a so-called вЂњfreeвЂќ outlet. Any alternative after 2018 earns more, so the Antminer S9 is firmly the past. That does not change the fact that the 9th line is the most popular mining ASIC in the industryвЂ™s history.","text":"Today using the legend is not fully justified, even with a so-called вЂњfreeвЂќ outlet. Any alternative after 2018 earns more, so the Antminer S9 is firmly the past. That does not change the fact that the 9th line is the most popular mining ASIC in the industryвЂ™s history."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S9","src":"/images/articles/popular-asics/antminer-s9.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2017"},{"label":"Hashrate","value":"from 13 to 18 TH/s"},{"label":"Power consumption","value":"from 1,280 to 1,728 W"},{"label":"Energy efficiency","value":"from 96 to 98 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"85 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lost relevance after 2024."],"pros":["Incredible durability and exemplary reliability;","Unfussy model;","Repairability;","In the past вЂ” an optimal way to start mining;","Many spare parts on the secondary market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer S19","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BitmainвЂ™s Antminer 19th series can rightly be called legendary. It was the most popular model before the 2024 halvings, and many miners still use these devices. If electricity is below average, Antminer S19 operation remains profitable.","text":"BitmainвЂ™s Antminer 19th series can rightly be called legendary. It was the most popular model before the 2024 halvings, and many miners still use these devices. If electricity is below average, Antminer S19 operation remains profitable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Technically, Bitmain gear is reliable and unfussy. With proper scheduled maintenance, an Antminer can run for years. That put Bitmain products in the most-popular ASICs TOP. As of early 2025, every 4th ASIC in the world is an Antminer S19.","text":"Technically, Bitmain gear is reliable and unfussy. With proper scheduled maintenance, an Antminer can run for years. That put Bitmain products in the most-popular ASICs TOP. As of early 2025, every 4th ASIC in the world is an Antminer S19."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S19","src":"/images/articles/popular-asics/antminer-s19-a.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2020"},{"label":"Base hashrate","value":"90вЂ“110 TH/s"},{"label":"Power consumption","value":"3,250 W"},{"label":"Energy efficiency","value":"29вЂ“36 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"40 x 19.5 x 29 cm"},{"label":"Weight","value":"14.4 kg"},{"label":"Noise level","value":"82 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["If network hashrate keeps rising, Antminer S19 mining margins will fall fast;","Low income with expensive electricity."],"pros":["Reliable, unfussy devices from a proven maker;","Still profitable after the halving (with a cheap outlet);","Relevant on the secondary market;","Fast, inexpensive repair at any specialized center."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer T21","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer T21 is a professional SHA-256 miner built for Bitcoin. It delivers up to 190 TH/s at 3,610 W, making it one of the most popular ASICs in its class.","text":"The Antminer T21 is a professional SHA-256 miner built for Bitcoin. It delivers up to 190 TH/s at 3,610 W, making it one of the most popular ASICs in its class."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A model trait is three-phase power. That connection is common on large farms and data centers but less convenient for private miners. That is why the Antminer T21 costs less than most peers with similar hashrate вЂ” it targets the pro market, which lowers demand from home users.","text":"A model trait is three-phase power. That connection is common on large farms and data centers but less convenient for private miners. That is why the Antminer T21 costs less than most peers with similar hashrate вЂ” it targets the pro market, which lowers demand from home users."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer T21","src":"/images/articles/popular-asics/antminer-t21.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"190 TH/s"},{"label":"Power draw","value":"3,610 W"},{"label":"Coins","value":"BTC"},{"label":"Noise level","value":"80 dB"},{"label":"Dimensions","value":"570 Г— 316 Г— 430 mm"},{"label":"Weight","value":"20 kg"},{"label":"Release year","value":"2023"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Needs three-phase power, which complicates home connection;","Noise up to 80 dB вЂ” install only in isolated rooms or on mining sites."],"pros":["One of the accessibility leaders in its category;","Suitable for large farms and industrial mining clusters;","Good stability and reliability."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Bitmain Antminer S21","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of todayвЂ™s most modern and efficient ASIC lines tops our popularity ranking. These miners are the most profitable and effective after 2024, because younger modelsвЂ™ ROI is doubtful вЂ” especially where power is expensive.","text":"One of todayвЂ™s most modern and efficient ASIC lines tops our popularity ranking. These miners are the most profitable and effective after 2024, because younger modelsвЂ™ ROI is doubtful вЂ” especially where power is expensive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S21 line belongs to ChinaвЂ™s Bitmain, the world leader in mining hardware. That helps owners: Russia has many service centers, a wide spare-parts range, and strong secondary-market demand. Bitmain devices also proved reliable and unfussy miners that can run for years with proper care.","text":"The Antminer S21 line belongs to ChinaвЂ™s Bitmain, the world leader in mining hardware. That helps owners: Russia has many service centers, a wide spare-parts range, and strong secondary-market demand. Bitmain devices also proved reliable and unfussy miners that can run for years with proper care."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitmain Antminer S21","src":"/images/articles/popular-asics/antminer-s21-b.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2023"},{"label":"Base hashrate","value":"200вЂ“335 TH/s"},{"label":"Power consumption","value":"3,250вЂ“5,360 W"},{"label":"Energy efficiency","value":"16вЂ“17.5 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"11.7 x 30.4 x 33.8 cm (19.5 x 29 x 40 cm for Hyd)"},{"label":"Weight","value":"17.5 kg (13.1 for Hyd)"},{"label":"Noise level","value":"70 dB (50 dB for Hyd)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price;","Not adapted for home mining (high noise, serious power draw, large heat output)."],"pros":["Exemplary line efficiency as of 2024;","Mining on the key popular algorithm вЂ” SHA-256;","Known, proven manufacturer;","A water-cooled unit in the series;","No issues with spare parts and service centers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 57
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
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ASICs are becoming the industry standard thanks to efficiency, power, and ease of use. But for investments to pay off, it matters to:","text":"ASICs are becoming the industry standard thanks to efficiency, power, and ease of use. But for investments to pay off, it matters to:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Pick a model for the right cryptocurrency and algorithm;","Assess power consumption and potential yield;","Account for brand reliability and hardware relevance amid rising mining difficulty."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ASIC choice should rest not only on specs but on your budget, electricity cost, and mining strategy (long-term mining, resale, solo mining, or pools).","text":"ASIC choice should rest not only on specs but on your budget, electricity cost, and mining strategy (long-term mining, resale, solo mining, or pools)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samye-populyarnye-asiki-dlya-majninga-top-5$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Most expensive mining ASICs: top premium models$tmj$,
       $tmj$After the halving reshaped hardware demand, which high-end ASICs command the biggest price tags.$tmj$,
       $tmj$Industrial mining farm$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
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
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"2024 became a pivotal year for mining and cryptocurrencies: the spring halving substantially reshaped the balance of power, affected the hardware market, and forced some miners to quit. Against that backdrop, a ranking of the most expensive ASICs for mining in 2026 is worth a look вЂ” we prepared a TOP-5 of the priciest models. And as a quick spoiler вЂ” not every model is aimed only at Bitcoin mining.","text":"2024 became a pivotal year for mining and cryptocurrencies: the spring halving substantially reshaped the balance of power, affected the hardware market, and forced some miners to quit. Against that backdrop, a ranking of the most expensive ASICs for mining in 2026 is worth a look вЂ” we prepared a TOP-5 of the priciest models. And as a quick spoiler вЂ” not every model is aimed only at Bitcoin mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Industrial mining farm","src":"/images/articles/expensive-asics/mining-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why are ASICs so expensive?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Several reasons explain this pricing policy in the mining industry:","text":"Several reasons explain this pricing policy in the mining industry:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"An ASIC is a device designed solely for one task: mining cryptocurrency (for example, Bitcoin with SHA-256). Chip development requires major investment вЂ” from design to testing and mass production. Factory production lines cost millions of dollars, and not every company can afford that;","title":"Narrow specialization and manufacturing complexity"},{"text":"The main players are Bitmain, MicroBT, Canaan, and a few others. That limited field creates low competition, which lets manufacturers keep prices high, especially on flagship models;","title":"Limited number of manufacturers"},{"text":"When crypto prices rise, interest in mining grows. That spikes demand for equipment, and supply does not always keep up. The result is higher prices, especially on popular models;","title":"High demand with limited supply"},{"text":"Most ASIC devices are manufactured in China. International shipping adds customs duties, taxes, and fees вЂ” all of which are baked into the final price.","title":"Logistics and duty challenges"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why are new ASIC miners always more expensive?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"You have probably noticed that as soon as a new model hits the market, its price is much higher than competing offers. LetвЂ™s explain why:","text":"You have probably noticed that as soon as a new model hits the market, its price is much higher than competing offers. LetвЂ™s explain why:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"New models offer better energy efficiency and hashrate. For example, if an older miner delivers 190 TH/s at 3.5 kW, a new one may deliver 240 TH/s at the same or lower power draw. That helps recover investment faster вЂ” hence the premium price;","title":"Improved specs"},{"text":"Owners of the first batches of new ASICs get a competitive edge: they start mining at higher efficiency before network difficulty adapts. Manufacturers use that by charging a premium for access to the newest hardware;","title":"The вЂњfirst-moverвЂќ effect"},{"text":"Early on, the manufacturer releases a limited number of units, and wholesalers or large pools often buy them up. The smaller the supply, the higher the price.","title":"Limited launch volumes"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to buy an ASIC cheaper?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"That does not mean buying a miner cheaper is impossible. Here are a few tips to lower the price:","text":"That does not mean buying a miner cheaper is impossible. Here are a few tips to lower the price:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Many miners upgrade and sell older, still-working models. On platforms like Avito, eBay, or specialized forums you can find good deals. The main thing is to verify the unit works and the seller is honest;","title":"Buying on the secondary market"},{"text":"You can always order equipment directly from the manufacturer or a large distributor at a lower price;","title":"Wholesale purchases"},{"text":"Some companies offer installment plans, discounts on multiple units, or seasonal promotions. Such offers appear more often when the crypto market is down;","title":"Buying from local suppliers with installments or discounts"},{"text":"When crypto prices fall, interest in mining drops. That is an ideal time to buy equipment: sellers are willing to negotiate just to move their hardware.","title":"Wait for market dips"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Now letвЂ™s look at the TOP-5 most expensive ASICs in the world: leaders that stand out not only for high performance, but also for price.","text":"Now letвЂ™s look at the TOP-5 most expensive ASICs in the world: leaders that stand out not only for high performance, but also for price."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC with liquid cooling","src":"/images/articles/expensive-asics/antminer-hydro-tubes.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: VolcMiner D1 Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"VolcMiner D1 Hydro 30GH is an industrial Scrypt ASIC miner aimed at Litecoin and Dogecoin mining. The device costs more than 1,000,000 rubles, which immediately places the model in the professional segment for large farms and data centers.","text":"VolcMiner D1 Hydro 30GH is an industrial Scrypt ASIC miner aimed at Litecoin and Dogecoin mining. The device costs more than 1,000,000 rubles, which immediately places the model in the professional segment for large farms and data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The miner delivers 30 GH/s at 7,600 W. Water cooling helps hold stable temperatures and lowers noise to 50 dB, which matters in dense deployments. The unit is designed for a three-phase 380 V supply and is not intended for home use.","text":"The miner delivers 30 GH/s at 7,600 W. Water cooling helps hold stable temperatures and lowers noise to 50 dB, which matters in dense deployments. The unit is designed for a three-phase 380 V supply and is not intended for home use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"VolcMiner D1 Hydro","src":"/images/articles/expensive-asics/volcminer-d1-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Starting price","value":"from 1,000,000 rubles"},{"label":"Manufacturer","value":"VolcMiner"},{"label":"Release year","value":"2024"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"30 GH/s"},{"label":"Power consumption","value":"7,600 W"},{"label":"Energy efficiency","value":"0.253 J/MH"},{"label":"Coins for mining","value":"LTC, DOGE, BEL"},{"label":"Cooling","value":"Water"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"657 Г— 482 Г— 87 mm"},{"label":"Weight","value":"25.8 kg"},{"label":"Operating temperature","value":"from -20 to +45 В°C"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires three-phase 380 V power;","Not suitable for home mining;","More complex maintenance than air cooling."],"pros":["One of the most powerful Scrypt ASICs;","High energy efficiency for its class;","Water cooling reduces heat and noise;","Suitable for round-the-clock industrial operation;","Aimed at stable LTC and DOGE mining."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Antminer S23 HYDRO 580 TH","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S23 Hydro 580 TH is a high-performance Bitmain ASIC for Bitcoin mining on SHA-256. The model belongs to the water-cooled line and targets farms where high density, stable operation, and minimal noise matter.","text":"Antminer S23 Hydro 580 TH is a high-performance Bitmain ASIC for Bitcoin mining on SHA-256. The model belongs to the water-cooled line and targets farms where high density, stable operation, and minimal noise matter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"580 TH/s at 5,510 W delivers strong performance and 9.5 J/TH efficiency. Water cooling lowers thermal load and keeps noise around 45 dB, which is especially important for 24/7 operation.","text":"580 TH/s at 5,510 W delivers strong performance and 9.5 J/TH efficiency. Water cooling lowers thermal load and keeps noise around 45 dB, which is especially important for 24/7 operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Hydro","src":"/images/articles/expensive-asics/antminer-hydro-black.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"from 1,200,000 rubles"},{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2026"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"580 В±3% TH/s"},{"label":"Power consumption","value":"5,510 В±5% W"},{"label":"Energy efficiency","value":"9.5 В±5% J/TH"},{"label":"Coins for mining","value":"BTC, BCH"},{"label":"Cooling","value":"Water"},{"label":"Noise level","value":"45 dB"},{"label":"Dimensions","value":"410 Г— 170 Г— 209 mm"},{"label":"Weight","value":"13.5 kg"},{"label":"Operating temperature","value":"0вЂ“40 В°C"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires a water cooling system;","Not suitable for home mining;","High power-supply requirements."],"pros":["High hashrate for SHA-256;","Low noise thanks to water cooling;","Excellent energy efficiency for its class;","Suitable for dense placement in farms and data centers;","Higher performance than previous models."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer S21e XP Hydro 3U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21e XP Hydro 3U is one of the most powerful SHA-256 ASIC miners, aimed at industrial Bitcoin mining. The model uses a 3U server form factor and is meant for data centers, mining hotels, and large farms with prepared engineering infrastructure.","text":"Antminer S21e XP Hydro 3U is one of the most powerful SHA-256 ASIC miners, aimed at industrial Bitcoin mining. The model uses a 3U server form factor and is meant for data centers, mining hotels, and large farms with prepared engineering infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"860 TH/s at 11,180 W makes the Antminer S21e XP Hydro 3U a professional mining tool built for long-term operation. The water cooling system ensures stable work under high load, reduces noise and heat, and positively affects equipment lifespan.","text":"860 TH/s at 11,180 W makes the Antminer S21e XP Hydro 3U a professional mining tool built for long-term operation. The water cooling system ensures stable work under high load, reduces noise and heat, and positively affects equipment lifespan."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21e XP Hydro 3U","src":"/images/articles/expensive-asics/antminer-3u-rack.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"from 1,200,000 rubles"},{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"860 В±3% TH/s"},{"label":"Power consumption","value":"11,180 В±5% W"},{"label":"Energy efficiency","value":"13 J/TH"},{"label":"Coins for mining","value":"BTC, BCH"},{"label":"Cooling","value":"Water"},{"label":"Dimensions","value":"900 Г— 482.6 Г— 130 mm"},{"label":"Weight","value":"42.7 kg"},{"label":"Operating temperature","value":"0вЂ“40 В°C"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High entry cost;","Substantial power consumption;","Higher requirements for the electrical network and cooling;","Not intended for home mining."],"pros":["Record performance for SHA-256;","Aimed at industrial and data-center mining;","Stable operation thanks to hydro cooling;","Convenient 3U rack form factor;","Strong relevance for several years ahead."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer L11 Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Hydro is a flagship Scrypt ASIC aimed at industrial Litecoin and Dogecoin mining. The device delivers 33 GH/s at 5,676 W, offering notably better energy efficiency than the previous L9 generation. The starting price underscores that the model belongs to the premium segment.","text":"Antminer L11 Hydro is a flagship Scrypt ASIC aimed at industrial Litecoin and Dogecoin mining. The device delivers 33 GH/s at 5,676 W, offering notably better energy efficiency than the previous L9 generation. The starting price underscores that the model belongs to the premium segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The miner has a liquid cooling system that holds stable temperatures under high load and lowers noise to 45 dB. The Antminer L11 Hydro is designed for data centers and professional mining farms with prepared infrastructure and reliable power.","text":"The miner has a liquid cooling system that holds stable temperatures under high load and lowers noise to 45 dB. The Antminer L11 Hydro is designed for data centers and professional mining farms with prepared infrastructure and reliable power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro","src":"/images/articles/expensive-asics/antminer-hydro-tubes.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"from 1,400,000 rubles"},{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"33 GH/s"},{"label":"Power consumption","value":"5,676 W"},{"label":"Energy efficiency","value":"172 J/GH"},{"label":"Coins for mining","value":"LTC, DOGE, BEL"},{"label":"Cooling","value":"Liquid"},{"label":"Noise level","value":"45 dB"},{"label":"Weight","value":"60.3 kg"},{"label":"Operating temperature","value":"0вЂ“40 В°C"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High entry cost;","Substantial power consumption;","Infrastructure and cooling requirements;","Not suitable for home mining."],"pros":["High Scrypt performance;","Simultaneous Litecoin and Dogecoin mining;","Improved energy efficiency versus previous models;","Liquid cooling and lower noise;","Aimed at long-term industrial operation."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer U3S23H","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer U3S23H is one of the most expensive and highest-performing ASIC miners on the market. The model targets industrial Bitcoin mining and other SHA-256 coins, offering a record 1,160 TH/s (1.16 PH/s). Its price places it in the premium segment for large mining farms and data centers.","text":"Antminer U3S23H is one of the most expensive and highest-performing ASIC miners on the market. The model targets industrial Bitcoin mining and other SHA-256 coins, offering a record 1,160 TH/s (1.16 PH/s). Its price places it in the premium segment for large mining farms and data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"High power is paired with a water cooling system that ensures stable operation under round-the-clock load. Despite a high noise level, the Antminer U3S23H is designed for specialized mining hotels and industrial facilities with prepared infrastructure and strong power supply.","text":"High power is paired with a water cooling system that ensures stable operation under round-the-clock load. Despite a high noise level, the Antminer U3S23H is designed for specialized mining hotels and industrial facilities with prepared infrastructure and strong power supply."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U3S23H","src":"/images/articles/expensive-asics/antminer-hydro-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Price","value":"from 2,500,000 rubles"},{"label":"Manufacturer","value":"Bitmain"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"1,160 TH/s"},{"label":"Power consumption","value":"11,020 В±10% W"},{"label":"Coins for mining","value":"BTC, BCH, BSV, FB"},{"label":"Cooling","value":"Water"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"900 Г— 482.6 Г— 130 mm"},{"label":"Weight","value":"48 kg"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Very high cost;","Substantial power consumption;","High noise level;","Requires professional infrastructure and a powerful electrical network."],"pros":["Record 1.16 PH/s hashrate;","Suitable for industrial Bitcoin mining;","Stable 24/7 operation under high load;","Water cooling and overheating protection;","Modern monitoring and management features."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
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
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ASICs are a powerful but expensive tool for mining cryptocurrencies. Their high price is driven by technical complexity, a limited market, and constant demand. New models always cost more because they deliver maximum profit at launch. Even in this segment, though, you can save: a smart approach to choosing hardware and timing the purchase can cut mining investment by tens of percent.","text":"ASICs are a powerful but expensive tool for mining cryptocurrencies. Their high price is driven by technical complexity, a limited market, and constant demand. New models always cost more because they deliver maximum profit at launch. Even in this segment, though, you can save: a smart approach to choosing hardware and timing the purchase can cut mining investment by tens of percent."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- samyj-tihij-asik-dlya-majninga-v-kvartire-top-5
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Quietest ASICs for apartment mining$tmj$,
       $tmj$From IceRiver KS0 Pro to ElphaPex DG Home 1 вЂ” low-noise models suited for home setups.$tmj$,
       $tmj$ElphaPex DG Home 1$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
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
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Crypto mining is possible not only in dedicated, specially prepared facilities. There is also home mining, where low-noise hardware makes sense. Here is a ranking вЂ” the quietest ASICs for apartment mining: a TOP-8 of near-silent devices whose operation will be almost unnoticeable to you and your neighbors.","text":"Crypto mining is possible not only in dedicated, specially prepared facilities. There is also home mining, where low-noise hardware makes sense. Here is a ranking вЂ” the quietest ASICs for apartment mining: a TOP-8 of near-silent devices whose operation will be almost unnoticeable to you and your neighbors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Quiet home mining in an apartment","src":"/images/articles/quiet-asics-2026/intro-home.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why should apartments use only quiet ASICs?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Noise from standard gear can do more than disturb sleep or work вЂ” it can literally drive residents out of their own homes. So вЂњquietвЂќ ASICs are not a luxury but a necessity.","text":"Noise from standard gear can do more than disturb sleep or work вЂ” it can literally drive residents out of their own homes. So вЂњquietвЂќ ASICs are not a luxury but a necessity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Why is noise critical?","text":"Why is noise critical?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"The human brain is highly sensitive to background noise. Constant fan hum (standard ASICs can reach 80вЂ“90 dB вЂ” like a running vacuum) can cause chronic fatigue, insomnia, irritability, and lower concentration and productivity;","title":"Health and psyche"},{"text":"Noise travels easily through walls and floors: even if you can tolerate the gearвЂ™s drone, your neighbors likely will not share the enthusiasm. That risks complaints, conflicts, and even law-enforcement involvement.","title":"Relations with neighbors"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"How to solve it? Silence can be achieved in several ways, and modern hardware (and peripheral) makers offer several paths:","text":"How to solve it? Silence can be achieved in several ways, and modern hardware (and peripheral) makers offer several paths:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Instead of standard fans, quiet coolers with large blades or even liquid cooling are used. Such solutions cut noise to 40вЂ“50 dB вЂ” comparable to a regular desktop PC;","title":"ASICs with passive or modified cooling"},{"text":"ASICs are placed in special boxes with sound-absorbing materials (foam polyurethane, rock wool, etc.). That is especially handy if you already have a вЂњnoisyвЂќ ASIC but want less drone;","title":"Soundproof enclosures (noise boxes)"},{"text":"Lower-power, efficient ASICs (e.g. for less resource-heavy coins like Kaspa or Dogecoin) produce less heat, need less cooling, and thus run quieter.","title":"Low-wattage and efficient models"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Now meet the TOP-8 quietest ASICs for an optimal home launch.","text":"Now meet the TOP-8 quietest ASICs for an optimal home launch."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: IceRiver KS0 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A modern ASIC with passive cooling вЂ” no fans in the design, so operation is completely silent. It targets Kaspa (KAS) вЂ” a popular altcoin whose mining is profitable and highly viable. Alternatives include the little-known Sedra (SDR) and Bugna (BGA). That is also a drawback: if KAS drops hard, the IceRiver KS0 Pro becomes unprofitable. Mining the other tokens is risky due to low popularity.","text":"A modern ASIC with passive cooling вЂ” no fans in the design, so operation is completely silent. It targets Kaspa (KAS) вЂ” a popular altcoin whose mining is profitable and highly viable. Alternatives include the little-known Sedra (SDR) and Bugna (BGA). That is also a drawback: if KAS drops hard, the IceRiver KS0 Pro becomes unprofitable. Mining the other tokens is risky due to low popularity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IceRiver KS0 Pro","src":"/images/articles/quiet-asics-2026/iceriver-ks0-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The KS0 Pro is not only one of the quietest ASICs but also very economical on electricity. Draw is just 100 W вЂ” comparable to a regular laptop. A normal room with good air circulation is enough for successful operation.","text":"The KS0 Pro is not only one of the quietest ASICs but also very economical on electricity. Draw is just 100 W вЂ” comparable to a regular laptop. A normal room with good air circulation is enough for successful operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IceRiver"},{"label":"Release year","value":"2023"},{"label":"Base hashrate","value":"200 GH/s"},{"label":"Power consumption","value":"100 W"},{"label":"Energy efficiency","value":"0.5 W per GH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Coins available for mining","value":"3"},{"label":"Dimensions","value":"20 x 19.4 x 7.4 cm"},{"label":"Weight","value":"3.2 kg"},{"label":"Noise level","value":"25 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Oriented only to three coins","Modest performance versus traditional KAS mining gear","Less popular maker вЂ” possible repair and spare-parts issues"],"pros":["One of the quietest ASICs on the market (fanless design)","Compact size, low weight","Low power consumption"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 15
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
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A fresh Goldshell model вЂ” a maker known for altcoin mining gear. The KA Box Pro runs kHeavyHash for only three coins: Kaspa (KAS), Sedra (SDR), and Bugna (BGA). In this niche it bridges low-power passive systems (e.g. IceRiver KS0 Pro) and classic gear with powerful fans (unsuitable for home use).","text":"A fresh Goldshell model вЂ” a maker known for altcoin mining gear. The KA Box Pro runs kHeavyHash for only three coins: Kaspa (KAS), Sedra (SDR), and Bugna (BGA). In this niche it bridges low-power passive systems (e.g. IceRiver KS0 Pro) and classic gear with powerful fans (unsuitable for home use)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Goldshell KA Box Pro","src":"/images/articles/quiet-asics-2026/goldshell-ka-box-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Noise while running stays under 55 dB, and power draw is acceptable вЂ” 600 W. The model is new (launched in 2024), so there are few reliability reviews yet. Still, the concept is attractive: home mining with meaningful income.","text":"Noise while running stays under 55 dB, and power draw is acceptable вЂ” 600 W. The model is new (launched in 2024), so there are few reliability reviews yet. Still, the concept is attractive: home mining with meaningful income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Goldshell"},{"label":"Release year","value":"2024"},{"label":"Base hashrate","value":"1,600 TH/s"},{"label":"Power consumption","value":"600 W"},{"label":"Energy efficiency","value":"0.375 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Coins available for mining","value":"3"},{"label":"Dimensions","value":"37 x 19.6 x 29 cm"},{"label":"Weight","value":"3 kg"},{"label":"Noise level","value":"55 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Risks of mining low-cap altcoins","Less-known maker, which complicates repairs","New model without real-user reviews yet"],"pros":["One of the most productive kHeavyHash ASICs suitable for home use","Acceptable noise level","Low electricity consumption","Compact size and low weight"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Goldshell Mini-DOGE III","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Experienced miners know Scrypt well вЂ” it is how LTC and DOGE are mined. These are reliable assets traded on most exchanges and in the TOP-20 by market cap. The Goldshell Mini-DOGE III fits home use: noise stays under 35 dB, and draw is only 400 W. On energy efficiency it shows an excellent metric вЂ” one of the best in the Scrypt segment.","text":"Experienced miners know Scrypt well вЂ” it is how LTC and DOGE are mined. These are reliable assets traded on most exchanges and in the TOP-20 by market cap. The Goldshell Mini-DOGE III fits home use: noise stays under 35 dB, and draw is only 400 W. On energy efficiency it shows an excellent metric вЂ” one of the best in the Scrypt segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Goldshell Mini-DOGE III","src":"/images/articles/quiet-asics-2026/goldshell-mini-doge.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ASIC uses a classic form factor with two cooling fans. It is compact and stylish, which eases home use. Many miners know the maker: Goldshell specializes in altcoin mining hardware.","text":"The ASIC uses a classic form factor with two cooling fans. It is compact and stylish, which eases home use. Many miners know the maker: Goldshell specializes in altcoin mining hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Goldshell"},{"label":"Release year","value":"2023"},{"label":"Base hashrate","value":"700 MH/s"},{"label":"Power consumption","value":"400 W"},{"label":"Energy efficiency","value":"0.57 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"22"},{"label":"Dimensions","value":"20 x 15 x 9.6 cm"},{"label":"Weight","value":"2.2 kg"},{"label":"Noise level","value":"35 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Less popular manufacturer","Rare model with its own repair specifics"],"pros":["Reliable Scrypt algorithm: mining 20+ coins including LTC and DOGE","Low noise level","Excellent Scrypt-segment energy efficiency","Compact, light, low consumption"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: iPollo V1 Mini","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When it launched in 2022, iPolloвЂ™s V1 Mini line was a real breakthrough. It is a series of compact, quiet devices for home Ethash mining. You can mine dozens of cryptocurrencies, including well-known Ethereum Classic (ETC). Another plus is a Wi-Fi module, so wired networking is optional.","text":"When it launched in 2022, iPolloвЂ™s V1 Mini line was a real breakthrough. It is a series of compact, quiet devices for home Ethash mining. You can mine dozens of cryptocurrencies, including well-known Ethereum Classic (ETC). Another plus is a Wi-Fi module, so wired networking is optional."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"iPollo V1 Mini","src":"/images/articles/quiet-asics-2026/ipollo-v1-mini.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Income from the Mini line is modest. The format fits small passive earnings or learning crypto with a path toward classic gear later. The same maker, iPollo, offers classic Ethash ASICs with much higher performance вЂ” but they are hard to use at home.","text":"Income from the Mini line is modest. The format fits small passive earnings or learning crypto with a path toward classic gear later. The same maker, iPollo, offers classic Ethash ASICs with much higher performance вЂ” but they are hard to use at home."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IPollo Miner"},{"label":"Release year","value":"2022"},{"label":"Base hashrate","value":"130вЂ“400 MH/s"},{"label":"Power consumption","value":"104вЂ“232 W"},{"label":"Energy efficiency","value":"0.58вЂ“0.8 W per MH"},{"label":"Algorithm","value":"EtHash and EtcHash"},{"label":"Coins available for mining","value":"36"},{"label":"Dimensions","value":"from 17.9 x 14.3 x 9"},{"label":"Weight","value":"2.1 kg"},{"label":"Noise level","value":"from 55 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Fairly young manufacturer","Low efficiency on some models"],"pros":["A full line of devices with different performance","A fitting format for home altcoin mining","Wi-Fi connectivity","Proven working algorithm","Many coins to mine"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Canaan Avalon Mini 3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Canaan Avalon Mini 3 is the most вЂњhomeвЂќ ASIC in the Avalon line, built for living spaces. Unlike classic miners, it is shaped like a compact heater that both mines Bitcoin and warms the room. That appeals to anyone who wants mining plus household benefit вЂ” for example heating a room in the off-season or winter.","text":"The Canaan Avalon Mini 3 is the most вЂњhomeвЂќ ASIC in the Avalon line, built for living spaces. Unlike classic miners, it is shaped like a compact heater that both mines Bitcoin and warms the room. That appeals to anyone who wants mining plus household benefit вЂ” for example heating a room in the off-season or winter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Canaan Avalon Mini 3","src":"/images/articles/quiet-asics-2026/canaan-avalon-mini-3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Avalon Mini 3вЂ™s main advantage is very low noise вЂ” about 40 dB. That matches a regular desktop PC or a quiet fan. You can place the miner in an apartment, bedroom, office, or private house without discomfort вЂ” one of the best home-mining options for 2024вЂ“2025.","text":"The Avalon Mini 3вЂ™s main advantage is very low noise вЂ” about 40 dB. That matches a regular desktop PC or a quiet fan. You can place the miner in an apartment, bedroom, office, or private house without discomfort вЂ” one of the best home-mining options for 2024вЂ“2025."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It runs SHA-256 and suits Bitcoin mining. Hashrate is 37.5 Th/s вЂ” not industrial, but for a home scenario it balances performance, quiet, and efficiency.","text":"It runs SHA-256 and suits Bitcoin mining. Hashrate is 37.5 Th/s вЂ” not industrial, but for a home scenario it balances performance, quiet, and efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Canaan"},{"label":"Model","value":"Avalon Mini 3"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"37.50 Th/s"},{"label":"Power draw","value":"800 W"},{"label":"Coins for mining","value":"BTC"},{"label":"Noise level","value":"40 dB"},{"label":"Dimensions","value":"250 Г— 180 Г— 120 mm"},{"label":"Weight","value":"4 kg"},{"label":"Release year","value":"2024"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest performance for SHA-256","Limited availability due to niche positioning"],"pros":["Heater form factor warms the room while mining","Very low noise вЂ” suitable for apartments and other living spaces","Energy efficiency acceptable for home use","Mining Bitcoin вЂ” the worldвЂ™s first cryptocurrency","Compact size and low weight"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Canaan Avalon Q","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Canaan Avalon Q is a balanced ASIC for those seeking power, stability, and acceptable home noise. It runs SHA-256 for Bitcoin at 90 Th/s and 1,675 W. A solid mix for miners who want confident yield without moving to industrial farms.","text":"The Canaan Avalon Q is a balanced ASIC for those seeking power, stability, and acceptable home noise. It runs SHA-256 for Bitcoin at 90 Th/s and 1,675 W. A solid mix for miners who want confident yield without moving to industrial farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Canaan Avalon Q","src":"/images/articles/quiet-asics-2026/canaan-avalon-q.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"About 65 dB makes the Avalon Q louder than вЂњquietвЂќ home models, but still workable in living spaces вЂ” a separate room, balcony, closet, or utility area. Noise is roughly like a home AC on high. For some users that is fine, especially with good ventilation and placement.","text":"About 65 dB makes the Avalon Q louder than вЂњquietвЂќ home models, but still workable in living spaces вЂ” a separate room, balcony, closet, or utility area. Noise is roughly like a home AC on high. For some users that is fine, especially with good ventilation and placement."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The cooling system deserves separate note: it is built for long loaded runs, holds stable temperature, and reduces overheating risk. That improves reliability and long-term operation without hashrate dips.","text":"The cooling system deserves separate note: it is built for long loaded runs, holds stable temperature, and reduces overheating risk. That improves reliability and long-term operation without hashrate dips."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Canaan Avalon"},{"label":"Model","value":"Avalon Q"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"90 Th/s"},{"label":"Power draw","value":"1,675 W"},{"label":"Coins for mining","value":"BTC"},{"label":"Noise level","value":"65 dB"},{"label":"Dimensions","value":"455 Г— 130.5 Г— 440 mm"},{"label":"Weight","value":"10.5 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Average efficiency versus more advanced ASICs","Comparatively rare model on the market"],"pros":["Suitable for home use with proper placement","Supports Bitcoin and all SHA-256 coins","Reliable cooling for long runs","Simple setup and intuitive connection"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Jasminer X16-Q PRO","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ChinaвЂ™s Sunlune Technology solved a tough problem: it built the Jasminer X16-Q PRO with high power while keeping low noise and modest draw. A convenient home-mining format on reliable EtHash and EtcHash (30+ mineable coins). The X16-Q PRO improves on a вЂњjuniorвЂќ unit that already proved itself among active users.","text":"ChinaвЂ™s Sunlune Technology solved a tough problem: it built the Jasminer X16-Q PRO with high power while keeping low noise and modest draw. A convenient home-mining format on reliable EtHash and EtcHash (30+ mineable coins). The X16-Q PRO improves on a вЂњjuniorвЂќ unit that already proved itself among active users."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Jasminer X16-Q PRO","src":"/images/articles/quiet-asics-2026/jasminer-x16-q-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A drawback is the young maker вЂ” Sunlune Technology is still earning trust among competitors, though buyer confidence is growing fast.","text":"A drawback is the young maker вЂ” Sunlune Technology is still earning trust among competitors, though buyer confidence is growing fast."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Sunlune Technology"},{"label":"Release year","value":"2024"},{"label":"Base hashrate","value":"2,050 MH/s"},{"label":"Power consumption","value":"520 W"},{"label":"Energy efficiency","value":"0.25 W per MH"},{"label":"Algorithm","value":"EtHash and EtcHash"},{"label":"Coins available for mining","value":"39"},{"label":"Dimensions","value":"44.5 x 13.2 x 44.3 cm"},{"label":"Weight","value":"10 kg"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young, unproven manufacturer","Rising Jasminer prices due to popularity"],"pros":["Solid efficiency (among the best in this format)","Low noise level","Compact size","Runs on well-known algorithms"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: ElphaPex DG home 1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex DG Home 1 is a quiet, stylish Scrypt ASIC for home mining. Built for living spaces where comfort, compact size, and minimal noise matter. At 4 GH/s and 960 W it is effective for popular coins like Litecoin and Dogecoin, and ~50 dB noise matches a quiet desk fan or a PC under load. That makes DG Home 1 one of the most convenient apartment-mining options.","text":"ElphaPex DG Home 1 is a quiet, stylish Scrypt ASIC for home mining. Built for living spaces where comfort, compact size, and minimal noise matter. At 4 GH/s and 960 W it is effective for popular coins like Litecoin and Dogecoin, and ~50 dB noise matches a quiet desk fan or a PC under load. That makes DG Home 1 one of the most convenient apartment-mining options."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex DG Home 1","src":"/images/articles/quiet-asics-2026/elphapex-dg-home-1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It needs no industrial ventilation or heavy electrical upgrades вЂ” a standard home outlet and light room cooling suffice. A compact case and neat design let you place the ASIC in any room without spoiling the look.","text":"It needs no industrial ventilation or heavy electrical upgrades вЂ” a standard home outlet and light room cooling suffice. A compact case and neat design let you place the ASIC in any room without spoiling the look."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Model","value":"DG Home 1"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"4 GH/s"},{"label":"Power draw","value":"960 W"},{"label":"Coins for mining","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"300 Г— 150 Г— 200 mm"},{"label":"Weight","value":"7 kg"},{"label":"Release year","value":"2023"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Significantly weaker than industrial ASICs","Scrypt only вЂ” not suitable for BTC mining"],"pros":["Ideal for home mining thanks to low noise","Supports popular, reliable coins вЂ” Litecoin and Dogecoin","Modern look, compact neat form factor","Simple setup even for beginners","No special utilities or industrial ventilation required"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is home mining becoming popular?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Not long ago mining meant humming hangars and industrial farms, but the shift toward home mining grows. Makers respond fast вЂ” more compact, quiet, efficient ASICs for apartments appear. This is no longer a temporary trend but a new reality.","text":"Not long ago mining meant humming hangars and industrial farms, but the shift toward home mining grows. Makers respond fast вЂ” more compact, quiet, efficient ASICs for apartments appear. This is no longer a temporary trend but a new reality."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Home mining farm in an apartment","src":"/images/articles/quiet-asics-2026/home-mining-setup.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Why is this happening?","text":"Why is this happening?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"GPUs and CPUs are losing appeal fast: yield fell near zero from competition and rising algorithm difficulty, and some large chains (including Ethereum) left classic mining entirely. ASICs remain the only stable mining path, especially on SHA-256 (Bitcoin) and kHeavyHash (Kaspa) вЂ” and increasingly at home scale each year;","title":"Falling GPU and CPU mining profitability"},{"text":"Makers like Goldshell, iPollo, and Antminer (hydro or mini formats) ship low-noise models drawing 100вЂ“1,000 W вЂ” no more than a regular heater. They fit on a shelf, need no industrial ventilation, and suit apartments and private homes;","title":"Availability and compact next-gen ASICs"},{"text":"Many miners want independence from hosting and rent, to service the device themselves, and to control income without middleman fees. Home mining gives that control and full independence;","title":"Control and independence"},{"text":"Today you can start home mining with в‚Ѕ50вЂ“80 thousand invested. That is below GPU farm costs from even 2вЂ“3 years ago.","title":"Low entry barrier"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Why do users choose home mining? Quiet and efficiency вЂ” new ASICs hum like a PC case and use 2вЂ“3Г— less power than old GPUs. Stable payback also matters вЂ” an ASIC runs one algorithm but steadily mines the chosen coin without idle downtime. Finally, ease of use вЂ” a modern unit sets up in 10 minutes, connects to Wi-Fi, and needs no special skills.","text":"Why do users choose home mining? Quiet and efficiency вЂ” new ASICs hum like a PC case and use 2вЂ“3Г— less power than old GPUs. Stable payback also matters вЂ” an ASIC runs one algorithm but steadily mines the chosen coin without idle downtime. Finally, ease of use вЂ” a modern unit sets up in 10 minutes, connects to Wi-Fi, and needs no special skills."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 65
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
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Apartment mining is convenient only if it does not turn your home into a server room. Noise is the main enemy of home mining, and you must fight it. Quiet ASICs, soundproofing, and modern solutions preserve comfort, mood, and good neighbor relations.","text":"Apartment mining is convenient only if it does not turn your home into a server room. Noise is the main enemy of home mining, and you must fight it. Quiet ASICs, soundproofing, and modern solutions preserve comfort, mood, and good neighbor relations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you want to mine at home вЂ” choose wisely: investing in quiet pays off in peace, sleep, and stable farm operation.","text":"If you want to mine at home вЂ” choose wisely: investing in quiet pays off in peace, sleep, and stable farm operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$samyj-tihij-asik-dlya-majninga-v-kvartire-top-5$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$First corporate profit-tax filing for legal miners in Russia$tmj$,
       $tmj$April 2025: legal entities file their first Q1 profit-tax return. 25% rate, due by April 25 вЂ” what miners need to know.$tmj$,
       $tmj$Profit tax declaration for miners$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
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
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"April 2025 became an important month for crypto mining in Russia. The reason is not only the full mining ban in the south of Irkutsk Region through 2031, but also the requirement for legal entities to file their first corporate profit-tax return for Q1 2025. Such a document is being prepared for the first time, so this event can be seen as a starting point in the history of farm taxation in Russia."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"First corporate profit-tax return for miners in Russia","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As of spring 2025, more than 700 Russian companies mining digital assets were listed in the Russian minersвЂ™ registry. These companies were the first to file corporate profit-tax returns. What you need to know about this reporting:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Reporting period вЂ” Q1 2025;","Tax rate вЂ” 25%;","Filing deadline вЂ” by April 25, 2025;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This is how the tax principle for miners in Russia takes shape: 2025 can officially be considered the start of the Federal Tax Service (FNS) system within the legalization process."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Corporate profit-tax return for miners","src":"/images/articles/mining-profit-tax-declaration-2025/cover.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What you need to know about mining taxes in Russia","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Tax rules began taking shape in 2025 and by year-end reached their current form:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Individuals are subject to personal income tax (NDFL). The rate is 13% to 15% (depending on annual mining income);","Legal entities are subject to corporate profit tax. From January 1, 2025, it is calculated at a 25% rate."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Self-employment and the simplified tax system are not available for this activity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For calculations you must use the quotes published on the FNS website at this <a href=\"https://www.nalog.gov.ru/rn49/promo/mining/\">link</a>. The same page has other information that may be useful for individuals and legal entities engaged in mining.","text":"For calculations you must use the quotes published on the FNS website at this link. The same page has other information that may be useful for individuals and legal entities engaged in mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"FNS section for miners","src":"/images/articles/mining-profit-tax-declaration-2025/fns-screenshot.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What else to read on legislation, legalization, and taxes?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Our site has a full series of materials on legalizing and taxing mining in Russia. We recommend these pieces:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"<ul><li><a href=\"https://top-mining.ru/novichkam/legalny-li-majning-fermy-v-rossii-v-2025-godu/\">Are mining farms legal in Russia in 2025: registry, taxes, and regional specifics</a>. What you need to know about mining legalization in Russia;</li><li><a href=\"https://top-mining.ru/mining/majning-ferma-doma-zakonno-li-eto/\">A mining farm at home: is it legal?</a></li><li><a href=\"https://top-mining.ru/mining/pochemu-majning-fermy-zapreshheny-v-rossii-novoe-zakonodatelstvo-rf/\">Why mining farms are banned in Russia: new Russian legislation</a>.</li></ul>","text":"Are mining farms legal in Russia in 2025: registry, taxes, and regional specifics. What you need to know about mining legalization in Russia; A mining farm at home: is it legal?; Why mining farms are banned in Russia: new Russian legislation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"More useful, up-to-date information is available in our <a href=\"https://t.me/topminingru\">Telegram channel</a>. Subscribe to stay on top of the latest news.","text":"More useful, up-to-date information is available in our Telegram channel. Subscribe to stay on top of the latest news."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Top 7 ASIC mining secrets and life hacks$tmj$,
       $tmj$Undervolting, heat reuse, cheap power, alternative algorithms, hashrate rental, and containers вЂ” ways to squeeze more from ASICs.$tmj$,
       $tmj$Bitcoin and ASIC mining$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2026, ASIC mining remains one of the most stable ways to earn in the crypto industry. But the easy-mining era is over: to stay profitable, buying an Antminer and plugging it in is no longer enough. TodayвЂ™s miner is not only a technician but a strategist who can save, adapt, and squeeze the most from every machine.","text":"In 2026, ASIC mining remains one of the most stable ways to earn in the crypto industry. But the easy-mining era is over: to stay profitable, buying an Antminer and plugging it in is no longer enough. TodayвЂ™s miner is not only a technician but a strategist who can save, adapt, and squeeze the most from every machine."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In this article we collected the most effective and lesser-known mining lifehacks that help cut costs, raise income, and extend hardware life.","text":"In this article we collected the most effective and lesser-known mining lifehacks that help cut costs, raise income, and extend hardware life."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcoin and ASIC mining","src":"/images/articles/asic-lifehacks-2026/bitcoin-pcb.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining lifehack #1: undervolting вЂ” lower power use","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: miners can be вЂњflashedвЂќ with custom firmware that cuts power draw by 20вЂ“40% with minimal or no hashrate loss.","text":"The idea: miners can be вЂњflashedвЂќ with custom firmware that cuts power draw by 20вЂ“40% with minimal or no hashrate loss."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Example","text":"Antminer S19 Pro (110 TH/s) вЂ” 3,250 W draw. With Braiins OS+ you can drop to 2,800 W at 105 TH/s or to 2,400 W at 95 TH/s;"},{"title":"What to use","text":"Braiins OS+ (for Bitmain) or VNish, Hiveon ASIC, Asic.to вЂ” alternatives with support for many models;"},{"title":"Benefit","text":"An 800 W difference at $0.10/kWh = $58.00/month savings per device."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Industrial ASIC farm","src":"/images/articles/asic-lifehacks-2026/mining-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining lifehack #2: heating spaces with miners","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: an ASIC puts out a lot of heat вЂ” you can use it to heat rooms, warehouses, greenhouses, baths, or pools.","text":"The idea: an ASIC puts out a lot of heat вЂ” you can use it to heat rooms, warehouses, greenhouses, baths, or pools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Example","text":"Almost any miner works like a 3.2 kW heater вЂ” enough to heat a 25вЂ“30 mВІ room at outdoor temperatures down to в€’10В°C;"},{"title":"Lifehacks","text":"connect heat rejection to a water heat exchanger, route hot air into ventilation ducts, use ASICs in home heating."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In winter вЂ” lower heating bills plus an optimal farm cooling mode. The result is lower utility bills, which is an extra mining benefit.","text":"In winter вЂ” lower heating bills plus an optimal farm cooling mode. The result is lower utility bills, which is an extra mining benefit."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Lifehack #3: mining in regions with cheap electricity","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: find and use locations with cheap or preferential electricity.","text":"The idea: find and use locations with cheap or preferential electricity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Examples","text":"rural areas with rates below $0.04/kWh, sites with cheap power (garages, warehouses, hotels, country houses), industrial rates via sole proprietorship and other legal formats;"},{"title":"Calculation","text":"at $0.12/kWh, income from an S19 = $2.5/day. At $0.04/kWh вЂ” $5.1/day. More than a 2Г— difference!"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Power grids and cheap electricity","src":"/images/articles/asic-lifehacks-2026/cheap-electricity.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Lifehack #4: alternative algorithms","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: not all ASICs run SHA-256 for Bitcoin. There are many alternative formats and promising coins with less crowded networks.","text":"The idea: not all ASICs run SHA-256 for Bitcoin. There are many alternative formats and promising coins with less crowded networks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Examples","text":"Kadena (KDA) вЂ” Goldshell KD6 ASIC, Kaspa (KAS) вЂ” Antminer KS3, Ironfish, Nervos, Handshake вЂ” younger coins with lower competition;"},{"title":"Takeaway","text":"Buying an ASIC for вЂњsecond-waveвЂќ assets can yield more profit during a growth period than, for example, an S19 series on the Bitcoin network."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Lifehack #5: renting out farm hashrate","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: you can buy 5вЂ“10 miners, rent a space with power, and rent out their hashrate via NiceHash, MiningRigRentals, or Poolin Hashrate Market.","text":"The idea: you can buy 5вЂ“10 miners, rent a space with power, and rent out their hashrate via NiceHash, MiningRigRentals, or Poolin Hashrate Market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Example: Antminer S19 XP produces 140 TH/s. Average rental: $0.015/TH/s/day = $2.10/day.","text":"Example: Antminer S19 XP produces 140 TH/s. Average rental: $0.015/TH/s/day = $2.10/day."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you rent out 10 units, you get stable passive income without pool setup hassles.","text":"If you rent out 10 units, you get stable passive income without pool setup hassles."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Lifehack #6: tracking prices and difficulty 24/7","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: not all miners react to network difficulty and coin price changes. With a flexible approach you can build your own strategy for higher returns.","text":"The idea: not all miners react to network difficulty and coin price changes. With a flexible approach you can build your own strategy for higher returns."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"What to use","text":"Miningpoolstats вЂ” to track pools and coins, WhatToMine (ASIC section) вЂ” to pick the optimal coin, Coinwarz Difficulty Charts вЂ” difficulty charts, Telegram bots for key metrics;"},{"title":"How to use it","text":"when difficulty drops вЂ” temporarily focus on that coin to capture the maximum before the network recovers."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Lifehack #7: a modular farm in containers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The idea: instead of a fixed building you can use shipping containers or industrial blocks fitted for mining. That lets you move the farm quickly to where power is cheaper or the climate is better.","text":"The idea: instead of a fixed building you can use shipping containers or industrial blocks fitted for mining. That lets you move the farm quickly to where power is cheaper or the climate is better."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Advantages","text":"easy to relocate to another country or region, fast assembly and launch (2вЂ“3 days), a container is already a protected structure that can be sound- and heat-insulated;"},{"title":"Example","text":"a container for 40 ASICs (e.g. S19) draws ~120 kW. In one region the miner pays $0.12/kWh в†’ $3,456/month. In another вЂ” $0.05/kWh в†’ $1,440/month. Savings of $2,000+ per month."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Takeaway: a container is a mobile asset, especially useful in countries with swinging rates or bans.","text":"Takeaway: a container is a mobile asset, especially useful in countries with swinging rates or bans."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Secrets and lifehacks: takeaways","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The future of mining belongs to those who donвЂ™t just turn equipment on, but think, calculate, and experiment. Applying these lifehacks can put you a step ahead of most miners.","text":"The future of mining belongs to those who donвЂ™t just turn equipment on, but think, calculate, and experiment. Applying these lifehacks can put you a step ahead of most miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Undervolting","value":"up to $50+/month per device"},{"label":"Location with cheap power","value":"Г—2 net profit"},{"label":"Alternative coins","value":"+100вЂ“300% ROI on growth"},{"label":"Auto hashrate rental","value":"stable passive income"},{"label":"Using heat","value":"heating savings"},{"label":"Mobile containers","value":"easy, fast relocation"},{"label":"Tracking prices and difficulty","value":"quick algorithm switches for extra income"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Applying these practices can substantially cut costs, raise business resilience, and help you adapt to external changes.","text":"Applying these practices can substantially cut costs, raise business resilience, and help you adapt to external changes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining articles from TOP MINING: knowledge as a profit tool$tmj$,
       $tmj$How TOP MINING produces mining articles, six content pillars, and how to apply the insights in practice.$tmj$,
       $tmj$Mining articles from TOP MINING$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
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
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Modern mining is more than just cryptocurrency extraction. It is an industry where energy, IT, finance, engineering, and law intersect. To avoid getting lost in this flow of technology, hardware, and news, it is important to have a source of reliable, in-depth, and systematized information."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That source became the вЂњArticles about miningвЂќ section on the TOP MINING platform вЂ” the largest media and analytics service in Russia and the CIS, combining the knowledge and experience of crypto industry participants."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These are not just publications вЂ” they are an information base with more than 300 original articles based on analytics, hardware tests, interviews, and practical cases from real data centers. Every article here is not a clickbait review but a practical guide. It is knowledge that helps make decisions, build a business, and develop mining infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why the вЂњArticles about miningвЂќ section is needed","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The digital mining market changes every month: new ASIC models appear, algorithms are updated, electricity tariffs and regulation rules shift. In such conditions, without a systematic approach it is impossible to navigate the information flow."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The sectionвЂ™s goal is to give a full picture of the market, covering its technical, economic, and legal sides."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The TOP MINING editorial teamвЂ™s mission is to translate complex topics into clear language."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Materials published here cover:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["technologies and new releases;","the experience of miners and companies;","ways to improve efficiency;","legal and safe mining;","investment strategies and business optimization."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Thus, вЂњArticles about miningвЂќ is an information platform that combines education, analytics, and practice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Why the articles about mining section is needed","src":"/images/articles/articles-topmining/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How TOP MINING articles are created","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The editorial team works on a вЂњfrom practice to analyticsвЂќ principle. Every publication starts not with theory but with observation or a real community request. Journalists and analysts gather data, run hardware tests, and talk with manufacturers, consultants, and farm owners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The article creation process includes:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"gathering data from official sources, forums, and miner surveys.","title":"Research"},{"text":"comparing hardware specs with real operating metrics.","title":"Information verification"},{"text":"using devices and services in real conditions.","title":"Practical testing"},{"text":"adapting the material for different audience levels: from beginners to experts.","title":"Editorial processing"},{"text":"adding charts, tables, calculators, and infographics.","title":"Visualization and examples"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Many publications are prepared jointly with partners and industry experts, and some articles are based on data from TOP MININGвЂ™s internal analytics system вЂ” rankings, catalogs, and calculators."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Section structure: six thematic directions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To simplify navigation, articles are divided into six thematic rubrics, each covering its own aspect of the industry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Foundational section: algorithms, blocks, hashrate, equipment types. Examples: вЂњWhat is Bitcoin mining difficultyвЂќ; вЂњWhat is a mining farm?вЂќ.","title":"All about mining"},{"text":"Reviews of firmwares, pools, calculators, and wallets. Key articles: next-generation calculator, mining firmwares.","title":"Tools and services"},{"text":"Profitability, taxes, payback, scaling cases: taxes in Russia, power rental, electricity costs, mining on gas.","title":"Investments"},{"text":"How to start mining: choosing an ASIC, calculating profit, connecting to a pool, what to do with crypto after mining.","title":"For beginners"},{"text":"Laws, hardware announcements, conferences, and trends вЂ” from Blockchain Life in Dubai to The Trends in Moscow.","title":"News"},{"text":"Official publications from companies, manufacturers, and projects firsthand.","title":"Press releases"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Articles section structure","src":"/images/articles/articles-topmining/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to use the section in practice","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњArticles about miningвЂќ section is not just a library вЂ” it is a market navigator:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["If you are choosing equipment вЂ” go to articles about ASICs, GPUs, and firmwares.","If you are planning to launch a farm вЂ” read publications on ventilation, cooling, and power supply. If you want to reduce risks вЂ” study materials on taxes and mining legalization.","If you are analyzing the market вЂ” use analytical reviews and rankings linked to the articles.","Every text is connected to other TOP MINING services: the company catalog, rankings, calculator, and mining hotel aggregator."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This makes the platform a unified eco-service for the miner."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Who this section is useful for","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"for choosing equipment, pools, and sites.","title":"Miners"},{"text":"for analyzing profitability and assessing trends.","title":"Investors"},{"text":"for comparing solutions and finding partners.","title":"Companies and integrators"},{"text":"for a safe start in crypto mining.","title":"Beginners"},{"text":"as a source of reliable data and expertise.","title":"Media and analysts"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why TOP MINING articles are unique?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"All data goes through double verification by the editorial team and experts.","title":"Verified facts"},{"text":"Publications are based on the work of operating mining companies.","title":"Experience from real practice"},{"text":"Each article is not a news retelling but research with conclusions.","title":"Depth of analysis"},{"text":"Materials complement rankings, catalogs, press releases, and calculators.","title":"Connection to services"},{"text":"New articles are published weekly, and older ones are revised for current realities.","title":"Constant updates"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Why TOP MINING articles are unique","src":"/images/articles/articles-topmining/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 29
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
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњArticles about miningвЂќ section is a living encyclopedia of the industry. Here you can find everything: from choosing equipment and analyzing electricity to farm launch cases and crypto market development forecasts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"TOP MINING makes knowledge clear, relevant, and practical. It is a place where information becomes a tool for profit and growth."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Reading TOP MINING articles, you do not just learn the news вЂ” you learn to manage your mining as a business."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- stoit-li-pokupat-fermu-i-zanimatsya-majningom
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Should you buy a farm and start mining?$tmj$,
       $tmj$Five decision factors: hardware, power, placement, investment format, and goals вЂ” is a farm worth it?$tmj$,
       $tmj$Should you buy a mining farm$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
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
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is it worth buying mining equipment? How justified is entering the crypto mining market today? Is investing in mining profitable? Regardless of market state, bull or bear cycle, and BTC price, these questions remain relevant. There is no universal answer for everyone. The best approach is to analyze the factors that affect mining efficiency so a future miner can see how they apply to their own conditions and opportunities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is mining worth it: 5 factors","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To answer whether buying a mining farm is worthwhile, analyze five key factors:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["The equipment you plan to use;","Electricity cost;","Equipment hosting conditions;","Investment format;","Goals and objectives."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Knowing the answers, you can assess crypto mining profitability. To help everyone do that, we will examine each factor in detail."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Factor #1: Equipment","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Decide the mining format: GPUs or ASICs. After Ethereum moved to PoS in autumn 2022, GPU crypto mining is still in prolonged uncertainty. On one hand, dozens of other coins can be mined on GPUs. On the other, the former returns and investment reliability that ETH provided have not been matched."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The end of Ether mining on GPUs let hardware prices correct вЂ” gamers and designers celebrated most."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"GPUs are still used actively for mining, but extra challenges appeared: finding the optimal token, and lower asset reliability and liquidity. ASICs remain unchanged: SHA-256 Bitcoin miners still lead sales. Hardware power keeps rising, offsetting rising difficulty and softening the impact of the 2024 halving."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"When asking whether to buy a farm and mine, you need to know exactly which equipment you plan to use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That affects not only optimal mining conditions but also which coin you plan to mine. Also assess resale potential on the secondary market and depreciation of used hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining equipment","src":"/images/articles/buy-farm-worth/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Factor #2: Electricity","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Second on the list, but probably first in importance, is electricity cost. Is mining BTC profitable at 3 rubles per kWh? Clearly yes. If your regional rate is 7 rubles per kWh, there are serious reasons to question mining profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A modern mining calculator helps answer that: based on kWh price and hardware hashrate it estimates income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"With cheap electricity almost any ASIC will be profitable. Without that advantage at the mining site, calculate carefully вЂ” electricity bills will be your main expense."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Many know the idea of a вЂњzeroвЂќ outlet вЂ” access to free power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"But that is a conditional concept, because someone always pays the utility bills. If a miner boasts of a free outlet, fraud schemes and dubious mining formats are usually involved. Should you buy a farm then? Definitely not вЂ” it is a direct legal violation with possible criminal liability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Electricity and farm placement","src":"/images/articles/buy-farm-worth/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Factor #3: Farm location conditions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Can you mine if you lack suitable space for the hardware? With ASICs the answer is no вЂ” high noise, heat, and power draw make comfortable operation impossible. We recommend GPUs, which are less demanding on operating conditions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Separately, note the option of mining on specialized sites вЂ” hostings or hotels."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That format involves extra costs, but technical difficulties become irrelevant. It is the best approach if you own a large farm of dozens or even hundreds of ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Factor #4: Investment format","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining, like any earning method, always involves risk, so whether to buy a farm depends on how you acquire the hardware. Several options exist:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Reinvesting funds earned from crypto. For example, you already have several ASICs and plan to expand or refresh the fleet. That is an optimal approach used by many miners;","Buying hardware with spare cash. Also a workable format that keeps risk low;","Buying miners with your last money or on credit. Not recommended. The mined coinвЂ™s price may fall, an ASIC may break or be stolen вЂ” not to mention infrastructure risks and legal surprises."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risk diversification is a key success criterion in any business, and crypto mining is no exception."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining investment format","src":"/images/articles/buy-farm-worth/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Factor #5: Goals and objectives","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The final question to ask yourself: why do I plan to mine crypto? There may be several answers, and whether to buy a farm is individual:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["A first introduction to mining. A practical way to learn whether you should do it at all and how interesting it is for you. A workable way to find out;","Extra income alongside an existing earning activity. Also effective for additional profit when you have suitable technical conditions for mining;","Passive income with minimal owner involvement. Quite debatable, because mining hardware still needs serious attention: monitoring ASICs, maintenance, fleet upgrades, and timely electricity payments. An exception is a turnkey business where you are an investor and not involved in operations;","Primary income source. Realistic, but only with suitable space, strong grid capacity, and powerful equipment (serious upfront investment)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is it worth buying a farm and mining: conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To decide, answer all five questions we covered. If there are doubts or contested factors, resolve those issues first. If there are no visible obstacles and you have suitable conditions for profitable mining, crypto extraction can become a powerful tool for earning, investing, and even an engaging hobby for several BTC cycles ahead."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stoit-li-pokupat-fermu-i-zanimatsya-majningom$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Turnkey mining facilities: from idea to power-on$tmj$,
       $tmj$Full data center build cycle for mining: audit, design, construction, fit-out, case studies, and the upside of owning the site.$tmj$,
       $tmj$Turnkey mining facility construction$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
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
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Building your own mining site is not just a business вЂ” it is a strategic decision that gives investments resilience, technical independence, and major savings. If you are considering investing in mining, your own turnkey data center is a foundational asset that works for you every day."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We design and build data centers of any complexity. Our expertise covers the full cycle: from initial audit and engineering design to commissioning, putting the facility into operation, and ongoing support."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What does turnkey mining-site construction mean?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"вЂњTurnkeyвЂќ means we take on every stage and task: from analyzing site potential and power supply to installing equipment and launching the facility. You get infrastructure ready for operation without spending time on contractors, logistics, or technical issues. One team with an experienced technical director handles all the work."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 4
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
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Investors who want to cut rental costs;","Large miners with dozens or even hundreds of devices;","Business owners launching their own mining hotel;","Companies that want to raise the value of their own assets;","IT companies that need access to their own energy-efficient infrastructure."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"What turnkey site construction means","src":"/images/articles/mining-site-build/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Main stages of building a mining site","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The full process of building a professional mining site can be split into three stages. LetвЂ™s cover each in detail:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Technical audit and design","text":"We start with a deep analysis of business goals and the site. This stage prevents early mistakes, sets an optimal architecture, and plans for scale. Analysis includes: estimating IT load (server count, hashrate, power draw), studying available energy resources, networks, and connectivity, designing the future data center (redundancy type, cooling, UPS). Example: for one client we designed a modular 30 MW data center split into six independent segments, each operated autonomously. That delivered high fault tolerance and simple management;"},{"title":"Site selection and construction","text":"We help choose the best location: land cost, proximity to power lines, climate, logistics вЂ” everything matters. What we do: build structures or assemble modular units, install fire suppression, cooling, access control, climate control, and lay out power infrastructure (transformers, UPS, diesel generators, distribution boards). Example: in Siberia we delivered a project based on a container data center. That cut construction time by 40% and simplified delivery and installation in a remote area;"},{"title":"Fit-out and launch","text":"When the site is ready, the final stage begins вЂ” installing equipment and tuning all systems. It includes installing server racks, switches, routers, integrating cooling, configuring backup systems, and running load and temperature tests. Example: one of our data centers passed stress testing at +35В°C, running at 100% capacity without failures вЂ” largely thanks to well-designed cooling and backup power."}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Stages of building a mining site","src":"/images/articles/mining-site-build/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why invest in your own mining site?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Three reasons why owning a mining site is optimal when you invest meaningfully in digital-asset mining:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Long-term savings. Your own capacity can save в‚Ѕ1.5вЂ“2 million per month at 1 MW connected. Per year that is up to в‚Ѕ25 million in net savings. You can also connect at wholesale rates and influence your cost structure;","Full control. You set architecture, access, and redundancy yourself. Just as important: independence from providers and landlords, plus fast upgrades and flexible tuning for business needs;","Scale without extra waste. Modular architecture lets you grow capacity quickly. Add racks, increase power, upgrade cooling вЂ” all without stopping the site."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Why invest in your own site","src":"/images/articles/mining-site-build/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Example: a client with a 1 MW data center scaled to 2.5 MW in 6 months without interrupting operations and upgraded cooling along the way."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Building a mining site with TOP MINING","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages of working with us:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Engineering expertise: architects, engineers, designers, cooling and power specialists on staff;","Flexible solutions: from container setups to permanent buildings;","Design to international standards;","Full support: licensing, approvals, service, and energy management."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Examples and case studies","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Case 1: From hosting to your own data center","text":"Before: an IT entrepreneur from Tatarstan rented 100 kW on external hosting. Monthly service costs were about в‚Ѕ700,000, not counting service fees. There were outages and overheating. After: after building a 120 kW site of their own, costs nearly halved thanks to a direct grid connection and no middlemen. Service costs fell, full equipment control was gained, and downtime was avoided. Payback вЂ” under 18 months."},{"title":"Case 2: Growth via leasing вЂ” expansion without extra risk","text":"Situation: a Novosibirsk company ran a 1.2 MW mining center. With a stable market and forecast income they decided to scale. Solution: by growing assets the company leased equipment without tying up working capital. Building a second phase raised productivity 70% without critical new investment."},{"title":"Case 3: Double income вЂ” own mining + hosting","text":"Story: an industrial site owner in Khakassia built a 3 MW data center, of which only 2 MW was used for own mining. Result: the remaining 1 MW is rented to other miners as hosting, bringing stable income per hosted device. That shortened payback and helped cover infrastructure costs."},{"title":"Case 4: A mobile site for scalable mining","text":"Solution: one client chose a modular container data center (2Г—40-ft blocks). Thanks to flexibility they could quickly move the site to a region with cheaper electricity, saving up to 30% monthly."},{"title":"Case 5: An investment project under management","text":"Scenario: a private investor wanted mining as an asset but not day-to-day operations. We delivered a turnkey project вЂ” from site selection and construction to hiring staff and tuning equipment. Result: in 4 months an 800 kW site was fully live and runs under a trust model, generating stable passive income."}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We cover more examples and case studies in a separate article."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Ready to discuss your project?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Leave a request and we will run a free preliminary assessment, calculate capacity, define data-center architecture for your needs, and draft a budget estimate. Build a data center that works only for you!"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Turnkey mining site construction$tmj$,
       $tmj$Turnkey data center builds in Russia: who it suits, project stages, income models, case studies, and why owning a site can beat renting.$tmj$,
       $tmj$Turnkey mining site construction$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
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
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Modern business increasingly needs powerful computing resources вЂ” whether for hosting mining equipment, renting server space, or building its own data-processing infrastructure. That is why data center construction is becoming not just a technical service but a strategic investment. Below we detail why it is needed, who it suits, and what benefits it brings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why construction services are needed","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Turnkey data center construction turns a technical facility into a source of income. For example, investing from 125 million в‚Ѕ can yield a project with payback from 17 months.","title":"Infrastructure as an investment asset"},{"text":"When renting someone elseвЂ™s hosting, you depend on third-party tariffs and rules. Your own data center gives full control over infrastructure, operating conditions, and utilization.","title":"Full independence from rentals"},{"text":"A facility built under a data center construction service can generate stable profit from rental or operation вЂ” regardless of market swings or cryptocurrency exchange rates.","title":"Lower risk and income stability"},{"text":"Building your own site helps substantially cut costs for electricity, cooling, maintenance, and third-party services.","title":"Cost optimization"},{"text":"A turnkey data center project is designed with future growth in mind вЂ” you can add capacity and upgrade equipment without a full rebuild.","title":"Scalability and flexibility"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Why data center construction services are needed","src":"/images/articles/mining-site-turnkey/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Who data center construction is for","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Investors looking for an asset with high returns and fast payback.","Miners and mining companies that need to control capacity, power consumption, and tariffs.","Businesses that want to diversify assets: not only mine, but also lease sites.","IT companies and cloud providers interested in their own reliable infrastructure.","Enterprises that want to move equipment off third-party sites and manage all processes themselves."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How turnkey data center construction works","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Working with TOP MINING experts on data center construction is divided into several stages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"A site audit is performed, loads are calculated, a technical specification is drawn up, and power, cooling, redundancy, and connectivity systems are planned.","title":"Analytics and design"},{"text":"An optimal location is chosen based on land cost, logistics, and grid access. Technical conditions (TC) and other permits are obtained.","title":"Site selection and documentation"},{"text":"A building or modular structure is erected; fire suppression, cooling, security, and power systems are installed; UPS and distribution gear are fitted.","title":"Construction and installation"},{"text":"Equipment is installed, load-tested, and checked in thermal and emergency modes. After that the site goes live and can be filled with clients immediately.","title":"Commissioning"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How turnkey data center construction works","src":"/images/articles/mining-site-turnkey/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What the client gets: income models and examples","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Main cooperation formats"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Model 1: data center construction without buying ASIC miners. Investment ~125 million в‚Ѕ в†’ payback ~17 months.","Model 2: construction followed by sale. Investment ~125 million в‚Ѕ в†’ sale in 4 months for ~150 million в‚Ѕ.","Model 3: construction with miner purchase. Investment ~567 million в‚Ѕ в†’ payback ~14 months.","Model 4: data center built for a 7-year lease. Investment ~62.5 million в‚Ѕ в†’ ROI in ~17 months."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Operating advantages","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["When leasing the site, operating risks are minimal вЂ” the facility remains your property.","Profit can reach ~7 million в‚Ѕ per month thanks to electricity tariff spreads.","With self-mining, placement costs and commissions decrease."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Case studies","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Tatarstan: a client rented 100 kW (cost ~700,000 в‚Ѕ/month), built 120 kW вЂ” costs nearly halved, payback < 18 months.","Novosibirsk: a company expanded capacity by 70% by building a second phase.","Khakassia: a 3 MW site вЂ” 2 MW own mining, 1 MW lease в†’ accelerated payback.","Mobile option: a container data center moved to a region with low tariffs saved ~30%.","Investment project: 800 kW, southern Russia вЂ” launch in 4 months, the investor receives passive income.","Region with tariff в‰€ 3 в‚Ѕ/kWh: northern zone, gas generation в†’ payback < 14 months."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why data center construction is especially profitable","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Infrastructure control. Your own data center means full autonomy from operators and intermediaries.","Lower costs. Ability to choose the cheapest electricity tariffs and optimize cooling systems.","Growth and scaling. Modular solutions let you grow capacity without stopping operations.","Rising demand. The Russian data center market is actively developing; capacity increases every year.","Regional advantages. The North and Siberia offer cheap energy, a cold climate, and available sites вЂ” ideal conditions for building data centers in Russia."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Why data center construction is profitable","src":"/images/articles/mining-site-turnkey/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to consider when launching a data center","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"","title":"Region choice (tariff, climate, infrastructure)"},{"text":"","title":"Reliable engineering systems: power, cooling, security"},{"text":"","title":"Risk management (fire, theft, remote control)"},{"text":"","title":"Ability to modernize without downtime"},{"text":"","title":"Legal support and obtaining all technical conditions"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why order turnkey data center construction","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A contractor offering turnkey data center construction takes on the full cycle:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["design and audit,","site selection and TC paperwork,","construction and installation,","commissioning and go-live,","ongoing technical support."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This format lets the client focus on business results rather than operational issues."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 26
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
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Building a mining site is not just a technical project вЂ” it is a full-fledged investment. It gives control over infrastructure, reduces dependence on rentals, and provides stable income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"With growing demand for computing capacity in Russia, now is the ideal moment to build your own data center and turn technology into an asset."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
