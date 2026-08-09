SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- rejting-kontejnerov-dlya-majninga-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining containers ranking 2026$tmj$,
       $tmj$Top container makers for mining вЂ” from IBMM to Bitferma вЂ” comparing cooling, capacity, and pricing.$tmj$,
       $tmj$Mining containers$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
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
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining keeps growing in popularity, and with it the need for efficient ways to house and cool hardware. One solution is mining containers вЂ” mobile, autonomous units built for mining farms. Below we explain what mining containers are, how they work, how they differ, what to check when choosing, and the TOP-9 makers of this farm-housing format.","text":"Cryptocurrency mining keeps growing in popularity, and with it the need for efficient ways to house and cool hardware. One solution is mining containers вЂ” mobile, autonomous units built for mining farms. Below we explain what mining containers are, how they work, how they differ, what to check when choosing, and the TOP-9 makers of this farm-housing format."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining containers in a warehouse","src":"/images/articles/mining-containers-2026/intro-containers.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What are mining containers?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining container is a modular structure often based on a shipping container. Inside is everything needed for many miners: racks, power, cooling and ventilation, monitoring, and security. You can place such a container almost anywhere with suitable infrastructure.","text":"A mining container is a modular structure often based on a shipping container. Inside is everything needed for many miners: racks, power, cooling and ventilation, monitoring, and security. You can place such a container almost anywhere with suitable infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main job of a container is stable, efficient operation of lots of mining gear in one place with minimal infrastructure spend.","text":"The main job of a container is stable, efficient operation of lots of mining gear in one place with minimal infrastructure spend."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages of this housing format:","text":"Advantages of this housing format:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"easy to move to sites with cheap electricity;","title":"Mobility"},{"text":"no major construction required;","title":"Fast installation"},{"text":"can be combined into clusters;","title":"Scalability"},{"text":"well-designed heat exhaust systems;","title":"Efficient cooling"},{"text":"controlled access, fire safety, video surveillance.","title":"Security"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Containers differ by design, size, and cooling. Main types:","text":"Containers differ by design, size, and cooling. Main types:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Standard sizes, easy to transport. Hold from 180 to 600 ASICs depending on model and packing density;","title":"20-foot and 40-foot containers"},{"text":"The most common option. Use powerful fans and air intakes;","title":"Air-cooled containers"},{"text":"Suited to high-density gear placement. Costlier to build, but more effective in hot climates;","title":"Liquid-cooled containers (immersion cooling)"},{"text":"Combine air and liquid cooling elements. Suit different equipment types.","title":"Hybrid containers"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Types of mining containers","src":"/images/articles/mining-containers-2026/container-types.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How are mining containers made and what is inside?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Container production has several stages:","text":"Container production has several stages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Shell selection вЂ” often a standard shipping container (new or used);","Internal infrastructure design вЂ” ventilation, electrics, and equipment layout;","Engineering install: power panels and distribution, cooling (fans, AC, immersion baths), access control and monitoring;","Testing вЂ” checking all systems under working conditions;","Connection and delivery to the customer."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Internal infrastructure of a mining container","src":"/images/articles/mining-containers-2026/container-interior.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"What is inside a mining container? A typical unit includes:","text":"What is inside a mining container? A typical unit includes:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Metal shell (shipping container or welded frame);","Equipment racks;","Heavy electricals (transformers, cables, circuit breakers);","Ventilation and cooling system;","Remote monitoring devices (temperature, humidity, power sensors);","Fire suppression system (optional);","Security system (locks, cameras, alarms)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a mining container?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When choosing a container, consider:","text":"When choosing a container, consider:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Answer these questions: which miners will you install? How many units do you plan to place?","title":"Equipment quantity and type"},{"text":"Account for peak power draw and confirm matching power feeds;","title":"Power load"},{"text":"Cold regions suit air cooling; hot climates favor liquid or hybrid;","title":"Cooling type"},{"text":"Review delivery and on-site placement, plus infrastructure вЂ” substation, internet, security;","title":"Location and logistics"},{"text":"Do not chase the cheapest option вЂ” reliability is critical. Check maker reputation, warranty, and support.","title":"Price and manufacturer"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: IBMM","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A container from a major mining hardware seller and hosting provider in Russia. Despite claimed box-building experience of over three years, marketing for this service is weak. Buyers get only surface info without specs or prices. IBMM suggests talking to managers for answers вЂ” many will find that inconvenient.","text":"A container from a major mining hardware seller and hosting provider in Russia. Despite claimed box-building experience of over three years, marketing for this service is weak. Buyers get only surface info without specs or prices. IBMM suggests talking to managers for answers вЂ” many will find that inconvenient."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IBMM вЂ” mining container","src":"/images/articles/mining-containers-2026/ibmm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Specs for IBMMвЂ™s single model are limited: a 40-foot shipping container for up to 264 ASICs. Cooling is direct; stock fans are adjusted manually. For an extra fee the maker can add climate control and CCTV.","text":"Specs for IBMMвЂ™s single model are limited: a 40-foot shipping container for up to 264 ASICs. Cooling is direct; stock fans are adjusted manually. For an extra fee the maker can add climate control and CCTV."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"IBMM"},{"label":"Website","value":"ibmm.ru"},{"label":"Domain registration year","value":"2017"},{"label":"Models on sale","value":"no data"},{"label":"ASIC capacity","value":"no data"},{"label":"Total power","value":"no data"},{"label":"Operating temperature range","value":"no data"},{"label":"Cooling","value":"direct airflow"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"on request"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Almost no information on the website"],"pros":["Containers from a well-known mining hardware store","Practical data-center solution: client gear runs in similar boxes"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Mining Cluster","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining Cluster takes a full approach to selling and hosting compute gear in Russia. Besides ASICs and GPUs, hosting, repairs, and data-center builds, it also makes mining containers. The range is large вЂ” more than 10 options.","text":"Mining Cluster takes a full approach to selling and hosting compute gear in Russia. Besides ASICs and GPUs, hosting, repairs, and data-center builds, it also makes mining containers. The range is large вЂ” more than 10 options."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining Cluster вЂ” containers","src":"/images/articles/mining-containers-2026/mining-cluster.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The site has basic technical info on containers вЂ” enough for a general view. Prices are listed, which is a clear plus.","text":"The site has basic technical info on containers вЂ” enough for a general view. Prices are listed, which is a clear plus."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"вЂњMining ClusterвЂќ"},{"label":"Website","value":"cluster-mining.com"},{"label":"Domain registration year","value":"2021"},{"label":"Models on sale","value":"12"},{"label":"ASIC capacity","value":"from 148 to 315"},{"label":"Total power","value":"from 0.535 to 1.06 MW"},{"label":"Operating temperature range","value":"from в€’40 В°C to +35 В°C"},{"label":"Cooling","value":"direct airflow"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"from 1,857,675 в‚Ѕ to 20,987,775 в‚Ѕ"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":[],"pros":["Full approach to miner needs","Large container assortment","Basic product info on the site, including prices"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: PROMMINER","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Promminer is one of RussiaвЂ™s largest crypto mining equipment sellers. Beyond the store it offers a service center, investment format, hosting, and container manufacturing. The range is impressive: 11 models, some in stock, others made to order. Modular design lets them build boxes of many specs for business needs.","text":"Promminer is one of RussiaвЂ™s largest crypto mining equipment sellers. Beyond the store it offers a service center, investment format, hosting, and container manufacturing. The range is impressive: 11 models, some in stock, others made to order. Modular design lets them build boxes of many specs for business needs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"PROMMINER вЂ” mining containers","src":"/images/articles/mining-containers-2026/promminer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For a comfortable temperature regime, engineers use direct cooling. Despite the store and makerвЂ™s scale, technical info is thin вЂ” no video reviews, real finished-product photos, or certificates. PROMMINER offers containers for private use (36 units) and industrial scale (308 slots).","text":"For a comfortable temperature regime, engineers use direct cooling. Despite the store and makerвЂ™s scale, technical info is thin вЂ” no video reviews, real finished-product photos, or certificates. PROMMINER offers containers for private use (36 units) and industrial scale (308 slots)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"PROMMINER"},{"label":"Website","value":"promminer.ru"},{"label":"Domain registration year","value":"2019"},{"label":"Models on sale","value":"11"},{"label":"ASIC capacity","value":"from 36 to 308"},{"label":"Total power","value":"from 0.198 to 1.355 MW"},{"label":"Operating temperature range","value":"no data"},{"label":"Cooling","value":"direct airflow"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"from 950,000 в‚Ѕ to 11,750,000 в‚Ѕ"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Shortage of technical and presentation data","High price on some models"],"pros":["Major Russian mining player: store, data center, service, investments","Impressive model range","Convenient modular production","Containers in stock and made to order"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: GreenChain Technologies","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A full mining approach lets GreenChain Technologies offer the full service stack for digital-asset mining. Beyond hardware sales: a mining hotel, service center, and turnkey investments. The container lineup has eight housing options from 91 to 490 devices.","text":"A full mining approach lets GreenChain Technologies offer the full service stack for digital-asset mining. Beyond hardware sales: a mining hotel, service center, and turnkey investments. The container lineup has eight housing options from 91 to 490 devices."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"GreenChain Technologies вЂ” mining containers","src":"/images/articles/mining-containers-2026/greenchain.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A simple configurator helps pick a model: choose options and see the price at once. Despite that openness, the site is awkward вЂ” especially on mobile. Experience and service breadth earn respect, but site UX falls short.","text":"A simple configurator helps pick a model: choose options and see the price at once. Despite that openness, the site is awkward вЂ” especially on mobile. Experience and service breadth earn respect, but site UX falls short."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"GreenChain Technologies"},{"label":"Website","value":"greenchain.tech"},{"label":"Domain registration year","value":"2017"},{"label":"Models on sale","value":"21"},{"label":"ASIC capacity","value":"from 91 to 490"},{"label":"Total power","value":"from 0.434 to 0.69 MW"},{"label":"Operating temperature range","value":"no data"},{"label":"Cooling","value":"direct airflow (passive or forced cooling)"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"from 750,000 в‚Ѕ to 9,930,000 в‚Ѕ"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The website is frankly inconvenient"],"pros":["Full approach to client needs","Solid model range","Informative website","Convenient configurator","Available options"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Hexacon","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kazan-based HEXACON LLC combines three mining-related lines. Besides hosting customer gear and a service center, it sells ASIC containers. The lineup has one box: a 40-foot container for 300 miners with ready infrastructure.","text":"Kazan-based HEXACON LLC combines three mining-related lines. Besides hosting customer gear and a service center, it sells ASIC containers. The lineup has one box: a 40-foot container for 300 miners with ready infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Hexacon вЂ” mining container","src":"/images/articles/mining-containers-2026/geksakon.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Some engineering choices are pleasantly smart. For example, the main power panel is outside, and the interior splits into two independent sections. Cooling is standard (cold/hot aisles with fans), but automation keeps a programmed internal temperature. Hot-air mixing also helps ASICs run comfortably in winter.","text":"Some engineering choices are pleasantly smart. For example, the main power panel is outside, and the interior splits into two independent sections. Cooling is standard (cold/hot aisles with fans), but automation keeps a programmed internal temperature. Hot-air mixing also helps ASICs run comfortably in winter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"вЂњHEXACONвЂќ"},{"label":"Website","value":"geksakon.ru"},{"label":"Domain registration year","value":"2022"},{"label":"Models on sale","value":"1"},{"label":"ASIC capacity","value":"300"},{"label":"Total power","value":"1.06 MW"},{"label":"Operating temperature range","value":"from в€’40 В°C to +35 В°C"},{"label":"Cooling","value":"direct airflow + fans"},{"label":"Electrical scheme","value":"two independent blocks and external main panel"},{"label":"Model range pricing","value":"on request"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only 1 model on sale","Price on request","Limited photos and technical data"],"pros":["Proven solution from industrial miners","Full mining approach (not only containers, but hosting and service)","Automatic temperature control","Hot-air mixing system","Quality website"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: 1Mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"1Mining has made mining containers since 2019. Several models cover most industrial minersвЂ™ needs. Each model has many photos and detailed specs, which helps browsing. Prices are not listed вЂ” 1Mining shares them only via managers, same as some technical details.","text":"1Mining has made mining containers since 2019. Several models cover most industrial minersвЂ™ needs. Each model has many photos and detailed specs, which helps browsing. Prices are not listed вЂ” 1Mining shares them only via managers, same as some technical details."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"1Mining вЂ” mining containers","src":"/images/articles/mining-containers-2026/1mining.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The makerвЂ™s site is neither informative nor convenient: the marketing concept raises questions. It feels like a TV-shop pitch with bonuses and gifts for ordering in the first 10 minutes. That tone creates mixed feelings for buyers of serious gear.","text":"The makerвЂ™s site is neither informative nor convenient: the marketing concept raises questions. It feels like a TV-shop pitch with bonuses and gifts for ordering in the first 10 minutes. That tone creates mixed feelings for buyers of serious gear."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"1Mining"},{"label":"Website","value":"1-mining.ru"},{"label":"Domain registration year","value":"2023"},{"label":"Models on sale","value":"no data"},{"label":"ASIC capacity","value":"no data"},{"label":"Total power","value":"no data"},{"label":"Operating temperature range","value":"no data"},{"label":"Cooling","value":"direct airflow"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"on request"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No prices or specs on the website","Conflicting site concept: classic marketing landing for a serious product line"],"pros":["Container production since 2019","Company focused on building boxes"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Bitcube","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A maker with a strong mining-container lineup in Russia: industrial models and smaller boxes for private use. Each option is carefully designed for convenience and safety. Bitcube uses a direct-airflow concept.","text":"A maker with a strong mining-container lineup in Russia: industrial models and smaller boxes for private use. Each option is carefully designed for convenience and safety. Bitcube uses a direct-airflow concept."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcube вЂ” mining containers","src":"/images/articles/mining-containers-2026/bitcube.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The presentation site impresses: exhaustive product and tech detail вЂ” photos, video, specs, instructions, and certificates. That open approach earns respect. Bitcube builds containers at three sites in Russia, showing success and demand.","text":"The presentation site impresses: exhaustive product and tech detail вЂ” photos, video, specs, instructions, and certificates. That open approach earns respect. Bitcube builds containers at three sites in Russia, showing success and demand."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitcube"},{"label":"Website","value":"bit-cube.ru"},{"label":"Domain registration year","value":"2018"},{"label":"Models on sale","value":"10"},{"label":"ASIC capacity","value":"from 100 to 350"},{"label":"Total power","value":"from 0.05 to 1.2 MW"},{"label":"Operating temperature range","value":"from в€’40 В°C to +35 В°C"},{"label":"Cooling","value":"direct airflow"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"from 2,450,000 в‚Ѕ to 4,380,000 в‚Ѕ"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High model prices"],"pros":["Large known brand with three production sites","Wide product range","Option to order extra gear and fittings","Many options for almost any hardware volume","Quality site with very detailed information","Convenient selection: catalog and configurator","High level of protection and automation","Small boxes for private use available","Works with ASICs and graphics cards"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: MinerPark","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"INTORA-ENGINEERING, which makes MinerPark mining containers, is part of the Free Technologies engineering holding. Two key lines: boxes for mining gear, and data centers in three locations (two in Russia, one in the US). The maker works with Russian and international clients worldwide.","text":"INTORA-ENGINEERING, which makes MinerPark mining containers, is part of the Free Technologies engineering holding. Two key lines: boxes for mining gear, and data centers in three locations (two in Russia, one in the US). The maker works with Russian and international clients worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MinerPark вЂ” mining containers","src":"/images/articles/mining-containers-2026/minerpark.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The brand lineup has four container sizes from 90 to 480 ASICs. Production uses a standard shipping box. Cooling splits cold and hot aisles plus fans. Products ship fully assembled and ready to start.","text":"The brand lineup has four container sizes from 90 to 480 ASICs. Production uses a standard shipping box. Cooling splits cold and hot aisles plus fans. Products ship fully assembled and ready to start."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"вЂњINTORA-ENGINEERINGвЂќ"},{"label":"Website","value":"miner-park.ru"},{"label":"Domain registration year","value":"2018"},{"label":"Models on sale","value":"4"},{"label":"ASIC capacity","value":"from 90 to 480"},{"label":"Total power","value":"from 0.32 to 1.8 MW"},{"label":"Operating temperature range","value":"from в€’45 В°C to +35 В°C"},{"label":"Cooling","value":"direct airflow + fans"},{"label":"Electrical scheme","value":"several independent blocks"},{"label":"Model range pricing","value":"on request"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No prices on the website"],"pros":["Proven maker inside a large engineering holding","Russian and international clients","Solid model range","Ways to lower cost via certain technical choices","Optional extras on request (heat recovery, alarms, CCTV, remote control, etc.)","Informative site with comprehensive data"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Bitferma","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitferma focuses on giving buyers a full, high-quality look at its mining containers. The detailed, convenient site has everything: lineup with tech descriptions and video, renders and specs, prices, and official certificates. For useful site data volume, Bitferma ranks among the best makers.","text":"Bitferma focuses on giving buyers a full, high-quality look at its mining containers. The detailed, convenient site has everything: lineup with tech descriptions and video, renders and specs, prices, and official certificates. For useful site data volume, Bitferma ranks among the best makers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitferma вЂ” mining containers","src":"/images/articles/mining-containers-2026/bitferma.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The company offers four models from 180 to 400 ASICs. Each is well described and presented. Engineering depth impresses вЂ” full automation, protection, and control systems. Needed data is on the site and downloadable as detailed presentations.","text":"The company offers four models from 180 to 400 ASICs. Each is well described and presented. Engineering depth impresses вЂ” full automation, protection, and control systems. Needed data is on the site and downloadable as detailed presentations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitferma"},{"label":"Website","value":"bitferma.ru"},{"label":"Domain registration year","value":"2017"},{"label":"Models on sale","value":"4"},{"label":"ASIC capacity","value":"from 180 to 360"},{"label":"Total power","value":"from 0.66 to 1.43 MW"},{"label":"Operating temperature range","value":"from в€’40 В°C to +35 В°C"},{"label":"Cooling","value":"cold and hot aisles + fans"},{"label":"Electrical scheme","value":"no data"},{"label":"Model range pricing","value":"from 2,970,000 в‚Ѕ to 4,000,000 в‚Ѕ"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No photos of finished units on the website"],"pros":["Mining infrastructure market presence since 2016","Highly detailed site with a large volume of data","Container video review available","Solid model range","Turnkey boxes with all needed systems and extras","Maximum automation and protection","Alternative ventilation format (indirect)","Official certificates available"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 73
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
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining containers are a strong option if you want to scale a farm quickly, cut infrastructure costs, and keep gear stable. They help most in regions with cheap power, cold climates, and remote sites. A well-chosen, well-installed container can raise mining profitability a lot.","text":"Mining containers are a strong option if you want to scale a farm quickly, cut infrastructure costs, and keep gear stable. They help most in regions with cheap power, cold climates, and remote sites. A well-chosen, well-installed container can raise mining profitability a lot."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you need advice on picking a container, assessing a site, or designing infrastructure, contact TOP MINING specialists: an individual approach and technical audit help avoid expensive mistakes.","text":"If you need advice on picking a container, assessing a site, or designing infrastructure, contact TOP MINING specialists: an individual approach and technical audit help avoid expensive mistakes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kontejnerov-dlya-majninga-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best crypto exchangers ranking$tmj$,
       $tmj$Top exchangers including 60cek, Prostocash, Baksman, and 24paybank вЂ” fees, reserves, and Russia-focused details.$tmj$,
       $tmj$60cek$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
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
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"As the crypto market grew, users needed convenient ways to quickly swap digital assets for fiat and back. Crypto exchangers appeared for that вЂ” services that let you buy or sell crypto without exchange registration or extra hassle. They are especially relevant for CIS users, where working with crypto often involves legal and banking limits.","text":"As the crypto market grew, users needed convenient ways to quickly swap digital assets for fiat and back. Crypto exchangers appeared for that вЂ” services that let you buy or sell crypto without exchange registration or extra hassle. They are especially relevant for CIS users, where working with crypto often involves legal and banking limits."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Working with crypto and exchangers","src":"/images/articles/crypto-exchangers-top8/trader-hero.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This article covers what exchangers are, how they differ from exchanges, their pros and cons, the risks вЂ” especially in Russia вЂ” and how to choose a reliable exchange service.","text":"This article covers what exchangers are, how they differ from exchanges, their pros and cons, the risks вЂ” especially in Russia вЂ” and how to choose a reliable exchange service."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a crypto exchanger and why do you need one?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A crypto exchanger is an online platform or service where users swap fiat (rubles, dollars, etc.) for crypto (BTC, ETH, USDT, and so on) and vice versa. Unlike a crypto exchange, an exchanger uses a fixed rate вЂ” you immediately see how much you get.","text":"A crypto exchanger is an online platform or service where users swap fiat (rubles, dollars, etc.) for crypto (BTC, ETH, USDT, and so on) and vice versa. Unlike a crypto exchange, an exchanger uses a fixed rate вЂ” you immediately see how much you get."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrencies for exchange","src":"/images/articles/crypto-exchangers-top8/crypto-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Main exchanger functions:","text":"Main exchanger functions:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Buying crypto with fiat;","Selling crypto with payout to a card, wallet, or account;","Swapping one cryptocurrency for another;","Working with various payment systems: bank cards (MIR, Visa, MasterCard), QIWI, YuMoney, Tinkoff, Sberbank, Payeer, Advcash, and others;","Support for popular cryptocurrencies: BTC, ETH, LTC, TRX, USDT (TRC20/ERC20), BNB, and many more."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Exchanger pros and cons","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
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
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"In most cases the operation takes 5 to 30 minutes;","title":"Speed"},{"text":"No registration, verification, or trading skills required;","title":"Ease of use"},{"text":"Working with Russian cards and wallets matters especially under restrictions;","title":"Russian card support"},{"text":"At request time the user knows exactly how much they will receive;","title":"Fixed rate"},{"text":"You can work with small amounts (from в‚Ѕ1,000вЂ“2,000).","title":"Access to small sums"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 11
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
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"The spread is 1% to 5%, especially on popular pairs;","title":"Rate above exchange rate"},{"text":"Some exchangers have limited daily exchange volume;","title":"Limits"},{"text":"Manual mode can cause delays;","title":"Manual processing"},{"text":"Risk of card and transfer blocks вЂ” especially relevant for Russia;","title":"Card blocks"},{"text":"Identity and/or card verification may be required.","title":"Verification"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risks when using exchangers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Russian users should be especially careful with crypto exchange. There is no legal ban on holding crypto, but banks and financial monitoring watch transfers closely вЂ” especially regular or large ones.","text":"Russian users should be especially careful with crypto exchange. There is no legal ban on holding crypto, but banks and financial monitoring watch transfers closely вЂ” especially regular or large ones."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Main risks:","text":"Main risks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Bank card block. Banks may freeze a transfer and lock the card until the source of funds is clarified;","Account freeze with a demand to explain fund origins;","Transfer rejection вЂ” especially with P2P services and no payment-purpose notes;","Dealing with scammers вЂ” unchecked exchangers can cost you everything."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Tip: avoid words like вЂњcrypto,вЂќ вЂњbitcoin,вЂќ or вЂњexchangeвЂќ in the payment purpose. Use neutral wording or leave the field empty if possible.","text":"Tip: avoid words like вЂњcrypto,вЂќ вЂњbitcoin,вЂќ or вЂњexchangeвЂќ in the payment purpose. Use neutral wording or leave the field empty if possible."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose an exchanger?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When choosing an exchange service, evaluate these factors:","text":"When choosing an exchange service, evaluate these factors:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Check the registration date. Use monitors BestChange, KursExpert, OkChanger. Read reviews on forums, social media, Trustpilot, etc.;","title":"Reputation and project age"},{"text":"Clearly stated rate, fees, limits and exchange times, refund info, and support;","title":"Transparent terms"},{"text":"BTC, USDT (TRC20/ERC20), ETH, Russian bank cards, QIWI, YuMoney;","title":"Popular directions"},{"text":"HTTPS, no suspicious ads, 2FA, email transaction confirmation, etc.;","title":"Site security"},{"text":"Online chat or fast channels (Telegram, email). 24/7 is desirable;","title":"Technical support"},{"text":"Automatic mode is faster and more reliable; manual can be cheaper but more often delayed.","title":"Operating mode"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Working with exchangers in Russia and the CIS","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In Russia banks closely watch inbound/outbound transfers. Prefer proven exchangers that have long operated and adapted to banking-system requirements.","text":"In Russia banks closely watch inbound/outbound transfers. Prefer proven exchangers that have long operated and adapted to banking-system requirements."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Other CIS countries have their own nuances: local card support, P2P regulation, work with international exchanges.","text":"Other CIS countries have their own nuances: local card support, P2P regulation, work with international exchanges."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Some exchangers are built specifically for CIS clients вЂ” with local languages, convenient navigation, and responsive support.","text":"Some exchangers are built specifically for CIS clients вЂ” with local languages, convenient navigation, and responsive support."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: 365cash.co","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This exchanger does not lead in currency-pair count, but users value it mainly for simplicity and fast transfers in most cases. Trust is solid: it launched in 2015, and there have been no major scandals tied to 365cash. Identity verification is not mandatory, but bank-card verification is required for transactions.","text":"This exchanger does not lead in currency-pair count, but users value it mainly for simplicity and fast transfers in most cases. Trust is solid: it launched in 2015, and there have been no major scandals tied to 365cash. Identity verification is not mandatory, but bank-card verification is required for transactions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"365Cash вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/365cash.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Russian users can work here, though long transfers sometimes occur (up to 5 days to Russian banks). The UI is well translated into Russian, with 24/7 support for transaction issues. In some cases the process is slower because the exchanger runs in semi-automatic mode.","text":"Russian users can work here, though long transfers sometimes occur (up to 5 days to Russian banks). The UI is well translated into Russian, with 24/7 support for transaction issues. In some cases the process is slower because the exchanger runs in semi-automatic mode."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2015"},{"label":"Website","value":"365cash.co"},{"label":"Domain registration year","value":"2015"},{"label":"Registration country","value":"Germany"},{"label":"Fees","value":"from 0.5% to 1.5%"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"15+"},{"label":"Supported Russian bank cards","value":"10+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Some transfers to Russian cards take long вЂ” up to 5 days;","Semi-automatic processing of some transactions;","Mandatory bank-card verification;","Small number of exchange pairs;","Site design that does not inspire high trust."],"pros":["Old, proven exchanger;","Fast transfers in most cases;","Unobstructed operation in Russia;","No mandatory user verification."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Sova","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SovaвЂ™s main feature is cash transactions at physical company offices. Branches exist in Moscow, St. Petersburg, Novosibirsk, Krasnodar, Istanbul, Antalya, Yerevan, Tbilisi, Bishkek, and Dubai. At the same time the site has no founder or legal-entity info, which makes cash exchange somewhat risky. Still, the service is offered вЂ” something competitors rarely do.","text":"SovaвЂ™s main feature is cash transactions at physical company offices. Branches exist in Moscow, St. Petersburg, Novosibirsk, Krasnodar, Istanbul, Antalya, Yerevan, Tbilisi, Bishkek, and Dubai. At the same time the site has no founder or legal-entity info, which makes cash exchange somewhat risky. Still, the service is offered вЂ” something competitors rarely do."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Sova вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/sova.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The service works with all popular coins, payment systems, and Russian bank cards. The site UI is well translated into Russian, with 24/7 support. Transaction time is standard, though Russian bank cards may delay вЂ” the service warns about that in advance.","text":"The service works with all popular coins, payment systems, and Russian bank cards. The site UI is well translated into Russian, with 24/7 support. Transaction time is standard, though Russian bank cards may delay вЂ” the service warns about that in advance."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2020"},{"label":"Website","value":"sova.gg"},{"label":"Domain registration year","value":"2020"},{"label":"Registration country","value":"Serbia"},{"label":"Fees","value":"no exact info on the site"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"20+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Relatively young exchanger;","No legal information;","Contradictory data on whether card verification is required."],"pros":["Cash operations in cities of presence;","Popular coins and payment systems;","Quality, convenient site;","Russian-language support 24/7;","Convenient Bitcoin network congestion indicator on the site;","Reserve information published."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Ferma","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the simplest, most intuitive exchangers вЂ” even a beginner crypto investor can master it in minutes. Easy UI is a key advantage, while some other terms may not suit more experienced users. For example, frequent transaction delays: despite FermaвЂ™s claim of very short windows, some swaps can take over an hour. There are also complaints about high fees.","text":"One of the simplest, most intuitive exchangers вЂ” even a beginner crypto investor can master it in minutes. Easy UI is a key advantage, while some other terms may not suit more experienced users. For example, frequent transaction delays: despite FermaвЂ™s claim of very short windows, some swaps can take over an hour. There are also complaints about high fees."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ferma вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/ferma.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Exchange pairs and payment services are more than enough for comfortable work вЂ” the variety is convincing. Reserve volumes are published on the site along with detailed how-to guides. Identity verification is not mandatory, but card checks are required. Overall reviews are positive: since launch in 2017 there have been no major scandals or backlash.","text":"Exchange pairs and payment services are more than enough for comfortable work вЂ” the variety is convincing. Reserve volumes are published on the site along with detailed how-to guides. Identity verification is not mandatory, but card checks are required. Overall reviews are positive: since launch in 2017 there have been no major scandals or backlash."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2017"},{"label":"Website","value":"ferma.cc"},{"label":"Domain registration year","value":"2017"},{"label":"Registration country","value":"Netherlands"},{"label":"Fees","value":"no exact info on the site"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"40+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High fees;","Minimum exchange threshold вЂ” from в‚Ѕ5,000;","Frequent delays processing transactions;","Only two interface languages."],"pros":["Honest, quality work since 2017;","Large number of coins available to exchange;","Quality Russian site translation;","Russian tech support 24/7;","No mandatory identity verification."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Kassa","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An extremely simple crypto-asset exchange service: it has operated since 2016 and is popular with digital-asset owners. Users note elementary exchange logic вЂ” even a first-timer can quickly grasp the UI. Request processing speed is also decent: Kassa swaps within reasonable times, nearly matching key competitors.","text":"An extremely simple crypto-asset exchange service: it has operated since 2016 and is popular with digital-asset owners. Users note elementary exchange logic вЂ” even a first-timer can quickly grasp the UI. Request processing speed is also decent: Kassa swaps within reasonable times, nearly matching key competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Kassa.cc вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/kassa.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are no dozens of coins, payment systems, and partner banks: the service offers a basic set that is enough in most cases. If you need less popular pairs, look elsewhere. But if you want a simple, clear tool with a good reputation, Kassa deserves attention.","text":"There are no dozens of coins, payment systems, and partner banks: the service offers a basic set that is enough in most cases. If you need less popular pairs, look elsewhere. But if you want a simple, clear tool with a good reputation, Kassa deserves attention."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2016"},{"label":"Website","value":"kassa.cc"},{"label":"Domain registration year","value":"2016"},{"label":"Registration country","value":"Georgia"},{"label":"Fees","value":"from 0.5% to 1.99%"},{"label":"Reserves","value":"not published"},{"label":"Cryptocurrencies available for exchange","value":"15+"},{"label":"Supported Russian bank cards","value":"5+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No reserve information;","Only 3 interface languages;","Possible delays with Russian bank cards;","Card verification required;","Support answers only during business hours;","Small number of supported coins and cards."],"pros":["Successful work since 2016;","Simple, light, intuitive interface;","No mandatory verification;","Works with Russian bank cards;","Quality Russian site translation;","An info center with current crypto news;","Favorable partner program."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: 24paybank","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An old, proven exchanger actively used by Russian users. It offers a large set of pairs, decent transaction speed, and acceptable fees. The site is fully translated into Russian, with solid support and a referral system. Reserves are fully public on a separate page.","text":"An old, proven exchanger actively used by Russian users. It offers a large set of pairs, decent transaction speed, and acceptable fees. The site is fully translated into Russian, with solid support and a referral system. Reserves are fully public on a separate page."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"24PAYBANK вЂ” multi-currency exchange service","src":"/images/articles/crypto-exchangers-top8/24paybank.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another plus is transactions via a Telegram bot. Identity verification is recommended but optional; without card confirmation you cannot use Russian bank payment systems. A fairly popular exchanger without striking features or major flaws.","text":"Another plus is transactions via a Telegram bot. Identity verification is recommended but optional; without card confirmation you cannot use Russian bank payment systems. A fairly popular exchanger without striking features or major flaws."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2015"},{"label":"Website","value":"24paybank.net"},{"label":"Domain registration year","value":"2015"},{"label":"Registration country","value":"Georgia"},{"label":"Fees","value":"from 0.5% to 1%"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"30+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory card verification."],"pros":["Many supported cryptocurrencies and Russian banks;","Fairly high exchange speed;","Acceptable fee size;","Convenient Telegram bot;","No mandatory identity verification;","Favorable referral program."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Baksman","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A proven service operating since 2015. The main distinctive trait is a large number of coins available to exchange. Baksman also offers a convenient Telegram bot and a useful invoicing feature вЂ” create a payment order and send it to any counterparty.","text":"A proven service operating since 2015. The main distinctive trait is a large number of coins available to exchange. Baksman also offers a convenient Telegram bot and a useful invoicing feature вЂ” create a payment order and send it to any counterparty."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Baksman вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/baksman.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Transaction processing is fast, reserve volumes are published on a separate page, and there is a favorable referral program. Some doubt the casino-like design вЂ” it does not boost trust. Card verification is required; KYC is not mandatory.","text":"Transaction processing is fast, reserve volumes are published on a separate page, and there is a favorable referral program. Some doubt the casino-like design вЂ” it does not boost trust. Card verification is required; KYC is not mandatory."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2015"},{"label":"Website","value":"baksman.net"},{"label":"Domain registration year","value":"2015"},{"label":"Registration country","value":"Estonia"},{"label":"Fees","value":"no exact info on the site"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"40+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory card verification;","No exact fee-size information;","Peculiar site design."],"pros":["Old, reliable project operating since 2015;","Many coins and banks for exchange;","Good transaction processing speed;","Own Telegram bot;","Invoicing feature;","No mandatory identity verification;","Reserves shown;","Multilingual service well adapted for Russia and Asian countries."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Prostocash","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An exchanger launched in 2017 offers many cryptocurrencies and payment systems with 24/7 support. Identity verification is needed only in some cases (e.g. disputes or fraud suspicion); exchange speed is fairly high. The site is fully translated into Russian (other UI languages exist); tech support responds quickly and well.","text":"An exchanger launched in 2017 offers many cryptocurrencies and payment systems with 24/7 support. Identity verification is needed only in some cases (e.g. disputes or fraud suspicion); exchange speed is fairly high. The site is fully translated into Russian (other UI languages exist); tech support responds quickly and well."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Prostocash вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/prostocash.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Reserves are truly impressive: volumes on a separate page inspire respect. The project offers a favorable partner program and referral earnings. On drawbacks, note serious fees for large transfers. Card verification is also required.","text":"Reserves are truly impressive: volumes on a separate page inspire respect. The project offers a favorable partner program and referral earnings. On drawbacks, note serious fees for large transfers. Card verification is also required."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2017"},{"label":"Website","value":"prostocash.com"},{"label":"Domain registration year","value":"2016"},{"label":"Registration country","value":"Estonia"},{"label":"Fees","value":"from 0.1% to 0.5%"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"35+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mandatory card verification;","User complaints about high fees on large transfers;","Some transactions take a long time."],"pros":["Old, proven exchanger operating since 2017;","Many exchange options;","Fairly fast transactions;","Full Russian UI translation;","Low stated fees;","Favorable partner program;","No Russia operating restrictions;","No mandatory identity verification."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: 60cek","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the best-known and oldest crypto exchangers, launched in 2016. It offers fast swaps of many tokens, works with Russian bank cards, and supports the most popular payment systems. The site is well translated into several languages including Russian. There is 24/7 Russian-language tech support. The exchanger does not hide reserve volumes: current info is on the site and constantly updated.","text":"One of the best-known and oldest crypto exchangers, launched in 2016. It offers fast swaps of many tokens, works with Russian bank cards, and supports the most popular payment systems. The site is well translated into several languages including Russian. There is 24/7 Russian-language tech support. The exchanger does not hide reserve volumes: current info is on the site and constantly updated."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"60cek вЂ” crypto exchanger","src":"/images/articles/crypto-exchangers-top8/60cek.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Fairly high fees are offset by many advantages вЂ” a Telegram bot, a low minimum exchange amount, a bonus program, and extra account protection. Identity verification is not required to use the service, though it may be needed for technical issues or suspected dubious operations. While identity confirmation is optional, card verification is mandatory for transactions with вЂњ60cek.вЂќ","text":"Fairly high fees are offset by many advantages вЂ” a Telegram bot, a low minimum exchange amount, a bonus program, and extra account protection. Identity verification is not required to use the service, though it may be needed for technical issues or suspected dubious operations. While identity confirmation is optional, card verification is mandatory for transactions with вЂњ60cek.вЂќ"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Project launch year","value":"2016"},{"label":"Website","value":"60cek.net"},{"label":"Domain registration year","value":"2016"},{"label":"Registration country","value":"Estonia"},{"label":"Fees","value":"from 0.5% to 2%"},{"label":"Reserves","value":"published"},{"label":"Cryptocurrencies available for exchange","value":"30+"},{"label":"Supported Russian bank cards","value":"15+"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High fees;","Mandatory card verification;","Outdated site design."],"pros":["High trust: operating since 2016;","Many supported cryptocurrencies, payment services, and cards;","Low minimum exchange threshold;","Works in Russia (bank cards, UI language, tech support);","High exchange speed;","Optional identity verification;","Telegram exchange bot;","Option to enable two-factor authentication;","Many positive reviews across various platforms."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 73
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
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Crypto exchangers are an important, convenient tool for quickly buying or selling digital assets without extra complexity.","text":"Crypto exchangers are an important, convenient tool for quickly buying or selling digital assets without extra complexity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"They are especially useful for those who:","text":"They are especially useful for those who:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Do not want to deal with exchanges;","Want to cash out crypto quickly;","Work with small amounts."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"But convenience brings responsibility: always check the exchanger, avoid dubious platforms, and account for banking risks. To minimize problems, prefer exchangers listed on major monitors and watch legal updates in your country.","text":"But convenience brings responsibility: always check the exchanger, avoid dubious platforms, and account for banking risks. To minimize problems, prefer exchangers listed on major monitors and watch legal updates in your country."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Wi-Fi miners ranking: top 3 cable-free ASICs$tmj$,
       $tmj$Three home ASICs with Wi-Fi: iPollo V1 Mini, Jasminer X16-Q PRO, and Elphapex DG Home 1 вЂ” fewer cables, simpler setup.$tmj$,
       $tmj$Home mining farm with Wi-Fi$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
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
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Running a home crypto mining farm is not only about low noise, but also about avoiding wired connections. Looks and wireless connectivity are key requirements for those who prefer mining in living spaces. LetвЂ™s look at three devices that fully meet these criteria: compact, quiet, вЂњcoolвЂќ ASICs that can be started with a built-in Wi-Fi module.","text":"Running a home crypto mining farm is not only about low noise, but also about avoiding wired connections. Looks and wireless connectivity are key requirements for those who prefer mining in living spaces. LetвЂ™s look at three devices that fully meet these criteria: compact, quiet, вЂњcoolвЂќ ASICs that can be started with a built-in Wi-Fi module."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Home mining farm without extra cables","src":"/images/articles/wifi-miners/home-wifi-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: iPollo V1 Mini","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The V1 Mini series from iPollo can be considered the pioneer of ASICs with wireless connectivity. These miners were meant to replace CPU and GPU mining while keeping the advantages of that format: an organic look, low noise, comfortable operating temperatures, and few cables, enabling a quick and convenient setup.","text":"The V1 Mini series from iPollo can be considered the pioneer of ASICs with wireless connectivity. These miners were meant to replace CPU and GPU mining while keeping the advantages of that format: an organic look, low noise, comfortable operating temperatures, and few cables, enabling a quick and convenient setup."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"iPollo products run on Ethash вЂ” a popular mining format that is hardly new. That is its advantage: it works with known coins whose prices are stable and not subject to severe volatility. The most powerful ASIC in the iPollo series is the V1 Mini SE Plus. With 400 MH/s hashrate, the device consumes only 232 W, and noise does not exceed 35 dB.","text":"iPollo products run on Ethash вЂ” a popular mining format that is hardly new. That is its advantage: it works with known coins whose prices are stable and not subject to severe volatility. The most powerful ASIC in the iPollo series is the V1 Mini SE Plus. With 400 MH/s hashrate, the device consumes only 232 W, and noise does not exceed 35 dB."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"iPollo V1 Mini Wi-Fi","src":"/images/articles/wifi-miners/ipollo-v1-mini.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"iPollo"},{"label":"Release year","value":"2022"},{"label":"Hashrate","value":"400 MH/s"},{"label":"Power consumption","value":"232 W"},{"label":"Energy efficiency","value":"0.58 W per MH"},{"label":"Algorithm","value":"Ethash"},{"label":"Coins available for mining","value":"16"},{"label":"Noise level","value":"35 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Lowest profitability among all home ASICs with Wi-Fi"],"pros":["A full lineup of models with different performance levels","Attractive device design, including gold-color variants","An already proven manufacturer familiar to many","Extremely low noise level","Operation within a proven algorithm"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 8
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
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Jasminer X16-Q ASICs can also be seen as opening a new segment: unlike iPollo products, this is considerably more powerful hardware that sits between entry-level miners and professional industrial ASICs. The manufacturer still preserved the advantages of residential mining вЂ” relative compactness, modest power draw, fairly low noise, and wireless network connectivity.","text":"Jasminer X16-Q ASICs can also be seen as opening a new segment: unlike iPollo products, this is considerably more powerful hardware that sits between entry-level miners and professional industrial ASICs. The manufacturer still preserved the advantages of residential mining вЂ” relative compactness, modest power draw, fairly low noise, and wireless network connectivity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ASIC offers users two algorithms at once вЂ” Etchash and Ethash вЂ” which makes Jasminer a reliable investment format. Moreover, this model became a blueprint for many other manufacturers: after the X16-Q launched, brands rushed to fill the niche with conceptually similar miners, including equipment on other algorithms.","text":"The ASIC offers users two algorithms at once вЂ” Etchash and Ethash вЂ” which makes Jasminer a reliable investment format. Moreover, this model became a blueprint for many other manufacturers: after the X16-Q launched, brands rushed to fill the niche with conceptually similar miners, including equipment on other algorithms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Jasminer X16-Q PRO","src":"/images/articles/wifi-miners/jasminer-x16-q-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Sunlune Technology"},{"label":"Release year","value":"2023"},{"label":"Hashrate","value":"5,800 MH/s"},{"label":"Power consumption","value":"1,900 W"},{"label":"Energy efficiency","value":"0.32 W per MH"},{"label":"Algorithm","value":"Etchash/Ethash"},{"label":"Coins available for mining","value":"16"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price","Possible difficulty finding spare parts due to the young brand"],"pros":["A full-fledged miner in a classic PC form factor","Stable and reliable operating algorithm","Jasminer is a relatively young brand, but its reliability has already been proven over time","One of the most powerful modifications for Etchash and Ethash","Good profitability for a home mining format"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Elphapex DG Home 1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The clear leader in the home miners-with-Wi-Fi segment is the DG Home 1 from Elphapex. A new brand that made a loud entrance and put serious competitive pressure on leaders in Scrypt miners. Starting with classic industrial ASICs, Elphapex also remembered home miners and released the DG Home 1.","text":"The clear leader in the home miners-with-Wi-Fi segment is the DG Home 1 from Elphapex. A new brand that made a loud entrance and put serious competitive pressure on leaders in Scrypt miners. Starting with classic industrial ASICs, Elphapex also remembered home miners and released the DG Home 1."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The manufacturer appeared relatively recently, but in a short time managed to gain impressive popularity.","text":"The manufacturer appeared relatively recently, but in a short time managed to gain impressive popularity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Demand for the entire Elphapex DG lineup comes from a smart algorithm choice: today Scrypt can mine 6 coins at once вЂ” that is how merged mining works. In total, owners of such hardware can access more than twenty tokens, which is an important advantage of the format.","text":"Demand for the entire Elphapex DG lineup comes from a smart algorithm choice: today Scrypt can mine 6 coins at once вЂ” that is how merged mining works. In total, owners of such hardware can access more than twenty tokens, which is an important advantage of the format."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Elphapex DG Home 1","src":"/images/articles/wifi-miners/elphapex-dg-home-1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"2100 MH/s"},{"label":"Power consumption","value":"630 W"},{"label":"Energy efficiency","value":"0.3 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Elphapex has not yet stood the test of time","Possible difficulty finding spare parts and service centers"],"pros":["One of the leading altcoin algorithms вЂ” Scrypt (merged mining LTC + DOGE + BELLS + PEP + LKY + JKC)","Solid performance for residential mining","Attractive appearance","Acceptable price due to the brandвЂ™s youth"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to turn any ASIC into a Wi-Fi miner?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Crypto mining gear with a Wi-Fi interface is fairly rare across the full hardware range. However, there is a way to turn any miner with a LAN port into a Wi-Fi model. You only need a few components:","text":"Crypto mining gear with a Wi-Fi interface is fairly rare across the full hardware range. However, there is a way to turn any miner with a LAN port into a Wi-Fi model. You only need a few components:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["A converter from Wi-Fi to wired data transfer. This can be an ordinary signal booster with a LAN jack: such devices usually cost under 1,000 rubles;","A short Ethernet cable;","A router (including models without a LAN interface)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The connection setup is based on passing a wireless signal from the router to the booster, to which the ASIC is then connected by cable.","text":"The connection setup is based on passing a wireless signal from the router to the booster, to which the ASIC is then connected by cable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With such a kit you can use any industrial miner that is not equipped with Wi-Fi. Instead, a converter acts as an intermediary between the ASIC and the router.","text":"With such a kit you can use any industrial miner that is not equipped with Wi-Fi. Instead, a converter acts as an intermediary between the ASIC and the router."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Wi-Fi in mining: advantages and disadvantages","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"What advantages does wireless access offer when organizing your own farm? There are three reasons to choose this approach:","text":"What advantages does wireless access offer when organizing your own farm? There are three reasons to choose this approach:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Minimal cabling, especially relevant for home setups. A clean connection looks attractive and helps preserve the roomвЂ™s design integrity;","Using a router without cable connectivity. Many 3G and 4G modem models only support Wi-Fi, so a LAN cable is not an option;","A large distance between the router and the miner, which is often relevant in home mining. To avoid overloading the apartment with cables, a Wi-Fi interface is simpler."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There is one drawback to wireless data transfer вЂ” ping.","text":"There is one drawback to wireless data transfer вЂ” ping."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Not every Wi-Fi connection meets the requirements for quality, uninterrupted farm operation. That is why few manufacturers focus on ASICs with Wi-Fi, preferring the traditional (and more reliable) mode of operation.","text":"Not every Wi-Fi connection meets the requirements for quality, uninterrupted farm operation. That is why few manufacturers focus on ASICs with Wi-Fi, preferring the traditional (and more reliable) mode of operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
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
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite the growth of home mining, only a small range of equipment is aimed at Wi-Fi networks:","text":"Despite the growth of home mining, only a small range of equipment is aimed at Wi-Fi networks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["iPollo V1 Mini;","Jasminer X16-Q PRO;","Elphapex DG Home 1."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, the recommendation above lets you use any classic ASIC with wireless signal distribution. The cost of such an add-on is negligible compared with the benefits the user gets.","text":"However, the recommendation above lets you use any classic ASIC with wireless signal distribution. The cost of such an add-on is negligible compared with the benefits the user gets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Used ASICs ranking: top 7 secondary-market miners$tmj$,
       $tmj$Used ASICs can cut CapEx and speed payback вЂ” when it is safe, when it is not, and which models stand out.$tmj$,
       $tmj$Mining farm with ASIC equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
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
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Beginners and even experienced miners often consider buying used ASICs to save money and speed up ROI. But is it as safe and profitable as it seems? We cover when used ASICs beat new ones, how to choose them, which models to watch, and when to skip the idea."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm with ASIC hardware","src":"/images/articles/used-asics/mining-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why a used ASIC can be better than a new one","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Buying used ASICs is not always a forced compromise вЂ” it can be a strategy. Situations where it makes sense:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"For newcomers, buying new gear can be hard. Used ASICs let you test the market and start mining with minimal capital;","title":"Limited budget"},{"text":"A used miner can cost 2вЂ“3Г— less than a new one. If it runs stably, payback is much faster;","title":"Faster payback"},{"text":"When bitcoin drops sharply, new hardware prices can stay high while the secondary market falls faster вЂ” more attractive in unstable markets;","title":"Lower risk in an unstable market"},{"text":"Sometimes it is simpler and cheaper to add capacity with used units than wait for new factory shipments;","title":"Scaling capacity"},{"text":"If you expect a market rally, buying used gear cheaply can prepare you for the next bull trend.","title":"Preparing for future growth"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Used ASICs are not only for beginners. Many experienced crypto enthusiasts prefer second-hand hardware as a deliberate strategy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Used Antminer S21 ASICs","src":"/images/articles/used-asics/antminer-s21-pair.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a used ASIC","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Buying used is always a trade-off between price and reliability. Factors you must check:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Avoid private sellers with no clear history вЂ” fraud and hidden defects are common. Buy from shops or mining companies that offer a warranty. Check reviews, reputation, and community activity;","title":"Trusted seller"},{"text":"Ask for a video of the unit running with HiveOS or Braiins OS stats (temperature, hashrate, errors). If possible, test in person: 10вЂ“15 minutes of real work reveals a lot;","title":"Functional check"},{"text":"An ASIC that lived in a data center with good airflow and stable power will likely last longer. Beware garage-farm units вЂ” poor cooling, voltage spikes, and heavy dust;","title":"Operating conditions"},{"text":"If a unit ran 24/7 for more than 2вЂ“3 years, wear may be critical. Ask for purchase date and duty cycle;","title":"Operating age"},{"text":"Confirm spare parts exist: fans, boards, PSUs. Check for a nearby service center or online repair resources;","title":"Repairability"},{"text":"Some sellers offer units still under Bitmain or MicroBT warranty вЂ” a big plus;","title":"Remaining warranty (bonus)"},{"text":"Compare price, power draw, and hashrate with current yield. A cheap inefficient ASIC can lose money long term.","title":"Check the economics"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risks of buying used ASICs","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Before buying a used miner, analyze the risks carefully:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Hidden defects: bad chips, buggy firmware, PSU failures;","Firmware abuse: some sellers overclock to the limit, causing overheating and early wear;","No spare parts: old models may be unrepairable;","Legal risks: stolen ASICs appear on the market вЂ” a recovered unit can be seized."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Used miners can be profitable but always carry risks: hidden faults, overheating, no warranty or repair path, and even dubious origin. Without experience and careful checks, losses are likely вЂ” so prepare carefully."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 14
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
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Used gear can mine not only BTC (SHA-256) but also altcoins. One strong option is Scrypt. More than twenty coins are available; the best-known pair is DOGE+LTC. Advantages: LTC halving was in fall 2023, making the asset scarcer; DOGE is the top meme coin and remains relevant in this bull cycle; Dogecoin is Elon MuskвЂ™s favorite вЂ” his tweets often move the price."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Despite launching in 2021, Antminer L7 remains the strongest Scrypt ASIC (9,500 MH/s). Rivals lag far behind, so it is still relevant. L7 is relatively rare on the secondary market because Scrypt hardware is less popular overall. After the 2024 Bitcoin halving, altcoin mining looks attractive again вЂ” and L7 fits that moment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2021"},{"label":"Hashrate","value":"9,500 MH/s"},{"label":"Power consumption","value":"3,500 W"},{"label":"Energy efficiency","value":"0.36 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available to mine","value":"22"},{"label":"Noise level","value":"70 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Altcoins are more volatile than Bitcoin вЂ” mining adds extra risk;","Scrypt ASICs are less liquid on the secondary market."],"pros":["Model from a known, proven manufacturer;","Profitable mining of BTC alternatives;","LTC network halved in 2023 вЂ” miner rewards stay fixed for a long time;","Meme coins remain relevant in the current bull market;","DOGE support from Elon Musk."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Whatsminer M50","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"MicroBTвЂ™s 50-series Whatsminer followed the 30-series with stronger hashrate and efficiency. Finding an M50 used is harder because it stays efficient after the halving at almost any reasonable power price. Familiar pluses remain вЂ” reliability, spare parts, and service centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The 50-series has only two models вЂ” classic M50 and upgraded M50+. Prefer the latter: same power draw but about 8 TH/s more, which helps profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M50","src":"/images/articles/used-asics/whatsminer-m50.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2022"},{"label":"Hashrate","value":"from 114 to 126 TH/s"},{"label":"Power consumption","value":"from 3,276 to 3,306 W"},{"label":"Energy efficiency","value":"from 26 to 29 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available to mine","value":"36"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Brand premium markup;","Harder to overclock MicroBT units."],"pros":["Mining format that stays relevant after the halving;","Proven manufacturer with an excellent reputation;","Many spare parts on the secondary market;","No major repair or service headaches;","Popular on the secondary market;","Horizontal form factor and only 2 fans: less noise and footprint."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Whatsminer M30S","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"MicroBTвЂ™s 30-series Whatsminer is the direct rival to Antminer S19. Some call it the reliability benchmark, but in practice durability of both market leaders is similar. The gap is preference and marketing вЂ” like Apple vs Samsung, BMW vs Toyota, Nike vs Reebok, Coke vs Pepsi. In ASIC mining it is Antminer vs Whatsminer."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The MicroBT 30-series has only three models вЂ” S, S+, and S++ вЂ” so choice is narrower. Differences are power and efficiency; consumption is similar. Whatsminer owners rarely struggle with parts or service, and farms with cheap power stay profitable after the halving."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M30S","src":"/images/articles/used-asics/whatsminer-m30s.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"MicroBT"},{"label":"Release year","value":"2020"},{"label":"Hashrate","value":"from 88 to 112 TH/s"},{"label":"Power consumption","value":"from 3,344 to 3,472 W"},{"label":"Energy efficiency","value":"from 31 to 38 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available to mine","value":"36"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Brand premium markup;","Modest yield on expensive electricity;","Harder to overclock than Antminer: fewer Whatsminer firmwares."],"pros":["Proven manufacturer many consider the most reliable;","Profitable post-halving mining, especially with cheap power;","Many secondary-market listings вЂ” easier to pick and negotiate;","Whatsminer hardware is popular used;","Horizontal form factor saves space вЂ” especially with soundboxes;","Only 2 fans (not 4 like Antminer) вЂ” lower noise."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer S19","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The clear leader of our ranking is BITMAINвЂ™s Antminer 19-series: simple, reliable, and available in many variants. Technical differences between variants are minor, so any generation unit works вЂ” Pro, Hydro, XP, plus вЂњsвЂќ and вЂњjвЂќ suffixes. Differences are hashrate (90вЂ“255 TH/s) and cooling (air or water). One generation that is becoming legendary."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"19-series strengths: reliability, low fuss, and brand recognition. Every service center knows BITMAIN; Antminer parts are everywhere; durability is proven since the 2020 launch. After the halving many miners upgrade fleets, so good used units are easy to find вЂ” and there is room to negotiate given secondary-market supply."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2020"},{"label":"Hashrate","value":"from 90 to 255 TH/s"},{"label":"Power consumption","value":"from 3,250 to 5,360 W"},{"label":"Energy efficiency","value":"from 21 to 36 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available to mine","value":"36"},{"label":"Noise level","value":"82 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Brand premium;","Weak ROI for lower variants on expensive power;","Vertical form factor needs more space (especially with a soundbox);","4 fans make this model fairly loud."],"pros":["Proven model from market leader BITMAIN;","Reliable series вЂ” the whole 19-line is a success;","No parts or repair shortages;","Stays relevant after the halving on almost any power rate;","Some S19 units exceed stated hashrate;","Secondary-market liquidity;","Discount potential due to high supply;","Overclocking options вЂ” many optimized Antminer firmwares."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer S21","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"BitmainвЂ™s Antminer S21 tops used ASIC rankings and is among the most relevant Bitcoin miners after the halving. The series spread thanks to a strong balance of hashrate, power draw, and reliability, plus wide secondary-market presence."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The S21 lineup includes classic air-cooled versions, higher-performance Pro, plus Hydro and Immersion for pro farms. That variety fits different budgets, power rates, and hosting formats вЂ” which is why beginners and pros both pick S21."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Bitmain deserves separate mention. It is one of the best-understood ASIC makers. Original and alternate firmwares, many service centers, and spare parts are available for S21. Even used, risk is below average: the model diagnoses and services easily."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another popularity driver is mass secondary supply. Large farms used S21 heavily and refresh fleets often, so many units appear in varied condition and price вЂ” room to bargain for solid residual life."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21","src":"/images/articles/used-asics/antminer-s21-b.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"200вЂ“860 TH/s"},{"label":"Power consumption","value":"from 3,500 W"},{"label":"Energy efficiency","value":"up to 13.5 J/TH"},{"label":"Available coins","value":"BTC, BCH, BSV and others"},{"label":"Cooling","value":"Air, water, immersion"},{"label":"Noise level","value":"75вЂ“80 dB"},{"label":"Release year","value":"2024вЂ“2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise вЂ” not for homes without soundproofing;","Air versions lag Hydro and Immersion on thermals;","Used prices can run above average due to demand."],"pros":["One of the most popular used models вЂ” easy to find and compare;","Wide mods: classic to water and immersion;","Known, proven Bitmain with a mature ecosystem;","Excellent liquidity вЂ” easy to resell S21;","Strong power/efficiency balance for SHA-256 after the halving;","Lots of repair, setup, and optimization info."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"BONUS #1: Antminer S9","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"With free electricity (a вЂњzero socketвЂќ), any hardware can profit. Special attention goes to BITMAINвЂ™s legendary Antminer 9-series вЂ” iconic gear many miners started on."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Antminer S9 is remarkably durable: the first units appeared in 2017, and many still run. Users call it unkillable; repairs are simple and parts are easy to find. Six modifications exist, including a water-cooled version."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S9","src":"/images/articles/used-asics/antminer-s9.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2017"},{"label":"Hashrate","value":"from 13 to 18 TH/s"},{"label":"Power consumption","value":"from 1,280 to 1,728 W"},{"label":"Energy efficiency","value":"from 96 to 98 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available to mine","value":"36"},{"label":"Noise level","value":"85 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only relevant with free electricity;","Hard to find units in good condition;","Low hashrate with high draw вЂ” terrible efficiency;","High noise."],"pros":["You can get this model almost for free;","Striking durability and low fuss;","Good buy for learning mining;","Parts and service centers available;","Many secondary-market options."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"BONUS #2: Antminer L3++","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Antminer L3++ mirrors the S9 story: an obsolete model useful only on a zero socket. Difference: S9 is SHA-256; L3++ mines Scrypt altcoins. The main pair is DOGE+LTC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The lineup also has weaker L3+. For learning and experiments it still works вЂ” low price justifies 2024 use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L3+","src":"/images/articles/used-asics/antminer-l3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"BITMAIN"},{"label":"Release year","value":"2017"},{"label":"Hashrate","value":"from 504 to 580 MH/s"},{"label":"Power consumption","value":"from 800 to 940 W"},{"label":"Energy efficiency","value":"from 1.5 to 1.6 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available to mine","value":"22"},{"label":"Noise level","value":"70 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Morally and technically obsolete;","Hard to find decent units in good shape;","Mining unstable, highly volatile altcoins."],"pros":["Extremely low price;","Parts and service available;","Cheap way to learn mining;","Low power draw."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 56
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
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Buying a used ASIC is like buying a used car: you can save and drive for years вЂ” or land expensive repairs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Buy if:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["You have a limited budget;","You understand how mining works;","You have access to cheap power;","You can check hardware or hire someone who can;","You buy from a trusted seller."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Skip used if:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["You are a beginner and do not know the technical details;","You cannot inspect the equipment;","You lack cheap power вЂ” payback stretches;","The seller looks dubious."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Golden rule: pay a bit more for a checked, working used ASIC than buy a cheap brick."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-proshivok-dlya-asikov-top-5
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$ASIC firmware ranking: top 5$tmj$,
       $tmj$PitBit, Vnish, HiveOn, Bixbit, and Braiins OS вЂ” features, fees, and compatibility compared.$tmj$,
       $tmj$PitBit Firmware$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
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
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining is a technically complex process where not only hardware power matters, but also correct configuration. One of the key tools that lets you optimize an ASIC is firmware.","text":"Cryptocurrency mining is a technically complex process where not only hardware power matters, but also correct configuration. One of the key tools that lets you optimize an ASIC is firmware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC printed circuit board and firmware","src":"/images/articles/asic-firmware-top6/pcb-hero.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Factory firmware shipped with the device provides basic functionality but often limits customization and control. That is why more miners switch to third-party firmware that helps squeeze the maximum from the hardware.","text":"Factory firmware shipped with the device provides basic functionality but often limits customization and control. That is why more miners switch to third-party firmware that helps squeeze the maximum from the hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is third-party firmware and why do you need it?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining firmware is software installed on the minerвЂ™s controller that manages its operation: frequency, voltage, fans, pool connection algorithm, and other parameters.","text":"Mining firmware is software installed on the minerвЂ™s controller that manages its operation: frequency, voltage, fans, pool connection algorithm, and other parameters."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Third-party firmware is unofficial software developed by independent teams or companies. It replaces the factory firmware to expand functionality and optimize device operating parameters.","text":"Third-party firmware is unofficial software developed by independent teams or companies. It replaces the factory firmware to expand functionality and optimize device operating parameters."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Why third-party firmware is needed:","text":"Why third-party firmware is needed:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"To overclock chips and increase hashrate;","title":"Overclocking"},{"text":"To reduce power consumption while keeping performance;","title":"Undervolting"},{"text":"For better temperature and fan control;","title":"Temperature and fans"},{"text":"For extra statistics and monitoring;","title":"Monitoring"},{"text":"For automatic restart and protection against freezes and errors;","title":"Stability"},{"text":"To manage a large device fleet from one interface.","title":"Fleet management"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pros and cons of third-party firmware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
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
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Overclocking can raise hashrate by 10вЂ“30%, while undervolting cuts electricity costs;","title":"Higher profitability"},{"text":"A wide settings set lets you adapt the device to specific conditions (for example, lower noise or heat);","title":"Flexibility"},{"text":"Useful features are often included: pool autofailover, remote control, API access, log journal;","title":"Additional features"},{"text":"Precise temperature and power tuning reduces equipment wear;","title":"Longer service life"},{"text":"Many third-party firmwares regularly receive updates and developer support.","title":"Updatability"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
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
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"After installing third-party firmware the manufacturer may refuse warranty service;","title":"Warranty loss"},{"text":"Not every firmware fits all ASIC models вЂ” failures are possible;","title":"Compatibility"},{"text":"Using unverified firmware can lead to hashrate theft or malware activity;","title":"Malware risk"},{"text":"Technical understanding of parameters and mining basics is required.","title":"Manual configuration"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose firmware: key criteria","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Before choosing software, analyze a set of basic parameters that affect profitability, efficiency, and security.","text":"Before choosing software, analyze a set of basic parameters that affect profitability, efficiency, and security."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Key characteristics:","text":"Key characteristics:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Check whether your specific model is supported. Some firmwares target Antminer S19, others S21, T21, and so on;","title":"ASIC compatibility"},{"text":"Do you need overclocking, undervolting, remote access, automation, or other features?","title":"Functionality"},{"text":"Choose only proven, widely used firmwares. Look at reviews, update frequency, and tech support availability;","title":"Reliability and reputation"},{"text":"An intuitive control panel simplifies setup and monitoring. Some firmwares support Russian;","title":"Interface convenience"},{"text":"Look for open-source projects or a transparent privacy policy. Some firmwares integrate protection against viruses and failures;","title":"Security"},{"text":"Some firmwares are free, but advanced features may require a subscription or license (for example, by hashrate or device count).","title":"Cost"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risks of using third-party firmware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Software from third-party teams always involves risks you should remember.","text":"Software from third-party teams always involves risks you should remember."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Key factors that can cause problems:","text":"Key factors that can cause problems:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"With unsafe firmware, part of the computing power may be redirected to third parties;","title":"Hashrate loss"},{"text":"Overclocking can raise temperature and wear, especially without proper cooling;","title":"Unstable operation"},{"text":"In some cases, especially after failures, restoring original firmware can be difficult;","title":"Hard to revert"},{"text":"Manufacturers do not support third-party solutions and may void the warranty.","title":"Warranty violation"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To reduce risks:","text":"To reduce risks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Use only official developer websites;","Back up configuration before updating;","Set temperature limits and automatic shutdown."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"LetвЂ™s look at the top 5 best third-party ASIC firmwares.","text":"LetвЂ™s look at the top 5 best third-party ASIC firmwares."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Braiins OS","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The well-known Braiins mining pool, operating since 2010, has its own ASIC firmware suite. That format builds trust because the software is presented on the poolвЂ™s official site. Developers prepared updated firmwares for the Bitmain lineup вЂ” you can overclock 9th, 17th, and 19th series models. The vendor promises simple install and fast launch, so even beginners can use the update.","text":"The well-known Braiins mining pool, operating since 2010, has its own ASIC firmware suite. That format builds trust because the software is presented on the poolвЂ™s official site. Developers prepared updated firmwares for the Bitmain lineup вЂ” you can overclock 9th, 17th, and 19th series models. The vendor promises simple install and fast launch, so even beginners can use the update."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Braiins OS вЂ” Antminer performance upgrade","src":"/images/articles/asic-firmware-top6/braiins-os.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Devices flashed with Braiins OS can work on any pools вЂ” in that case the miner pays developers a 2.5% fee. But if the farm owner chooses the Braiins pool, firmware fees are waived вЂ” rights holders earn only from pool fees. Clear downsides include a poorly translated Russian site: only part of the interfaces is clear for Russian-speaking users.","text":"Devices flashed with Braiins OS can work on any pools вЂ” in that case the miner pays developers a 2.5% fee. But if the farm owner chooses the Braiins pool, firmware fees are waived вЂ” rights holders earn only from pool fees. Clear downsides include a poorly translated Russian site: only part of the interfaces is clear for Russian-speaking users."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Website","value":"braiins.com/os/plus"},{"label":"Domain registration year","value":"2011"},{"label":"Supported ASICs","value":"Antminer S9, S17, S19"},{"label":"Claimed profitability increase","value":"up to 20%"},{"label":"Cost","value":"from 0 to 2.5% of hash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Focused on products of only one manufacturer вЂ” Bitmain;","Limited model range вЂ” only 3 lines;","Poorly translated Russian website."],"pros":["Official firmware from a well-known pool, which increases trust in the software;","No firmware fees when using the Braiins pool;","Simple, clear installation process;","Safe operation with minimized risks;","Works with immersion cooling;","Pre-heat function to prevent cold farm starts;","Automatic software updates;","Mass installation format."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Bixbit","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bixbit is a fairly well-known maker of immersion cooling systems for mining farms. Alongside that, it offers custom firmwares to boost hardware performance and enable placement in immersion containers. Claimed performance gain is up to 40%; service fee is 1.8% to 2.8% (depending on ASIC model). Site design and content are pleasantly surprising: full, detailed information that builds trust.","text":"Bixbit is a fairly well-known maker of immersion cooling systems for mining farms. Alongside that, it offers custom firmwares to boost hardware performance and enable placement in immersion containers. Claimed performance gain is up to 40%; service fee is 1.8% to 2.8% (depending on ASIC model). Site design and content are pleasantly surprising: full, detailed information that builds trust."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BiXBiT вЂ” branded ASIC firmware","src":"/images/articles/asic-firmware-top6/bixbit.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bixbit developers prepared software not only for Bitmain Antminer but also for Whatsminer from MicroBT, which sets these firmwares apart from most competitors. The suitable device range is also impressive вЂ” nearly twenty ASICs from the manufacturers above.","text":"Bixbit developers prepared software not only for Bitmain Antminer but also for Whatsminer from MicroBT, which sets these firmwares apart from most competitors. The suitable device range is also impressive вЂ” nearly twenty ASICs from the manufacturers above."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Website","value":"bixbit.io/ru/firmwares"},{"label":"Domain registration year","value":"2017"},{"label":"Supported ASICs","value":"Antminer L3, S9, S17, S19 and Whatsminer M2, M3, M5"},{"label":"Claimed profitability increase","value":"up to 40%"},{"label":"Cost","value":"from 1.8% to 2.8% of hash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Fees for some ASIC models are higher than competitors."],"pros":["Firmwares from a known immersion cooling seller;","Works with Bitmain and MicroBT products;","Many suitable models for optimization;","Detailed statistics;","High-quality website;","Attractive partner program;","Additional services for custom software development;","Many technical support formats."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: HiveOn","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"HiveOn firmware for Antminer ASICs claims up to 30% hashrate increase, which strongly affects miner income. The software fits the most popular Bitmain ASIC models вЂ” 9th, 17th, and 19th series, plus L3 and L7. The developer site has a handy calculator to estimate real benefit from the firmware for any available hardware model.","text":"HiveOn firmware for Antminer ASICs claims up to 30% hashrate increase, which strongly affects miner income. The software fits the most popular Bitmain ASIC models вЂ” 9th, 17th, and 19th series, plus L3 and L7. The developer site has a handy calculator to estimate real benefit from the firmware for any available hardware model."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unfortunately the site itself is not translated into Russian, which makes work harder for users. Pricing is also complex and unclear: in some cases firmware use needs no fee, but there are also commercial formats with 2% deductions from extracted income.","text":"Unfortunately the site itself is not translated into Russian, which makes work harder for users. Pricing is also complex and unclear: in some cases firmware use needs no fee, but there are also commercial formats with 2% deductions from extracted income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Website","value":"hiveon.com"},{"label":"Domain registration year","value":"2012"},{"label":"Supported ASICs","value":"Antminer L3, L7, S9, S17, S19"},{"label":"Claimed profitability increase","value":"up to 30%"},{"label":"Cost","value":"from 0 to 2% of hash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Complete lack of Russian localization;","Tech support only in English;","Complex, confusing pricing policy."],"pros":["Well-known firmwares from a project with a rich history;","Developers have their own mining pool;","Convenient on-site calculator showing real benefit per device;","Works with major Bitmain Antminer models;","Factory warranty preserved when working in ASIC Hub format;","Convenient management of large farms;","Special terms for large-scale farms and mining hotels."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Vnish","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Perhaps the best-known custom ASIC firmware belongs to the Vnish team вЂ” the most popular software for boosting hardware performance, undervolting, and farm optimization. Developers promise up to 50% profitability increase вЂ” the gain depends on the device and electricity cost. Vnish works with Bitmain gear (Antminer 9th, 17th, 19th series, and L3) and Innosilicon (T2Tz only). Whatsminer firmwares from MicroBT have long been in development (though announced on the site).","text":"Perhaps the best-known custom ASIC firmware belongs to the Vnish team вЂ” the most popular software for boosting hardware performance, undervolting, and farm optimization. Developers promise up to 50% profitability increase вЂ” the gain depends on the device and electricity cost. Vnish works with Bitmain gear (Antminer 9th, 17th, 19th series, and L3) and Innosilicon (T2Tz only). Whatsminer firmwares from MicroBT have long been in development (though announced on the site)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC Firmware from VNISH Developers","src":"/images/articles/asic-firmware-top6/vnish.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Vnish firmwares offer many benefits вЂ” a rich feature set that significantly optimizes mining. Options range from antivirus to quieter fans. The site is well translated into Russian, but support is English-only.","text":"Vnish firmwares offer many benefits вЂ” a rich feature set that significantly optimizes mining. Options range from antivirus to quieter fans. The site is well translated into Russian, but support is English-only."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is commonly thought Vnish firmware is free, but in practice it is not. Part of income is automatically sent to developer wallets вЂ” commission amounts are not disclosed. Still, users speak positively about effectiveness and note genuinely rising profitability. So fee debates rarely arise вЂ” this format suits all parties.","text":"It is commonly thought Vnish firmware is free, but in practice it is not. Part of income is automatically sent to developer wallets вЂ” commission amounts are not disclosed. Still, users speak positively about effectiveness and note genuinely rising profitability. So fee debates rarely arise вЂ” this format suits all parties."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Website","value":"vnish.com"},{"label":"Domain registration year","value":"2009"},{"label":"Supported ASICs","value":"Antminer L3, S9, S17, S19 and Innosilicon T2Tz"},{"label":"Claimed profitability increase","value":"up to 50%"},{"label":"Cost","value":"unknown"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Tech support only in English;","No software for Whatsminer."],"pros":["One of the oldest and best-known custom ASIC firmware projects;","Comprehensive optimization: higher hashrate, undervolting, antivirus, autotune, farm search, smart fans, sleep mode, multiple profiles, etc.;","Simple, fast installation;","Large amount of user information online about firmware use and setup;","Firmware available for Innosilicon."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: PitBit","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"PitBit Firmware is an innovative leader in the firmware world! Their custom firmware for popular miner models focuses on power savings and remote management. The solution is for equipment owners who want higher mining efficiency and lower operating costs.","text":"PitBit Firmware is an innovative leader in the firmware world! Their custom firmware for popular miner models focuses on power savings and remote management. The solution is for equipment owners who want higher mining efficiency and lower operating costs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"PitBit Online вЂ” software for mining equipment","src":"/images/articles/asic-firmware-top6/pitbit-boxes.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The company offers two usage formats: firmware with DEVFEE 2.75% вЂ” for testing or less powerful devices (up to 100 Th/s); a one-time license вЂ” for stable work without a fee, typically paying back in 2вЂ“5 months on average.","text":"The company offers two usage formats: firmware with DEVFEE 2.75% вЂ” for testing or less powerful devices (up to 100 Th/s); a one-time license вЂ” for stable work without a fee, typically paying back in 2вЂ“5 months on average."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"PitBit Firmware means remote management (control and setup via PITBIT Online), per-chip tuning (individual chip-level parameter adjustment), smart mode (automatic adaptation to external conditions вЂ” temperature, load), lower consumption (undervolting support вЂ” energy savings up to 20вЂ“30%), and water-cooling support (works with hydro-cooled ASIC lines such as S19 XP Hyd).","text":"PitBit Firmware means remote management (control and setup via PITBIT Online), per-chip tuning (individual chip-level parameter adjustment), smart mode (automatic adaptation to external conditions вЂ” temperature, load), lower consumption (undervolting support вЂ” energy savings up to 20вЂ“30%), and water-cooling support (works with hydro-cooled ASIC lines such as S19 XP Hyd)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Website","value":"pitbitecosystem.com/firmware/"},{"label":"Domain registration year","value":"2025"},{"label":"Supported ASICs","value":"Antminer S19 Hyd, S21, S21 Imm, S21 Hyd, T21, L9, L7, D7"},{"label":"Claimed profitability increase","value":"depends on the model"},{"label":"Cost","value":"from 105 USDT"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Pricing for some licenses is available only on request;","No support for older models (e.g. S9, T17)."],"pros":["Built-in PITBIT Online monitoring and management is available to every user;","Supports both new Bitmain models and less common ones (e.g. L7 and L9);","Firmwares are regularly updated for new devices (including S21 Pro and S21+)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"PitBit вЂ” Your Mining Ecosystem","src":"/images/articles/asic-firmware-top6/pitbit-ecosystem.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 56
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
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Third-party firmwares are a powerful tool for those who want to maximize mining profitability and adapt devices to their conditions. They unlock features missing from factory software and allow fine-tuning ASIC behavior.","text":"Third-party firmwares are a powerful tool for those who want to maximize mining profitability and adapt devices to their conditions. They unlock features missing from factory software and allow fine-tuning ASIC behavior."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Still, such firmwares require care: they involve certain risks and should be used only with basic technical knowledge. The main advice is to use proven solutions with a good reputation and support.","text":"Still, such firmwares require care: they involve certain risks and should be used only with basic technical knowledge. The main advice is to use proven solutions with a good reputation and support."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-proshivok-dlya-asikov-top-5$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-stran-po-majningu-top-8-gosudarstv-liderov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Top mining countries: ranking of 8 leaders$tmj$,
       $tmj$Which states lead crypto mining today вЂ” power costs, regulation, and infrastructure that set the global map.$tmj$,
       $tmj$World map and Bitcoin symbol$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
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
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining is an extremely dynamic industry constantly subject to change, innovation, and the influence of various factors. Literally yesterday a countryвЂ™s authorities could be loyal to the mining segment, and today bans begin to take effect. Conversely, new investor hubs unexpectedly appear when a state suddenly revises its attitude toward the niche.","text":"Cryptocurrency mining is an extremely dynamic industry constantly subject to change, innovation, and the influence of various factors. Literally yesterday a countryвЂ™s authorities could be loyal to the mining segment, and today bans begin to take effect. Conversely, new investor hubs unexpectedly appear when a state suddenly revises its attitude toward the niche."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"LetвЂ™s see what the TOP-8 countries by mining volume look like: we will build a ranking from open sources. Exact hashrate figures are hard to name, because numbers constantly change and not all farm owners operate openly. Even so, the list of leaders has remained unchanged for a long time вЂ” these parts of the globe are what we will cover in the article. We will not give exact hashrate and power figures (because those numbers are volatile). We will only note approximate shares of global mining to form an overall picture.","text":"LetвЂ™s see what the TOP-8 countries by mining volume look like: we will build a ranking from open sources. Exact hashrate figures are hard to name, because numbers constantly change and not all farm owners operate openly. Even so, the list of leaders has remained unchanged for a long time вЂ” these parts of the globe are what we will cover in the article. We will not give exact hashrate and power figures (because those numbers are volatile). We will only note approximate shares of global mining to form an overall picture."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining features in different countries","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining as a business depends on several factors at once:","text":"Mining as a business depends on several factors at once:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Electricity cost;","Climate (temperature and humidity);","Legal environment (legality and level of regulation);","Availability of equipment and infrastructure;","Grid stability."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Based on these criteria, countries can be conditionally divided into three groups:","text":"Based on these criteria, countries can be conditionally divided into three groups:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"These are regions with low electricity costs, a stable grid, and a neutral or even positive attitude toward mining. In such countries crypto mining is a competitive business even during price downturns. Examples: Kazakhstan, Russia, Iran (with caveats), Ethiopia, Paraguay;","title":"States with a favorable regime and cheap energy"},{"text":"In these countries mining is not banned but regulated: licenses are often required, reporting procedures are in place, and electricity prices are in a moderate range. As a rule, these are developed economies with a high level of legal control. Examples: Canada, Germany, Norway, UAE;","title":"Jurisdictions with moderate loyalty and medium costs"},{"text":"Here mining is either directly banned (for example, as in China since 2021) or limited through high tariffs, harsh taxation, or confiscation measures. Examples: China, Algeria, Bangladesh, Nepal, Iraq.","title":"Regions with a high level of bans or unfriendly policy"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"World map and Bitcoin symbol","src":"/images/articles/rating-countries/map-bitcoin-wide.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is it hard to accurately estimate hashrate by country?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At first glance it seems simple to rank countries by mining volume using data from pools and energy companies.","text":"At first glance it seems simple to rank countries by mining volume using data from pools and energy companies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, there are serious difficulties that hinder accurate analytics:","text":"However, there are serious difficulties that hinder accurate analytics:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Most miners connect to international pools that distribute power across data centers worldwide. Therefore the real geographic location of equipment is often not disclosed;","title":"Cloud and multi-geographic pools"},{"text":"Miners in countries with semi-legal, young legislation or gray status (for example, Russia or Iran) do not advertise their presence. Use of proxies and VPNs also makes tracking harder;","title":"Participant anonymity"},{"text":"Many companies can move mining farms from one country to another depending on tariffs, regulation, or technical failures. Thus hashrate data ages quickly;","title":"Equipment relocation"},{"text":"Home miners, especially in countries with subsidized tariffs, most often do not enter statistics at all.","title":"Home mining"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: El Salvador","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This Central American country is known for its loyal attitude toward the entire cryptocurrency segment. Much of that is thanks to President Nayib Bukele, who sees impressive prospects in BTC: digital assets receive heightened attention in El SalvadorвЂ™s economy. For example, authorities have long been buying 1 BTC daily (sometimes more), and local Bitcoin farms run on volcanic energy. Fortunately, there are plenty of such natural green energy sources here вЂ” more than one and a half hundred.","text":"This Central American country is known for its loyal attitude toward the entire cryptocurrency segment. Much of that is thanks to President Nayib Bukele, who sees impressive prospects in BTC: digital assets receive heightened attention in El SalvadorвЂ™s economy. For example, authorities have long been buying 1 BTC daily (sometimes more), and local Bitcoin farms run on volcanic energy. Fortunately, there are plenty of such natural green energy sources here вЂ” more than one and a half hundred."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"El Salvador is open to foreign investment, attracts foreign miners, and offers special economic conditions for those working with blockchain. Of course, this Central American stateвЂ™s share of total hashrate is small, but the authoritiesвЂ™ desire to organize dense work with the niche draws attention.","text":"El Salvador is open to foreign investment, attracts foreign miners, and offers special economic conditions for those working with blockchain. Of course, this Central American stateвЂ™s share of total hashrate is small, but the authoritiesвЂ™ desire to organize dense work with the niche draws attention."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Globe and coins вЂ” El Salvador","src":"/images/articles/rating-countries/globe-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"less than 1%"},{"label":"Energy","value":"volcanoes"},{"label":"Largest investors and farms","value":"Tether, Luxor Technologies"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A criminal country;","Limited volumes and potential."],"pros":["Loyal government;","Benefits for investors;","Use of green energy."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Ethiopia","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2024 an unexpected player appeared on the world mining stage вЂ” Ethiopia. A relatively poor African state rapidly broke into the top ten countries by digital asset mining volume. The mining story here looks paradoxical: despite impressive blockchain workloads, a large share of EthiopiaвЂ™s population still lacks access to electricity and effectively lives below the poverty line. Corruption thrives, and most BTC revenue is concentrated in the hands of foreign investors.","text":"In 2024 an unexpected player appeared on the world mining stage вЂ” Ethiopia. A relatively poor African state rapidly broke into the top ten countries by digital asset mining volume. The mining story here looks paradoxical: despite impressive blockchain workloads, a large share of EthiopiaвЂ™s population still lacks access to electricity and effectively lives below the poverty line. Corruption thrives, and most BTC revenue is concentrated in the hands of foreign investors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite all difficulties, EthiopiaвЂ™s authorities skillfully use hydropower potential to launch and support farms. About 10% of all electricity generation goes to mining, which shows the sectorвЂ™s high influence on the African countryвЂ™s economy.","text":"Despite all difficulties, EthiopiaвЂ™s authorities skillfully use hydropower potential to launch and support farms. About 10% of all electricity generation goes to mining, which shows the sectorвЂ™s high influence on the African countryвЂ™s economy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"World map with Bitcoin вЂ” Ethiopia","src":"/images/articles/rating-countries/map-bitcoin-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"from 1% to 5%"},{"label":"Energy","value":"hydropower plants"},{"label":"Largest investors and farms","value":"BitFuFu, EEP"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Corruption;","Low level of security."],"pros":["Renewable energy sources;","Inexpensive labor."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Canada","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The mining situation in Canada is ambiguous. On one hand, North American climate conditions are optimal for large farms, but on the other, the industryвЂ™s heavy power consumption forced authorities to set restrictions, complicating minersвЂ™ work. As a result, CanadaвЂ™s hashrate share fell significantly from its former top values once strict regulation kicked in.","text":"The mining situation in Canada is ambiguous. On one hand, North American climate conditions are optimal for large farms, but on the other, the industryвЂ™s heavy power consumption forced authorities to set restrictions, complicating minersвЂ™ work. As a result, CanadaвЂ™s hashrate share fell significantly from its former top values once strict regulation kicked in."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A similar situation occurred in Kazakhstan, so the mining fates of these two countries are alike. Mining Bitcoin in Canada has become much harder and more expensive, but authorities do not plan to change their decision, partly for environmental reasons. Mining digital assets requires increasing local power plant capacity, which forces higher volumes of harmful atmospheric emissions.","text":"A similar situation occurred in Kazakhstan, so the mining fates of these two countries are alike. Mining Bitcoin in Canada has become much harder and more expensive, but authorities do not plan to change their decision, partly for environmental reasons. Mining digital assets requires increasing local power plant capacity, which forces higher volumes of harmful atmospheric emissions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Data center вЂ” Canada","src":"/images/articles/rating-countries/datacenter-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"about 5%"},{"label":"Energy","value":"conventional power plants"},{"label":"Largest investors and farms","value":"BitFury and Hut 8"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Serious restrictions;","High taxes."],"pros":["Suitable climate;","Proximity to the USA;","A drive to use green energy."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Kazakhstan","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Several years ago Kazakhstan was among the top three countries by total mining volume. After ChinaвЂ™s official crypto ban, many farms began moving not only to Russia but also to other CIS states. One of them is Kazakhstan, which saw rapid niche growth in 2021вЂ“2022. After some time, however, authorities faced a serious shortage of electric capacity, which led to restrictive and regulatory legislation.","text":"Several years ago Kazakhstan was among the top three countries by total mining volume. After ChinaвЂ™s official crypto ban, many farms began moving not only to Russia but also to other CIS states. One of them is Kazakhstan, which saw rapid niche growth in 2021вЂ“2022. After some time, however, authorities faced a serious shortage of electric capacity, which led to restrictive and regulatory legislation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Ultimately the number of miners in Kazakhstan shrank significantly, while tax contributions to the treasury are growing. The explanation is simple: this activity was heavily taxed, so only some of the farms that previously operated remain. This situation suits the authorities entirely: load on the grid fell, and tax receipts rose.","text":"Ultimately the number of miners in Kazakhstan shrank significantly, while tax contributions to the treasury are growing. The explanation is simple: this activity was heavily taxed, so only some of the farms that previously operated remain. This situation suits the authorities entirely: load on the grid fell, and tax receipts rose."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm вЂ” Kazakhstan","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"from 2% to 5%"},{"label":"Energy","value":"conventional power plants"},{"label":"Largest investors and farms","value":"Energix, Genesis Digital Assets and BTC.kz"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High tax rates for miners;","Bans and restrictions."],"pros":["Proximity to China;","Inexpensive electricity;","Moderate climate."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: United Arab Emirates","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The UAE is known worldwide for its loyal attitude toward the crypto segment, and mining is no exception. But miningвЂ™s popularity is driven not only by commitment to blockchain technology, but also by access to inexpensive electricity. Persian Gulf countries have plenty of oil used to generate cheap power: optimal conditions for launching farms. Solar power plants are also common here, which favorably affects tariffs. The only drawback of the direction is considered the hot climate, which increases investorsвЂ™ costs for organizing cooling systems.","text":"The UAE is known worldwide for its loyal attitude toward the crypto segment, and mining is no exception. But miningвЂ™s popularity is driven not only by commitment to blockchain technology, but also by access to inexpensive electricity. Persian Gulf countries have plenty of oil used to generate cheap power: optimal conditions for launching farms. Solar power plants are also common here, which favorably affects tariffs. The only drawback of the direction is considered the hot climate, which increases investorsвЂ™ costs for organizing cooling systems."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Rapid adoption of the digital asset segment in the United Arab Emirates lets investors not fear a change in the authoritiesвЂ™ attitude toward mining. Large market participants actively invest in UAE farms, because the country offers attractive economic conditions for foreign capital.","text":"Rapid adoption of the digital asset segment in the United Arab Emirates lets investors not fear a change in the authoritiesвЂ™ attitude toward mining. Large market participants actively invest in UAE farms, because the country offers attractive economic conditions for foreign capital."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Global mining вЂ” UAE","src":"/images/articles/rating-countries/map-bitcoin-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"from 5% to 10%"},{"label":"Energy","value":"conventional power plants, solar panels"},{"label":"Largest investors and farms","value":"Marathon Digital, Zero Two, Hearst"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Hot climate."],"pros":["Government support for the sector;","A favorable investment environment;","High degree of cryptocurrency adoption;","Inexpensive electricity thanks to large oil fields;","Solar energy."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: China","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It is well known that in 2021 Chinese authorities issued an official ban on cryptocurrencies, including digital asset mining. That caused a global migration of farms to various countries, including Kazakhstan and Russia. Before that loud event China was the undisputed leader in global hashrate structure, but prohibitive measures seriously reshuffled the balance of power.","text":"It is well known that in 2021 Chinese authorities issued an official ban on cryptocurrencies, including digital asset mining. That caused a global migration of farms to various countries, including Kazakhstan and Russia. Before that loud event China was the undisputed leader in global hashrate structure, but prohibitive measures seriously reshuffled the balance of power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The paradox of Chinese mining today is that despite an official ban, farms from the Middle Kingdom still generate a noticeable share of global power. Moreover, China holds a solid third place by hashrate volume: participation by вЂњgrayвЂќ industry players is that large. Large-scale government farms are also not ruled out, though the countryвЂ™s authorities do not comment on that possibility.","text":"The paradox of Chinese mining today is that despite an official ban, farms from the Middle Kingdom still generate a noticeable share of global power. Moreover, China holds a solid third place by hashrate volume: participation by вЂњgrayвЂќ industry players is that large. Large-scale government farms are also not ruled out, though the countryвЂ™s authorities do not comment on that possibility."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcoin and world map вЂ” China","src":"/images/articles/rating-countries/map-bitcoin-wide.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"about 10%"},{"label":"Energy","value":"conventional power plants"},{"label":"Largest investors and farms","value":"no data"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["An official ban and severe penalties for breaking the law."],"pros":["China is the birthplace of all mining infrastructure;","Concentration of the largest hardware manufacturers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Russia","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A rapid push in Russian mining development came in 2021, when China banned cryptocurrencies. A flood of ASICs poured into CIS countries, and Russia received the most substantial deliveries. Inexpensive electricity (especially in Siberian regions), a cool climate, and a complete absence of bans made Russia one of the centers of global mining. In 2024, specialized legislation appeared to legalize the industry and bring it into the legal fold вЂ” now cryptocurrencies can be mined fully officially in our country.","text":"A rapid push in Russian mining development came in 2021, when China banned cryptocurrencies. A flood of ASICs poured into CIS countries, and Russia received the most substantial deliveries. Inexpensive electricity (especially in Siberian regions), a cool climate, and a complete absence of bans made Russia one of the centers of global mining. In 2024, specialized legislation appeared to legalize the industry and bring it into the legal fold вЂ” now cryptocurrencies can be mined fully officially in our country."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"However, it was not without a fly in the ointment: restrictions or a full ban on crypto mining were introduced in 13 regions of the country, which started a farm migration process. The birthplace of Russian mining, Irkutsk Region, also fell under restrictions вЂ” ASICs can no longer be run here during the heating season. Such actions by the authorities may result in Russia losing its share of global hashrate. Despite that, some experts do not rule out the opposite: Russia competing with the US on equal terms for the title of world mining capital.","text":"However, it was not without a fly in the ointment: restrictions or a full ban on crypto mining were introduced in 13 regions of the country, which started a farm migration process. The birthplace of Russian mining, Irkutsk Region, also fell under restrictions вЂ” ASICs can no longer be run here during the heating season. Such actions by the authorities may result in Russia losing its share of global hashrate. Despite that, some experts do not rule out the opposite: Russia competing with the US on equal terms for the title of world mining capital."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm вЂ” Russia","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"up to 15%"},{"label":"Energy","value":"conventional power plants"},{"label":"Largest investors and farms","value":"BitRiver, Intelion Data Systems, Promminer, Sibmain, BitCluster"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Bans and restrictions for some regions."],"pros":["Inexpensive electricity;","Cool climate;","Appearance of legislation that legalizes mining."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: USA","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The undisputed leader of the world ranking after 2021 is the United States of America: the country controls up to 40% of total hashrate. With Donald Trump coming to power, strengthening of that position continues: the new president aims to make the US the world center of the crypto industry, and mining should become an integral part of that infrastructure.","text":"The undisputed leader of the world ranking after 2021 is the United States of America: the country controls up to 40% of total hashrate. With Donald Trump coming to power, strengthening of that position continues: the new president aims to make the US the world center of the crypto industry, and mining should become an integral part of that infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The US has specialized legislation regulating minersвЂ™ activity. In turn, the bulk of total hashrate is concentrated in the hands of fundamental market participants вЂ” large companies with no peers in the world. Large-scale farms often use renewable energy sources as well as inexpensive electricity in some states, forming a favorable environment for deploying equipment.","text":"The US has specialized legislation regulating minersвЂ™ activity. In turn, the bulk of total hashrate is concentrated in the hands of fundamental market participants вЂ” large companies with no peers in the world. Large-scale farms often use renewable energy sources as well as inexpensive electricity in some states, forming a favorable environment for deploying equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Large mining farm вЂ” USA","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Share of global hashrate","value":"up to 40%"},{"label":"Energy","value":"conventional power plants, solar batteries"},{"label":"Largest investors and farms","value":"Marathon Digital Holdings, Hut 8 Mining, Bitdeer"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Harsh laws and legal restrictions."],"pros":["Presence of rich infrastructure;","A suitable legal framework;","New authoritiesвЂ™ drive to develop the niche;","A focus on renewable sources for electrifying farms."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 60
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
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The TOP-8 world ranking of countries by cryptocurrency mining volume looks as follows:","text":"The TOP-8 world ranking of countries by cryptocurrency mining volume looks as follows:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["USA;","Russia;","China;","UAE;","Kazakhstan;","Canada;","Ethiopia;","El Salvador."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are other participants as well (for example, Norway, Sweden, Germany, Ireland, Iran, and so on), but the countries that ended up in our analysis look the most vivid and promising.","text":"There are other participants as well (for example, Norway, Sweden, Germany, Ireland, Iran, and so on), but the countries that ended up in our analysis look the most vivid and promising."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-stran-po-majningu-top-8-gosudarstv-liderov$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- riski-majninga-razbor-opasnostej-i-ugroz
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining risks: threats every investor should weigh$tmj$,
       $tmj$Technical, financial, power, legal, and infrastructure risks in mining вЂ” what to factor into your plan.$tmj$,
       $tmj$Mining risks$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
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
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Any kind of business, whether franchise work or running things on your own, involves potential risks. Even an ordinary bank deposit is not 100% reliable income given certain legal nuances. Bitcoin, blockchain, mining investments, and crypto formats are further confirmation of this. There are financial nuances and risks here that experienced investors face as well. Every minerвЂ™s job, regardless of experience and equipment type, is to know all technical, legal, and infrastructure risks. This article is prepared to address exactly that."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What risks exist in mining?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Many people far from the digital asset market think earning in crypto on the blockchain is simple enough: buy an ASIC, build a farm, start the process, and just collect profit. In practice everything is much more complex than it first appears."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Technical, financial, energy, legal, and infrastructure вЂ” these are all real difficulties every miner faces after choosing the crypto business."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"What risks exist in mining","src":"/images/articles/mining-risks/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The more thoroughly you know each nuance on the list, the easier it is to grow the farm and earn from the crypto market. That is why we examine each risk type separately, analyzing the details carefully."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Miner hardware: technical details","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The first question miners answer when deciding to mine bitcoin is which hardware to choose вЂ” ASICs or GPUs. Dozens of companies with different reputations make each device type. The technical choice is an important moment that deserves special attention."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is always a risk of hardware failure. Warranty coverage, repair complexity, service cost, and recovery expenses вЂ” sooner or later you will deal with all of this."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is why you should mine on proven equipment (preferably new, not used) from a known manufacturer. Then you will find service more easily: repairs will not become a serious headache. Restoring hardware that many technicians know is also much simpler."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are other risks that hinder miner earnings вЂ” technical traits of specific devices, as well as placement and resale on the secondary market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For example, Antminer 17-series chips can detach from the board during shipping, and some Whatsminer models heat up significantly during operation. All these nuances can hurt investments and affect profits. So you should know such important details before buying any given ASIC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Financial risk in mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Now a few words about a completely different type of crypto risk вЂ” everything related to financial complexity. Several key questions stand out:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Bitcoins are digital assets. Many see crypto as a big bubble that will eventually burst. Rapid growth of the virtual coin market is obvious, but even the banking system can collapse, so digital currencies also lack absolute viability;","If miners produce the main currency вЂ” bitcoin вЂ” risks are minimal. If the investor chooses alternative and little-known coins, there is a high chance of fraud and financial loss;","The risk of buying mining hardware that becomes obsolete. This is not only about investing in dubious formats and niche gear. Everyone understood autumn 2022, when Ether moved to PoS: many farms faced an unenviable fate, though only recently the market had generously rewarded GPU investors;","Any digital asset has elevated volatility вЂ” meaning speculators can influence prices. Their influence, for example, in the stock market is much smaller, so crypto industry volatility is a real risk and threat. Bitcoin earnings are more tangible, but potential losses are too;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Financial risk in mining","src":"/images/articles/mining-risks/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The number of financial factors an investor must know is large. Knowledge and experience help avoid mistakes, as does developing personal financial literacy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Electricity risks","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Digital revenue is also tied to electricity вЂ” hardware consumes a sizable amount of power, which successful businesses must account for."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An ASIC farm needs a large amount of grid capacity вЂ” utility costs can easily run into tens of thousands of rubles."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If you ignore these costs at the start, mining profitability will bring an unpleasant surprise. So do not forget electricity when planning profit:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Electricity must be paid regularly without accumulating debt;","Be ready for tariff increases that inevitably raise expenses;","Kilowatt price plays a major role: in some regions it is under 1 ruble, in others over 7 rubles. Income will depend directly on this figure;","Some mining tools are so power-hungry that the roomвЂ™s outlet capacity may be insufficient вЂ” you will need extra capacity if technically available;","When mining digital currency, you may face a situation where the state treats mining as commercial profit-making. Fines and moving the farm to a special energy tariff may be unavoidable. A noticeable drop in profit is then inevitable;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is why electricity payments in the mining market deserve heightened attention. For stable income and business growth, remember the risks tied to the power sector."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Cybersecurity in the markets","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An even more important issue is protecting the user from cybersecurity threats. The blockchain world is a place where hundreds of fraudsters apply their talents to steal your money. Successful management of a digital-services business means knowing all sources of cyber threats. LetвЂ™s start from the first steps:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Buying hardware. A user may find the ASIC mining crypto to someone elseвЂ™s wallet. The cause is fraudulent sellers who reflash equipment for easy money;","ASIC service and firmware updates during operation вЂ” another way to face fraud for the same reason above;","The pool the hardware uses. Dubious pools always raise the risk that beginners become victims of scam schemes. Choose a reliable pool partner known to experienced users and with a strong reputation;","Storing funds after withdrawing from the pool. Prefer proven tools, for example cold wallets from a company whose name is known on the market;","Storing funds on an exchange. Such sites do not guarantee absolute safety, because cloud exchange formats have private owners;","Viruses on ASICs and on the computer (laptop) used for management. Malware aimed at blockchain management is common, so investors must always stay alert;","Making dubious transfers and other operations. You can easily become a scam victim. Check every wallet digit on every site and sense potential threats;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cybersecurity in mining","src":"/images/articles/mining-risks/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In crypto networks, hardly a day passes without some site collapsing or a service disappearing along with usersвЂ™ assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This is a real financial fraud problem that currently has no absolute solution. To avoid such a situation, always follow basic crypto security rules."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Taxation and gaps in legislation","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"You cannot say authorities ban mining digital gold and working in crypto. The reason is that in many countries today there is no legal framework, tax base, regulation, privacy policy, legality rules, or rate вЂ” documents are simply missing. For many states crypto is still a dark forest, though some countries are already thinking about the legal side, and elsewhere mining is strictly banned."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Until the state issues clear rules on taxation and market regulation, the number of people wanting to mine BTC will not shrink."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Even now, with some confidence, we can say what will eventually interest authorities. First, taxation of income from exchange trading. Second, higher electricity costs for miners. Third, registering mining devices in specialized registries."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining difficulty and halving","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another risk category in digital money work is declining miner income from two phenomena everyone faces:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"The BTC digital network has a fundamental parameter вЂ” hashrate. This value constantly increases as Bitcoin mining difficulty grows. Keeping the same setup, miners earn less, not to mention rising costs while profitability falls. Asset price can fix the situation вЂ” historically, growth dynamics usually compensate crypto enthusiastsвЂ™ risks;","title":"Network hashrate growth"},{"text":"Under BTC blockchain technology, every 4 years miner rewards are cut exactly in half: that is the financial model the Bitcoin creator embedded from the first record. After a halving, however, key crypto asset prices usually rise, which also offsets risks and fees and improves mining system conditions.","title":"Halving"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining difficulty and halving","src":"/images/articles/mining-risks/img-4.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Working with BTC is based on cycles. Both concepts we covered above also follow that factor, allowing more predictable income management."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Outlook and the future of mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How do you start extracting value from the crypto system, and how do experienced market participants earn? Clear planning, sound calculation, and understanding which difficulties await on the path вЂ” that is the key to success."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What can we say about the outlook for cryptocurrencies and mining in particular? First of all, that markets are only at the very beginning of their formation and growth."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The sooner you get acquainted with this segment, the faster you will find your place in the crypto industry. Start simple, gradually mastering new directions on the path to larger returns!"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$riski-majninga-razbor-opasnostej-i-ugroz$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
