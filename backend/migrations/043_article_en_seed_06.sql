SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- proshivki-dlya-majninga-kak-zarabatyvat-bolshe
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining firmware: how to earn more$tmj$,
       $tmj$How custom ASIC firmware can raise hashrate and cut power draw вЂ” plus risks to weigh and how to pick reliable software.$tmj$,
       $tmj$Mining firmware$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
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
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Modern miners know that real efficiency and profit come only to those who can tune hardware correctly and watch every detail. Mining firmware plays a key role here вЂ” specialized software that unlocks overclocking, fine-tuning, and ASIC optimization. LetвЂ™s see how ASIC firmware raises profitability, what to look for when choosing it, and why it is not just a trend but a professional tool."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is mining firmware and what is it for?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An ASIC is a specialized device for mining cryptocurrency. By default every ASIC ships with factory firmware made by the manufacturer for average, stable operation. Those вЂњstockвЂќ mining firmwares rarely unlock the deviceвЂ™s full potential."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is why owners increasingly look for where to download ASIC firmware built by independent teams or enthusiasts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Such firmware allows you to:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Overclock hashrate and speed up mining;","Cut power use while keeping performance;","Improve device monitoring and control;","Adapt operation to specific conditions вЂ” for example high room temperature or unstable power."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As a result, even without buying new hardware you can raise income and lower costs by using the best ASIC firmware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How mining firmware affects profitability","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining economics rests on a fine balance between hashrate, power use, and stability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"ASIC firmware helps you manage all of these factors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Overclocking and higher hashrate","text":"Installing alternative firmware often raises hashrate by 10вЂ“20% or more. For example, an ASIC with a stock 200 TH/s can run at 210вЂ“240 TH/s if parameters are tuned well;"},{"title":"Undervolting","text":"Lowering voltage while keeping performance cuts electricity use. At large mining volumes that saves tens or even hundreds of dollars a month;"},{"title":"Fewer downtime and failures","text":"The best ASIC firmwares often include better monitoring and self-diagnostics. If a device overheats or goes offline, the owner learns instantly and can fix it quickly;"},{"title":"Flexible work profiles","text":"You can create different modes for winter and summer, immersion cooling, or high humidity. That flexibility improves overall stability and reduces the chance of breakdowns."}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How firmware affects profitability","src":"/images/articles/firmware-mining/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is it profitable to use ASIC firmware?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"LetвЂ™s look at real numbers. You have an ASIC at 190 TH/s drawing 3,500 W (for example, Antminer T21). At the current electricity price of в‚Ѕ4.72/kWh, costs are substantial вЂ” about в‚Ѕ397 per day (3.5 kW Г— 24 hours Г— в‚Ѕ4.72). Per month that is almost в‚Ѕ12,000 on electricity alone."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Now imagine you decide to download ASIC firmware and install a solid custom build."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What that can deliver:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["With optimization and overclocking, real hashrate can rise about 10вЂ“15%, for example to 210вЂ“215 TH/s;","Proper undervolting can cut power from 3,500 W to roughly 3,200вЂ“3,300 W without losing stability."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What does that mean for profitability?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["An extra 20вЂ“25 TH/s will raise mining income by the same 10вЂ“15%;","At the same time electricity savings will be about в‚Ѕ200вЂ“250 per day (the difference between 3,500 W and, say, 3,200 W Г— 24 hours Г— в‚Ѕ4.72)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In the end, installing better ASIC firmware alone can add about в‚Ѕ6вЂ“8 thousand per month (from overclocking) and save roughly в‚Ѕ6 thousand on power. Over a year that is already в‚Ѕ140вЂ“170 thousand extra вЂ” without buying new hardware, only through smart tuning."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"And even if downloading ASIC firmware costs money, those costs pay back in a couple of months of operation. After that the device keeps running more efficiently, lowering the cost of each mined bitcoin and raising your net profit."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is why installing thoughtful firmware is not just a вЂњhobby for enthusiasts,вЂќ but a real tool for higher returns and a competitive edge for every miner."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risks and pitfalls","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Remember: mining firmware is a powerful tool вЂ” but only in the hands of someone who knows what they are doing."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Warranty: installing third-party ASIC firmware almost always voids the factory warranty;","Overheating and failures: wrong settings can overheat chips, wear fans faster, or burn a board;","Security: do not download files from suspicious sites. Malicious firmware may include a miner that skims part of your income or opens remote control of the device."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"So when choosing where to download ASIC firmware, prefer only trusted teams with a reputation and support."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Risks of custom firmware","src":"/images/articles/firmware-mining/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose the best ASIC firmware?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To find truly best ASIC firmware, weigh several factors:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Developer reputation and user reviews.","Support for current ASIC models.","Flexible tuning (overclocking, undervolting, profiles).","Availability of updates and fixes.","Support staff who can help with setup or failures."],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Good practice is to test firmware on one device first and only then roll it out across the farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Technical capabilities of custom firmware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Modern mining firmware can not only raise income but also make working with an ASIC easier:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Built-in web interface for monitoring.","Fan and cooling system tuning.","Automatic restart on error.","Flexible alerts via Telegram or email.","ASIC work stats for day, week, and month."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These features are especially valued by those who manage not one device but a large farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Outlook and the future","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Every year mining requirements grow: network difficulty rises, electricity prices climb, and competition gets tougher. That is why more miners look for where to download ASIC firmware to stay profitable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The trend is as follows:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["More developers of alternative firmware.","Support for new ASIC models almost right after release.","More advanced monitoring and automation systems.","Integration with cloud management services."],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In the future, those who do not use the best ASIC firmware will simply be uncompetitive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 40
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
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining firmware is not just a вЂњhackвЂќ or a buzzword вЂ” it is a real tool for higher returns, lower costs, and more stable operation. If you want the most from your hardware, you need to understand firmware and know how to use it."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Remember: choose the best ASIC firmware, download only from trusted sites, and test every change. Then your devices will last longer, run more stably, and bring more profit even in tough market conditions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A TOP list of mining firmwares from independent mining-market experts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$proshivki-dlya-majninga-kak-zarabatyvat-bolshe$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$EMCD Bitcoin mining pool: overview$tmj$,
       $tmj$EMCD pool review: FPPS+ 1.5% fees, supported coins, signup, feedback, referrals, and Coinhold for CIS miners.$tmj$,
       $tmj$EMCD Bitcoin mining pool$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
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
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The EMCD mining pool is well known to Russian cryptocurrency miners, as the service is confidently popular across the CIS. Globally the picture is equally strong вЂ” the project ranks in the top 10 by user count among all shared digital-asset mining tools. Here is an honest EMCD review: we introduce the project, cover pros and cons, assess registration and setup, read user feedback, and explain why the pool is popular in Russia."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"EMCD Bitcoin mining pool: overview","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The project launched in 2018 and is headquartered in Hong Kong. Its hallmark is simplicity вЂ” no complex technical setups or endless options. Just one reward payout algorithm, seven coins, fast registration, and a simple interface."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It seems the EMCD pool creators aimed to make minersвЂ™ work as simple as possible вЂ” and according to most users, they succeeded."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Beyond simplicity and ease of use, the service has other important features:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Mining of seven popular coins: BTC, BCH, LTC, DSC, ETC, DOGE, KAS. Before Ethereum moved to PoS, the project also supported ETH, but that format had to be dropped after the blockchain change;","The tool offers only one reward method вЂ” FPPS+. On one hand that limits options; on the other, most miners do not care about the choice, so a single format removes unnecessary hassle;","EMCD is not only a mining pool but a set of other tools. The project offers its own wallet, a profitability calculator, a P2P crypto buy/sell service, mining-hotel services, and the Coinhold passive-income system. Each tool is interesting in its own right and deserves a separate review;","The EMCD mining pool uses many servers worldwide to provide a stable connection with minimal ping. Users choose their location themselves: Russia, Europe, USA, China, Iran, and Kazakhstan;","Users can boost farm performance with Vnish firmware вЂ” downloadable from the pool site. Optimization is available for popular BITMAIN ASICs: Antminer S19, S19+, S19 Pro, S17, S17+, T17, T17+, L3+;","Russian-language support, which is especially important for beginners. Specialists help with connection and answer questions. Wait times for help are minimal;","No minimum withdrawal threshold вЂ” you can send any amount;","There is a mobile app for Apple and Android that is also simple to use with clear interaction logic."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another important feature is loyalty to CIS users even under sanctions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The project owners have repeatedly stated they will keep working with Russian miners, because bans and restrictions in this industry contradict the idea of a fair blockchain."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"EMCD pool overview","src":"/images/articles/emcd-pool/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pool fees","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Following a policy of absolute simplicity and user-friendliness, the pool offers a fixed fee for mining any coin on FPPS+. The rate is 1.5%, among the lowest in the industry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Withdrawals are possible to internal and external wallets, to a bank card, and via the P2P system."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is another set of reasons why the pool is popular among miners from Russia and CIS countries."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"EMCD mining pool: reviews","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A detailed review of feedback paints a positive picture of the service. Users note higher income versus competitors (possibly due to the low fee), stable system operation, good support, and accompanying services that miners actually use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Rare negative feedback relates to isolated account blocks and transaction issues. Details on those stories are missing, so deliberate disinformation from competitors cannot be ruled out. Moreover, those cases did not spread widely or gain much attention."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to set up the EMCD mining pool","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Registration and getting started again follow the idea of maximum simplicity and intuition. The steps look like this:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Create an account on https://emcd.io;","Connect a device: specify the mining coin and nearest location. The system automatically prepares connection parameters вЂ” three addresses and a worker name;","Enter those parameters in the ASIC control panel, after which the device will mine cryptocurrency to your wallet."],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The EMCD mining pool offers one of the simplest setup and connection flows in the entire crypto mining industry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The steps are clear even for beginners: trouble getting started is rare."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How to configure the EMCD pool","src":"/images/articles/emcd-pool/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Maximizing profit on EMCD","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are several tips to make working on the service even more attractive from an earnings perspective:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Use the referral program. Like many crypto projects, EMCD wants to grow users through existing clients. By bringing referrals you can earn up to 0.5% of their volumes вЂ” a meaningful income boost;","The Coinhold passive earning system. Assets from mining can grow via staking вЂ” yields reach 12% per year, comparable to bank deposits;","Special terms for large farms. Cooperation is discussed individually and may include lowering the service fee, which is already attractively low at 1.5%."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Three basic recommendations for increasing mining income with the EMCD pool: any crypto enthusiast can use the first two options regardless of farm size."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
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
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"EMCD deservedly holds a leading position in crypto mining for CIS users. Low fees, convenient withdrawals, a good reputation, and extreme simplicity attract miners worldwide: account count has already exceeded 200,000 вЂ” a solid mark of quality and reliability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- razreshen-li-majning-v-rossii
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Is mining legal in Russia?$tmj$,
       $tmj$Legal status of mining in Russia, taxes, and commercial electricity tariffs explained simply.$tmj$,
       $tmj$Is mining allowed in Russia$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
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
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Russian authorities constantly threaten to ban cryptocurrencies, restrict mining, and introduce total control over those who try to work with digital assets. How do things stand today? We will try to answer whether mining is legal in Russia in 2024, and what prospects this activity has in the future."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is mining legal: current legislation","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"At present, there are no regulations or provisions that define mining activity and, accordingly, govern this process. No law of the Russian Federation describes the concept of вЂњmining,вЂќ so the extraction process remains legally contested for many."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is mining legal in Russia in 2024? Today the answer is unambiguous: it is allowed вЂ” primarily because there is no legislative ban."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Current mining legislation","src":"/images/articles/mining-legal-russia/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"At the same time, it is important to remember three key points that allow mining digital gold under Russian law:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Mining requires a legal status, as with any other business activity;","Income from mining is subject to tax;","Since mining is a form of entrepreneurship, electricity must be paid at the commercial rate."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We will examine each of these aspects separately to answer in detail whether mining is legal in Russia."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Legal status","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To mine legally and not worry about possible sanctions from the authorities, you first need to register as an individual entrepreneur or a self-employed person. The second option is preferable for three reasons:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["A lower tax;","No additional social contributions;","A simple system for registration, running the business, and paying taxes."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Self-employed status is registered in the вЂњMy TaxвЂќ app, on Gosuslugi, or through an accredited bank. Tax is withheld automatically at 4вЂ“6% of account inflows. There are no pension fund or insurance payments. By contrast, individual entrepreneur status requires bookkeeping, tax at a rate from 6%, and additional payments to state bodies (insurance and future pension)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Paying taxes","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Whatever business format the miner chooses (individual entrepreneur or self-employment), taxes must be paid. Refusal to pay, incomplete payments, or late payments can lead to criminal liability вЂ” from fines to imprisonment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Self-employment has the advantage that the tax amount is withheld automatically from the minerвЂ™s account."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is an important limit, though: if a self-employed personвЂ™s annual income exceeds 2,400,000 rubles, they must register as an individual entrepreneur or split mining proceeds among different people. That is the only restriction that may limit using self-employment for official mining activity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Paying for electricity","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The vast majority of private miners use public power grids and pay residential rates. That is also not entirely correct under the law, because business activity has its own terms вЂ” the so-called commercial tariff."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Real examples of penalties for using residential rates for mining do exist. For now they number only in the dozens per year, but the number of such violations being recorded is steadily growing."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Paying for electricity when mining","src":"/images/articles/mining-legal-russia/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Business tariffs are far less attractive than вЂњhomeвЂќ use or mining crypto in a garage. But for full compliance with current law, the commercial format is the correct one. Abuses are quickly spotted by utilities, because any ASIC farm consumes a substantial amount of power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Is mining legal in Russia: conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Answering whether mining is legal in Russia, we can give a confident yes вЂ” but legal compliance is possible only in three cases."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"You mine cryptocurrency as a business (individual entrepreneur or self-employed status), pay taxes on time and in full, and use the commercial electricity tariff for mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Only then is mining fully legal: you can feel completely secure under the law without legal gray areas or possible liability for illegal business activity in Russia."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$razreshen-li-majning-v-rossii$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$RussiaвЂ™s mining registry: what it is and who must join$tmj$,
       $tmj$Who must register as a miner, what the requirements are, the roles of Minkomsvyaz and Roskomnadzor, plus FAQ.$tmj$,
       $tmj$Mining registry in Russia$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
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
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In August 2024, a law was signed defining how mining activity is regulated in Russia; it took effect on November 1, 2024. It is about legalizing digital currency mining in the Russian Federation вЂ” a starting point for systematizing this activity. Under the law, miners must join a specialized registry, or their activity will be illegal. We will explain what this is, how to get on the lists, who oversees them, and who must submit their data to the registry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is the mining registry in Russia?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The supervisory agency tasked with systematizing cryptocurrency mining in Russia is the Ministry of Digital Development, Communications and Mass Media of the Russian Federation (Minkomsvyaz for short). The Minkomsvyaz registry is the list that every miner in the country operating as an individual entrepreneur or legal entity must join."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In addition to farm owners, mining pools and hosting operators must also join the registry: this requirement is likewise mandatory for legal activity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"What is the mining registry in Russia","src":"/images/articles/mining-registry-russia/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What other requirements for cryptocurrency mining, besides registry enrollment, does the new law introduce:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Reporting. Authorities must receive information about the minerвЂ™s wallets and volumes of mined cryptocurrency;","Compliance with electricity caps set by regional authorities;","A ban on advertising cryptocurrencies, as well as using digital assets as payment for goods or services."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another participant in the process is the Federal Service for Supervision of Communications, Information Technology and Mass Media (Roskomnadzor)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This agencyвЂ™s role is to oversee correct maintenance of the registry, including adding and removing participants."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Who must join the registry?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The following market participants must apply to Minkomsvyaz to join the mining registry:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["ASIC and farm owners operating as individual entrepreneurs or legal entities;","Mining hotels and hostings that place clientsвЂ™ equipment;","Pools registered in Russia;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Individuals are exempt from applying for registry enrollment: private miners face fewer restrictions вЂ” compliance with electricity consumption caps, and bans on advertising and using cryptocurrencies as a means of payment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are also restrictions for those who have no legal right to mine digital assets in Russia. These categories include:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Citizens with an unexpunged conviction for economic crimes (for example, money laundering);","Persons involved with terrorist or extremist organizations;","Companies related to the generation, transmission, and purchase of electricity."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A ban on mining activity may also be introduced in specific regions of the country."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As a rule, these are regions with a shortage of power capacity: farms can worsen an already difficult energy situation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How do you join the mining registry in Russia?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The enrollment procedure as of late summer 2024 had not been defined: it will be regulated by additional legislative acts, as will many other clarifications of the new mining law."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Q&A","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Q&A on the mining registry","src":"/images/articles/mining-registry-russia/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"There are no legislative acts on this yet вЂ” they will appear soon. Regional authorities will likely be able to set consumption caps individually.","title":"What electricity limits are we talking about?"},{"text":"It is premature to say so, because there are no separate OKVED codes or specialized tax rules for miners yet.","title":"Can we say mining in Russia has become a standalone type of entrepreneurial activity?"},{"text":"Average consumption figures will likely be used for this. Energy retail specialists will monitor consumption under rules adopted in the future.","title":"How will exceeding the limits be detected?"},{"text":"There are several options. First, you can register as an individual entrepreneur or legal entity to mine under the registry. Second, you can distribute equipment across locations in different regions.","title":"What if a miner hits the set limits?"},{"text":"At this stage such formats do not exist due to the absence of several regulations governing the activity (OKVED, tax base, etc.). Over time, as the segment develops, similar subsidies may appear.","title":"If mining is now officially allowed, are there any subsidies or state support measures?"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 22
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
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The summer 2024 law legalizing mining in Russia is the first step toward regulating the sector. Although many points are not yet covered and important legislative clarifications are missing, in the coming years this area will face thorough oversight and regulation by Russian authorities. The registry of persons mining digital currency is the opening stage of a new trend."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-algoritmov-majninga-na-asikah-top-10
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Top 10 ASIC mining algorithms$tmj$,
       $tmj$The most popular ASIC algorithms among miners вЂ” proven, reliable formats and what drives their profitability.$tmj$,
       $tmj$Data center with mining ASICs$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
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
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ASIC crypto mining industry unites many algorithms, but only 10 of them enjoy elevated popularity among miners. These are proven, reliable, and efficient formats whose profitability has been tested by time and confirmed by manufacturer recognition. LetвЂ™s look at the TOP-10 best ASIC algorithms and which miners work within these standards.","text":"The ASIC crypto mining industry unites many algorithms, but only 10 of them enjoy elevated popularity among miners. These are proven, reliable, and efficient formats whose profitability has been tested by time and confirmed by manufacturer recognition. LetвЂ™s look at the TOP-10 best ASIC algorithms and which miners work within these standards."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Data center with mining ASICs","src":"/images/articles/mining-algorithms/datacenter-blue.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a mining algorithm","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining algorithm is a cryptographic function used to hash data and create new blocks on a blockchain network. More simply, the algorithm sets the format of the task miners must solve to вЂњwriteвЂќ the next block into the chain. For successfully solving that task the miner receives a reward вЂ” new cryptocurrency and fees for transactions included in the block.","text":"A mining algorithm is a cryptographic function used to hash data and create new blocks on a blockchain network. More simply, the algorithm sets the format of the task miners must solve to вЂњwriteвЂќ the next block into the chain. For successfully solving that task the miner receives a reward вЂ” new cryptocurrency and fees for transactions included in the block."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Each cryptocurrency uses its own algorithm. Some algorithms are more resistant to specialized hardware (ASICs), others require high memory bandwidth or large compute power. That directly affects mining accessibility for ordinary users and its profitability.","text":"Each cryptocurrency uses its own algorithm. Some algorithms are more resistant to specialized hardware (ASICs), others require high memory bandwidth or large compute power. That directly affects mining accessibility for ordinary users and its profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC miner printed circuit board","src":"/images/articles/mining-algorithms/pcb-gold.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How the algorithm works in mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At the core of any algorithm is hashing вЂ” transforming input data into a unique fixed-length string (a hash). Miner devices try millions of hashes per second to find one that matches the current blockвЂ™s conditions. Once a suitable hash is found, the block is considered solved, the miner receives a reward, and the block is added to the blockchain.","text":"At the core of any algorithm is hashing вЂ” transforming input data into a unique fixed-length string (a hash). Miner devices try millions of hashes per second to find one that matches the current blockвЂ™s conditions. Once a suitable hash is found, the block is considered solved, the miner receives a reward, and the block is added to the blockchain."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Operating features depend on the algorithm:","text":"Operating features depend on the algorithm:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["SHA-256 вЂ” requires high compute power, aimed at fast hash enumeration;","Ethash and Equihash вЂ” use large amounts of video memory to complicate creating ASIC equipment;","RandomX вЂ” emphasizes RAM and CPU power, suitable for CPU mining;","Scrypt вЂ” combines memory and compute, requiring a balanced ASIC architecture."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitmain Antminer ASIC miner","src":"/images/articles/mining-algorithms/asic-front.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Differences between algorithms","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining algorithms differ by the following parameters:","text":"Mining algorithms differ by the following parameters:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Supported hardware type вЂ” GPU, CPU, or ASICs;","Compute difficulty and hashrate вЂ” this determines energy consumption and profitability;","Required memory volume вЂ” affects hardware compatibility;","Degree of centralization вЂ” ASIC-friendly algorithms often lead to hashrate centralization;","51% attack protection вЂ” some algorithms have built-in resilience mechanisms."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Which equipment suits different algorithms:","text":"Which equipment suits different algorithms:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["SHA-256: ASIC devices (Antminer S21, WhatsMiner M60, Avalon A1466);","Ethash: GPU (NVIDIA RTX 3080, AMD RX 6800) and ASIC (Jasminer X16-P, iPollo V1);","Scrypt: ASIC (Antminer L9, Elphapex DG1);","RandomX: powerful CPUs (AMD Ryzen 9, Intel i9);","KawPow: modern GPUs (NVIDIA RTX 3080 Ti, RX 6600 XT);","Equihash: GPU (NVIDIA GTX 1080 Ti, RTX 2070); ASICs also exist."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrency coins","src":"/images/articles/mining-algorithms/coins-gold.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: X11","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The X11 standard got its name for a reason: this format unites 11 hashing algorithms at once: BLAKE, SHAvite-3, Keccak, Luffa, Blue Midnight Wish, GrГёstl, SIMD, JH, Skein, CubeHash, and Echo. That is how X11 logic was launched in 2013 by Evan Duffield, who also created DASH. Notably, that is effectively the only asset you can realistically earn by running X11 today.","text":"The X11 standard got its name for a reason: this format unites 11 hashing algorithms at once: BLAKE, SHAvite-3, Keccak, Luffa, Blue Midnight Wish, GrГёstl, SIMD, JH, Skein, CubeHash, and Echo. That is how X11 logic was launched in 2013 by Evan Duffield, who also created DASH. Notably, that is effectively the only asset you can realistically earn by running X11 today."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The algorithm can be considered a fairly flexible and universal tool: it could mine more than a hundred coins, but at present the absolute majority are no longer supported by development teams, although the tokens are still on exchanges. X11 can run on CPUs, GPUs, and dedicated ASICs, which drove the algorithmвЂ™s popularity several years ago. Today, however, extracting profitability on CPU is difficult due to high difficulty, and finding a suitable asset for other devices takes time (DASH being the exception).","text":"The algorithm can be considered a fairly flexible and universal tool: it could mine more than a hundred coins, but at present the absolute majority are no longer supported by development teams, although the tokens are still on exchanges. X11 can run on CPUs, GPUs, and dedicated ASICs, which drove the algorithmвЂ™s popularity several years ago. Today, however, extracting profitability on CPU is difficult due to high difficulty, and finding a suitable asset for other devices takes time (DASH being the exception)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC for the X11 algorithm","src":"/images/articles/mining-algorithms/asic-psu.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2013"},{"label":"Suitable devices","value":"CPU, GPU, ASICs"},{"label":"Number of coins","value":"more than 100"},{"label":"Best-known tokens","value":"DASH, BLOCX, NET, OSMI"},{"label":"Best ASICs for the job","value":"Antminer D9"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A small number of profitable coins;","High equipment cost while more accessible and profitable analogs exist."],"pros":["Ability to work on ASICs and GPUs;","High security thanks to using 11 algorithms;","Low competition on the network."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Cuckatoo32","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Cuckatoo32 algorithm was created to obtain the fairly well-known GRIN cryptocurrency вЂ” this asset can be mined with both GPUs and ASICs. When developing the standard, authors accounted for one of minersвЂ™ key problems вЂ” unchecked growth in mining difficulty. That is why farm owners mining GRIN can feel relatively calm, as network hashrate remains stable.","text":"The Cuckatoo32 algorithm was created to obtain the fairly well-known GRIN cryptocurrency вЂ” this asset can be mined with both GPUs and ASICs. When developing the standard, authors accounted for one of minersвЂ™ key problems вЂ” unchecked growth in mining difficulty. That is why farm owners mining GRIN can feel relatively calm, as network hashrate remains stable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Most Cuckatoo32 users prefer GPU mining, but ASIC fans also have several device models. Such an investment approach is fairly risky, because besides GRIN these miners cannot mine alternative coins.","text":"Most Cuckatoo32 users prefer GPU mining, but ASIC fans also have several device models. Such an investment approach is fairly risky, because besides GRIN these miners cannot mine alternative coins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC for the Cuckatoo32 algorithm","src":"/images/articles/mining-algorithms/asic-side.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2020"},{"label":"Suitable devices","value":"GPU, ASICs"},{"label":"Number of coins","value":"1"},{"label":"Best-known tokens","value":"GRIN"},{"label":"Best ASICs for the job","value":"iPollo G1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Only 1 coin available for mining;","Many Cuckatoo32 ASICs are not adapted to work with alternative tokens."],"pros":["Implementation on both GPUs and dedicated ASICs;","Stable network hashrate."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Blake2S","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With Blake2S you can mine many diverse assets: from known popular coins (for example Kadena вЂ“ KDA) to less relevant tokens (XVG, XSH, HONEY, TAJ, NEVA, PUPA, and BLAS). The standard is used in dedicated ASICs primarily aimed at mining Kadena. Peak popularity of this format was in 2023вЂ“2024, but due to rapidly rising Kadena mining difficulty, Blake2S relevance has noticeably declined.","text":"With Blake2S you can mine many diverse assets: from known popular coins (for example Kadena вЂ“ KDA) to less relevant tokens (XVG, XSH, HONEY, TAJ, NEVA, PUPA, and BLAS). The standard is used in dedicated ASICs primarily aimed at mining Kadena. Peak popularity of this format was in 2023вЂ“2024, but due to rapidly rising Kadena mining difficulty, Blake2S relevance has noticeably declined."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Blake2S belongs to the Blake algorithm group, which among other things also has alternative formats for other assets. But it is the 2S modification that is popular with miners who chose altcoins with small market caps.","text":"Blake2S belongs to the Blake algorithm group, which among other things also has alternative formats for other assets. But it is the 2S modification that is popular with miners who chose altcoins with small market caps."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC for the Blake2S algorithm","src":"/images/articles/mining-algorithms/asic-bitmain.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2012"},{"label":"Suitable devices","value":"ASICs"},{"label":"Number of coins","value":"more than 10"},{"label":"Best-known tokens","value":"KDA, XVG, XSH, HONEY, TAJ, NEVA, PUPA and BLAS"},{"label":"Best ASICs for the job","value":"Antminer KA3"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Narrow profitable-use profile вЂ” a small number of profitable coins;","Significantly increased network difficulty reduced miner incomes."],"pros":["A fairly old and proven format;","High operating reliability;","Excellent interaction speed;","Minimal probability of errors."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: RandomX","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The RandomX algorithm launched in 2019, and a key development goal was protecting mining from a rapid ASIC invasion. Spoiler: ultimately the project authors failed вЂ” today RandomX is equally successfully used by GPUs, CPUs, and those same ASICs. The standard can work in two modes вЂ” fast and lightweight вЂ” depending on the potential of the hardware used.","text":"The RandomX algorithm launched in 2019, and a key development goal was protecting mining from a rapid ASIC invasion. Spoiler: ultimately the project authors failed вЂ” today RandomX is equally successfully used by GPUs, CPUs, and those same ASICs. The standard can work in two modes вЂ” fast and lightweight вЂ” depending on the potential of the hardware used."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One advantage of RandomX is the ability to mine several coins: familiar Zephyr (ZEPH) and Monero (XMR), plus less popular EPIC, YDA, XDAG, SAL. The work format is still relevant: the algorithm is equally successfully used by card owners and by owners of full ASIC farms.","text":"One advantage of RandomX is the ability to mine several coins: familiar Zephyr (ZEPH) and Monero (XMR), plus less popular EPIC, YDA, XDAG, SAL. The work format is still relevant: the algorithm is equally successfully used by card owners and by owners of full ASIC farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC for the RandomX algorithm","src":"/images/articles/mining-algorithms/asic-dark.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2019"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"more than 10"},{"label":"Best-known tokens","value":"ZEPH, XMR, EPIC, YDA, XDAG, SAL"},{"label":"Best ASICs for the job","value":"Antminer XMR Miner X5"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The original task (ASIC protection) was not solved by the creators;","Format difficulty."],"pros":["Adaptability for CPU, GPU, and ASICs;","A fairly large number of active coins;","Two operating modes."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Equihash","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"EquihashвЂ™s fate is very similar to RandomXвЂ™s story: the standard was also developed as ASIC-resistant, but ultimately miner manufacturers prevailed. Today classic ASICs successfully run on Equihash and can mine many coins and tokens. Among them: ZEC, KMD, ZCL, ZER, HUSH, and ZEN. Some assets are well known not only to miners but also to traders.","text":"EquihashвЂ™s fate is very similar to RandomXвЂ™s story: the standard was also developed as ASIC-resistant, but ultimately miner manufacturers prevailed. Today classic ASICs successfully run on Equihash and can mine many coins and tokens. Among them: ZEC, KMD, ZCL, ZER, HUSH, and ZEN. Some assets are well known not only to miners but also to traders."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Equihash can be called an extremely flexible algorithm: it can be used on CPUs, GPUs, and ASICs (but miners deliver maximum profitability). Difficulty within this format has grown significantly, which only proves the obvious: ASIC manufacturers see no obstacles created by algorithm developers. And if a standard is designed as a GPU baseline, over time (and with market interest) the token can be mined with miners.","text":"Equihash can be called an extremely flexible algorithm: it can be used on CPUs, GPUs, and ASICs (but miners deliver maximum profitability). Difficulty within this format has grown significantly, which only proves the obvious: ASIC manufacturers see no obstacles created by algorithm developers. And if a standard is designed as a GPU baseline, over time (and with market interest) the token can be mined with miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2016"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"more than 10"},{"label":"Best-known tokens","value":"ZEC, KMD, ZCL, ZER, HUSH, ZEN"},{"label":"Best ASICs for the job","value":"Antminer Z15 Pro"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["The ASIC-protection question was not solved."],"pros":["Work on CPU, GPU, and ASICs;","A large number of well-known coins;","Solving the centralization problem."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Blake3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Blake3 technology launched in 2020, but special attention came in 2024 when Alephium (ALPH) appeared within the PoW algorithm. At launch it was one of the most profitable altcoins when running BitmainвЂ™s dedicated Antminer AL1 ASIC. But Blake3 is not only for miners: CPU and GPU owners also actively use the format when running their farms.","text":"Blake3 technology launched in 2020, but special attention came in 2024 when Alephium (ALPH) appeared within the PoW algorithm. At launch it was one of the most profitable altcoins when running BitmainвЂ™s dedicated Antminer AL1 ASIC. But Blake3 is not only for miners: CPU and GPU owners also actively use the format when running their farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"You cannot call the algorithm suitable for mining a large number of tokens: users have only a few options, including Alephium (ALPH), Iron Fish (IRON), Decred (DCR), and UNIUM (UNM). For ASIC owners there are potential risks, because if these coinsвЂ™ prices fail, miner payback periods will grow significantly.","text":"You cannot call the algorithm suitable for mining a large number of tokens: users have only a few options, including Alephium (ALPH), Iron Fish (IRON), Decred (DCR), and UNIUM (UNM). For ASIC owners there are potential risks, because if these coinsвЂ™ prices fail, miner payback periods will grow significantly."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2020"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"4"},{"label":"Best-known tokens","value":"ALPH, IRON, DCR, UNM"},{"label":"Best ASICs for the job","value":"Antminer AL1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A small number of coins available for mining;","The Antminer AL1 launch made work on other devices less profitable."],"pros":["The algorithm suits CPUs, GPUs, and ASICs;","Maximum ASIC profitability in 2024 among all altcoins."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Ethash","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the worldвЂ™s best-known algorithms: within this standard the top altcoin by market cap was mined вЂ” Ethereum (before its move to PoS in 2022). One of the mechanismвЂ™s developers is Vitalik Buterin, who authored the Dagger technology. Together with the second mechanic (Hashimoto, creator вЂ” Thaddeus Dryja) that is the famous format best known to GPU owners.","text":"One of the worldвЂ™s best-known algorithms: within this standard the top altcoin by market cap was mined вЂ” Ethereum (before its move to PoS in 2022). One of the mechanismвЂ™s developers is Vitalik Buterin, who authored the Dagger technology. Together with the second mechanic (Hashimoto, creator вЂ” Thaddeus Dryja) that is the famous format best known to GPU owners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite EthereumвЂ™s move, the Ethash algorithm is still relevant: it is used to mine many known coins, for example Ethereum Classic (ETC), Pirl (PIRL), Ubiq (UBQ), Expanse (EXP), Callisto (CLO), and Metaverse (ETP). Users have access to more than 15 tokens, and Ethash can run on CPUs, GPUs, and ASICs.","text":"Despite EthereumвЂ™s move, the Ethash algorithm is still relevant: it is used to mine many known coins, for example Ethereum Classic (ETC), Pirl (PIRL), Ubiq (UBQ), Expanse (EXP), Callisto (CLO), and Metaverse (ETP). Users have access to more than 15 tokens, and Ethash can run on CPUs, GPUs, and ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ethereum and the Ethash algorithm","src":"/images/articles/mining-algorithms/ethereum-circuit.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2015"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"16"},{"label":"Best-known tokens","value":"ETC, PIRL, UBQ, EXP, CLO, ETP"},{"label":"Best ASICs for the job","value":"Antminer E9 Pro, Jasminer X16-Q, iPollo V1 and iPollo V1 mini"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Profitability decline after Ethereum moved to PoS;","High competition."],"pros":["A reliable and proven algorithm;","Many coins available for mining;","Work on CPU, GPU, and ASICs;","An impressive ASIC assortment (for both classic and home use)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: kHeavyHash","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Kaspa cryptocurrency exploded in popularity in 2023 together with ASICs created to work with this asset. Mining uses the kHeavyHash algorithm, which quickly became popular and one of the key ones. Besides KAS, two more coins can be mined this way вЂ” Sedra (SDA) and Bugna (BGA).","text":"The Kaspa cryptocurrency exploded in popularity in 2023 together with ASICs created to work with this asset. Mining uses the kHeavyHash algorithm, which quickly became popular and one of the key ones. Besides KAS, two more coins can be mined this way вЂ” Sedra (SDA) and Bugna (BGA)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Narrow hardware specialization on kHeavyHash is the key drawback of this work format. If the three coinsвЂ™ prices fall, investment recovery periods will grow significantly. In addition, Kaspa mining difficulty grows extremely fast, which negatively affects miner profitability. Even so, many still choose this direction among many other altcoins.","text":"Narrow hardware specialization on kHeavyHash is the key drawback of this work format. If the three coinsвЂ™ prices fall, investment recovery periods will grow significantly. In addition, Kaspa mining difficulty grows extremely fast, which negatively affects miner profitability. Even so, many still choose this direction among many other altcoins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Kaspa вЂ” kHeavyHash algorithm","src":"/images/articles/mining-algorithms/kaspa.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2022"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"3"},{"label":"Best-known tokens","value":"KAS, SDA, BGA"},{"label":"Best ASICs for the job","value":"Antminer KS5, IceRiver KAS"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Rapidly growing mining difficulty;","Only 3 coins within the algorithm."],"pros":["Noticeable profitability among other altcoins;","Ability to run on GPUs and ASICs;","An improved version of the base HeavyHash algorithm."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Scrypt","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the most popular and profitable altcoin algorithms is Scrypt: it is how LTC + DOGE are mined, and since 2024 Bellscoin was added as well. Merged mining of three assets at once yields elevated returns, and DogecoinвЂ™s rapid price growth turns ASIC work into a profitable investment project. In total Scrypt has more than twenty tokens available; mining with this algorithm can even start on cards and CPUs.","text":"One of the most popular and profitable altcoin algorithms is Scrypt: it is how LTC + DOGE are mined, and since 2024 Bellscoin was added as well. Merged mining of three assets at once yields elevated returns, and DogecoinвЂ™s rapid price growth turns ASIC work into a profitable investment project. In total Scrypt has more than twenty tokens available; mining with this algorithm can even start on cards and CPUs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite appearing in 2012, Scrypt remains highly popular today. Many miners choose merged mining of three coins at once, preferring this format even to Bitcoin mining. And that decision looks justified, because LTC + DOGE are foundational coins of the entire crypto market, and Bellscoin can be seen as a pleasant bonus that increases profitability.","text":"Despite appearing in 2012, Scrypt remains highly popular today. Many miners choose merged mining of three coins at once, preferring this format even to Bitcoin mining. And that decision looks justified, because LTC + DOGE are foundational coins of the entire crypto market, and Bellscoin can be seen as a pleasant bonus that increases profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Scrypt вЂ” LTC, DOGE and other coins","src":"/images/articles/mining-algorithms/coins-silver.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2012"},{"label":"Suitable devices","value":"CPUs, GPUs, ASICs"},{"label":"Number of coins","value":"22"},{"label":"Best-known tokens","value":"LTC, DOGE, BEL, GLC, TROLL, PUT, PIRATE, LDOGE, THC, ARCO"},{"label":"Best ASICs for the job","value":"Antminer L9, Elphapex DG1"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost of top-tier equipment;","Serious volatility of the main asset вЂ” DOGE."],"pros":["A profitable merged mining format;","Excellent profitability;","High reliability of base assets;","Many coins available for mining;","Work on CPUs, cards, and ASICs."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: SHA-256","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Undisputed leadership belongs to Bitcoin mining as the foundational currency of the entire digital-asset segment. The process is based on SHA-256, which appeared in 2009 (from foundational work in 2001). The author is Satoshi Nakamoto, whose identity remains unknown. Today many industrial miners build their investment activity around the Bitcoin blockchain, so SHA-256 can be considered the irreplaceable foundation of the entire niche.","text":"Undisputed leadership belongs to Bitcoin mining as the foundational currency of the entire digital-asset segment. The process is based on SHA-256, which appeared in 2009 (from foundational work in 2001). The author is Satoshi Nakamoto, whose identity remains unknown. Today many industrial miners build their investment activity around the Bitcoin blockchain, so SHA-256 can be considered the irreplaceable foundation of the entire niche."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SHA-256 ASIC income is highly predictable; the format has existed for a long time and has already felt the impact of three halvings. Network difficulty grows quickly, proving miner activity and manufacturersвЂ™ desire to create newer, more powerful, and more energy-efficient equipment.","text":"SHA-256 ASIC income is highly predictable; the format has existed for a long time and has already felt the impact of three halvings. Network difficulty grows quickly, proving miner activity and manufacturersвЂ™ desire to create newer, more powerful, and more energy-efficient equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Launch year","value":"2009"},{"label":"Suitable devices","value":"ASICs"},{"label":"Number of coins","value":"31"},{"label":"Best-known tokens","value":"BTC, BCH, BCHSV, BCD, NMC, ILC, PZM, ADM, FB"},{"label":"Best ASICs for the job","value":"Antminer 21st series, Whatsminer 5th and 6th generation"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Rapidly growing difficulty;","Need to buy powerful equipment;","Inability to mine on cards and CPUs."],"pros":["The oldest mining algorithm;","Working with the foundational asset вЂ” BTC;","Extremely predictable profitability;","Minimal volatility;","Many ASICs available to choose from;","Appearance of merged mining functionality in 2024 (Fractal Bitcoin coin)."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 74
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
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A mining algorithm is the foundation of an entire cryptocurrency networkвЂ™s infrastructure. Its choice directly affects equipment type, costs, profitability, and even mining investment strategy.","text":"A mining algorithm is the foundation of an entire cryptocurrency networkвЂ™s infrastructure. Its choice directly affects equipment type, costs, profitability, and even mining investment strategy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For experienced miners with access to cheap electricity, SHA-256 or Scrypt can be profitable вЂ” they require powerful ASICs but also deliver stable income.","text":"For experienced miners with access to cheap electricity, SHA-256 or Scrypt can be profitable вЂ” they require powerful ASICs but also deliver stable income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Regardless of choice, it is important to account for the cryptocurrencyвЂ™s own prospects, network difficulty, electricity price, and the overall competitive environment. Deep understanding of algorithms is not just theory, but a tool for competent, profitable mining.","text":"Regardless of choice, it is important to account for the cryptocurrencyвЂ™s own prospects, network difficulty, electricity price, and the overall competitive environment. Deep understanding of algorithms is not just theory, but a tool for competent, profitable mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-algoritmov-majninga-na-asikah-top-10$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best Scrypt ASICs for DOGE and LTC$tmj$,
       $tmj$Top Scrypt miners for Dogecoin and Litecoin вЂ” from Elphapex DG Home 1 to Antminer L11 Hydro 6U.$tmj$,
       $tmj$Dogecoin and Scrypt mining$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
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
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Scrypt is the most popular digital-asset mining standard after Bitcoin mining on SHA-256. There are many reasons for this algorithmвЂ™s popularity вЂ” from Elon MuskвЂ™s support of DOGE to merged mining of six coins at once (LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO), which maximizes profitability without extra costs. LetвЂ™s look at the TOP-10 most popular Scrypt miners: we will analyze classic models and also note a couple of formats ideally adapted for home use.","text":"Scrypt is the most popular digital-asset mining standard after Bitcoin mining on SHA-256. There are many reasons for this algorithmвЂ™s popularity вЂ” from Elon MuskвЂ™s support of DOGE to merged mining of six coins at once (LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO), which maximizes profitability without extra costs. LetвЂ™s look at the TOP-10 most popular Scrypt miners: we will analyze classic models and also note a couple of formats ideally adapted for home use."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Dogecoin and merged mining on Scrypt","src":"/images/articles/scrypt-miners/doge-scrypt-intro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The Scrypt algorithm: from creation to advantages","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Scrypt was proposed in 2009 by Colin Percival as a password-protection function requiring large amounts of memory to hinder cracking. In 2011 Charlie Lee used it when creating Litecoin вЂ” a Bitcoin alternative with faster transactions and a focus on decentralization.","text":"Scrypt was proposed in 2009 by Colin Percival as a password-protection function requiring large amounts of memory to hinder cracking. In 2011 Charlie Lee used it when creating Litecoin вЂ” a Bitcoin alternative with faster transactions and a focus on decentralization."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main idea: offer mining on ordinary GPUs and CPUs, requiring modest compute power. That made Scrypt more вЂњdemocraticвЂќ in the early years вЂ” even ordinary users could mine.","text":"The main idea: offer mining on ordinary GPUs and CPUs, requiring modest compute power. That made Scrypt more вЂњdemocraticвЂќ in the early years вЂ” even ordinary users could mine."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages of the Scrypt algorithm:","text":"Advantages of the Scrypt algorithm:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Merged mining support. For example, you can mine Litecoin and Dogecoin at the same time (plus several other coins), receiving reward for parallel work without losing power;","A more democratic start. The algorithm was conceived as protection against mining centralization, though Scrypt ASICs appeared over time;","Low entry barrier. There are still Scrypt coins that can be mined even with relatively inexpensive equipment;","Fast transactions and low fees for many Scrypt coins."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The best-known coins mined on the Scrypt algorithm:","text":"The best-known coins mined on the Scrypt algorithm:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Litecoin (LTC) вЂ” вЂњdigital silver,вЂќ the main and first Scrypt coin;","Dogecoin (DOGE) вЂ” a popular meme coin, actively used in merged mining with Litecoin. Supported by Elon Musk;","Viacoin (VIA) вЂ” fast transactions and high scalability;","DigiByte (DGB) вЂ” a multi-algorithm network that partially uses Scrypt."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Merged mining deserves a separate note: Scrypt allows mining several compatible coins at once without increasing energy costs. This is done via so-called вЂњauxiliary proof-of-work.вЂќ","text":"Merged mining deserves a separate note: Scrypt allows mining several compatible coins at once without increasing energy costs. This is done via so-called вЂњauxiliary proof-of-work.вЂќ"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For example, by mining Litecoin you automatically also mine Dogecoin if the pool supports it. The approach increases profitability and reduces risks.","text":"For example, by mining Litecoin you automatically also mine Dogecoin if the pool supports it. The approach increases profitability and reduces risks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In total, merged mining on Scrypt covers 7 coins: LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO. That is a tangible advantage of the format, interesting from both marketing and practical viewpoints.","text":"In total, merged mining on Scrypt covers 7 coins: LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO. That is a tangible advantage of the format, interesting from both marketing and practical viewpoints."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Elphapex DG Home 1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The second home ASIC in our ranking is the DG Home 1 from relatively new manufacturer Elphapex. Unlike its predecessor, this miner has more impressive power вЂ” 2,100 MH/s вЂ” which at only 630 W consumption makes it highly energy-efficient. The unit looks like a modern PC case, letting the model fit any interior.","text":"The second home ASIC in our ranking is the DG Home 1 from relatively new manufacturer Elphapex. Unlike its predecessor, this miner has more impressive power вЂ” 2,100 MH/s вЂ” which at only 630 W consumption makes it highly energy-efficient. The unit looks like a modern PC case, letting the model fit any interior."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Among DG Home 1 drawbacks is the youth of both the ASIC itself and the manufacturer. Elphapex has not yet proven product quality over time, as the brand entered the market relatively recently. Moreover, the model is also new: the manufacturerвЂ™s first miners were classic industrial formats, and only later did a home-use version appear.","text":"Among DG Home 1 drawbacks is the youth of both the ASIC itself and the manufacturer. Elphapex has not yet proven product quality over time, as the brand entered the market relatively recently. Moreover, the model is also new: the manufacturerвЂ™s first miners were classic industrial formats, and only later did a home-use version appear."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Elphapex DG Home 1","src":"/images/articles/scrypt-miners/elphapex-dg-home-1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Release year","value":"2024"},{"label":"Base hashrate","value":"2100 MH/s"},{"label":"Power consumption","value":"630 W"},{"label":"Energy efficiency","value":"0.3 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Dimensions","value":"57 x 54 x 32 cm"},{"label":"Weight","value":"10.3 kg"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young manufacturer","A new model whose reliability still has to be proven","50 dB is a fairly serious noise threshold for use in living spaces"],"pros":["A powerful ASIC for home launch on Scrypt","Decent energy efficiency"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Antminer L7","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An ASIC from the worldвЂ™s leading crypto mining hardware manufacturer. BitmainвЂ™s seventh Scrypt miner series unites several devices of different power (from 8,500 to 9,500 MH/s). The model began losing relevance as more powerful alternatives appeared, but DogecoinвЂ™s rising price and new coins in merged mining made Antminer L7 work profitable and relevant again.","text":"An ASIC from the worldвЂ™s leading crypto mining hardware manufacturer. BitmainвЂ™s seventh Scrypt miner series unites several devices of different power (from 8,500 to 9,500 MH/s). The model began losing relevance as more powerful alternatives appeared, but DogecoinвЂ™s rising price and new coins in merged mining made Antminer L7 work profitable and relevant again."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model ships in a classic industrial miner form factor with matching specs вЂ” high power draw, an impressive amount of heat, and serious noise. Running such hardware at home is possible only with a quality soundproof box, but L7 profitability significantly exceeds the benefits of home-format miners.","text":"The model ships in a classic industrial miner form factor with matching specs вЂ” high power draw, an impressive amount of heat, and serious noise. Running such hardware at home is possible only with a quality soundproof box, but L7 profitability significantly exceeds the benefits of home-format miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L7","src":"/images/articles/scrypt-miners/antminer-l7.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2021"},{"label":"Base hashrate","value":"9,500 MH/s"},{"label":"Power consumption","value":"3,500 W"},{"label":"Energy efficiency","value":"0.36 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Dimensions","value":"37 x 19.5 x 29 cm"},{"label":"Weight","value":"15 kg"},{"label":"Noise level","value":"70 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["An aging ASIC whose prospects depend on the DOGE price","Not the best energy efficiency","Industrial format with no comfortable home launch option"],"pros":["A leading brand with a good reputation","An old, proven model with plenty of spare parts and repair shops","Confident profitability even despite newer-generation miners","Relevance on the secondary market"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Elphapex DG1","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The young company Elphapex made a loud entrance with the DG1 and DG1+ miner lineup on Scrypt. The series put serious competitive pressure on Bitmain products, as the newcomers drew attention not only with specs but also with a lower price. The brand still has to prove its hardwareвЂ™s reliability, but such a confident start convinces investors that another strong market player has appeared.","text":"The young company Elphapex made a loud entrance with the DG1 and DG1+ miner lineup on Scrypt. The series put serious competitive pressure on Bitmain products, as the newcomers drew attention not only with specs but also with a lower price. The brand still has to prove its hardwareвЂ™s reliability, but such a confident start convinces investors that another strong market player has appeared."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing Elphapex products, you can prefer ASICs of different power вЂ” from 8,000 to 14,400 MH/s. Thus the DG1 lineup almost fully mirrors the Antminer L7 and L9 assortment, which is the basis of the manufacturerвЂ™s success. Elphapex lags Bitmain only in the top-model segment, but that may be only a temporary issue for the new brand.","text":"Choosing Elphapex products, you can prefer ASICs of different power вЂ” from 8,000 to 14,400 MH/s. Thus the DG1 lineup almost fully mirrors the Antminer L7 and L9 assortment, which is the basis of the manufacturerвЂ™s success. Elphapex lags Bitmain only in the top-model segment, but that may be only a temporary issue for the new brand."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Elphapex DG1","src":"/images/articles/scrypt-miners/elphapex-dg1.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Release year","value":"2024"},{"label":"Maximum hashrate","value":"14,400 MH/s"},{"label":"Power consumption","value":"3,920 W"},{"label":"Energy efficiency","value":"0.27 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Dimensions","value":"58 x 34 x 43 cm"},{"label":"Weight","value":"18.3 kg"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young manufacturer","Possible difficulties with spare parts and repair"],"pros":["A rich lineup of diverse models","Lower cost (compared with competitors)","Excellent energy efficiency"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Antminer L9","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The most powerful and profitable Scrypt ASIC is BitmainвЂ™s top Antminer L9 model. With impressive performance and energy-efficiency specs, the miner stands out not only for peak profitability but also for an impressive price вЂ” you will pay significantly more for the L9 than for similar models. That is understandable, because the equipment appeared relatively recently and currently has exemplary technical parameters.","text":"The most powerful and profitable Scrypt ASIC is BitmainвЂ™s top Antminer L9 model. With impressive performance and energy-efficiency specs, the miner stands out not only for peak profitability but also for an impressive price вЂ” you will pay significantly more for the L9 than for similar models. That is understandable, because the equipment appeared relatively recently and currently has exemplary technical parameters."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer L9 is offered in several modifications with power up to 17,600 MH/s at only 3,260 W consumption. Using BitmainвЂ™s newest Scrypt technologies resulted in impressive energy efficiency that still looks unreachable for competitors.","text":"The Antminer L9 is offered in several modifications with power up to 17,600 MH/s at only 3,260 W consumption. Using BitmainвЂ™s newest Scrypt technologies resulted in impressive energy efficiency that still looks unreachable for competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L9","src":"/images/articles/scrypt-miners/antminer-l9.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Maximum hashrate","value":"17,600 MH/s"},{"label":"Power consumption","value":"3,260 W"},{"label":"Energy efficiency","value":"0.185 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Dimensions","value":"40 x 29 x 19.5 cm"},{"label":"Weight","value":"14.1 kg"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost"],"pros":["The worldвЂ™s most powerful Scrypt ASIC","Peak profitability","Impressive energy efficiency","Leading manufacturer"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Antminer L11","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer L11 is a balanced Bitmain model aimed at mining Litecoin, Dogecoin, and merged mining of several more altcoins. That balance of specs makes the model especially attractive: 20 GH/s hashrate, merged mining support, and 0.183 W/GH efficiency вЂ” a reliable foundation for stable earnings.","text":"The Antminer L11 is a balanced Bitmain model aimed at mining Litecoin, Dogecoin, and merged mining of several more altcoins. That balance of specs makes the model especially attractive: 20 GH/s hashrate, merged mining support, and 0.183 W/GH efficiency вЂ” a reliable foundation for stable earnings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The L11 was a notable step forward for the series: the device is significantly more productive than predecessors while remaining simple, clear, and unpretentious to operate. Classic air cooling, compact size, and a friendly interface make the Antminer L11 an ideal partner for beginners or those building a small but thoughtful farm.","text":"The L11 was a notable step forward for the series: the device is significantly more productive than predecessors while remaining simple, clear, and unpretentious to operate. Classic air cooling, compact size, and a friendly interface make the Antminer L11 an ideal partner for beginners or those building a small but thoughtful farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11","src":"/images/articles/scrypt-miners/antminer-l11.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Maximum hashrate","value":"20,000 MH/s"},{"label":"Power consumption","value":"3,680 W"},{"label":"Energy efficiency","value":"0.183 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Does not match flagships on profitability"],"pros":["Excellent power-to-consumption ratio","Support for multiple coins","Simple maintenance","Familiar cooling format"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: VolcMiner D3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The VolcMiner D3 appeared on the market like a challenge to Scrypt segment leaders. It immediately drew attention from those who want to mine Litecoin and Dogecoin at high speed without immersion systems and complex engineering. With 20 GH/s hashrate and 3,580 W consumption, VolcMiner D3 shows 0.179 J/MH efficiency, making it one of the most balanced solutions in its class.","text":"The VolcMiner D3 appeared on the market like a challenge to Scrypt segment leaders. It immediately drew attention from those who want to mine Litecoin and Dogecoin at high speed without immersion systems and complex engineering. With 20 GH/s hashrate and 3,580 W consumption, VolcMiner D3 shows 0.179 J/MH efficiency, making it one of the most balanced solutions in its class."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The chassis is industrial in style вЂ” nothing extra, only functionality. Two powerful fans confidently keep temperature in the 5вЂ“45В°C working range, and protection against extreme humidity (up to 95%) makes the device suitable even for non-standard data centers.","text":"The chassis is industrial in style вЂ” nothing extra, only functionality. Two powerful fans confidently keep temperature in the 5вЂ“45В°C working range, and protection against extreme humidity (up to 95%) makes the device suitable even for non-standard data centers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"VolcMiner D3 does not claim to be quiet вЂ” its 75 dB is audible. It is built for farms, not apartments. But where there is space and power, it becomes a stable, productive mining tool.","text":"VolcMiner D3 does not claim to be quiet вЂ” its 75 dB is audible. It is built for farms, not apartments. But where there is space and power, it becomes a stable, productive mining tool."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"VolcMiner D3","src":"/images/articles/scrypt-miners/volcminer-d3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"VolcMiner"},{"label":"Release year","value":"2026"},{"label":"Maximum hashrate","value":"20,000 MH/s"},{"label":"Power consumption","value":"3,580 W"},{"label":"Energy efficiency","value":"0.179 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not the most popular manufacturer"],"pros":["High energy efficiency","Standard architecture","Stable operation under high load","Cheaper than A-brands"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: ElphaPex DG2","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex is a young market player that has already established itself as a maker of innovative, quality equipment. The DG2 confirms that course: a combination of stable hashrate, energy efficiency, and solid construction makes the model an interesting alternative to better-known brands.","text":"ElphaPex is a young market player that has already established itself as a maker of innovative, quality equipment. The DG2 confirms that course: a combination of stable hashrate, energy efficiency, and solid construction makes the model an interesting alternative to better-known brands."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex DG2 20G is a fresh, ambitious product on the Scrypt miner market. With 20 GH/s hashrate and 3,800 W consumption, the device shows 0.19 J/MH efficiency, helping maintain stable profitability even amid Litecoin and Dogecoin price swings.","text":"ElphaPex DG2 20G is a fresh, ambitious product on the Scrypt miner market. With 20 GH/s hashrate and 3,800 W consumption, the device shows 0.19 J/MH efficiency, helping maintain stable profitability even amid Litecoin and Dogecoin price swings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model stands out for reliability and predictable operation. ElphaPex DG2 is built for miners who value high performance at moderate operating cost. Classic air cooling, compact size, and 75 dB noise make the device convenient for farms of different scale вЂ” from home to professional.","text":"The model stands out for reliability and predictable operation. ElphaPex DG2 is built for miners who value high performance at moderate operating cost. Classic air cooling, compact size, and 75 dB noise make the device convenient for farms of different scale вЂ” from home to professional."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex DG2","src":"/images/articles/scrypt-miners/elphapex-dg2.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"ElphaPex"},{"label":"Release year","value":"2025"},{"label":"Maximum hashrate","value":"20,000 MH/s"},{"label":"Power consumption","value":"3,800 W"},{"label":"Energy efficiency","value":"0.19 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not the highest hashrate compared with top models","Belonging to a second-wave brand"],"pros":["High operating stability","Energy efficiency","Reliability","Cheaper than A-brand competitors"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer L11 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BitmainвЂ™s Antminer L11 Pro is a confident step forward in Scrypt mining. The ASIC shows 21 GH/s hashrate and 3,680 W consumption, delivering an excellent performance-to-energy ratio (0.183 W/GH). The model stays relevant for several years ahead, confidently handling rising network difficulty and maintaining stable profitability.","text":"BitmainвЂ™s Antminer L11 Pro is a confident step forward in Scrypt mining. The ASIC shows 21 GH/s hashrate and 3,680 W consumption, delivering an excellent performance-to-energy ratio (0.183 W/GH). The model stays relevant for several years ahead, confidently handling rising network difficulty and maintaining stable profitability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The L11 ProвЂ™s main advantages are stable operation, ease of use, and high efficiency. The device integrates easily into existing infrastructure thanks to standard air cooling and a clear interface. That makes the ASIC popular with both beginners and experienced farm operators.","text":"The L11 ProвЂ™s main advantages are stable operation, ease of use, and high efficiency. The device integrates easily into existing infrastructure thanks to standard air cooling and a clear interface. That makes the ASIC popular with both beginners and experienced farm operators."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Pro","src":"/images/articles/scrypt-miners/antminer-l11-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Maximum hashrate","value":"21,000 MH/s"},{"label":"Power consumption","value":"3,680 W"},{"label":"Energy efficiency","value":"0.183 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost"],"pros":["High performance (one of the top among air-cooled ASICs)","Energy efficiency","Reliability","Simple maintenance"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer U2L9H","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The modelвЂ™s main feature is water cooling, which keeps operation stable under high loads and reduces equipment wear. Noise is only 50 dB, a very comfortable figure by Scrypt miner standards. With 27 GH/s hashrate and 5,670 W consumption, the ASIC offers an optimal balance of power and electricity cost, making it attractive for large farms and professional miners.","text":"The modelвЂ™s main feature is water cooling, which keeps operation stable under high loads and reduces equipment wear. Noise is only 50 dB, a very comfortable figure by Scrypt miner standards. With 27 GH/s hashrate and 5,670 W consumption, the ASIC offers an optimal balance of power and electricity cost, making it attractive for large farms and professional miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The U2L9H is built for those seeking reliability, long-term relevance, and predictable profitability. A compact form factor and thoughtful design make it easy to integrate into existing infrastructure, while high efficiency guarantees a fast return on investment.","text":"The U2L9H is built for those seeking reliability, long-term relevance, and predictable profitability. A compact form factor and thoughtful design make it easy to integrate into existing infrastructure, while high efficiency guarantees a fast return on investment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U2L9H","src":"/images/articles/scrypt-miners/antminer-u2l9h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Maximum hashrate","value":"27,000 MH/s"},{"label":"Power consumption","value":"5,670 W"},{"label":"Energy efficiency","value":"0.21 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires water infrastructure"],"pros":["High performance","Low noise level","Energy efficiency"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer L11 Hyd 6U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BitmainвЂ™s Antminer L11 Hydro 6U is a true record-holder in the Scrypt world. The model shows 33 GH/s hashrate at 5,676 W consumption, combining high performance with thoughtful energy efficiency. The L11 Hydro 6U is built for those constructing industrial farms focused on maximum performance, reliability, and long-term payback.","text":"BitmainвЂ™s Antminer L11 Hydro 6U is a true record-holder in the Scrypt world. The model shows 33 GH/s hashrate at 5,676 W consumption, combining high performance with thoughtful energy efficiency. The L11 Hydro 6U is built for those constructing industrial farms focused on maximum performance, reliability, and long-term payback."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The L11 Hydro 6UвЂ™s main feature is water cooling, which ensures stable operation under high loads, minimizes component wear, and reduces overheating risk. Noise is only 50 dB, a rare advantage for this equipment class. The undisputed leader of our ranking.","text":"The L11 Hydro 6UвЂ™s main feature is water cooling, which ensures stable operation under high loads, minimizes component wear, and reduces overheating risk. Noise is only 50 dB, a rare advantage for this equipment class. The undisputed leader of our ranking."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro 6U","src":"/images/articles/scrypt-miners/antminer-l11-hyd-6u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Maximum hashrate","value":"33,000 MH/s"},{"label":"Power consumption","value":"5,670 W"},{"label":"Energy efficiency","value":"0.17 W per MH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"21"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires a hydro system","Cost"],"pros":["Highest power","Low noise level","Relevance for years ahead"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 74
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
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ranking of best Scrypt ASICs includes Antminer, Elphapex, and VolcMiner models. You can choose either a home mining format or classic industrial, where leadership is held by the Antminer L11 Hydro 6U. This model significantly outperforms competitors in power, energy efficiency, and long-term relevance.","text":"The ranking of best Scrypt ASICs includes Antminer, Elphapex, and VolcMiner models. You can choose either a home mining format or classic industrial, where leadership is held by the Antminer L11 Hydro 6U. This model significantly outperforms competitors in power, energy efficiency, and long-term relevance."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Hydro-cooled ASICs ranking 2026$tmj$,
       $tmj$Top 10 water-cooled ASICs in 2026: from Antminer S19 XP Hydro to Antminer S23 Hydro 3U.$tmj$,
       $tmj$Antminer S23 Hydro 3U$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
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
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The race for energy efficiency pushes mining hardware makers to seek new technical formats for record results. Notably, todayвЂ™s most powerful ASICs are water-cooled miners. The classic (air) approach is still used, but that way of lowering temperatures is far less efficient than liquid cooling. LetвЂ™s review the rating of water-cooled ASICs by studying 10 top options.","text":"The race for energy efficiency pushes mining hardware makers to seek new technical formats for record results. Notably, todayвЂ™s most powerful ASICs are water-cooled miners. The classic (air) approach is still used, but that way of lowering temperatures is far less efficient than liquid cooling. LetвЂ™s review the rating of water-cooled ASICs by studying 10 top options."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining farm with water cooling","src":"/images/articles/hydro-asics-2026/intro-hydro-farm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What should you know about water-cooled ASICs?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Water cooling (or liquid cooling) is a system where heat from chips is removed by circulating liquid (usually water or a special coolant), not air.","text":"Water cooling (or liquid cooling) is a system where heat from chips is removed by circulating liquid (usually water or a special coolant), not air."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages of water cooling:","text":"Advantages of water cooling:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Heat removal efficiency. Water is dozens of times more effective than air in heat capacity and thermal conductivity, so such systems handle overheating even under extreme loads;","Lower noise. Unlike air-cooled ASICs with powerful fans, water-cooled ASICs are much quieter;","Higher stability. Keeping a constant temperature reduces overheating risk and component failure, extending service life;","Farm compactness. Better heat removal lets you place units denser, saving space."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Disadvantages of water cooling:","text":"Disadvantages of water cooling:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Higher cost. The ASICs themselves are more expensive because the budget includes cooling system, installation, and maintenance;","Service complexity. Water systems need careful monitoring of leaks, pressure, and fluid cleanliness;","Need for technical preparation. Especially with a complex system, you need proper installation, tuning, and understanding of hydraulics."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Water-cooled ASICs are a step forward toward efficient and scalable mining.","text":"Water-cooled ASICs are a step forward toward efficient and scalable mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"They are especially relevant for industrial farms where reducing noise and maximizing available space matter. For home mining, choosing them may be excessive due to cost and complexity.","text":"They are especially relevant for industrial farms where reducing noise and maximizing available space matter. For home mining, choosing them may be excessive due to cost and complexity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If you have a large farm, stable power supply, and the ability to control temperature вЂ” a water-cooled ASIC can be a profitable investment. Otherwise, carefully calculate ROI and compare with simpler air-cooled solutions.","text":"If you have a large farm, stable power supply, and the ability to control temperature вЂ” a water-cooled ASIC can be a profitable investment. Otherwise, carefully calculate ROI and compare with simpler air-cooled solutions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Antminer S19 XP Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The most powerful ASIC in AntminerвЂ™s entire 19th lineup. Benchmark hashrate and energy-efficiency figures at launch kept the model relevant for years ahead. It is the same recognizable concept that became the foundation for BitmainвЂ™s later releases (in particular the 21st lineup of water-cooled miners).","text":"The most powerful ASIC in AntminerвЂ™s entire 19th lineup. Benchmark hashrate and energy-efficiency figures at launch kept the model relevant for years ahead. It is the same recognizable concept that became the foundation for BitmainвЂ™s later releases (in particular the 21st lineup of water-cooled miners)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S19 XP Hydro hashrate is 257 TH/s at 5,450 W: energy efficiency of 21 W per TH looks impressive even years after release. The miner needs three-phase power and must be complemented with a pump and radiator. However, many users note the unit is more finicky than competitors and earlier-generation ASICs.","text":"Antminer S19 XP Hydro hashrate is 257 TH/s at 5,450 W: energy efficiency of 21 W per TH looks impressive even years after release. The miner needs three-phase power and must be complemented with a pump and radiator. However, many users note the unit is more finicky than competitors and earlier-generation ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S19 XP Hydro","src":"/images/articles/hydro-asics-2026/antminer-s19-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No pump and radiator in the kit","Serious requirements for the outlet and wiring","A share of negative reviews."],"pros":["The most powerful ASIC in BitmainвЂ™s entire 19th series","Excellent energy-efficiency figures that remain relevant years after release","Low noise level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Whatsminer M66 Hydro and M66S Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"After the M56, WhatsminerвЂ™s lineup gained two more ASICs for immersion cooling: the 66 series with M66 Hydro and M66S Hydro. Both also appeared in 2023 after the debut product. Hashrate rose to 280 and 298 TH/s, while consumption is roughly similar вЂ” 5,600 and 5,550 W.","text":"After the M56, WhatsminerвЂ™s lineup gained two more ASICs for immersion cooling: the 66 series with M66 Hydro and M66S Hydro. Both also appeared in 2023 after the debut product. Hashrate rose to 280 and 298 TH/s, while consumption is roughly similar вЂ” 5,600 and 5,550 W."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"MicroBT engineers delivered benchmark energy efficiency: 19вЂ“20 W per TH, a real breakthrough in 2023. Mass production of M66 Hydro and M66S Hydro did not happen (due to more complex operation for users), but it proved that power and efficiency can grow almost without limit via water cooling.","text":"MicroBT engineers delivered benchmark energy efficiency: 19вЂ“20 W per TH, a real breakthrough in 2023. Mass production of M66 Hydro and M66S Hydro did not happen (due to more complex operation for users), but it proved that power and efficiency can grow almost without limit via water cooling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M66 Hydro and M66S Hydro","src":"/images/articles/hydro-asics-2026/whatsminer-m66-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Serious requirements for the outlet and wiring","Need to buy additional components","Complexity of startup and maintenance."],"pros":["Maximum hashrate for immersion-cooled ASICs","Low noise level","Excellent energy efficiency","Reliable manufacturer."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Whatsminer M63 Hydro and M63S Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"MicroBTвЂ™s 63rd lineup is WhatsminerвЂ™s most powerful ASICs today. Using water cooling, the maker reached figures that seemed fantastic only a few years ago. 366 and 390 TH/s at 7,300 and 7,250 W is a major technical achievement for the entire cryptocurrency mining industry.","text":"MicroBTвЂ™s 63rd lineup is WhatsminerвЂ™s most powerful ASICs today. Using water cooling, the maker reached figures that seemed fantastic only a few years ago. 366 and 390 TH/s at 7,300 and 7,250 W is a major technical achievement for the entire cryptocurrency mining industry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Energy efficiency around 18.5 W per TH is a benchmark for Whatsminer, but it was only possible with liquid cooling. For classic (air) designs, such metrics are still out of reach.","text":"Energy efficiency around 18.5 W per TH is a benchmark for Whatsminer, but it was only possible with liquid cooling. For classic (air) designs, such metrics are still out of reach."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Whatsminer M63 Hydro and M63S Hydro","src":"/images/articles/hydro-asics-2026/whatsminer-m63-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Consumption over 7 kW вЂ” serious requirements for quality wiring and a powerful outlet","Need to add extra cooling-system components."],"pros":["The most powerful and productive ASICs in the Whatsminer lineup","Proven, reliable brand","Benchmark energy efficiency for this manufacturer","Low noise level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Antminer S21 Hydro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Closing the top three is the junior model of BitmainвЂ™s 21st water-cooled lineup. Same recognizable chassis, but the 2024 model already delivers 335 Th/s at only 5,360 W. At launch, Antminer engineers set a new energy-efficiency record вЂ” just 16 W per TH, a real breakthrough in spring 2024. Again this was possible thanks to water cooling, while air cooling still cannot match such metrics.","text":"Closing the top three is the junior model of BitmainвЂ™s 21st water-cooled lineup. Same recognizable chassis, but the 2024 model already delivers 335 Th/s at only 5,360 W. At launch, Antminer engineers set a new energy-efficiency record вЂ” just 16 W per TH, a real breakthrough in spring 2024. Again this was possible thanks to water cooling, while air cooling still cannot match such metrics."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21 Hydro needs a pump and radiator, so you cannot run it вЂњout of the box.вЂќ That applies to any liquid-cooled model, so experienced miners will not be surprised.","text":"Antminer S21 Hydro needs a pump and radiator, so you cannot run it вЂњout of the box.вЂќ That applies to any liquid-cooled model, so experienced miners will not be surprised."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 Hydro","src":"/images/articles/hydro-asics-2026/antminer-s21-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Need to buy additional components","A new lineup whose reliability is not yet proven by time."],"pros":["High hashrate","Flawless energy efficiency","Proven manufacturer","Low noise level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 35
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
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S23 Immersion is a next-generation ASIC built specifically for immersion tanks. The model targets large farms that need high placement density, low noise, and 24/7 operation without downtime. Hashrate is 442 Th/s, making it attractive for projects that want to grow total hashrate without expanding floor space.","text":"Antminer S23 Immersion is a next-generation ASIC built specifically for immersion tanks. The model targets large farms that need high placement density, low noise, and 24/7 operation without downtime. Hashrate is 442 Th/s, making it attractive for projects that want to grow total hashrate without expanding floor space."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Immersion cooling lets the S23 Imm run more stably than air models: no fans, no overheating risk, and even temperature under high load. The miner resists dust, needs no regular cleaning, and is convenient at large infrastructure scale. At the same time, a full immersion bath and fluid circulation system are required вЂ” important to consider before buying.","text":"Immersion cooling lets the S23 Imm run more stably than air models: no fans, no overheating risk, and even temperature under high load. The miner resists dust, needs no regular cleaning, and is convenient at large infrastructure scale. At the same time, a full immersion bath and fluid circulation system are required вЂ” important to consider before buying."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Imm","src":"/images/articles/hydro-asics-2026/antminer-s23-imm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S23 Imm"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"442 Th/s"},{"label":"Power consumption","value":"5304 W"},{"label":"Coin","value":"BTC"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires an immersion bath and additional infrastructure.","Not suitable for small home setups.","Higher deployment cost."],"pros":["Built for immersion cooling вЂ” stability under 24/7 loads.","High hashrate.","Low noise thanks to no fans.","Resistance to dust and the environment.","Suitable for large farms and data centers with high placement density."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 41
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
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The XP version is a logical continuation of AntminerвЂ™s 21st water-cooled lineup. Hashrate grew to an impressive 473 TH/s at only 5,676 W. Bitmain engineers delivered a record energy-efficiency figure for now: 12 W per TH, which seemed fantastic only a few years ago. This is a truly incredible scientific and technical achievement in cryptocurrency mining.","text":"The XP version is a logical continuation of AntminerвЂ™s 21st water-cooled lineup. Hashrate grew to an impressive 473 TH/s at only 5,676 W. Bitmain engineers delivered a record energy-efficiency figure for now: 12 W per TH, which seemed fantastic only a few years ago. This is a truly incredible scientific and technical achievement in cryptocurrency mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21 XP Hydro matches the hashrate of five S19 units at 95 TH/s each. Yet the 2024 miner needs 2.5Г— less electricity. That is what a successful fight for energy efficiency looks like, and Bitmain shows excellent results.","text":"Antminer S21 XP Hydro matches the hashrate of five S19 units at 95 TH/s each. Yet the 2024 miner needs 2.5Г— less electricity. That is what a successful fight for energy efficiency looks like, and Bitmain shows excellent results."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 XP Hydro","src":"/images/articles/hydro-asics-2026/antminer-s21-xp-hydro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price","No pump and radiator in the kit."],"pros":["One of the worldвЂ™s most powerful ASICs","Benchmark energy efficiency in 2024","Leading global manufacturer","Low noise level."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Antminer U2L9H","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer U2L9H is a professional Scrypt miner designed for Litecoin and Dogecoin with high stability and minimal overheating risk. Water cooling lets the unit handle 24/7 loads and keep stable hashrate even in hot rooms or dense installations.","text":"Antminer U2L9H is a professional Scrypt miner designed for Litecoin and Dogecoin with high stability and minimal overheating risk. Water cooling lets the unit handle 24/7 loads and keep stable hashrate even in hot rooms or dense installations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At 27 Gh/s and 5670 W, the model targets users who want maximum yield at optimal power cost. Water cooling lowers noise, extends hardware life, and makes the miner more reliable for long-term use. Antminer U2L9H is a good choice for building a farm or scaling existing infrastructure.","text":"At 27 Gh/s and 5670 W, the model targets users who want maximum yield at optimal power cost. Water cooling lowers noise, extends hardware life, and makes the miner more reliable for long-term use. Antminer U2L9H is a good choice for building a farm or scaling existing infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U2L9H","src":"/images/articles/hydro-asics-2026/antminer-u2l9h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer U2L9H"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"27000 Mh/s (27 Gh/s)"},{"label":"Power consumption","value":"5670 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not suitable for home use.","Higher infrastructure cost versus air-cooled models."],"pros":["Water cooling provides quiet, stable operation.","High hashrate on the Scrypt algorithm.","Suitable for long loads without overheating.","Optimal balance between hashrate and power consumption.","Convenient for dense farms and containers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer L11 Hydro 6U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Hydro 6U is a flagship Scrypt miner with water cooling, built for Litecoin, Dogecoin, and other coins on this algorithm. At 33 Gh/s it targets large farms and users who need maximum hashrate with stable 24/7 operation.","text":"Antminer L11 Hydro 6U is a flagship Scrypt miner with water cooling, built for Litecoin, Dogecoin, and other coins on this algorithm. At 33 Gh/s it targets large farms and users who need maximum hashrate with stable 24/7 operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hydro cooling keeps chip temperatures low, extends hardware life, and notably cuts noise versus air systems. The miner is effective in large projects, data centers, and containers where placement density and minimal downtime matter. Antminer L11 Hydro 6U combines high power, efficiency, and reliability, making it one of the best options for professional Scrypt mining.","text":"Hydro cooling keeps chip temperatures low, extends hardware life, and notably cuts noise versus air systems. The miner is effective in large projects, data centers, and containers where placement density and minimal downtime matter. Antminer L11 Hydro 6U combines high power, efficiency, and reliability, making it one of the best options for professional Scrypt mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro 6U","src":"/images/articles/hydro-asics-2026/antminer-l11-hydro-6u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer L11 Hydro 6U"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"33000 Mh/s (33 Gh/s)"},{"label":"Power consumption","value":"5676 W"},{"label":"Coin","value":"LTC, DOGE"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Takes more space than standard air-cooled models.","Not intended for home use.","High price."],"pros":["High hashrate for the Scrypt algorithm.","Hydro cooling reduces noise and improves stability.","Suitable for large farms and large rooms.","Effective cooling extends hardware life.","Optimal operation under 24/7 load."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer S21E XP Hyd 3U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The undisputed leader among water-cooled ASICs is BitmainвЂ™s Antminer S21E XP Hyd 3U. Against competitors and earlier miners this hardware looks fantastic, yet the brandвЂ™s engineers truly achieved unique real-world results. 860 TH/s is the ASICвЂ™s main technical feature, making it the clear leader. Consumption is no less impressive вЂ” 11,180 W, for about 13 W per TH. The S21 XP Hydro looks preferable on efficiency, but its hashrate is nearly half.","text":"The undisputed leader among water-cooled ASICs is BitmainвЂ™s Antminer S21E XP Hyd 3U. Against competitors and earlier miners this hardware looks fantastic, yet the brandвЂ™s engineers truly achieved unique real-world results. 860 TH/s is the ASICвЂ™s main technical feature, making it the clear leader. Consumption is no less impressive вЂ” 11,180 W, for about 13 W per TH. The S21 XP Hydro looks preferable on efficiency, but its hashrate is nearly half."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"S21E XP Hyd 3U sets fundamentally new requirements for the roomвЂ™s outlet and wiring. Over 10 kW suits far from every location, so launching this Antminer may bring extra difficulties. The price also surprises, but you pay for technology and a string of record figures.","text":"S21E XP Hyd 3U sets fundamentally new requirements for the roomвЂ™s outlet and wiring. Over 10 kW suits far from every location, so launching this Antminer may bring extra difficulties. The price also surprises, but you pay for technology and a string of record figures."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21E XP Hyd 3U","src":"/images/articles/hydro-asics-2026/antminer-s21e-xp-hyd-3u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price","Serious requirements for the outlet and wiring","Missing launch components in the kit."],"pros":["The most powerful ASIC in the world","Excellent energy efficiency","Maximum yield among SHA-256 ASICs","Low noise level","Proven brand."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Antminer S23 Hydro 3U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S23 Hydro 3U is an innovative SHA-256 miner вЂ” the first device to cross the 1 petahash power threshold. At 1160 Th/s, a compact 3U form factor, and water cooling, it is an optimal choice for professional data centers and industrial farms where maximum compute density, efficient power use, and 24/7 stability matter.","text":"Antminer S23 Hydro 3U is an innovative SHA-256 miner вЂ” the first device to cross the 1 petahash power threshold. At 1160 Th/s, a compact 3U form factor, and water cooling, it is an optimal choice for professional data centers and industrial farms where maximum compute density, efficient power use, and 24/7 stability matter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hydro cooling keeps chip temperatures low, reduces acoustic noise, and helps maintain stable operation regardless of external conditions. High energy efficiency helps cut operating costs, which is especially important for large mining clusters.","text":"Hydro cooling keeps chip temperatures low, reduces acoustic noise, and helps maintain stable operation regardless of external conditions. High energy efficiency helps cut operating costs, which is especially important for large mining clusters."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Hydro 3U","src":"/images/articles/hydro-asics-2026/antminer-s23-hydro-3u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Model","value":"Antminer S23 Hydro 3U"},{"label":"Algorithm","value":"SHA-256"},{"label":"Hashrate","value":"1160 Th/s"},{"label":"Power consumption","value":"11020 W"},{"label":"Coin","value":"BTC"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost.","High power draw requires well-planned infrastructure.","Not suitable for home conditions or small farms."],"pros":["Hashrate over 1 petahash.","Hydro cooling reduces noise and increases stability.","Compact 3U form factor for dense rack placement.","High energy efficiency of 9.5 J/TH.","Suitable for large mining centers and industrial installations."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
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
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Water cooling systems in ASICs are a modern, technological solution for managing equipment heat under high loads. Versus traditional air cooling, they provide more stable device operation, lower noise, and denser placement.","text":"Water cooling systems in ASICs are a modern, technological solution for managing equipment heat under high loads. Versus traditional air cooling, they provide more stable device operation, lower noise, and denser placement."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Water cooling is especially relevant for industrial mining farms where stable hashrate and minimized overheating risk matter. Deploying such systems, however, requires extra spend on equipment, installation, and maintenance, plus qualified staff.","text":"Water cooling is especially relevant for industrial mining farms where stable hashrate and minimized overheating risk matter. Deploying such systems, however, requires extra spend on equipment, installation, and maintenance, plus qualified staff."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Overall, water cooling is justified with large volumes of mining gear, high placement density, and a long-term strategy. Otherwise, especially at small scale, traditional air cooling may be more rational.","text":"Overall, water cooling is justified with large volumes of mining gear, high placement density, and a long-term strategy. Otherwise, especially at small scale, traditional air cooling may be more rational."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing liquid-cooled hardware, a miner can expect high hashrate and lower noise. But each model needs extra gear such as a pump, radiator, and/or immersion bath.","text":"Choosing liquid-cooled hardware, a miner can expect high hashrate and lower noise. But each model needs extra gear such as a pump, radiator, and/or immersion bath."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The TOP-10 best water-cooled ASICs in 2024 looks as follows:","text":"The TOP-10 best water-cooled ASICs in 2024 looks as follows:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Antminer S19 XP Hydro","Whatsminer M66 Hydro and M66S Hydro","Whatsminer M63 Hydro and M63S Hydro","Antminer S21 Hydro","Antminer S23 Imm","Antminer S21 XP Hydro","Antminer U2L9H","Antminer L11 Hydro 6U","Antminer S21E XP Hyd 3U","Antminer S23 Hydro 3U"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best CPUs for mining: top 10 processors$tmj$,
       $tmj$CPU mining is the oldest approach вЂ” a ranking of processors still relevant for selected coins.$tmj$,
       $tmj$Bitcoin and CPU boards$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
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
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"CPU mining is a way to mine cryptocurrencies in which blockchain computing tasks are processed by the computerвЂ™s central processing unit. It was the very first mining method, used in the early Bitcoin era. Much has changed since then, but CPU mining still holds a niche in the market.","text":"CPU mining is a way to mine cryptocurrencies in which blockchain computing tasks are processed by the computerвЂ™s central processing unit. It was the very first mining method, used in the early Bitcoin era. Much has changed since then, but CPU mining still holds a niche in the market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcoin and processor boards","src":"/images/articles/cpu-mining/bitcoin-pcb.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Everything useful to know about CPU mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A brief history of CPU mining:","text":"A brief history of CPU mining:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["2009вЂ“2011: BitcoinвЂ™s early years вЂ” mining was done only on CPUs;","2011вЂ“2013: GPU miners (graphics cards) appeared and pushed CPUs out of Bitcoin mining;","From 2013: ASIC devices (specialized hardware) came to dominate mining of most coins;","2018вЂ“2024: rising popularity of ASIC-resistant altcoins revived interest in CPU mining (for example Monero, VerusCoin, Raptoreum)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite sharply rising difficulty and falling profitability in parallel, CPU mining still exists today. That is possible thanks to advantages of this format:","text":"Despite sharply rising difficulty and falling profitability in parallel, CPU mining still exists today. That is possible thanks to advantages of this format:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"You can start mining even with a regular home PC or laptop (though efficiency will be low);","title":"Low entry barrier"},{"text":"Some cryptocurrencies (for example Yadacoin and VerusCoin) use algorithms designed to be inefficient on ASICs and GPUs, protecting CPU miners;","title":"ASIC resistance"},{"text":"Processors use less energy and do not need noisy cooling like graphics cards. So you can run a farm at home;","title":"Quiet operation and low power use"},{"text":"Easy to switch between coins. A CPU can always be used for other tasks as well.","title":"Flexibility"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are downsides too, some of them significant:","text":"There are downsides too, some of them significant:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"CPU mining is highly inefficient for most popular coins. Earnings often barely cover electricity costs;","title":"Low profitability"},{"text":"Constant 24/7 load increases wear on the processor and motherboard;","title":"Hardware wear"},{"text":"Only a small number of cryptocurrencies (for example Haven and Raptoreum) are profitable to mine on CPU.","title":"Limited coin choice"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"What technical specifics matter if you plan to start mining with processors? The main characteristics are:","text":"What technical specifics matter if you plan to start mining with processors? The main characteristics are:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Core and thread count (more is better) вЂ” many algorithms are multithreaded;","L3 cache. Especially important for algorithms like RandomX and GhostRider. More cache means higher profitability;","Power consumption. Consider efficiency: how many hashes per second per watt;","Overclocking and cooling. Mining loads the CPU at 100%: reliable cooling is required, preferably a tower cooler or liquid cooling."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"LetвЂ™s look at the best CPUs for mining, analyzing each option available on the market today in detail.","text":"LetвЂ™s look at the best CPUs for mining, analyzing each option available on the market today in detail."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Processor on a motherboard","src":"/images/articles/cpu-mining/circuit-board.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Intel Core i9-10900K","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Almost every Intel appearance in our CPU mining ranking is a compromise. Core i9-10900K is no exception вЂ” calling this CPU optimal for crypto mining is hard. It is in the top because it belongs to a flagship series from a famous maker. For design and gaming, Intel Core i9-10900K is truly successful. But in mining you can find far more efficient devices much cheaper. For example, the familiar Xeon E5-2699V3 is often preferable, even though the two CPUsвЂ™ prices are incomparable.","text":"Almost every Intel appearance in our CPU mining ranking is a compromise. Core i9-10900K is no exception вЂ” calling this CPU optimal for crypto mining is hard. It is in the top because it belongs to a flagship series from a famous maker. For design and gaming, Intel Core i9-10900K is truly successful. But in mining you can find far more efficient devices much cheaper. For example, the familiar Xeon E5-2699V3 is often preferable, even though the two CPUsвЂ™ prices are incomparable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Buying a Core i9 specifically for mining is not worthwhile. But if your gaming or work PC is built on this processor, you can use it for passive income. In that case the Intel CPU helps offset part of the purchase cost.","text":"Buying a Core i9 specifically for mining is not worthwhile. But if your gaming or work PC is built on this processor, you can use it for passive income. In that case the Intel CPU helps offset part of the purchase cost."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intel Core i9-10900K","src":"/images/articles/cpu-mining/intel-i9-10900k.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"LGA 1200"},{"label":"Core count","value":"10"},{"label":"Base frequency","value":"3,700 MHz"},{"label":"Overclocking potential","value":"5,300 MHz"},{"label":"Power draw","value":"125 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest mining efficiency;","Higher cost versus peers with similar specs."],"pros":["A powerful solution for gaming, design, and office tasks;","Exemplary single-thread performance."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: AMD Threadripper 1950X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An unusual HEDT-format processor вЂ” a niche option that can also be used for mining. CPU performance is solid, which makes sense. HEDT means High-End Desktop вЂ” high-performance machines for heavy tasks. Crypto mining fits that definition well, so AMD Threadripper 1950X owners often use the architecture for mining.","text":"An unusual HEDT-format processor вЂ” a niche option that can also be used for mining. CPU performance is solid, which makes sense. HEDT means High-End Desktop вЂ” high-performance machines for heavy tasks. Crypto mining fits that definition well, so AMD Threadripper 1950X owners often use the architecture for mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The difficulty is component availability. This CPU is not sold in every store, and finding the rest of the PC parts takes time and money. Still, the HEDT format is optimal for building full farms involving not one but several workstations.","text":"The difficulty is component availability. This CPU is not sold in every store, and finding the rest of the PC parts takes time and money. Still, the HEDT format is optimal for building full farms involving not one but several workstations."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Threadripper 1950X","src":"/images/articles/cpu-mining/threadripper-1950x.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"TR4"},{"label":"Core count","value":"16"},{"label":"Base frequency","value":"3,400 MHz"},{"label":"Overclocking potential","value":"4,000 MHz"},{"label":"Power draw","value":"180 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A rare, not very popular format;","Possible difficulty reselling on the secondary market;","Must be paired only with a matching motherboard;","Impressive physical size;","Cheaper than competing models from other makers."],"pros":["Noticeable device performance;","Solid multithreading;","An optimal option for building a full farm."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Intel Core i7-7700","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the few Intel representatives in our ranking, Core i7-7700 is here for its versatility and popularity among classic users. The model is often used for office workstations, design systems, and affordable gaming PCs. Alongside that you can get a passive income source by using the CPU for crypto mining.","text":"One of the few Intel representatives in our ranking, Core i7-7700 is here for its versatility and popularity among classic users. The model is often used for office workstations, design systems, and affordable gaming PCs. Alongside that you can get a passive income source by using the CPU for crypto mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The processor is great for an introduction to mining: serious loads are unlikely to ruin the device. The maker trusts the line вЂ” buyers get a 3-year warranty. A major downside is overclocking difficulty, typical of Intel products. Core i7s are also fairly вЂњhot,вЂќ so you must be careful.","text":"The processor is great for an introduction to mining: serious loads are unlikely to ruin the device. The maker trusts the line вЂ” buyers get a 3-year warranty. A major downside is overclocking difficulty, typical of Intel products. Core i7s are also fairly вЂњhot,вЂќ so you must be careful."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intel Core i7-7700","src":"/images/articles/cpu-mining/intel-i7-7th.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"LGA 1151"},{"label":"Core count","value":"4"},{"label":"Base frequency","value":"3,600 MHz"},{"label":"Overclocking potential","value":"4,200 MHz"},{"label":"Power draw","value":"65 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Small mining income;","Overclocking difficulties;","Need to monitor temperatures due to overheating risk."],"pros":["A popular model among all kinds of users;","Reliability вЂ” 3-year warranty;","Relevance on the secondary market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: AMD Ryzen 9 3900X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The mid-range AMD Ryzen 9 3900X is most often used to mine Monero (XMR) вЂ” that is where this CPU is most efficient. Overall it is universal for mining and other tasks such as office apps or powerful designer builds. It is one of the processors with the highest share of positive reviews, so it can safely be called legendary.","text":"The mid-range AMD Ryzen 9 3900X is most often used to mine Monero (XMR) вЂ” that is where this CPU is most efficient. Overall it is universal for mining and other tasks such as office apps or powerful designer builds. It is one of the processors with the highest share of positive reviews, so it can safely be called legendary."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To reach optimal mining earnings the CPU must be overclocked. Extra attention goes to cooling, which even in the stock configuration does not always handle the load well. Done right, you get a reliable mid-tier farm for stable, efficient altcoin mining.","text":"To reach optimal mining earnings the CPU must be overclocked. Extra attention goes to cooling, which even in the stock configuration does not always handle the load well. Done right, you get a reliable mid-tier farm for stable, efficient altcoin mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Ryzen 9 3900X","src":"/images/articles/cpu-mining/ryzen-9-box-a.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"AM4"},{"label":"Core count","value":"12"},{"label":"Base frequency","value":"3,800 MHz"},{"label":"Overclocking potential","value":"4,600 MHz"},{"label":"Power draw","value":"105 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest hashrate;","Poor cooling system that needs replacement when overclocking."],"pros":["One of the best options for mining Monero (XMR);","A universal, in-demand model;","Relatively low cost;","Decent mining efficiency at modest investment."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: AMD Ryzen 7 3700X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Not only AMDвЂ™s 9th generation is actively used in mining. Some 7th-gen models also work for profitable mining вЂ” for example AMD Ryzen 7 3700X. Despite modest specs, this processor is popular with beginner crypto enthusiasts. Main reasons: acceptable price, simplicity, and low fuss.","text":"Not only AMDвЂ™s 9th generation is actively used in mining. Some 7th-gen models also work for profitable mining вЂ” for example AMD Ryzen 7 3700X. Despite modest specs, this processor is popular with beginner crypto enthusiasts. Main reasons: acceptable price, simplicity, and low fuss."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This CPU is optimal for tests and experiments, and modest power draw lets you mine without a huge expense side. Ryzen 7 3700X is also valued on the secondary market because it is often used for office tasks and mid-tier gaming builds.","text":"This CPU is optimal for tests and experiments, and modest power draw lets you mine without a huge expense side. Ryzen 7 3700X is also valued on the secondary market because it is often used for office tasks and mid-tier gaming builds."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Ryzen 7 3700X","src":"/images/articles/cpu-mining/ryzen-7-3700x.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"AM4"},{"label":"Core count","value":"8"},{"label":"Base frequency","value":"3,600 MHz"},{"label":"Overclocking potential","value":"4,400 MHz"},{"label":"Power draw","value":"65 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Low mining profitability;","Mediocre single-thread performance."],"pros":["Low cost;","Modest power consumption;","Decent overclocking potential;","Versatility;","Ability to sell quickly on the secondary market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: AMD Ryzen 9 3960X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another AMD 9th-gen representative in our ranking вЂ” Ryzen 3960X. It sits between the expensive 3970X and the efficient but less outstanding (by income) 3950X. This CPU has 24 cores, and when overclocked can reach up to 4,300 MHz (though many note it resists overclocking).","text":"Another AMD 9th-gen representative in our ranking вЂ” Ryzen 3960X. It sits between the expensive 3970X and the efficient but less outstanding (by income) 3950X. This CPU has 24 cores, and when overclocked can reach up to 4,300 MHz (though many note it resists overclocking)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main trait of AMD Ryzen 9 3960X is an optimal price-to-performance ratio. Add modest power draw, which lets you mine successfully even where electricity is expensive. For more convincing mining results, pair the farm with fast modern DDR4 memory.","text":"The main trait of AMD Ryzen 9 3960X is an optimal price-to-performance ratio. Add modest power draw, which lets you mine successfully even where electricity is expensive. For more convincing mining results, pair the farm with fast modern DDR4 memory."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Ryzen 9 3960X","src":"/images/articles/cpu-mining/ryzen-9-box-b.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"sTRX4"},{"label":"Core count","value":"24"},{"label":"Base frequency","value":"3,800 MHz"},{"label":"Overclocking potential","value":"4,500 MHz"},{"label":"Power draw","value":"280 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Difficult overclocking process;","Need to use modern DDR4 memory (otherwise crypto mining volumes drop)."],"pros":["A favorite among many miners for optimal price-to-specs ratio;","A universal CPU for mining, office, and games;","Excellent results when overclocked;","Reputation as a quality, proven model."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: AMD Threadripper 3990X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The flagship of the processor world ranks only 4th here. This CPU delivers record mining earnings, but digital-asset mining always factors in upfront cost. For the 3990X the downside is price вЂ” also record-high, like its performance. Payback is therefore much longer, which kept this Threadripper out of the top three.","text":"The flagship of the processor world ranks only 4th here. This CPU delivers record mining earnings, but digital-asset mining always factors in upfront cost. For the 3990X the downside is price вЂ” also record-high, like its performance. Payback is therefore much longer, which kept this Threadripper out of the top three."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Maximum 3990X performance is reachable only with DDR4 memory from 3,200 MHz вЂ” another requirement for effective mining. Otherwise this AMD model cannot show its limits. Overclocking is also hard, complicating work for beginners. Done carefully, though, the device will please its owner with high income.","text":"Maximum 3990X performance is reachable only with DDR4 memory from 3,200 MHz вЂ” another requirement for effective mining. Otherwise this AMD model cannot show its limits. Overclocking is also hard, complicating work for beginners. Done carefully, though, the device will please its owner with high income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Threadripper 3990X","src":"/images/articles/cpu-mining/threadripper-box-a.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"sTRX4"},{"label":"Core count","value":"64"},{"label":"Base frequency","value":"2,900 MHz"},{"label":"Overclocking potential","value":"4,300 MHz"},{"label":"Power draw","value":"280 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost;","Labor-intensive setup and overclocking;","Extra requirements to reach maximum efficiency;","Low secondary-market demand (premium segment is chosen reluctantly)."],"pros":["One of the most powerful CPUs available today;","With proper setup, record mining income is possible;","Maximum speed not only in mining but also gaming, design, and office work;","Relatively low power draw given impressive performance."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Intel Xeon E5-2699V3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Intel processors are not especially popular with miners because they lag their direct rival вЂ” AMD products. But if you prefer Intel gear, Xeon E5-2699V3 is one of the best crypto options even though it appeared in 2014 and far more powerful devices exist today. The key reason is low cost, which lets you build full farms.","text":"Intel processors are not especially popular with miners because they lag their direct rival вЂ” AMD products. But if you prefer Intel gear, Xeon E5-2699V3 is one of the best crypto options even though it appeared in 2014 and far more powerful devices exist today. The key reason is low cost, which lets you build full farms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With this CPU it is profitable to mine only a limited set of coins (for example mining Monero is economically unwise). Overclocking can also cause extra problems because the maker tried to block it. Despite those downsides, Intel Xeon E5-2699V3 has become as legendary in CPU mining as the Antminer 9 series in the ASIC segment.","text":"With this CPU it is profitable to mine only a limited set of coins (for example mining Monero is economically unwise). Overclocking can also cause extra problems because the maker tried to block it. Despite those downsides, Intel Xeon E5-2699V3 has become as legendary in CPU mining as the Antminer 9 series in the ASIC segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intel Xeon E5-2699V3","src":"/images/articles/cpu-mining/xeon-e5.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"LGA 2011-v3"},{"label":"Core count","value":"18"},{"label":"Base frequency","value":"2,300 MHz"},{"label":"Overclocking potential","value":"3,600 MHz"},{"label":"Power draw","value":"145 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest income;","Advanced age: this CPU appeared in 2014;","Overclocking difficulties;","Not the most popular socket format."],"pros":["Low cost вЂ” one of the most affordable mining solutions in 2024;","Low power consumption;","Ability to build full farms thanks to accessibility and relative efficiency;","Popularity on the secondary market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: AMD Ryzen Threadripper 3970X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the most powerful mass-segment processors today вЂ” a reference model with high power and equally impressive cost. If a miner has a large budget and plans to mine crypto for a long time, AMD Ryzen Threadripper 3970X can be a long-term investment. It has not become a bestseller yet, mainly because of price вЂ” many CPU miners prefer more affordable alternatives.","text":"One of the most powerful mass-segment processors today вЂ” a reference model with high power and equally impressive cost. If a miner has a large budget and plans to mine crypto for a long time, AMD Ryzen Threadripper 3970X can be a long-term investment. It has not become a bestseller yet, mainly because of price вЂ” many CPU miners prefer more affordable alternatives."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model has 32 cores, enabling 64 threads. Base frequency is 3,700 MHz, and overclocking can raise that to 4,500 MHz. Impressive performance needs good cooling: this CPU can easily be вЂњburnedвЂќ if you neglect a quality cooler.","text":"The model has 32 cores, enabling 64 threads. Base frequency is 3,700 MHz, and overclocking can raise that to 4,500 MHz. Impressive performance needs good cooling: this CPU can easily be вЂњburnedвЂќ if you neglect a quality cooler."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Ryzen Threadripper 3970X","src":"/images/articles/cpu-mining/threadripper-box-b.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"sTRX4"},{"label":"Core count","value":"32"},{"label":"Base frequency","value":"3,700 MHz"},{"label":"Overclocking potential","value":"4,500 MHz"},{"label":"Power draw","value":"280 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost;","Serious power consumption;","Serious cooling requirements;","Possible resale difficulty due to narrow specialty (premium CPU class)."],"pros":["Excellent performance metrics;","Impressive earnings from CPU mining;","Overclocking potential for even more impressive performance."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: AMD Ryzen 9 3950X","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Not the most powerful mining CPU, but by price-to-hashrate this model can be considered optimal. At a reasonable cost it offers impressive specs вЂ” three chiplets, 16 cores, 32 threads, 3,500 MHz base, and overclocking to 4,700 MHz. Built on AM4, which greatly simplifies choosing a motherboard.","text":"Not the most powerful mining CPU, but by price-to-hashrate this model can be considered optimal. At a reasonable cost it offers impressive specs вЂ” three chiplets, 16 cores, 32 threads, 3,500 MHz base, and overclocking to 4,700 MHz. Built on AM4, which greatly simplifies choosing a motherboard."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"AMD Ryzen 9 3950X is most actively used to mine three suitable coins вЂ” Monero (XMR), Raptoreum (RTM), and Bitoreum (BTRM). Power draw is relatively modest at 105 W, and the claimed specs are more than enough not only for mining but for gaming and especially office tasks.","text":"AMD Ryzen 9 3950X is most actively used to mine three suitable coins вЂ” Monero (XMR), Raptoreum (RTM), and Bitoreum (BTRM). Power draw is relatively modest at 105 W, and the claimed specs are more than enough not only for mining but for gaming and especially office tasks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"AMD Ryzen 9 3950X","src":"/images/articles/cpu-mining/ryzen-9-chip.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Socket","value":"AM4"},{"label":"Core count","value":"16"},{"label":"Base frequency","value":"3,500 MHz"},{"label":"Overclocking potential","value":"4,700 MHz"},{"label":"Power draw","value":"105 W"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Overclocking is needed for a significant performance boost;","Stock cooling does not always handle the job;","Lower income versus more efficient competitors."],"pros":["One of the best price-to-performance ratios on the market;","Low power consumption;","Relatively low cost;","Excellent technical specs;","Modest heat when cooling is optimized;","Secondary-market popularity: the model is mass-market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"CPU mining: conclusions","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Nuances and requirements of CPU mining in 2026:","text":"Nuances and requirements of CPU mining in 2026:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Electricity is the key factor. With high rates, mining will run at a loss;","Location вЂ” countries with cheap power (Russia, Kazakhstan, Iran) are more profitable;","Regulation вЂ” consider local laws. CPU mining is less visible, but bans and limits may still apply in some regions;","Combined mining: you can use CPU + GPU at once (for example CPU mines Monero while GPU mines Ethereum Classic)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"CPU mining in 2026 is a niche but still relevant way to mine cryptocurrencies.","text":"CPU mining in 2026 is a niche but still relevant way to mine cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It suits beginners without a large starting budget, owners of powerful CPUs, and enthusiasts mining ASIC-resistant coins.","text":"It suits beginners without a large starting budget, owners of powerful CPUs, and enthusiasts mining ASIC-resistant coins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Still, for mass mining the CPU has long been no match for GPUs, let alone ASICs. Income is small and payback is doubtful, especially without a smart approach. If you are ready to experiment, follow new coins, and optimize costs, CPU mining can be an interesting niche.","text":"Still, for mass mining the CPU has long been no match for GPUs, let alone ASICs. Income is small and payback is doubtful, especially without a smart approach. If you are ready to experiment, follow new coins, and optimize costs, CPU mining can be an interesting niche."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
