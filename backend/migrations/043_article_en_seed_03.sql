SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- luchshie-asiki-dlya-majninga-kaspy-top-5
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best ASICs for Kaspa mining: top 5$tmj$,
       $tmj$Top kHeavyHash ASICs for Kaspa (KAS): from quiet IceRiver KS0 to powerful Antminer KS7 40T.$tmj$,
       $tmj$Antminer KS7 40T$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Rising Bitcoin network hashrate and the recent BTC halving push many miners to look for alternative assets. One of the most popular options is Kaspa (KAS), mined on the kHeavyHash algorithm. The format is relatively new and there are few dedicated tokens, but low network competition attracts miners who prefer Kaspa. Below we cover the five best ASICs for KAS and their pros and cons.","text":"Rising Bitcoin network hashrate and the recent BTC halving push many miners to look for alternative assets. One of the most popular options is Kaspa (KAS), mined on the kHeavyHash algorithm. The format is relatively new and there are few dedicated tokens, but low network competition attracts miners who prefer Kaspa. Below we cover the five best ASICs for KAS and their pros and cons."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to mine Kaspa?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kaspa mining uses classic Proof-of-Work with the kHeavyHash algorithm. It is designed to be energy-efficient and to suit modern GPUs and next-generation ASIC miners.","text":"Kaspa mining uses classic Proof-of-Work with the kHeavyHash algorithm. It is designed to be energy-efficient and to suit modern GPUs and next-generation ASIC miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Main mining methods:","text":"Main mining methods:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"requires your own full node, high difficulty, rarely used;","title":"Solo mining"},{"text":"the most popular method, stable payouts, lower risk.","title":"Pool mining"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Popular Kaspa pools: K1Pool, WoolyPooly, KaspaPool, HeroMiners.","text":"Popular Kaspa pools: K1Pool, WoolyPooly, KaspaPool, HeroMiners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is Kaspa?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kaspa is a Layer-1 blockchain based on a graph structure (BlockDAG) rather than a traditional chain of blocks. This architecture lets the network process multiple blocks in parallel, greatly increasing transaction speed and reducing confirmation time.","text":"Kaspa is a Layer-1 blockchain based on a graph structure (BlockDAG) rather than a traditional chain of blocks. This architecture lets the network process multiple blocks in parallel, greatly increasing transaction speed and reducing confirmation time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Kaspa вЂ” Beyond the Block","src":"/images/articles/kaspa-asics/kaspa-banner.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Key features of Kaspa:","text":"Key features of Kaspa:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"GHOSTDAG (a modification of the Nakamoto protocol);","title":"Consensus algorithm"},{"text":"в‰€ 1 second;","title":"Block time"},{"text":"focused on high-speed peer-to-peer payments;","title":"No smart contracts"},{"text":"yes, used to secure the network;","title":"Proof-of-Work (PoW)"},{"text":"kHeavyHash.","title":"Hashing algorithm"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kaspa attracts miners with decentralization, high throughput, and the ability to mine with powerful ASICs.","text":"Kaspa attracts miners with decentralization, high throughput, and the ability to mine with powerful ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Kaspa outlook and potential","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2024вЂ“2025 the KAS price showed strong growth driven by interest from miners and investors.","text":"In 2024вЂ“2025 the KAS price showed strong growth driven by interest from miners and investors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The community is growing: ongoing updates, exchange listings, and developer interest.","text":"The community is growing: ongoing updates, exchange listings, and developer interest."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Thanks to a fast and cheap transaction network, KAS could become a popular medium for peer-to-peer payments.","text":"Thanks to a fast and cheap transaction network, KAS could become a popular medium for peer-to-peer payments."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: IceRiver KS0","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One advantage of kHeavyHash mining is that home-friendly ASICs are available. A good example is the KS0 from IceRiver. Its key feature is no fans: the maker uses passive cooling with large heatsinks. Heat dissipates into the room on its own, so the IceRiver KS0 is nearly silent.","text":"One advantage of kHeavyHash mining is that home-friendly ASICs are available. A good example is the KS0 from IceRiver. Its key feature is no fans: the maker uses passive cooling with large heatsinks. Heat dissipates into the room on its own, so the IceRiver KS0 is nearly silent."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IceRiver KS0","src":"/images/articles/kaspa-asics/iceriver-ks0.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The flip side of that comfort is relatively low performance вЂ” even by kHeavyHash standards the model does only about 0.1 TH/s. The lineup also has higher models at 0.2 and even 0.4 TH/s; those are recommended, because with a small power difference performance is clearly better.","text":"The flip side of that comfort is relatively low performance вЂ” even by kHeavyHash standards the model does only about 0.1 TH/s. The lineup also has higher models at 0.2 and even 0.4 TH/s; those are recommended, because with a small power difference performance is clearly better."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IceRiver"},{"label":"Release year","value":"2023"},{"label":"Hashrate","value":"0.1вЂ“0.4 TH/s"},{"label":"Power consumption","value":"65вЂ“100 W"},{"label":"Energy efficiency","value":"250вЂ“650 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Noise level","value":"25 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest performance versus classic-architecture ASICs"],"pros":["One of the quietest ASICs among crypto mining gear (including Kaspa)","Several models in the lineup","Higher variants offer excellent energy efficiency","Compact size suited to home use","Fairly well-known manufacturer"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Goldshell KA BOX PRO","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Long treated as a second-wave brand, Goldshell keeps searching for its best niche. One direction is altcoins, with several interesting devices вЂ” for example the KA BOX on kHeavyHash for Kaspa. It is only partly home-friendly: noise stays under 35 dB. It is not perfectly comfortable in an apartment, but versus BTC ASICs that figure is exceptional.","text":"Long treated as a second-wave brand, Goldshell keeps searching for its best niche. One direction is altcoins, with several interesting devices вЂ” for example the KA BOX on kHeavyHash for Kaspa. It is only partly home-friendly: noise stays under 35 dB. It is not perfectly comfortable in an apartment, but versus BTC ASICs that figure is exceptional."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Performance is 1.6 TH/s at 600 W вЂ” a solid efficiency mix for residential use. Overall, the Goldshell KA BOX sits between home mining and professional Kaspa mining on classic units.","text":"Performance is 1.6 TH/s at 600 W вЂ” a solid efficiency mix for residential use. Overall, the Goldshell KA BOX sits between home mining and professional Kaspa mining on classic units."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Goldshell"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"1.6 TH/s"},{"label":"Power consumption","value":"600 W"},{"label":"Energy efficiency","value":"375 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Noise level","value":"35 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Fairly high price"],"pros":["Attractive design","Fairly well-known maker","Acceptable performance and efficiency","Relatively low noise"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: IceRiver KS1, KS2, KS3, KS5, and KS7","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Besides the passively cooled Kaspa ASIC, IceRiver also offers classic fan-cooled units. The KS lineup has five models from 1 to 30 TH/s. The maker focuses heavily on KAS, which explains the wide range of kHeavyHash hardware.","text":"Besides the passively cooled Kaspa ASIC, IceRiver also offers classic fan-cooled units. The KS lineup has five models from 1 to 30 TH/s. The maker focuses heavily on KAS, which explains the wide range of kHeavyHash hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IceRiver KS series","src":"/images/articles/kaspa-asics/iceriver-ks-series.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The KS line is not home-oriented: four fans mean high noise and substantial heat. Top models are also power-hungry. That is why IceRiver KS is treated as professional gear for dedicated facilities.","text":"The KS line is not home-oriented: four fans mean high noise and substantial heat. Top models are also power-hungry. That is why IceRiver KS is treated as professional gear for dedicated facilities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IceRiver"},{"label":"Release year","value":"2023"},{"label":"Hashrate","value":"1вЂ“30 TH/s"},{"label":"Power consumption","value":"600вЂ“3,400 W"},{"label":"Energy efficiency","value":"226вЂ“600 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise level","High power draw on higher versions"],"pros":["Professional lineup from a known manufacturer","Excellent efficiency on higher models"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer KAS Miner KS5 and KS5 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Leading mining hardware maker Bitmain also targets kHeavyHash and Kaspa ASICs. Beyond the third KAS Miner series, the top fifth lineup is KAS Miner KS5 including the Pro. These two are among the most powerful Kaspa miners today: 20 and 21 TH/s at 3,000 and 3,150 W. Benchmark efficiency helped Bitmain leave competitors far behind.","text":"Leading mining hardware maker Bitmain also targets kHeavyHash and Kaspa ASICs. Beyond the third KAS Miner series, the top fifth lineup is KAS Miner KS5 including the Pro. These two are among the most powerful Kaspa miners today: 20 and 21 TH/s at 3,000 and 3,150 W. Benchmark efficiency helped Bitmain leave competitors far behind."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer KAS Miner KS5","src":"/images/articles/kaspa-asics/antminer-ks5.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Given AntminerвЂ™s brand strength, another KS5 / KS5 Pro advantage is easier repairs and spare parts. Together, that makes BitmainвЂ™s KS5 lineup the best kHeavyHash option today.","text":"Given AntminerвЂ™s brand strength, another KS5 / KS5 Pro advantage is easier repairs and spare parts. Together, that makes BitmainвЂ™s KS5 lineup the best kHeavyHash option today."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"20вЂ“21 TH/s"},{"label":"Power consumption","value":"3,000вЂ“3,150 W"},{"label":"Energy efficiency","value":"150 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Number of mineable coins","value":"3"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Very high noise","High price"],"pros":["The most powerful Kaspa ASIC","Benchmark energy efficiency","Leading manufacturer","Available spare parts and service centers"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer KS7 40T","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain keeps expanding Kaspa ASICs, and the Antminer KS7 40T shows that clearly. It targets kHeavyHash as a new generation focused on a sharp performance jump while keeping power reasonable. Versus earlier KS series, KS7 looks like a real evolution, not a cosmetic refresh.","text":"Bitmain keeps expanding Kaspa ASICs, and the Antminer KS7 40T shows that clearly. It targets kHeavyHash as a new generation focused on a sharp performance jump while keeping power reasonable. Versus earlier KS series, KS7 looks like a real evolution, not a cosmetic refresh."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer KS7 40T","src":"/images/articles/kaspa-asics/antminer-ks7.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At 40 TH/s the KS7 is among the most powerful Kaspa ASICs on the market. Power stays around 3,080 W вЂ” excellent efficiency for kHeavyHash. The format is still strictly professional: high noise and classic air cooling rule out home use. KS7 is for farms, data centers, and facilities with prepared power and ventilation.","text":"At 40 TH/s the KS7 is among the most powerful Kaspa ASICs on the market. Power stays around 3,080 W вЂ” excellent efficiency for kHeavyHash. The format is still strictly professional: high noise and classic air cooling rule out home use. KS7 is for farms, data centers, and facilities with prepared power and ventilation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"40 TH/s"},{"label":"Power consumption","value":"3080 W"},{"label":"Energy efficiency","value":"77 J/TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Mineable coins","value":"KAS (Kaspa)"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"430 Г— 196 Г— 290 mm"},{"label":"Weight","value":"16.4 kg"},{"label":"Operating temperature","value":"0вЂ“40 В°C"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise вЂ” not suitable for living spaces","Air cooling needs proper ventilation","Narrow focus on Kaspa only","High entry cost for the segment"],"pros":["One of the highest-performing Kaspa ASICs","Much better efficiency than previous generations","Proven Bitmain brand","Fully focused on kHeavyHash","Relevant for industrial mining"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 45
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kaspa is a technically advanced blockchain with a unique architecture, high speed, and active development. The project attracts miners thanks to:","text":"Kaspa is a technically advanced blockchain with a unique architecture, high speed, and active development. The project attracts miners thanks to:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["The energy-efficient kHeavyHash algorithm;","The ability to use powerful, high-performance hardware;","Prospects for token price growth."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you want a current, potentially profitable mining project, consider Kaspa (KAS). It combines strong technology, a fair economy, and long-term participation potential.","text":"If you want a current, potentially profitable mining project, consider Kaspa (KAS). It combines strong technology, a fair economy, and long-term participation potential."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-kaspy-top-5$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-asiki-dlya-majninga-v-2024-godu-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best mining ASICs in 2026: top 10$tmj$,
       $tmj$Buying an ASIC is a serious step вЂ” a 2026 ranking of models amid new hardware, algorithms, and tech.$tmj$,
       $tmj$Working with mining equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Buying an ASIC is a responsible step for any miner, be it a beginner or an experienced professional. In 2026, the mining equipment market has become even more saturated: new models, algorithms, and energy saving technologies are appearing. To choose the truly best ASIC, you need to consider a number of criteria, and not just focus on price or advertising.","text":"Buying an ASIC is a responsible step for any miner, be it a beginner or an experienced professional. In 2026, the mining equipment market has become even more saturated: new models, algorithms, and energy saving technologies are appearing. To choose the truly best ASIC, you need to consider a number of criteria, and not just focus on price or advertising."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Working with mining equipment","src":"/images/articles/best-asics-2026/intro-engineer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose the best ASIC for mining in 2026?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"We will analyze the main parameters that need to be analyzed before purchasing and give conclusions for practical choice.","text":"We will analyze the main parameters that need to be analyzed before purchasing and give conclusions for practical choice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"What does this mean: each ASIC is configured to work with a specific cryptocurrency algorithm (SHA-256, Scrypt, Blake2b, Kadena and others). Why this is important: The chosen algorithm determines which coins can be mined and how promising the mining will be in the future. Examples: SHA-256 (Bitcoin, Bitcoin Cash), Scrypt (Litecoin, Dogecoin), kHeavyHash (Kaspa). Conclusion: choose an ASIC that is compatible with the most stable and promising coins;","title":"Mining algorithm"},{"text":"What this means: hashrate shows how many calculations a miner performs per second. Measured in TH/s (tera hashes per second) or GH/s (giga hashes). Why this is important: the higher the hashrate, the greater the reward. Conclusion: strive for the optimal balance between high hashrate and power consumption;","title":"Hashrate (performance)"},{"text":"What this means: It shows how much energy (in joules) is spent calculating one terahash. Why this is important: Electricity is the main expense in mining. The lower J/TH, the higher the profitability. Conclusion: energy efficiency is more important than just a high hashrate - look for devices with a minimum J/TH indicator;","title":"Energy efficiency (J/TH)"},{"text":"What does this mean: the ASIC should work stably for several years without critical breakdowns. Why is this important: buying a miner is an investment that should pay for itself over its lifespan. Conclusion: look for devices with good reviews, choose trusted brands (Bitmain, MicroBT);","title":"Reliability and service life"},{"text":"What does this mean: manufacturers and official sellers provide a guarantee for repair or replacement of equipment. Why this is important: When a new car fails without a warranty, the losses can be huge. Conclusion: choose miners with an official warranty of at least 6 months, preferably 12 months;","title":"Warranty and support"},{"text":"What does this mean: the ability to quickly repair the device or replace failed parts. Why is this important: long shipments abroad or lack of spare parts can reduce the profitability of mining. Conclusion: focus on brands with developed networks of service centers in your region;","title":"Availability of service centers and spare parts"},{"text":"What does this mean: evaluation of the deviceвЂ™s performance by real users, members of forums and communities. Why this is important: objective reviews allow you to understand the real pros and cons of models. Conclusion: the more positive reviews about stability and reliability, the better.","title":"Reviews and reputation of the manufacturer"},{"text":"What does this mean: the cost of the device and the period during which it will pay for itself at current prices for electricity and cryptocurrency. Why is this important: a miner that is too expensive in an unstable market may not pay off. Conclusion: calculate the payback taking into account real income, electricity costs and possible fluctuations in the coin exchange rate;","title":"Price and payback"},{"text":"What this means: Some miners allow you to install custom firmware to increase performance or reduce consumption. Why it's important: Proper optimization can significantly improve profitability. Conclusion: choose devices that support alternative firmware (for example, Braiins OS for Antminer);","title":"Possibility of flashing and overclocking"},{"text":"What this means: How well the device handles heat dissipation. Why it matters: Overheating reduces performance and accelerates component wear. Conclusion: pay attention to models with an efficient cooling system and the ability to install in farms or data centers with good ventilation;","title":"Cooling and operating temperature"},{"text":"What does this mean: some models are adapted to work in liquid cooling baths or have special energy saving modes. Why this is important: Such technologies increase service life and reduce energy costs. Conclusion: for large mining farms this is an important advantage.","title":"Support for new technologies"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The final list of ASIC selection criteria in 2026:","text":"The final list of ASIC selection criteria in 2026:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Mining algorithm;","Hashrate;","Energy efficiency;","Reliability;","Warranty and support;","Availability of services and spare parts;","Brand reputation;","Payback;","Possibility of firmware;","Cooling efficiency;","Support for new technologies."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: ElphaPex DG2","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex DG2 is a powerful new generation Scrypt miner focused on mining Litecoin, Dogecoin and other compatible coins. The device offers a hashrate of up to 20 GH/s and is characterized by stable operation even under prolonged loads. In practice, the miner attracts users with its combination of power and energy efficiency: consumption of 3800 W allows you to keep costs under control, and a well-thought-out cooling system ensures uninterrupted operation in industrial environments.","text":"ElphaPex DG2 is a powerful new generation Scrypt miner focused on mining Litecoin, Dogecoin and other compatible coins. The device offers a hashrate of up to 20 GH/s and is characterized by stable operation even under prolonged loads. In practice, the miner attracts users with its combination of power and energy efficiency: consumption of 3800 W allows you to keep costs under control, and a well-thought-out cooling system ensures uninterrupted operation in industrial environments."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The DG2 model has been chosen by many miners who are looking for a reliable device with a predictable return on investment. The ASIC confidently maintains its stated performance and tolerates round-the-clock operation well, which makes it a suitable option for farmers aiming for stable profitability.","text":"The DG2 model has been chosen by many miners who are looking for a reliable device with a predictable return on investment. The ASIC confidently maintains its stated performance and tolerates round-the-clock operation well, which makes it a suitable option for farmers aiming for stable profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex DG2 вЂ” Scrypt ASIC","src":"/images/articles/best-asics-2026/elphapex-dg2.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Model","value":"ElphaPex DG2"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"20000 Mh/s"},{"label":"Consumption","value":"3800 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"432 Г— 196 Г— 287 mm"},{"label":"Weight","value":"18.3 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The noise level is above average - not suitable for home use.","Requires a high-quality ventilation system.","Young producer."],"pros":["High performance of 20 GH/s with moderate power consumption.","Suitable for stable 24/7 mining.","Confidently maintains the declared hashrate indicators.","Optimal for medium and large farms.","Resistant to temperature fluctuations thanks to efficient cooling."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Antminer L11 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Pro is an updated high-performance Scrypt solution created specifically for mining Litecoin, Dogecoin and several other coins using the same algorithm. The model offers a hashrate of 21 GH/s with moderate power consumption, while maintaining energy efficiency at the level of professional devices. ASIC became a logical development of previous versions of the L-series line, receiving improved performance and more stable operation under round-the-clock load.","text":"Antminer L11 Pro is an updated high-performance Scrypt solution created specifically for mining Litecoin, Dogecoin and several other coins using the same algorithm. The model offers a hashrate of 21 GH/s with moderate power consumption, while maintaining energy efficiency at the level of professional devices. ASIC became a logical development of previous versions of the L-series line, receiving improved performance and more stable operation under round-the-clock load."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"L11 Pro will be appreciated by users who care about the speed of payback and predictable profitability. The device is designed for long-term operation without frequent interruptions, and its cooling system copes with thermal loads even in dense farm conditions. This is one of the most versatile options for miners working with Scrypt coins.","text":"L11 Pro will be appreciated by users who care about the speed of payback and predictable profitability. The device is designed for long-term operation without frequent interruptions, and its cooling system copes with thermal loads even in dense farm conditions. This is one of the most versatile options for miners working with Scrypt coins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Pro вЂ” Scrypt ASIC","src":"/images/articles/best-asics-2026/asic-air.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer L11 Pro"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"21000 Mh/s (21 GH/s)"},{"label":"Consumption","value":"3680 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Noise level","value":"76 dB"},{"label":"Dimensions","value":"400 Г— 195 Г— 290 mm"},{"label":"Weight","value":"14.2 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise levels are not the best option for home use.","Requires good farm ventilation."],"pros":["High performance of 21 GH/s for its class.","Energy efficient operation with moderate consumption.","Suitable for 24/7 mining with minimal downtime.","Improved cooling system for industrial placement.","Easy startup and stable operation without the need for complex setup."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Antminer U2L9H","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer U2L9H is a powerful new generation Scrypt miner designed for mining Litecoin, Dogecoin and a number of other coins using the same algorithm. The device produces 27 GH/s hashrate and uses water cooling, which allows it to maintain stable operation even at peak load. This type of cooling reduces the risk of overheating and makes the miner quiet compared to classic fans.","text":"Antminer U2L9H is a powerful new generation Scrypt miner designed for mining Litecoin, Dogecoin and a number of other coins using the same algorithm. The device produces 27 GH/s hashrate and uses water cooling, which allows it to maintain stable operation even at peak load. This type of cooling reduces the risk of overheating and makes the miner quiet compared to classic fans."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model is aimed at users who need high performance while maintaining energy efficiency. Antminer U2L9H demonstrates a balance between hashrate and power consumption, providing confident profitability and predictable payback. It is suitable for both large farms and miners looking to expand their infrastructure without increasing the heat load.","text":"The model is aimed at users who need high performance while maintaining energy efficiency. Antminer U2L9H demonstrates a balance between hashrate and power consumption, providing confident profitability and predictable payback. It is suitable for both large farms and miners looking to expand their infrastructure without increasing the heat load."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U2L9H - hydrocooling","src":"/images/articles/best-asics-2026/antminer-u2l9h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer U2L9H"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"27000 Mh/s (27 GH/s)"},{"label":"Consumption","value":"5670 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"445 Г— 188 Г— 670 mm"},{"label":"Weight","value":"12.8 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["An external water cooling circuit is required.","The dimensions are larger than those of classic air models.","Consumption of 5.6 kW requires high-quality wiring and a reliable power line."],"pros":["High hashrate 27 GH/s.","Water cooling reduces the risk of overheating and reduces noise.","Good balance of performance and power consumption.","Resistant to 24/7 operation.","Suitable for expanding farms without increasing the heat load."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Antminer L11 Hyd 6U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Hydro 6U is a high-performance Scrypt mining device designed for mining Litecoin, Dogecoin and other compatible coins. The model is equipped with hydrocooling, which ensures stable operation under intense loads and reduces thermal stress on the equipment. This type of cooling makes the miner suitable for large farms where long-term reliability and minimizing downtime are important.","text":"Antminer L11 Hydro 6U is a high-performance Scrypt mining device designed for mining Litecoin, Dogecoin and other compatible coins. The model is equipped with hydrocooling, which ensures stable operation under intense loads and reduces thermal stress on the equipment. This type of cooling makes the miner suitable for large farms where long-term reliability and minimizing downtime are important."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A hashrate of 33 GH/s opens up opportunities for increased profitability, and a thoughtful design allows you to efficiently use every watt of energy. Antminer L11 Hydro 6U is especially useful for those who plan to scale mining without increasing noise and overheating, while maintaining stable operation 24/7.","text":"A hashrate of 33 GH/s opens up opportunities for increased profitability, and a thoughtful design allows you to efficiently use every watt of energy. Antminer L11 Hydro 6U is especially useful for those who plan to scale mining without increasing noise and overheating, while maintaining stable operation 24/7."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro 6U","src":"/images/articles/best-asics-2026/antminer-l11-hyd.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer L11 Hydro 6U"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"33000 Mh/s (33 GH/s)"},{"label":"Consumption","value":"5676 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"600 Г— 450 Г— 350 mm"},{"label":"Weight","value":"25 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires external hydraulic circuit and additional equipment.","Takes up more space than classic airborne ASICs.","Consumption of almost 5.7 kW requires a reliable power grid and cooling infrastructure."],"pros":["High performance - 33 GH/s.","Hydrocooling ensures stable operation and reduced wear.","Optimal energy efficiency for its power class.","Suitable for 24/7 operation on large farms.","Low noise level for a device of this power."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 31
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S23 Immersion is a 2025 custom ASIC created by Bitmain to work in immersion cooling systems. It produces a hashrate of 442 TH/s with good energy efficiency of 12 J/TH and consumption of about 5304 W. The absence of fans reduces noise to zero and significantly improves reliability, as the immersion environment effectively cools equipment even under 24/7 loads.","text":"Antminer S23 Immersion is a 2025 custom ASIC created by Bitmain to work in immersion cooling systems. It produces a hashrate of 442 TH/s with good energy efficiency of 12 J/TH and consumption of about 5304 W. The absence of fans reduces noise to zero and significantly improves reliability, as the immersion environment effectively cools equipment even under 24/7 loads."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device is ideal for large industrial farms and data centers where high computing density, operational stability and minimal maintenance are important. Thanks to the immersion form factor, the miner demonstrates optimal performance without thermal overload and extends the life of the chips.","text":"The device is ideal for large industrial farms and data centers where high computing density, operational stability and minimal maintenance are important. Thanks to the immersion form factor, the miner demonstrates optimal performance without thermal overload and extends the life of the chips."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Immersion","src":"/images/articles/best-asics-2026/antminer-s23-imm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S23 Imm"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"442 Th/s"},{"label":"Consumption","value":"5304 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"40 dB"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires immersion infrastructure - pumps, controllers, tank.","Not suitable for home use.","Higher cost compared to air models."],"pros":["Fully compatible with immersion tanks without modification.","High hashrate of 442 TH/s with optimal power consumption.","No major noise.","Minimum risk of overheating and increased reliability.","Suitable for large-scale farms and automated data centers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Antminer S21 XP Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21 XP Hyd is a specialized next-generation ASIC aimed at those who seek maximum computing power with minimal energy loss. Unlike traditional air-cooled models, this version uses liquid to keep the chips at a stable temperature even under extreme load.","text":"Antminer S21 XP Hyd is a specialized next-generation ASIC aimed at those who seek maximum computing power with minimal energy loss. Unlike traditional air-cooled models, this version uses liquid to keep the chips at a stable temperature even under extreme load."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This approach makes the device especially attractive to those miners who want to expand the farm without the risk of overheating or additional ventilation costs. The compact body and high performance density allow efficient use of space, and the energy efficiency of the device makes it one of the most profitable solutions in the professional SHA-256 equipment segment.","text":"This approach makes the device especially attractive to those miners who want to expand the farm without the risk of overheating or additional ventilation costs. The compact body and high performance density allow efficient use of space, and the energy efficiency of the device makes it one of the most profitable solutions in the professional SHA-256 equipment segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 XP Hydro","src":"/images/articles/best-asics-2026/antminer-s21-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S21 XP Hyd"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"473 Th/s"},{"label":"Consumption","value":"5676 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"69 dB"},{"label":"Dimensions","value":"338 x 163 x 207 mm"},{"label":"Weight","value":"12.3 kg"},{"label":"Year of issue","value":"2024"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires a full hydraulic system and additional equipment.","Less suitable for small or home installations.","Higher startup cost compared to airborne ASICs."],"pros":["Liquid cooling reduces thermal load and improves operating stability.","High performance in a compact form factor.","Good energy efficiency for equipment of this level.","Easily scale as part of an industrial farm.","Reliable design for 24/7 operation."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 43
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SealMiner A2 Pro Hyd is a model from Bitdeer, one of the world's leading players in the field of mining and infrastructure solutions. This version is aimed at those who value not only high power, but also the ability to operate uninterruptedly under 24/7 load conditions. Thanks to Bitdeer's hybrid approach to building hardware and infrastructure, A2 Pro Hyd proves especially stable in large farms and data centers.","text":"SealMiner A2 Pro Hyd is a model from Bitdeer, one of the world's leading players in the field of mining and infrastructure solutions. This version is aimed at those who value not only high power, but also the ability to operate uninterruptedly under 24/7 load conditions. Thanks to Bitdeer's hybrid approach to building hardware and infrastructure, A2 Pro Hyd proves especially stable in large farms and data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hydrocooling allows the device to confidently maintain a hashrate of 500 Th/s even at high density. Uniform thermal conditions reduce component wear, and low noise levels make the model convenient for large-scale installations where dozens of devices operate synchronously. As a result, the miner receives predictable performance and equipment designed to last a long time.","text":"Hydrocooling allows the device to confidently maintain a hashrate of 500 Th/s even at high density. Uniform thermal conditions reduce component wear, and low noise levels make the model convenient for large-scale installations where dozens of devices operate synchronously. As a result, the miner receives predictable performance and equipment designed to last a long time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"SealMiner A2 Pro Hyd","src":"/images/articles/best-asics-2026/sealminer-a2-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"SealMiner (Bitdeer)"},{"label":"Model","value":"SealMiner A2 Pro Hyd"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"500 Th/s"},{"label":"Consumption","value":"7450 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"482 Г— 665 Г— 86 mm"},{"label":"Weight","value":"20.5 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires an installed hydraulic system, which increases the cost of implementation.","Not intended for home use."],"pros":["The model was developed by Bitdeer, an industry leader and a major operator of its own mining centers.","Hydrocooling ensures even temperature conditions and minimal noise.","High hashrate with optimal energy efficiency.","Suitable for projects with high equipment density.","It features stable operation under long-term loads."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 49
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S23 Hydro is a powerful water version of the S23 line, created for those who strive to get maximum hashrate with minimal energy losses. Thanks to a full-fledged hydraulic system, the device operates stably even under extreme loads and demonstrates a high component life due to effective cooling.","text":"Antminer S23 Hydro is a powerful water version of the S23 line, created for those who strive to get maximum hashrate with minimal energy losses. Thanks to a full-fledged hydraulic system, the device operates stably even under extreme loads and demonstrates a high component life due to effective cooling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model is designed for large mining complexes, where placement density and the absence of fans are especially valued. The C23 Hydro is quiet, easy to maintain and has an incredible energy efficiency of 9.5 J/Th, making it one of the most cost-effective SHA-256 solutions in 2025. This equipment is suitable for those who want to increase farm productivity without increasing the cost of electricity and cooling.","text":"The model is designed for large mining complexes, where placement density and the absence of fans are especially valued. The C23 Hydro is quiet, easy to maintain and has an incredible energy efficiency of 9.5 J/Th, making it one of the most cost-effective SHA-256 solutions in 2025. This equipment is suitable for those who want to increase farm productivity without increasing the cost of electricity and cooling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Hydro","src":"/images/articles/best-asics-2026/antminer-s23-hyd.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S23 Hydro"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"580 Th/s"},{"label":"Consumption","value":"5510 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"low (hydrocooling)"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A full hydraulic system is required.","Not suitable for home installation.","Requires professional installation in the farm infrastructure."],"pros":["One of the most energy-efficient SHA-256 miners.","Hydrocooling reduces wear and improves operating stability.","No fans - minimal noise and less dust.","Suitable for dense placement in data centers.","High durability with 24/7 operation."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 55
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21e XP Hydro 3U is a true flagship from Bitmain, capable of impressing even experienced miners. The model boasts a hashrate of 860 Th/s and an energy efficiency of 13 J/TH, making it one of the most productive and efficient water-cooled devices.","text":"Antminer S21e XP Hydro 3U is a true flagship from Bitmain, capable of impressing even experienced miners. The model boasts a hashrate of 860 Th/s and an energy efficiency of 13 J/TH, making it one of the most productive and efficient water-cooled devices."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ASIC is designed for industrial installations and data centers: high performance requires a serious connection to the power grid, and the compact 3U form factor allows you to save space and place devices in a dense configuration. Water cooling reduces noise and reduces chip wear, ensuring stable operation under 24/7 load.","text":"ASIC is designed for industrial installations and data centers: high performance requires a serious connection to the power grid, and the compact 3U form factor allows you to save space and place devices in a dense configuration. Water cooling reduces noise and reduces chip wear, ensuring stable operation under 24/7 load."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model is practically unsuitable for вЂњhomeвЂќ use, but for large farms and professional mining complexes this is one of the best solutions on the market, allowing you to receive maximum income with reasonable energy efficiency.","text":"The model is practically unsuitable for вЂњhomeвЂќ use, but for large farms and professional mining complexes this is one of the best solutions on the market, allowing you to receive maximum income with reasonable energy efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21e XP Hydro 3U","src":"/images/articles/best-asics-2026/antminer-s21e-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S21e XP Hydro 3U"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"860 Th/s"},{"label":"Consumption","value":"11 180 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"low (hydrocooling)"},{"label":"Weight","value":"13.8 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires powerful industrial power supply.","Not suitable for household use.","Professional installation and hydraulic system required."],"pros":["Excellent performance among SHA-256 hydrominers.","Energy efficiency 13 J/TH at extreme hashrate.","Hydrocooling reduces noise and component wear.","Compact 3U form factor for dense truss placement.","Stable operation under round-the-clock load."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 62
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer U3S23H is a top miner from Bitmain, created for large data centers and industrial mining farms. The model provides an impressive 1160 Th/s hashrate with an energy efficiency of 9.5 J/TH, making it one of the most powerful and economical SHA-256 devices on the market.","text":"Antminer U3S23H is a top miner from Bitmain, created for large data centers and industrial mining farms. The model provides an impressive 1160 Th/s hashrate with an energy efficiency of 9.5 J/TH, making it one of the most powerful and economical SHA-256 devices on the market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Water cooling maintains optimal chip temperatures, reduces noise and reduces equipment wear, ensuring stable operation under 24/7 load. The miner is compatible with most pools and supports remote management, making monitoring and configuration easy. The U3S23H is suitable for professional use where high density, reliability and maximum profitability are important.","text":"Water cooling maintains optimal chip temperatures, reduces noise and reduces equipment wear, ensuring stable operation under 24/7 load. The miner is compatible with most pools and supports remote management, making monitoring and configuration easy. The U3S23H is suitable for professional use where high density, reliability and maximum profitability are important."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U3S23H","src":"/images/articles/best-asics-2026/antminer-u3s23h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer U3S23H"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"1160 Th/s"},{"label":"Consumption","value":"11,020 W"},{"label":"Coin","value":"BTC"},{"label":"Noise level","value":"50 dB"},{"label":"Weight","value":"14.5 kg"},{"label":"Year of issue","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires industrial power supply.","High cost and complexity of installation.","Not intended for home use."],"pros":["Huge hashrate with impressive energy efficiency.","Water cooling reduces noise and chip wear.","Suitable for dense placement in farms and data centers.","Compatible with most mining pools.","Convenient remote management and monitoring."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose the best ASIC in 2026: conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2026, when competition in mining is extremely high, choosing the right ASIC is the key to the profitability and safety of your investment. The best miner is not just the most powerful or expensive machine, but a device that:","text":"In 2026, when competition in mining is extremely high, choosing the right ASIC is the key to the profitability and safety of your investment. The best miner is not just the most powerful or expensive machine, but a device that:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Brings maximum income with minimal expenses;","Works stably for years;","Easy to repair;","Supported by the manufacturer and users."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Recommendation: before purchasing, be sure to do payback calculations, read reviews from real miners, and focus on real quality, and not just marketing promises.","text":"Recommendation: before purchasing, be sure to do payback calculations, read reviews from real miners, and focus on real quality, and not just marketing promises."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-v-2024-godu-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-kanaly-o-majninge-na-youtube-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best YouTube channels about mining: top 10$tmj$,
       $tmj$Miner World, Serega Soleniy, MinerвЂ™s Notes, and more вЂ” reviews, stats, and how to pick channels worth watching.$tmj$,
       $tmj$Miner World$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Learning about mining in video format is a clear way to get into crypto mining. Combining visual and audio perception helps you absorb the material and see what is happening with your own eyes. Here is a ranking of the best Russian-language mining channels on YouTube: a TOP-10 with a detailed assessment of each project.","text":"Learning about mining in video format is a clear way to get into crypto mining. Combining visual and audio perception helps you absorb the material and see what is happening with your own eyes. Here is a ranking of the best Russian-language mining channels on YouTube: a TOP-10 with a detailed assessment of each project."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"YouTube and mining","src":"/images/articles/youtube-mining-channels/youtube-hero.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why YouTube?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The crypto mining world changes fast вЂ” new ASIC models appear, firmware is updated, pool competition grows, and regulation tightens. In this dynamic environment it matters not only to mine coins but also to stay on top of every novelty. YouTube remains one of the main platforms where miners find up-to-date knowledge, share experience, and discuss fresh news.","text":"The crypto mining world changes fast вЂ” new ASIC models appear, firmware is updated, pool competition grows, and regulation tightens. In this dynamic environment it matters not only to mine coins but also to stay on top of every novelty. YouTube remains one of the main platforms where miners find up-to-date knowledge, share experience, and discuss fresh news."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Reasons for YouTubeвЂ™s popularity in the mining community are clear:","text":"Reasons for YouTubeвЂ™s popularity in the mining community are clear:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Channels with technical reviews, news, and guides help you stay on trend;","title":"Fast access to up-to-date information"},{"text":"Videos make complex technical points easier to grasp than text;","title":"Clarity"},{"text":"YouTube can be watched on a phone, tablet, or computer вЂ” on the road, at work, or at home;","title":"Accessibility"},{"text":"Channels often become hubs of communication вЂ” comment discussions, streams, and Q&A.","title":"Community"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For beginners, YouTube is often the starting point for diving into crypto and mining. For experienced users it is a way to stay current and find interesting cases.","text":"For beginners, YouTube is often the starting point for diving into crypto and mining. For experienced users it is a way to stay current and find interesting cases."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"YouTube amid mining hardware","src":"/images/articles/youtube-mining-channels/youtube-hardware.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is video convenient for studying complex technical topics?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining involves many technical tasks: connecting and configuring ASICs, organizing power, choosing pools, working with firmware and cooling. Explaining that in text alone is hard and slow.","text":"Mining involves many technical tasks: connecting and configuring ASICs, organizing power, choosing pools, working with firmware and cooling. Explaining that in text alone is hard and slow."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Video gives several key advantages at once:","text":"Video gives several key advantages at once:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"It matters not only to read how to set up a miner but to see it done in practice. That saves hours of trial and error;","title":"Visual perception"},{"text":"The video author can narrate actions, explaining their meaning and possible mistakes;","title":"Audiovisual explanation"},{"text":"For example, how firmwares differ, and how overclocking affects hashrate and temperature;","title":"Real-time comparisons"},{"text":"True efficiency of hardware or firmware shows only in operation вЂ” and you can see that clearly on YouTube;","title":"Field testing"},{"text":"For example, connecting to a non-standard power source, working in high humidity, budget cooling, and so on.","title":"Life hacks and rare cases"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"So video is not just a delivery format but a full tool for learning, analysis, and practice.","text":"So video is not just a delivery format but a full tool for learning, analysis, and practice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose the best mining channel on YouTube?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There is a lot of content on the platform, but not all of it is equally useful. To avoid wasting time and falling for scammers or amateurs, evaluate channels by several criteria:","text":"There is a lot of content on the platform, but not all of it is equally useful. To avoid wasting time and falling for scammers or amateurs, evaluate channels by several criteria:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Channels that publish at least once a month show author engagement. Abandoned channels often go stale;","title":"Content regularity"},{"text":"The best channels show real hardware in action, configure ASICs, test firmware, and share profitability results;","title":"Practical focus"},{"text":"Information should reflect local realities: power rates, customs nuances, and CIS laws;","title":"Geography and relevance"},{"text":"Useful content is not only success stories but an honest account of difficulties and risks;","title":"Honesty and transparency"},{"text":"Comments, answers to questions, and discussion help you understand the material better.","title":"Feedback"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to watch for when viewing YouTube mining channels?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"YouTube is not only a knowledge platform but a space where ads thrive вЂ” and sometimes outright fraud.","text":"YouTube is not only a knowledge platform but a space where ads thrive вЂ” and sometimes outright fraud."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Here is what matters:","text":"Here is what matters:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"If the author heavily promotes a specific store, pool, or cloud service, stay critical;","title":"Ad inserts and hidden advertising"},{"text":"Overly optimistic headlines like вЂњEarn $500 a day from one ASICвЂќ or вЂњMining with no investmentвЂќ are a red flag;","title":"Unrealistic promises"},{"text":"If a channel asks you to invest money, send crypto to some wallet, or buy hardware via a вЂњspecial linkвЂќ вЂ” it may be a scam;","title":"Financial schemes"},{"text":"Be careful with вЂњgiveaways,вЂќ especially if you must send something or leave personal data to enter.","title":"Fraudulent contests"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Bogdan Musk/GetAsic","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An author channel from a representative of the well-known mining-hardware store GetAsic: a popular format where a distributor makes content to boost gear sales. The resource focuses on ASICs, though the author sometimes diversifies with related topics вЂ” interviews with known figures, crypto market trend reviews, and so on.","text":"An author channel from a representative of the well-known mining-hardware store GetAsic: a popular format where a distributor makes content to boost gear sales. The resource focuses on ASICs, though the author sometimes diversifies with related topics вЂ” interviews with known figures, crypto market trend reviews, and so on."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"GetAsic вЂ” YouTube mining channel","src":"/images/articles/youtube-mining-channels/getasic.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Some videos cover highly relevant topics and become real finds for beginners. The presentation is interesting and editing is solid. However, new-video frequency leaves much to be desired вЂ” the main drawback. Another weak point (as with all store channels) is interest in promoting certain brands, which hinders independent content.","text":"Some videos cover highly relevant topics and become real finds for beginners. The presentation is interesting and editing is solid. However, new-video frequency leaves much to be desired вЂ” the main drawback. Another weak point (as with all store channels) is interest in promoting certain brands, which hinders independent content."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@getasic"},{"label":"Channel founded","value":"2015"},{"label":"Subscribers","value":"18 000+"},{"label":"Number of videos","value":"650+"},{"label":"Average publishing frequency","value":"5+ per month"},{"label":"Views on average","value":"8 800+"},{"label":"Likes on average","value":"220+"},{"label":"Comments on average","value":"12+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Store representative interest in promoting certain brands;","Modest subscriber count;","Modest community activity in comments;","Low frequency of new videos."],"pros":["Quality, interesting presentation;","Long-standing channel;","Diverse content."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Ruslan PRO MINING","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An author channel about mining on GPUs, ASICs, and even laptops вЂ” both at home and at industrial scale. The format is interesting: an informal vlog for fans of free-form delivery. Content covers technical mining details and everyday aspects вЂ” it does not get boring, and videos feel easy. Topics range widely, from mining Bitcoin in a cabin to reviews of new ASICs.","text":"An author channel about mining on GPUs, ASICs, and even laptops вЂ” both at home and at industrial scale. The format is interesting: an informal vlog for fans of free-form delivery. Content covers technical mining details and everyday aspects вЂ” it does not get boring, and videos feel easy. Topics range widely, from mining Bitcoin in a cabin to reviews of new ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ruslan PRO mining вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/ruslan-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The author not only mines digital assets but also runs related businesses, such as selling spare parts. The profile concept is hard to call professional, yet content quality leaves no doubt about the hostвЂ™s skill. The channel is a real find for fans of informal mining coverage and a sometimes humorous take on investing.","text":"The author not only mines digital assets but also runs related businesses, such as selling spare parts. The profile concept is hard to call professional, yet content quality leaves no doubt about the hostвЂ™s skill. The channel is a real find for fans of informal mining coverage and a sometimes humorous take on investing."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@Ruslanpromining/"},{"label":"Channel founded","value":"2017"},{"label":"Subscribers","value":"24 000+"},{"label":"Number of videos","value":"225+"},{"label":"Average publishing frequency","value":"5+ per month"},{"label":"Views on average","value":"23 000+"},{"label":"Likes on average","value":"330+"},{"label":"Comments on average","value":"60+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mention of the hostвЂ™s side activities in the profile;","Author format does not suit every subscriber;","New videos are rare."],"pros":["Interesting presentation that truly does not get boring;","Wide range of topics;","Exposure to semi-industrial crypto mining;","Active subscribers in comments."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: MINING CENTER","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A channel from the same-named crypto mining hardware store. A known Russian crypto-market player that covers segment news via YouTube as well: over 30,000 subscribers and about 800 videos. Most videos are about mining: almost no off-topic content or general crypto news, which keeps focus on mining. MINING CENTER specializes in ASICs, so there is no GPU or CPU mining content.","text":"A channel from the same-named crypto mining hardware store. A known Russian crypto-market player that covers segment news via YouTube as well: over 30,000 subscribers and about 800 videos. Most videos are about mining: almost no off-topic content or general crypto news, which keeps focus on mining. MINING CENTER specializes in ASICs, so there is no GPU or CPU mining content."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MINING CENTER вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/mining-center.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The key drawback is that the channel belongs to a store: authors may cover topics subjectively, focusing only on gear they sell. Products from makers MINING CENTER does not partner with get less attention. Still, content is solid, diverse, and useful for beginners and experienced miners alike.","text":"The key drawback is that the channel belongs to a store: authors may cover topics subjectively, focusing only on gear they sell. Products from makers MINING CENTER does not partner with get less attention. Still, content is solid, diverse, and useful for beginners and experienced miners alike."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@MININGCENTER"},{"label":"Channel founded","value":"2012"},{"label":"Subscribers","value":"30 000+"},{"label":"Number of videos","value":"800+"},{"label":"Average publishing frequency","value":"10+ per month"},{"label":"Views on average","value":"6 500+"},{"label":"Likes on average","value":"150+"},{"label":"Comments on average","value":"13+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest subscriber count;","Interest in reviewing only gear sold in the store;","Modest subscriber activity;","No information on GPU mining."],"pros":["Mining-focused channel;","Quality material from market professionals;","Good frequency of new materials;","One of the oldest mining channels."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: KOLYA MINER","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known Belarusian blogger has run his YouTube channel since 2014, making it one of the oldest in the RU segment. An informal style won over many subscribers вЂ” Nikolai attracted over 40,000 people who actively watch, like, and comment. Content is very diverse вЂ” topics range from earning with crypto in general to deep technical details in 20вЂ“40 minute reviews.","text":"A well-known Belarusian blogger has run his YouTube channel since 2014, making it one of the oldest in the RU segment. An informal style won over many subscribers вЂ” Nikolai attracted over 40,000 people who actively watch, like, and comment. Content is very diverse вЂ” topics range from earning with crypto in general to deep technical details in 20вЂ“40 minute reviews."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"KOLYA MINER вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/kolya-mainer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The author does not specialize in one mining technology: he knows GPUs, CPUs, ASICs, and software tools well. Advice, recommendations, and life-hack sections are popular. The only drawback is the informal production approach. The author focuses on substance, not shooting conditions or video quality.","text":"The author does not specialize in one mining technology: he knows GPUs, CPUs, ASICs, and software tools well. Advice, recommendations, and life-hack sections are popular. The only drawback is the informal production approach. The author focuses on substance, not shooting conditions or video quality."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@koliamainer"},{"label":"Channel founded","value":"2014"},{"label":"Subscribers","value":"40 000+"},{"label":"Number of videos","value":"200+"},{"label":"Average publishing frequency","value":"7+ per month"},{"label":"Views on average","value":"13 000+"},{"label":"Likes on average","value":"550+"},{"label":"Comments on average","value":"110+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Few videos for one of the oldest CIS channels;","Video quality and shooting conditions will not please every viewer."],"pros":["One of the oldest mining and crypto channels;","Engaging author approach to content;","Diverse video topics;","Not only reviews but also life hacks;","Active subscribers in comments."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: PRO100 Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known channel not only about mining but crypto overall. The key trait is quality content with truly deep research. Topics are broad вЂ” mining new coins, hardware reviews, tips for working with digital assets. Attention goes to both substance and shooting quality: work is professional and earns respect.","text":"A well-known channel not only about mining but crypto overall. The key trait is quality content with truly deep research. Topics are broad вЂ” mining new coins, hardware reviews, tips for working with digital assets. Attention goes to both substance and shooting quality: work is professional and earns respect."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"PRO100 Mining вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/pro100-mining.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main drawback of PRO100 Mining is modest new-video frequency: no more than one new clip per month, which is clearly not enough for most subscribers. Many want more material, but the concept has not changed for a long time.","text":"The main drawback of PRO100 Mining is modest new-video frequency: no more than one new clip per month, which is clearly not enough for most subscribers. Many want more material, but the concept has not changed for a long time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@pro100mining"},{"label":"Channel founded","value":"2017"},{"label":"Subscribers","value":"125 000+"},{"label":"Number of videos","value":"120+"},{"label":"Average publishing frequency","value":"1 per month"},{"label":"Views on average","value":"78 000+"},{"label":"Likes on average","value":"2 700+"},{"label":"Comments on average","value":"500+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["New videos are extremely rare;","Not enough information on classic mining."],"pros":["Professional, quality channel on mining and crypto overall;","Large subscriber base, strong comment activity;","Diversity of topics covered."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: IBMM | technology","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of RussiaвЂ™s largest mining-hardware sellers also has a YouTube channel. Topics cover gear for mining digital assets (ASICs) and related materials вЂ” team and celebrity interviews, alternative cooling systems, and more. The channel launched in 2018; since then IBMM has devoted time and resources to developing it.","text":"One of RussiaвЂ™s largest mining-hardware sellers also has a YouTube channel. Topics cover gear for mining digital assets (ASICs) and related materials вЂ” team and celebrity interviews, alternative cooling systems, and more. The channel launched in 2018; since then IBMM has devoted time and resources to developing it."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IBMM technology вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/ibmm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unfortunately for viewers, new videos are infrequent. Comments are minimal despite interesting review topics. From time to time the channel posts resonant themes and original ideas rarely found elsewhere.","text":"Unfortunately for viewers, new videos are infrequent. Comments are minimal despite interesting review topics. From time to time the channel posts resonant themes and original ideas rarely found elsewhere."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@IBMMtechnology"},{"label":"Channel founded","value":"2018"},{"label":"Subscribers","value":"35 000+"},{"label":"Number of videos","value":"280+"},{"label":"Average publishing frequency","value":"4+ per month"},{"label":"Views on average","value":"65 000+"},{"label":"Likes on average","value":"2 100+"},{"label":"Comments on average","value":"40+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Low subscriber activity;","New videos are infrequent."],"pros":["Trusted resource from a mining-hardware sales leader;","Interesting topics and quality material."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: CryptoLeo","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the largest author channels about mining and crypto in Russian. The author informally covers his activities, shares analysis, and follows digital-asset market trends. That is why topics include not only classic ASIC and GPU mining but many other activities.","text":"One of the largest author channels about mining and crypto in Russian. The author informally covers his activities, shares analysis, and follows digital-asset market trends. That is why topics include not only classic ASIC and GPU mining but many other activities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"CryptoLeo вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/cryptoleo.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The channel has a large audience; subscribers are active and engaged вЂ” useful info appears not only in videos but in comments. CryptoLeoвЂ™s delivery style is hard to call professional, but substance fully offsets that.","text":"The channel has a large audience; subscribers are active and engaged вЂ” useful info appears not only in videos but in comments. CryptoLeoвЂ™s delivery style is hard to call professional, but substance fully offsets that."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@CryptoLeo"},{"label":"Channel founded","value":"2017"},{"label":"Subscribers","value":"85 000+"},{"label":"Number of videos","value":"650+"},{"label":"Average publishing frequency","value":"7+ per month"},{"label":"Views on average","value":"14 000"},{"label":"Likes on average","value":"650+"},{"label":"Comments on average","value":"100+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Distinctive presentation style;","No focus on one topic, which may not suit fans of specialized info."],"pros":["A strong example of an author crypto channel;","Wide range of topics вЂ” from mining to phone clickers;","Active community."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: MinerвЂ™s Notes","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A solid author crypto channel that also covers mining. The key trait is maximum useful info for everyday users. Life hacks are abundant; users actively comment, which helps everyone вЂ” comments hold no less useful info than the videos themselves.","text":"A solid author crypto channel that also covers mining. The key trait is maximum useful info for everyday users. Life hacks are abundant; users actively comment, which helps everyone вЂ” comments hold no less useful info than the videos themselves."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MinerвЂ™s Notes вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/zametki-mainera.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A noticeable drawback for the mining community is limited content specifically about mining digital assets. Lately the author focuses on topics for crypto beginners. So exclusive hardware info is only a small share of MinerвЂ™s Notes. Still, topics are useful and interesting, so it is worth visiting now and then for rare tips and recommendations.","text":"A noticeable drawback for the mining community is limited content specifically about mining digital assets. Lately the author focuses on topics for crypto beginners. So exclusive hardware info is only a small share of MinerвЂ™s Notes. Still, topics are useful and interesting, so it is worth visiting now and then for rare tips and recommendations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@ZametkiMainera"},{"label":"Channel founded","value":"2015"},{"label":"Subscribers","value":"75 000+"},{"label":"Number of videos","value":"1,013+"},{"label":"Average publishing frequency","value":"15+ per month"},{"label":"Views on average","value":"26 000+"},{"label":"Likes on average","value":"750+"},{"label":"Comments on average","value":"45+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lately much published content drifts away from mining topics."],"pros":["Author channel from a professional miner;","Large video library (1,000+ clips);","Coverage of the most relevant topics, including mining;","Many useful tips and unique life hacks;","High frequency of new videos."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Serega Soleniy miner","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"вЂњSoleniyвЂќ is the best-known CIS blogger on GPU mining. He knows GPUs inside out, working with cards at industrial scale. The channel covers farm builds, card selection and overclocking, flashing, and optimization. There is also plenty of other useful crypto-related info.","text":"вЂњSoleniyвЂќ is the best-known CIS blogger on GPU mining. He knows GPUs inside out, working with cards at industrial scale. The channel covers farm builds, card selection and overclocking, flashing, and optimization. There is also plenty of other useful crypto-related info."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Serega Soleniy miner вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/serega-soleniy.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Serega Soleniy minerвЂ™s author content is instantly recognizable: вЂњSoleniyвЂќ does not focus on shooting quality or presentation format. The key focus is usefulness, personal experience, and informal dialogue with viewers. Some may not like that concept, but it is hard to name anyone in the CIS who knows more about GPU mining than this channelвЂ™s author.","text":"Serega Soleniy minerвЂ™s author content is instantly recognizable: вЂњSoleniyвЂќ does not focus on shooting quality or presentation format. The key focus is usefulness, personal experience, and informal dialogue with viewers. Some may not like that concept, but it is hard to name anyone in the CIS who knows more about GPU mining than this channelвЂ™s author."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@SeregaSoleniy"},{"label":"Channel founded","value":"2017"},{"label":"Subscribers","value":"190 000+"},{"label":"Number of videos","value":"564+"},{"label":"Average publishing frequency","value":"5+ per month"},{"label":"Views on average","value":"43 000+"},{"label":"Likes on average","value":"2 000+"},{"label":"Comments on average","value":"220+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Almost no coverage of ASIC mining;","Informal vlog concept."],"pros":["Largest CIS channel on GPU mining;","High host qualification and expertise;","Adjacent content alongside the main topic;","Active subscribers debating in comments."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Miner World","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Perhaps the most organic Russian-language channel on mining and crypto. Everything for a comfortable start: diverse sections, quality content, several hosts, a fairly active community, and material for both beginners and experienced enthusiasts. Despite varied topics, mining dominates вЂ” hardware reviews, experiments, tips, recommendations, and life hacks.","text":"Perhaps the most organic Russian-language channel on mining and crypto. Everything for a comfortable start: diverse sections, quality content, several hosts, a fairly active community, and material for both beginners and experienced enthusiasts. Despite varied topics, mining dominates вЂ” hardware reviews, experiments, tips, recommendations, and life hacks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Miner World вЂ” YouTube channel","src":"/images/articles/youtube-mining-channels/miner-world.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Besides YouTube, the authors have a mining-hardware store and a service center. Those lines never matched video popularity (the store is not well known in the industry). For sales that is a downside, but for subscribers it is a plus: no aggressive marketing, usefulness comes first.","text":"Besides YouTube, the authors have a mining-hardware store and a service center. Those lines never matched video popularity (the store is not well known in the industry). For sales that is a downside, but for subscribers it is a plus: no aggressive marketing, usefulness comes first."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Channel link","value":"https://www.youtube.com/@miner-world"},{"label":"Channel founded","value":"2019"},{"label":"Subscribers","value":"114 000+"},{"label":"Number of videos","value":"900+"},{"label":"Average publishing frequency","value":"7+ per month"},{"label":"Views on average","value":"68 000+"},{"label":"Likes on average","value":"2 200+"},{"label":"Comments on average","value":"55+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Primarily oriented toward mining beginners."],"pros":["Balanced channel on mining and crypto;","Diversity of topics and formats;","Large video library and good new-material frequency;","Several hosts."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 80
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"YouTube remains one of the main platforms for anyone who wants to learn more about mining. Video reviews help you quickly grasp technical issues, find suitable hardware, compare firmware, learn about new pools, and understand how to earn more.","text":"YouTube remains one of the main platforms for anyone who wants to learn more about mining. Video reviews help you quickly grasp technical issues, find suitable hardware, compare firmware, learn about new pools, and understand how to earn more."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To get the most from YouTube:","text":"To get the most from YouTube:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Subscribe to trusted, honest channels;","Do not chase flashy headlines;","Cross-check video information with other sources;","Talk with the community вЂ” it helps you understand risks and find solutions."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Over time you will distinguish quality channels from shallow ones and use YouTube as a powerful tool for learning and growth in mining.","text":"Over time you will distinguish quality channels from shallow ones and use YouTube as a powerful tool for learning and growth in mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-na-youtube-top-10$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-kanaly-o-majninge-v-telegram-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best Telegram channels about mining: top 10$tmj$,
       $tmj$Telegram hosts a dense crypto and mining scene вЂ” projects and channels worth following for news and community.$tmj$,
       $tmj$Telegram and mining community$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Telegram is one of the most popular platforms for chatting, news, and games in the crypto world. It hosts the largest share of projects tied to digital assets. Below we review the best mining channels on Telegram вЂ” assessing how informative and high-quality they are, their pros and cons, and the traits of the most interesting TG communities.","text":"Telegram is one of the most popular platforms for chatting, news, and games in the crypto world. It hosts the largest share of projects tied to digital assets. Below we review the best mining channels on Telegram вЂ” assessing how informative and high-quality they are, their pros and cons, and the traits of the most interesting TG communities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Telegram and the mining community","src":"/images/articles/telegram-channels/telegram-prism.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why Telegram?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Telegram is no longer just a messenger вЂ” it is a full information ecosystem. In crypto it has a special place: people discuss prices, new ASICs, firmware, pool issues, power rates, and share hosting and setup tips.","text":"Telegram is no longer just a messenger вЂ” it is a full information ecosystem. In crypto it has a special place: people discuss prices, new ASICs, firmware, pool issues, power rates, and share hosting and setup tips."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For miners, Telegram means:","text":"For miners, Telegram means:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Fast access to fresh news and analysis;","Quick advice from other participants;","Direct communication with experts and services;","Listings to sell or rent hardware, farms, and sites."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Telegram channels form a real crypto-mining ecosystem вЂ” especially relevant for users in Russia, Kazakhstan, and the CIS, where other information sources are limited or unavailable.","text":"Telegram channels form a real crypto-mining ecosystem вЂ” especially relevant for users in Russia, Kazakhstan, and the CIS, where other information sources are limited or unavailable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining and the Telegram ecosystem","src":"/images/articles/telegram-channels/asic-rack.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is Telegram convenient for miners?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Miners use Telegram for good reasons. The main ones:","text":"Miners use Telegram for good reasons. The main ones:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Speed. News, updates, and alerts (for example network drops or pool outages) appear almost instantly;","Community. You can read and talk вЂ” in chats, comments, and private groups;","Privacy. Telegram preserves anonymity, which matters in regions with strict crypto rules;","Access to вЂњinsiderвЂќ info. Leaks, discounts, exclusives, and technical tips often appear on Telegram first;","Mobility. All you need is a smartphone with internet вЂ” you can follow events even from a data center or warehouse."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a quality Telegram mining channel?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A channel is more than a news feed. It is a knowledge source, a decision helper, and a gauge of industry mood.","text":"A channel is more than a news feed. It is a knowledge source, a decision helper, and a gauge of industry mood."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When choosing, check these criteria:","text":"When choosing, check these criteria:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"A good channel posts at least a few times a week. That shows authors follow the topic and keep content current;","title":"Posting regularity"},{"text":"Some channels target beginners, others pros. There are firmware channels, used-gear trading, and analytics. Pick based on your goals: buying, setup, investing, trading, or scaling;","title":"Topic focus"},{"text":"Who runs the channel? A private person, a developer team, a service company, an aggregator, or a seller? Prefer those with practical experience, a reputation, and an open identity;","title":"Authority"},{"text":"If a channel promotes services, pools, or firmware, that is fine вЂ” but ads should be labeled, not disguised;","title":"Transparency"},{"text":"Discussions or a linked chat mean a living community. That is a big plus: you can ask questions, hear other views, and request help.","title":"Comments and discussion"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to watch for when subscribing to Telegram channels?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining in the CIS attracts scammers. Even on Telegram, stay careful:","text":"Mining in the CIS attracts scammers. Even on Telegram, stay careful:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Beware of fake giveaways. If you must send crypto to join an вЂњASIC giveaway,вЂќ it is likely a scam;","Fake support. Fraudsters clone channels or pose as brand reps. Always check official links;","Unrealistic promises. Lines like вЂњearn 5,000 rubles a day from your phoneвЂќ or вЂњautomatic cloud mining with no investmentвЂќ are almost always traps;","Hardware sold from private accounts;","Check sellers and the channels where they post. Prefer reputable channels and deal guarantors."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pros and cons of Telegram mining channels","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 19
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["The fastest information;","Direct contact with other market participants;","Many niche and local channels;","Current offers (ASICs, sites, firmware, gear);","Free access."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Drawbacks:","text":"Drawbacks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Lots of fakes and low-quality content;","Hard to tell ads from honest reviews;","Risk of hitting scammers;","Older posts can be hard to find."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Pros and cons of Telegram mining channels","src":"/images/articles/telegram-channels/pickaxe-btc.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Intelion Data Systems","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A channel from a large, well-known mining hardware store. It offers solid mining-world news вЂ” authors focus on the mining segment for specialist coverage. The key content trait is long, detailed texts plus clear infographics. Each post has a custom image packed with useful info. Commercial posts are rare, which is a pleasant surprise for a store channel.","text":"A channel from a large, well-known mining hardware store. It offers solid mining-world news вЂ” authors focus on the mining segment for specialist coverage. The key content trait is long, detailed texts plus clear infographics. Each post has a custom image packed with useful info. Commercial posts are rare, which is a pleasant surprise for a store channel."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The project suits readers who want mining-specific news in a detailed format. Surface skimmers will not enjoy it, nor will people seeking general crypto news вЂ” the niche focus keeps the вЂњIntelion Data SystemsвЂќ subscriber count stably small.","text":"The project suits readers who want mining-specific news in a detailed format. Surface skimmers will not enjoy it, nor will people seeking general crypto news вЂ” the niche focus keeps the вЂњIntelion Data SystemsвЂќ subscriber count stably small."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/Intelionmine"},{"label":"Year created","value":"2018"},{"label":"Subscriber count","value":"8 000+"},{"label":"Number of posts","value":"750+"},{"label":"Average posting frequency","value":"1вЂ“2 posts per day"},{"label":"Average post views","value":"900+"},{"label":"ER","value":"12%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Tied to a store вЂ” interest in promoting certain manufacturersвЂ™ gear;","Small subscriber count."],"pros":["News and info about mining without unrelated topics;","Quality infographics;","Long, informative texts;","Minimal commercial posts."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: The Art of Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A small author channel about crypto and mining with the focus on digital-asset production. The creator mixes personal industry experience with related news вЂ” exchange updates, trends, game projects, and more. The tone is informal вЂ” no single brand style, and some posts lack images. Still, reading it is engaging.","text":"A small author channel about crypto and mining with the focus on digital-asset production. The creator mixes personal industry experience with related news вЂ” exchange updates, trends, game projects, and more. The tone is informal вЂ” no single brand style, and some posts lack images. Still, reading it is engaging."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The authorвЂ™s personal experience stands out: posts and videos cover building, using, and maintaining a mining farm in detail. вЂњThe Art of MiningвЂќ is a solid example of author mining content mixed with adjacent topics.","text":"The authorвЂ™s personal experience stands out: posts and videos cover building, using, and maintaining a mining farm in detail. вЂњThe Art of MiningвЂќ is a solid example of author mining content mixed with adjacent topics."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/artmining"},{"label":"Year created","value":"2021"},{"label":"Subscriber count","value":"10 000+"},{"label":"Number of posts","value":"650+"},{"label":"Average posting frequency","value":"7вЂ“10 posts per month"},{"label":"Average post views","value":"2 900+"},{"label":"ER","value":"26%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The lack of a unified content style may not suit everyone;","The channel covers mining and other activities."],"pros":["Independent author format;","Real miner experience shared;","Diverse content formats;","Good ER, showing subscriber engagement."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Cryptocurrency Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A channel with a plain name that matches its content: the author is an experienced ASIC and GPU miner sharing their work. A fully informal tone makes reading easy and keeps interest. Sometimes posts add related activities such as crypto games and useful tips from exchanges, exchangers, and wallets.","text":"A channel with a plain name that matches its content: the author is an experienced ASIC and GPU miner sharing their work. A fully informal tone makes reading easy and keeps interest. Sometimes posts add related activities such as crypto games and useful tips from exchanges, exchangers, and wallets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"вЂњCryptocurrency MiningвЂќ is highly useful for practicing and beginner miners. You get information tested in practice. Content helps avoid common mistakes and solve frequent problems вЂ” all shared by the author.","text":"вЂњCryptocurrency MiningвЂќ is highly useful for practicing and beginner miners. You get information tested in practice. Content helps avoid common mistakes and solve frequent problems вЂ” all shared by the author."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/mining_kriptowalut"},{"label":"Year created","value":"2022"},{"label":"Subscriber count","value":"10 000+"},{"label":"Number of posts","value":"5 400+"},{"label":"Average posting frequency","value":"5вЂ“7 posts per day"},{"label":"Average post views","value":"3 600+"},{"label":"ER","value":"34%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Narrow miner-focused info does not suit a broad audience;","Very high posting frequency is not for everyone;","Fully oriented to an author format."],"pros":["Useful info from a practicing miner;","Informal posts вЂ” easy to absorb;","Strong audience engagement metrics;","High posting frequency вЂ” many posts with current data;","Posts focused specifically on mining."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: USMFOX MINING | Mining and Cryptocurrency","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An author channel from a miner who uses CPUs and GPUs. Topics also include related areas вЂ” games, exchange news, and other digital-asset segments. Delivery feels light thanks to a casual style. The channel has a loyal base of active readers.","text":"An author channel from a miner who uses CPUs and GPUs. Topics also include related areas вЂ” games, exchange news, and other digital-asset segments. Delivery feels light thanks to a casual style. The channel has a loyal base of active readers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"вЂњUSMFOX MINING | Mining and CryptocurrencyвЂќ will not suit everyone, because topics follow projects the author joins вЂ” mainly GPU mining, current game activities, and other digital products.","text":"вЂњUSMFOX MINING | Mining and CryptocurrencyвЂќ will not suit everyone, because topics follow projects the author joins вЂ” mainly GPU mining, current game activities, and other digital products."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"USMFOX MINING","src":"/images/articles/telegram-channels/usmfox.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/usmfox_mining"},{"label":"Year created","value":"2022"},{"label":"Subscriber count","value":"13 000+"},{"label":"Number of posts","value":"1 400+"},{"label":"Average posting frequency","value":"5вЂ“8 posts per day"},{"label":"Average post views","value":"6 300+"},{"label":"ER","value":"45%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Narrow focus on some topics;","No unified content style."],"pros":["Author approach to running the channel;","Diverse directions the miner personally takes part in;","Outstanding ER showing very high engagement;","High posting frequency."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: EMCD RU channel","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the largest mining and crypto market players also runs a Telegram channel for the RU segment. EMCD today is a pool, hardware store, wallet, and exchanger, so topics cover a crypto enthusiastвЂ™s needs. Authors share mining news, current top ASIC yields, and key changes.","text":"One of the largest mining and crypto market players also runs a Telegram channel for the RU segment. EMCD today is a pool, hardware store, wallet, and exchanger, so topics cover a crypto enthusiastвЂ™s needs. Authors share mining news, current top ASIC yields, and key changes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Given channel ownership, commercial integrations are expected вЂ” EMCD product and service ads are substantial. Posts mostly target beginners; experienced large-farm owners may find them less useful.","text":"Given channel ownership, commercial integrations are expected вЂ” EMCD product and service ads are substantial. Posts mostly target beginners; experienced large-farm owners may find them less useful."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"EMCD RU channel","src":"/images/articles/telegram-channels/emcd.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/Emcdnews"},{"label":"Year created","value":"2018"},{"label":"Subscriber count","value":"20 000+"},{"label":"Number of posts","value":"1 800+"},{"label":"Average posting frequency","value":"1вЂ“2 posts per day"},{"label":"Average post views","value":"1 500+"},{"label":"ER","value":"7%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Interest in selling store hardware;","Ads for related services;","Modest user activity and engagement."],"pros":["Diverse mining info aimed at beginners;","Strong post formats such as current ASIC yields and clear major-coin price dynamics;","Exposure to investing options beyond classic mining."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: KOLYA MINER","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A simple, informal author blog where content matters more than polish. The creator covers mining and crypto work, shares experience, and answers subscribers. Nikolai may photograph his monitor instead of screenshotting, ignore image centering, or skip text styling.","text":"A simple, informal author blog where content matters more than polish. The creator covers mining and crypto work, shares experience, and answers subscribers. Nikolai may photograph his monitor instead of screenshotting, ignore image centering, or skip text styling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The value of this somewhat rough channel is information. Sometimes the author shares real life hacks for hard technical issues. It is a pure author crypto blog with all its quirks. If you care more about substance than design, following Nikolai yields lots of useful data вЂ” and the post count is impressive.","text":"The value of this somewhat rough channel is information. Sometimes the author shares real life hacks for hard technical issues. It is a pure author crypto blog with all its quirks. If you care more about substance than design, following Nikolai yields lots of useful data вЂ” and the post count is impressive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"KOLYA MINER","src":"/images/articles/telegram-channels/kolya-miner.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/koliamainer"},{"label":"Year created","value":"2018"},{"label":"Subscriber count","value":"27 000+"},{"label":"Number of posts","value":"11 000+"},{"label":"Average posting frequency","value":"10+ posts per day"},{"label":"Average post views","value":"8 000+"},{"label":"ER","value":"31%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The informal approach is not for everyone;","Technical content that beginners may not understand."],"pros":["Extremely informal вЂ” and therefore engaging вЂ” posts;","Real miner experience, activities, and working formats;","Direct interaction with readers;","The author does not hide their face;","Large number of posts;","Good subscriber engagement."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: News from Solyony","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An author channel from the best-known Russian-speaking GPU miner. Sergey вЂњSolyonyвЂќ is well known in the community вЂ” besides TG, he publishes lots of useful YouTube content. He is a true GPU mining expert: posts are infrequent, but the value fully compensates.","text":"An author channel from the best-known Russian-speaking GPU miner. Sergey вЂњSolyonyвЂќ is well known in the community вЂ” besides TG, he publishes lots of useful YouTube content. He is a true GPU mining expert: posts are infrequent, but the value fully compensates."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"вЂњNews from SolyonyвЂќ has a loyal base: subscribers talk actively in comments, so useful data lives in both posts and feedback. In recent years вЂњSolyonyвЂќ became a household name, so every GPU miner should follow this channel. Expect an idiosyncratic style вЂ” for example filming with a cigarette or speaking bluntly.","text":"вЂњNews from SolyonyвЂќ has a loyal base: subscribers talk actively in comments, so useful data lives in both posts and feedback. In recent years вЂњSolyonyвЂќ became a household name, so every GPU miner should follow this channel. Expect an idiosyncratic style вЂ” for example filming with a cigarette or speaking bluntly."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"News from Solyony","src":"/images/articles/telegram-channels/soleniy.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/NewsSoleniy"},{"label":"Year created","value":"2018"},{"label":"Subscriber count","value":"43 000+"},{"label":"Number of posts","value":"9 000+"},{"label":"Average posting frequency","value":"1вЂ“2 posts per day"},{"label":"Average post views","value":"15 500+"},{"label":"ER","value":"31%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Extremely informal channel;","Narrow technical info that beginners may not get;","Unstable posting (several days may pass without new posts)."],"pros":["Author channel from a GPU mining expert;","Lots of genuinely useful information;","Excellent community."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Mining Center","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The mining channel with the most RU-segment members вЂ” but that figure can mislead: analytics suggest many were bought. Still, there are plenty of active readers and useful posts. The project belongs to a same-named mining hardware store well known to Russian industry participants.","text":"The mining channel with the most RU-segment members вЂ” but that figure can mislead: analytics suggest many were bought. Still, there are plenty of active readers and useful posts. The project belongs to a same-named mining hardware store well known to Russian industry participants."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Content formats are limited: authors mostly introduce gear (often via video reviews) and publish a current price list. Despite contradictions, вЂњMining CenterвЂќ on Telegram is worth following: short but dense reviews carry useful data. Daily price updates let you assess investments almost in real time.","text":"Content formats are limited: authors mostly introduce gear (often via video reviews) and publish a current price list. Despite contradictions, вЂњMining CenterвЂќ on Telegram is worth following: short but dense reviews carry useful data. Daily price updates let you assess investments almost in real time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining Center","src":"/images/articles/telegram-channels/mining-center.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/miningcenter"},{"label":"Year created","value":"2018"},{"label":"Subscriber count","value":"190 000+"},{"label":"Number of posts","value":"3 800+"},{"label":"Average posting frequency","value":"5вЂ“7 posts per day"},{"label":"Average post views","value":"7 700+"},{"label":"ER","value":"no data"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Some subscribers were gained via fake growth;","Limited post topics;","Store ownership: interest in promoting certain brands."],"pros":["Channel with the largest subscriber count in Russia;","Quality video reviews;","Current prices updated daily;","Large number of posts."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 69
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the largest mining hardware stores runs its Telegram channel carefully. Professional delivery, branded post style, and quality graphics make the feed useful and informative. There is no coverage of dubious crypto formats (for example phone вЂњtapвЂќ games): authors focus only on mining and related topics.","text":"One of the largest mining hardware stores runs its Telegram channel carefully. Professional delivery, branded post style, and quality graphics make the feed useful and informative. There is no coverage of dubious crypto formats (for example phone вЂњtapвЂќ games): authors focus only on mining and related topics."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The channel is run professionally and earns respect: it looks reputable and builds trust in the store. Audience quality also shows subscribers care about the topic and read new posts.","text":"The channel is run professionally and earns respect: it looks reputable and builds trust in the store. Audience quality also shows subscribers care about the topic and read new posts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Promminer","src":"/images/articles/telegram-channels/promminer-lion.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/promminer"},{"label":"Year created","value":"2020"},{"label":"Subscriber count","value":"41 000+"},{"label":"Number of posts","value":"4 400+"},{"label":"Average posting frequency","value":"1вЂ“4 posts per day"},{"label":"Average post views","value":"4 000+"},{"label":"ER","value":"no data"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Store ownership вЂ” no independent view of brands and models;","Closed comments on posts."],"pros":["Verified channel of a major hardware store;","Professional content production;","Specialist mining and adjacent-topic info;","Pleasant graphics that complement the text."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Sibmain","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Paradoxically, first place goes to the channel with the fewest subscribers in our TOP. The reason is content quality: truly useful material with strong infographics. You may want to study the images longer than the text вЂ” that approach builds trust and respect.","text":"Paradoxically, first place goes to the channel with the fewest subscribers in our TOP. The reason is content quality: truly useful material with strong infographics. You may want to study the images longer than the text вЂ” that approach builds trust and respect."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Although the resource belongs to a hardware store, it does not feel like a hard sell: commercial integration is soft. Engagement metrics also look healthy: members actively read posts and react.","text":"Although the resource belongs to a hardware store, it does not feel like a hard sell: commercial integration is soft. Engagement metrics also look healthy: members actively read posts and react."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Sibmain","src":"/images/articles/telegram-channels/sibmain.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Link","value":"https://t.me/SibmainK"},{"label":"Year created","value":"2022"},{"label":"Subscriber count","value":"4 400+"},{"label":"Number of posts","value":"1 300+"},{"label":"Average posting frequency","value":"3 posts per day"},{"label":"Average post views","value":"1 100+"},{"label":"ER","value":"31%"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Store interest in selling certain brands;","Young channel with limited popularity."],"pros":["Top-tier content quality;","Clear infographics with figures and stats;","Organic growth without fake followers;","Native integration of commercial posts."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 81
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
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Telegram remains a key tool for any miner вЂ” from beginner to pro. You can quickly get news, advice, find gear, ask questions, and even find a contractor or landlord.","text":"Telegram remains a key tool for any miner вЂ” from beginner to pro. You can quickly get news, advice, find gear, ask questions, and even find a contractor or landlord."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To use Telegram effectively:","text":"To use Telegram effectively:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Subscribe to trusted, active channels;","Talk with the community in comments and chats;","Stay critical of loud promises and pushy ads;","Stay safe: do not share personal data or trust shady offers."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Telegram is not only a news feed but a living community. Choosing the right channels helps you stay current, decide better, and avoid mistakes others already made.","text":"Telegram is not only a news feed but a living community. Choosing the right channels helps you stay current, decide better, and avoid mistakes others already made."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kanaly-o-majninge-v-telegram-top-10$tmj$
) ordered
WHERE ordered.idx = 86
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-kriptobirzhi-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best crypto exchanges: top 10$tmj$,
       $tmj$Despite volatility and regulation, exchanges move billions daily вЂ” a ranking of major trading platforms.$tmj$,
       $tmj$Crypto market chart$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
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
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The cryptocurrency market is growing and developing, despite volatility and regulatory challenges. At the center of this digital space are cryptocurrency exchanges, platforms through which billions of dollars flow every day. This is exactly the place where the crypt вЂњbecomes aliveвЂќ: here it is bought, sold, exchanged and stored.","text":"The cryptocurrency market is growing and developing, despite volatility and regulatory challenges. At the center of this digital space are cryptocurrency exchanges, platforms through which billions of dollars flow every day. This is exactly the place where the crypt вЂњbecomes aliveвЂќ: here it is bought, sold, exchanged and stored."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Let's figure out what crypto exchanges are, why they are needed, how to choose the right one, what pitfalls can await the user (especially in the CIS countries), and also get acquainted with the TOP 10 best cryptocurrency exchanges in the world.","text":"Let's figure out what crypto exchanges are, why they are needed, how to choose the right one, what pitfalls can await the user (especially in the CIS countries), and also get acquainted with the TOP 10 best cryptocurrency exchanges in the world."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrency market chart","src":"/images/articles/crypto-exchanges/chart.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a cryptocurrency exchange and why is it needed?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A cryptocurrency exchange is an online platform for trading digital assets: bitcoin, ether, stablecoins and thousands of other tokens.","text":"A cryptocurrency exchange is an online platform for trading digital assets: bitcoin, ether, stablecoins and thousands of other tokens."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Main functions of the exchange:","text":"Main functions of the exchange:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Exchange one cryptocurrency for another (for example, BTC to ETH);","Purchasing crypto with fiat money (rubles, dollars, tenge, etc.);","Withdrawal of funds to fiat;","Custody of assets (custodial or non-custodial);","Additional services: staking, P2P, futures, margin trading."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Simply put, a crypto exchange is a вЂњbankвЂќ, вЂњexchangerвЂќ and вЂњinvestment platformвЂќ rolled into one.","text":"Simply put, a crypto exchange is a вЂњbankвЂќ, вЂњexchangerвЂќ and вЂњinvestment platformвЂќ rolled into one."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a cryptocurrency exchange?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Before registering, it is important to understand what exactly you plan to do: buy crypto and hold it for the long term, exchange and trade daily, use stablecoins as a way to preserve capital?","text":"Before registering, it is important to understand what exactly you plan to do: buy crypto and hold it for the long term, exchange and trade daily, use stablecoins as a way to preserve capital?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Based on this, you can formulate the main selection criteria:","text":"Based on this, you can formulate the main selection criteria:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Study reviews, platform lifespan, trading volumes. Exchanges like Binance, Bybit, OKX, Kraken, KuCoin have earned trust over the years;","title":"Reputation and reliability"},{"text":"Check if the coin you are interested in can be purchased directly with fiat or USDT;","title":"Availability of the required currency pairs"},{"text":"Important for CIS users: is there support for bank cards, P2P platforms, transfers in local currency;","title":"Convenience of depositing and withdrawing funds"},{"text":"Pay attention to trading fees, deposit/withdrawal fees, and hidden fees. Often P2P looks like there is no commission, but the real rate is already вЂњsetвЂќ;","title":"Commissions"},{"text":"The platform should be convenient and support should be fast. It is desirable to have a Russian-language interface and support service;","title":"Interface and support"},{"text":"Two-factor authentication, login history, cold wallets and account protection are mandatory for a serious exchange.","title":"Safety"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Subtleties and nuances of working with exchanges for users from the CIS","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For residents of the CIS, there are a number of features when working with cryptocurrency exchanges:","text":"For residents of the CIS, there are a number of features when working with cryptocurrency exchanges:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Some exchanges (for example, Kraken and Coinbase) have limited or closed registration for users from the Russian Federation. At the same time, exchanges from Asia (OKX, Bybit, KuCoin) continue to operate, but require caution when withdrawing and passing KYC;","title":"Restrictions and blocking"},{"text":"For full access to functions, KYC is often required. Users must be prepared to provide a passport, selfie, documents about their place of residence;","title":"Identity verification (KYC)"},{"text":"To purchase USDT/USDC for national currency, many use P2P platforms, where transactions occur directly between people. This allows you to bypass sanctions and restrictions on bank transfers;","title":"P2P platforms as a way to bypass restrictions"},{"text":"The exchange rate may differ greatly from the official Central Bank or bank rate. This is important to consider when calculating the actual cost of a purchase or withdrawal.","title":"Currency risks and rates"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages and disadvantages of crypto exchanges","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 16
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
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Quick access to the global crypto market;","High liquidity and many trading pairs;","Ability to use additional tools: staking, futures, P2P;","Convenient mobile applications and API;","The opportunity to earn money even without investment through referral programs and rewards."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Flaws:","text":"Flaws:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Centralized control (the exchange can freeze or block the account);","The need to trust a third party;","Risk of loss of funds if the platform is hacked;","Jurisdictional risks вЂ“ especially in the CIS and in the absence of regulation;","Possible difficulties with withdrawal of funds (especially if the rules are violated or without verification)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Now letвЂ™s move on to getting to know the TOP 10 best cryptocurrency exchanges in the world.","text":"Now letвЂ™s move on to getting to know the TOP 10 best cryptocurrency exchanges in the world."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Coinbase","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"American crypto exchange, existing since 2012. The main feature of the site is its focus on individual markets and countries, among which Russia and the CIS countries are not. This means that you will not be able to create a new RU account on Coinbase, nor will you be able to use previously registered profiles. The exchange officially left the Russian market, and the funds of some users were blocked in 2022.","text":"American crypto exchange, existing since 2012. The main feature of the site is its focus on individual markets and countries, among which Russia and the CIS countries are not. This means that you will not be able to create a new RU account on Coinbase, nor will you be able to use previously registered profiles. The exchange officially left the Russian market, and the funds of some users were blocked in 2022."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, this does not prevent Coinbase from remaining in the TOP 10 global crypto exchanges in terms of trading volume. The platform offers a large selection of coins and pairs, liquidity is at the proper level, and the interface of the tool will be clear even to a beginner (this is the reason why Coinbase has been recommended to novice traders for a long time).","text":"However, this does not prevent Coinbase from remaining in the TOP 10 global crypto exchanges in terms of trading volume. The platform offers a large selection of coins and pairs, liquidity is at the proper level, and the interface of the tool will be clear even to a beginner (this is the reason why Coinbase has been recommended to novice traders for a long time)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Coinbase","src":"/images/articles/crypto-exchanges/coinbase.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2012"},{"label":"Jurisdiction","value":"USA"},{"label":"Number of coins","value":"more than 200"},{"label":"Number of trading pairs","value":"more than 500"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Ban on work in the CIS;","Long and complex account verification;","High commissions for replenishment and trading."],"pros":["An exchange suitable for beginners;","A large number of coins and trading pairs;","Account security;","Many tools for earning money (including passive);","The status of the official exchange in the USA, Europe, Great Britain and Japan, which allows you to work in these countries in strict accordance with current legislation."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: BingX (Bingex)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A verified exchange with no mandatory need for account verification. RU accounts can work on this platform, but the procedure for replenishing the account is far from optimal. The platform has been qualitatively translated into Russian, technical support is available around the clock.","text":"A verified exchange with no mandatory need for account verification. RU accounts can work on this platform, but the procedure for replenishing the account is far from optimal. The platform has been qualitatively translated into Russian, technical support is available around the clock."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The variety of bonuses for new accounts is impressive, as well as the referral system - rewards for bringing new clients can be an excellent addition to earning money from trading. The training zone will allow you to learn trading, but high commissions may scare off active investors in cryptocurrencies.","text":"The variety of bonuses for new accounts is impressive, as well as the referral system - rewards for bringing new clients can be an excellent addition to earning money from trading. The training zone will allow you to learn trading, but high commissions may scare off active investors in cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BingX","src":"/images/articles/crypto-exchanges/bingx.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2018"},{"label":"Jurisdiction","value":"Singapore"},{"label":"Number of coins","value":"more than 600"},{"label":"Number of trading pairs","value":"more than 500"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Difficult replenishment and limited P2P functionality;","Little information about the owner and development team;","No fiat deposits."],"pros":["There is no mandatory verification for working with small volumes;","Translation into Russian;","High-quality support;","Availability of additional tools for working with cryptocurrencies."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Bitget (Bidget)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An exchange that actively uses the copy trading tool - a mechanism for repeating the actions of successful traders, which opens up the possibility of passive income for users. A good range of currencies for trading is complemented by the absence of mandatory verification (an extended version of KYC is required to increase limits).","text":"An exchange that actively uses the copy trading tool - a mechanism for repeating the actions of successful traders, which opens up the possibility of passive income for users. A good range of currencies for trading is complemented by the absence of mandatory verification (an extended version of KYC is required to increase limits)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Bitget exchange is loyal to Russian crypto enthusiasts: there are no restrictions on working with RU accounts. The platform is well translated into Russian, there are fiat trading pairs. Commissions are below the market average, and the availability of additional tools expands user options.","text":"The Bitget exchange is loyal to Russian crypto enthusiasts: there are no restrictions on working with RU accounts. The platform is well translated into Russian, there are fiat trading pairs. Commissions are below the market average, and the availability of additional tools expands user options."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitget","src":"/images/articles/crypto-exchanges/bitget.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2018"},{"label":"Jurisdiction","value":"Singapore"},{"label":"Number of coins","value":"more than 400"},{"label":"Number of trading pairs","value":"more than 500"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Confirmed cases of hacking;","Not the best technical support."],"pros":["Ability to work without verification;","Low commissions;","Decent set of coins and trading pairs;","Developed copy trading system;","Availability of additional services."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: KuCoin","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A well-known exchange that features low trading commissions. In 2020, KuCoin was hacked, but the owners managed to return about 85% of all stolen assets. After this incident, large-scale operations were carried out to improve the security of the site, which made it possible to create a truly reliable and user-friendly product.","text":"A well-known exchange that features low trading commissions. In 2020, KuCoin was hacked, but the owners managed to return about 85% of all stolen assets. After this incident, large-scale operations were carried out to improve the security of the site, which made it possible to create a truly reliable and user-friendly product."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The KuCoin exchange partially fulfills the sanctions imposed against Russian citizens: residents of the CIS countries can use the platform, but with some restrictions in the field of P2P. In particular, the largest banks were banned, which somewhat complicates working with the exchange.","text":"The KuCoin exchange partially fulfills the sanctions imposed against Russian citizens: residents of the CIS countries can use the platform, but with some restrictions in the field of P2P. In particular, the largest banks were banned, which somewhat complicates working with the exchange."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"KuCoin","src":"/images/articles/crypto-exchanges/kucoin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2017"},{"label":"Jurisdiction","value":"Seychelles"},{"label":"Number of coins","value":"more than 600"},{"label":"Number of trading pairs","value":"more than 1,000"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Unclear prospects for work in the Russian market;","Lack of support for a number of languages;","Incomplete licensing transparency."],"pros":["A large number of coins and trading pairs;","Minimum commissions;","Availability of passive income tools."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Gate","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest exchanges, the distinctive feature of which is an impressive number of coins for trading and currency pairs. The site is simple and lacks unnecessary elements, which is perfect for beginners. At the same time, experienced traders also actively use Gate, since this is where rare coins, including high-risk assets, are traded.","text":"One of the oldest exchanges, the distinctive feature of which is an impressive number of coins for trading and currency pairs. The site is simple and lacks unnecessary elements, which is perfect for beginners. At the same time, experienced traders also actively use Gate, since this is where rare coins, including high-risk assets, are traded."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The exchange belongs to an American company that bought the site from the Chinese founders - there is a risk of sanctions and blocking of accounts for Russians. However, at the moment there is no information about such plans of the owners, so many users from the CIS segment actively use Gate when working with cryptocurrencies.","text":"The exchange belongs to an American company that bought the site from the Chinese founders - there is a risk of sanctions and blocking of accounts for Russians. However, at the moment there is no information about such plans of the owners, so many users from the CIS segment actively use Gate when working with cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Gate.io","src":"/images/articles/crypto-exchanges/gate.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2013"},{"label":"Jurisdiction","value":"Cayman Islands"},{"label":"Number of coins","value":"more than 1,400"},{"label":"Number of trading pairs","value":"more than 2,300"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There is no translation of interfaces into Russian;","Extended verification for full operation;","Limited tools for placing market orders."],"pros":["Leading positions in the number of coins and trading pairs offered;","Simple and intuitive interface;","Small commission for completed transactions;","Easy registration procedure;","Absence of obvious intentions to abandon Russian users."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: MEXC (Mex)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another exchange that continues to work with Russian users without significant restrictions. Moreover, after some sites banned RU users, MEXC decided to encourage crypto enthusiasts to move to their site. For example, zero commissions for trading have appeared, as well as profitable bonus programs and referral systems.","text":"Another exchange that continues to work with Russian users without significant restrictions. Moreover, after some sites banned RU users, MEXC decided to encourage crypto enthusiasts to move to their site. For example, zero commissions for trading have appeared, as well as profitable bonus programs and referral systems."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the key features of MEXC is the large number of tokens for trading and currency pairs. Probably, with this, the creators of the exchange decided to compensate for the minimum number of passive income tools.","text":"One of the key features of MEXC is the large number of tokens for trading and currency pairs. Probably, with this, the creators of the exchange decided to compensate for the minimum number of passive income tools."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MEXC","src":"/images/articles/crypto-exchanges/mexc.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2018"},{"label":"Jurisdiction","value":"Singapore"},{"label":"Number of coins","value":"more than 400"},{"label":"Number of trading pairs","value":"more than 500"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Inability to top up from Russian bank cards;","Lack of options and dual-currency investments;","Poor quality translation of some sections into Russian;","The need for verification to carry out some trading operations."],"pros":["Full-time work in Russia and the CIS;","Possibility of replenishment via P2P without commission;","An impressive set of tokens and trading pairs;","Zero commissions when trading;","High leverage (up to x200)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Huobi or HTX (Huobi or Ashtiiks)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest crypto exchanges in the world, which was recently renamed from Huobi to HTX (Huobi Tron X). At the moment, this platform is one of the most user-friendly exchanges for Russian users - no restrictions have been introduced on the RU segment. You can top up your account either from a card or through the P2P payment system, which is very convenient under conditions of sanctions and restrictions.","text":"One of the oldest crypto exchanges in the world, which was recently renamed from Huobi to HTX (Huobi Tron X). At the moment, this platform is one of the most user-friendly exchanges for Russian users - no restrictions have been introduced on the RU segment. You can top up your account either from a card or through the P2P payment system, which is very convenient under conditions of sanctions and restrictions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The platform itself is quite convenient and rich in various types of trading tools, passive income and investments. HTX offers a large number of trading pairs and coins, all sections are translated into Russian. The interface is simple and clear, but not everyone will like the design of the site.","text":"The platform itself is quite convenient and rich in various types of trading tools, passive income and investments. HTX offers a large number of trading pairs and coins, all sections are translated into Russian. The interface is simple and clear, but not everyone will like the design of the site."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"HTX (Huobi)","src":"/images/articles/crypto-exchanges/htx.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2013"},{"label":"Jurisdiction","value":"Singapore"},{"label":"Number of coins","value":"more than 500"},{"label":"Number of trading pairs","value":"more than 600"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Controversial situation regarding the prospect of selling the exchange and platform ownership rights;","Commissions are higher than market averages;","Controversial decisions in the interface of the website and mobile application."],"pros":["No restrictions on work in Russia and the CIS countries;","Good reputation;","Availability of all necessary tools for working with cryptocurrency;","Extremely simple interface;","Fast account verification;","Availability of your own HT token."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: OKX (Okeyiks)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest exchanges, which changed its development vector in 2022. The site now has its own blockchain network, token and wallet, and the list of innovative solutions is rapidly growing. In terms of functionality and reputation, the OKX exchange is comparable to the Bybit platform, which makes the choice between these two tools difficult.","text":"One of the oldest exchanges, which changed its development vector in 2022. The site now has its own blockchain network, token and wallet, and the list of innovative solutions is rapidly growing. In terms of functionality and reputation, the OKX exchange is comparable to the Bybit platform, which makes the choice between these two tools difficult."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In terms of trading volume, the OKX exchange is consistently among the top five, offering a good selection of coins and trading pairs. Commissions on the site are small, the interface is simple and clear, including the presence of a demo mode. OKX does not plan to leave the Russian market, however, some restrictions have appeared for RU accounts for working with highly profitable passive instruments. The key disadvantage is the need for verification to complete transactions.","text":"In terms of trading volume, the OKX exchange is consistently among the top five, offering a good selection of coins and trading pairs. Commissions on the site are small, the interface is simple and clear, including the presence of a demo mode. OKX does not plan to leave the Russian market, however, some restrictions have appeared for RU accounts for working with highly profitable passive instruments. The key disadvantage is the need for verification to complete transactions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"OKX","src":"/images/articles/crypto-exchanges/okx.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2014"},{"label":"Jurisdiction","value":"Seychelles"},{"label":"Number of coins","value":"more than 300"},{"label":"Number of trading pairs","value":"more than 600"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory account verification;","Restriction of some tools for Russians;","Difficulty replenishing accounts with fiat from a card."],"pros":["Reliability and reputation due to the impressive age of the platform;","A large number of tokens and currency pairs;","Simple interface, understandable even for novice investors and traders;","Small commissions;","Rich infrastructure and availability of innovative tools;","High leverage;","Availability for the CIS."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Bybit","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An actively developing exchange that is an alternative to Binance for Russian users. The number of tokens and currency pairs is sufficient for comfortable trading, and high liquidity allows you not to worry about possible delays in the process of buying and selling assets. The platform offers a lucrative referral program, as well as numerous bonuses for new users, such as zero commissions for spot trading.","text":"An actively developing exchange that is an alternative to Binance for Russian users. The number of tokens and currency pairs is sufficient for comfortable trading, and high liquidity allows you not to worry about possible delays in the process of buying and selling assets. The platform offers a lucrative referral program, as well as numerous bonuses for new users, such as zero commissions for spot trading."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Since many CIS users, due to geopolitical factors, moved from Binance to Bybit, financial regulators are trying to make it more difficult for Russians to trade on the Bybit exchange. However, there are no obvious reasons for concern today, since the platform owners do not plan to give up tens of thousands of CIS accounts.","text":"Since many CIS users, due to geopolitical factors, moved from Binance to Bybit, financial regulators are trying to make it more difficult for Russians to trade on the Bybit exchange. However, there are no obvious reasons for concern today, since the platform owners do not plan to give up tens of thousands of CIS accounts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bybit","src":"/images/articles/crypto-exchanges/bybit.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2018"},{"label":"Jurisdiction","value":"Virgin Islands"},{"label":"Number of coins","value":"more than 200"},{"label":"Number of trading pairs","value":"more than 200"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory KYC verification for some transactions;","Lack of some coins and currency pairs on the spot platform;","High likelihood of regulation in the foreseeable future."],"pros":["Security of user accounts;","Good reputation in the global crypto market;","Possibility of comfortable work for users from the CIS;","A sufficient number of currencies and trading pairs;","High liquidity of assets;","Fast and efficient support;","Decent bonus program and referral system;","Simple and intuitive interface."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Binance","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The most famous and largest crypto exchange in the world in terms of trading volume, which is heard by every owner of digital assets. A large number of offered coins, many currency pairs, high liquidity, our own NFT platform, dozens of deposit and withdrawal methods. Binance ranks confidently first in the world in terms of popularity and number of users, so the exchange can be called the undisputed leader.","text":"The most famous and largest crypto exchange in the world in terms of trading volume, which is heard by every owner of digital assets. A large number of offered coins, many currency pairs, high liquidity, our own NFT platform, dozens of deposit and withdrawal methods. Binance ranks confidently first in the world in terms of popularity and number of users, so the exchange can be called the undisputed leader."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, BinanceвЂ™s position was seriously shaken after a criminal case against CEO Changpeng Zhao. The exchange has come under scrutiny from regulators, which threatens the anonymity and confidentiality of users. Separately, it is worth noting BinanceвЂ™s policy towards Russian users - in fact, the exchange stopped operating in Russia, offering to use the CommEX platform. The assets of the CIS division of Binance were sold to this company.","text":"However, BinanceвЂ™s position was seriously shaken after a criminal case against CEO Changpeng Zhao. The exchange has come under scrutiny from regulators, which threatens the anonymity and confidentiality of users. Separately, it is worth noting BinanceвЂ™s policy towards Russian users - in fact, the exchange stopped operating in Russia, offering to use the CommEX platform. The assets of the CIS division of Binance were sold to this company."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Binance","src":"/images/articles/crypto-exchanges/binance.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Year founded","value":"2017"},{"label":"Jurisdiction","value":"Hong Kong"},{"label":"Number of coins","value":"more than 300"},{"label":"Number of trading pairs","value":"more than 1,000"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Interference by US regulators in the working processes of the exchange;","Refusal to work in the Russian market;","Complex and overloaded interface;","Slow support service."],"pros":["A large number of coins and trading pairs;","High liquidity, which allows for instant transactions on most tokens;","Minimum commissions;","High degree of protection of user accounts from hacking;","API support, which opens up impressive possibilities for integration."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 81
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
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency exchanges are the main gateway to the world of digital assets. They provide liquidity, convenience and wide functionality, but require care and awareness from the user.","text":"Cryptocurrency exchanges are the main gateway to the world of digital assets. They provide liquidity, convenience and wide functionality, but require care and awareness from the user."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"What is important to remember:","text":"What is important to remember:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Always research the exchange before registering;","Never store large sums on the exchange - use cold wallets for storage;","Complete KYC only on reliable platforms;","Consider local risks, especially if you are from the CIS;","Don't forget about security - two-factor authentication and complex passwords are required."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The exchange is not just a site with charts, it is your crypto-bridge to the global digital economy. And the more reliable the bridge, the safer the path.","text":"The exchange is not just a site with charts, it is your crypto-bridge to the global digital economy. And the more reliable the bridge, the safer the path."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-kriptobirzhi-top-10$tmj$
) ordered
WHERE ordered.idx = 86
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
