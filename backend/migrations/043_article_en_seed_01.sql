SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).
-- algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Proof of Stake: how staking works and why it reshapes crypto$tmj$,
       $tmj$What PoS is, how staking works, PoW comparison, pros, risks, and the outlook for Proof-of-Stake networks.$tmj$,
       $tmj$PoS algorithm and staking$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
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
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Every blockchain is built on a consensus algorithm вЂ” rules by which the network decides which transactions will be recorded in a block. Proof-of-Work came first, where computation and energy use play the main role. But as cryptocurrencies grew more popular, a question arose: can the process be made faster, more accessible, and greener? That is how the PoS (Proof-of-Stake) algorithm appeared."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Today it is gradually displacing вЂњclassicвЂќ mining and setting new standards. To understand why staking changed the market, it is important to grasp what PoS is in crypto and how the PoS method actually works."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is PoS in cryptocurrency","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If Proof-of-Work bets on computing power and energy, the PoS algorithm uses a completely different principle. New blocks are created by validators вЂ” users who вЂњfreezeвЂќ their tokens in the network. This process is called staking."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The more coins a participant holds and the longer they are locked, the higher the chance of being selected to add a new block."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Work is rewarded with a share of transaction fees and new tokens. So the answer to what PoS is in crypto is simple: it is a system where the chance to earn depends not on hardware power, but on how many coins the user owns."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"PoS algorithm and staking","src":"/images/articles/pos-staking/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"History and development of the PoS method","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The PoS method was first mentioned in 2011 on Bitcoin community forums. Many were discussing how to reduce network energy use. In 2012, Peercoin was the first to deploy it in practice. Then came BlackCoin, Nxt, and Decred вЂ” projects that proved the idea was viable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"But the PoS algorithm truly went mainstream after Ethereum began its transition to Proof-of-Stake."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The launch of Ethereum 2.0 was a major milestone and showed that this technology can handle millions of transactions. Staking is now used across dozens of networks: Cardano, Solana, Polkadot, Tezos, Avalanche, Cosmos. In practice, the PoS method is becoming an industry standard."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How the PoS algorithm works","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The technical scheme of the PoS algorithm looks like this:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Staking coins","text":"the user locks tokens for a set period, confirming their stake in the networkвЂ™s operation."},{"title":"Validator selection","text":"the system randomly chooses a participant to create a block, taking deposit size and age into account."},{"title":"Block creation","text":"the chosen validator adds transactions and broadcasts the block to the network."},{"title":"Reward","text":"the participant receives a reward in coins or fees."}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To protect against attacks, вЂњslashingвЂќ mechanisms are used вЂ” penalties for trying to cheat the network or taking a node offline."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Example: you have 10,000 ADA (Cardano). At 4% APY you earn 400 ADA a year. If the coin price is $0.60, that is about $240 of passive income вЂ” without buying expensive ASICs or paying for electricity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"PoW vs PoS comparison","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To better understand what PoS is in crypto, letвЂ™s compare it with PoW:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"<table><thead><tr><th>Criterion</th><th>Proof-of-Work (PoW)</th><th>Proof-of-Stake (PoS)</th></tr></thead><tbody><tr><td>Energy use</td><td>Very high, especially for BTC</td><td>Minimal</td></tr><tr><td>Entry barrier</td><td>Expensive hardware</td><td>Buying tokens is enough</td></tr><tr><td>Transaction speed</td><td>Low</td><td>Higher, scalable</td></tr><tr><td>Security</td><td>Protected by network hashrate</td><td>Protected by capital and slashing</td></tr><tr><td>Income</td><td>From mining blocks</td><td>From staking tokens</td></tr></tbody></table>","text":"PoW vs PoS comparison by energy use, entry barrier, speed, security, and income."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages of the PoS method","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The PoS algorithm gives users and developers several important advantages at once:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Cost efficiency вЂ” no spending on electricity and hardware.","Environmental friendliness вЂ” PoS networks use about 99% less energy than Bitcoin.","Accessibility вЂ” you can join with small amounts.","Scalability вЂ” transactions are faster and fees are lower.","Reliability вЂ” the more people stake coins, the more resilient the network."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Advantages of the PoS method","src":"/images/articles/pos-staking/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Risks and weaknesses","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"At the same time, the PoS method also has drawbacks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Concentration of coins among large players can lead to centralization.","A falling token price reduces the incentive to keep it staked.","Stable node operation and protection against attacks are required."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These risks are addressed through well-designed penalty mechanisms, staking delegation, and an active community."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What the PoS algorithm gives users","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For investors, the answer to what PoS is in crypto sounds like this: it is a tool for passive income. Staking resembles a bank deposit, only yields are usually higher."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Ethereum вЂ” 4вЂ“6% per year.","Polkadot вЂ” up to 13%.","Cosmos вЂ” 10вЂ“12%."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For miners, it is a signal of change: the market is moving away from hardware and electricity toward financial assets. Accumulating and holding coins can now be more profitable than buying ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Development outlook","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In 2025, more than half of new blockchain projects launch on the PoS algorithm. Analysts estimate that in 5вЂ“7 years this standard will dominate, while PoW will remain mainly for Bitcoin as вЂњdigital gold.вЂќ"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Faster transactions, minimal fees, and a вЂњgreenвЂќ image make the PoS method attractive to investors and regulators alike."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 34
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
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We have covered what PoS is in crypto, how the PoS algorithm works, and why the PoS method is shaping the future of blockchains. It is not just a way to cut energy use, but a new model of user participation in the crypto economy."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Staking opens a path to passive income for millions of investors and turns blockchains into more resilient, flexible systems. Everything points to PoS being not a fad, but a new foundation of the crypto market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- blockchain-forum-2026-moscow
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Blockchain Forum 2026: The Global Crypto Industry Returns to Moscow, April 14вЂ“15$tmj$,
       $tmj$April 14вЂ“15, 2026 in Moscow: Blockchain Forum 2026 unites CIS and global crypto markets. Promo code TOPMINING вЂ” 10% off.$tmj$,
       $tmj$Blockchain Forum 2026 April$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
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
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Blockchain Forum 2026 April","src":"/images/articles/hero-blockchain-forum.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"On April 14вЂ“15, 2026, Blockchain Forum 2026 will take place вЂ” the largest event that will once again bring together the CIS and global crypto markets. It is the only event that will gather leading international industry companies, speakers, and investors in Moscow."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Behind the event is the team that gave the industry Blockchain Life вЂ” a legendary forum that has brought together tens of thousands of people in the worldвЂ™s crypto capitals since 2017."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The international forum traditionally features founders, top executives, and visionaries from Tether, Binance, Tron, Ripple, Bybit, Bitget, Promminer, A7A5, Animoca Brands, Circle, OKX, HTX, Kucoin, Telegram, Mastercard, ICP, Trust Wallet, Sandbox, Near, Litecoin, Bitmain, Marathon, Canaan, WhatsMiner, Bitfury, Consensys, Linea, DWF Labs, Wintermute, BNB chain, and many others."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For the Russian-speaking market, this is a rare chance to hear global leaders in person and build connections without intermediaries."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Three stages and unprecedented scale","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The 16th Blockchain Forum will occupy a dedicated pavilion at Crocus Expo, offering 20,000 attendees three full stages with parallel streams of talks, panel sessions, and workshops."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In addition, all presentations by international speakers will be accompanied by simultaneous interpretation into Russian."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The forum will feature a large exhibition area where more than 250 companies will present their products, services, and technology solutions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Visitors will not only meet well-known brands but also be among the first to see premieres of new platforms, products, tokens, and tools before they go mainstream."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"AI technologies and new formats","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For the first time within Blockchain Forum, AI Future (https://ai-future.com/ru/) will take place вЂ” a вЂњforum within a forumвЂќ dedicated to the intersection of artificial intelligence, blockchain, and the digital economy. Industry representatives, developers, researchers, and investors will meet to discuss how the synergy of AI and blockchain technologies is taking shape."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Attendees can also expect interactive zones, hackathons, a startup contest, NFT installations, a trading tournament, and other immersive themed activities to dive into the marketвЂ™s most current trends."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Tickets and participation","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Sponsorship packages are available at early-bird prices, and tickets come with a 10% discount using promo code TOPMINING:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"рџ‘‰ https://blockchain.forum/ вЂ” join Blockchain Forum"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"рџ‘‰ https://ai-future.com/ вЂ” join AI Future Forum"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$blockchain-forum-2026-moscow$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$What to do with Bitcoin after mining?$tmj$,
       $tmj$Miner strategies: HODL, partial sales, staking, trading, and reinvesting in hardware вЂ” pros, cons, and sample math.$tmj$,
       $tmj$What to do with mined Bitcoin$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
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
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to do with bitcoin in Russia is a question every miner asks, especially after the halving and rising competition. Even with a stable Antminer T21 at 190 TH/s (net profit about в‚Ѕ12,431.87 per month at в‚Ѕ4.7/kWh), you should plan ahead: how to use mined crypto to keep returns and reduce risk."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In this article we review the main options вЂ” from long-term holding to trading and staking вЂ” compare pros and cons, and help you decide what to do with bitcoin now so you donвЂ™t just mine, but earn steadily."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to do with Bitcoin now: options","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"After mining, an ASIC owner faces a key question: sell bitcoins right away or hold hoping for growth?"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"LetвЂ™s look at popular strategies:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"title":"Long term (HODL)","text":"accumulating BTC and waiting for price growth;"},{"title":"Partial sale","text":"to cover expenses;"},{"title":"Staking and DeFi","text":""},{"title":"Trading","text":"to earn from price swings;"},{"title":"Reinvesting in new hardware","text":""}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In practice, each approach fits a different strategy and risk tolerance. LetвЂ™s look at the formats one by one."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Long-term holding","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The simplest, clearest strategy is to hold BTC and wait for growth. Looking at the last 5вЂ“7 years, bitcoin in Russia and worldwide has on average grown even after drawdowns. For example, setting aside 50% of net profit (about в‚Ѕ6,200/month) from one Antminer T21 can accumulate roughly в‚Ѕ74,000 worth of bitcoin in a year."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If the price rises 30вЂ“40%, the profit on those holdings will be substantial."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A plus of long-term holding is protecting capital from ruble inflation; a minus is lower liquidity and the risk of temporary price dips."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Selling","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to do with bitcoins in Russia if you need cash for ongoing costs? The most direct option is to sell part of what you mine. For example, at в‚Ѕ4.7/kWh and revenue of в‚Ѕ24,727.52/month, an Antminer T21 yields about в‚Ѕ12,431.87 net profit per month."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If you immediately sell 50% of mined coins, you get about в‚Ѕ12,363 in rubles each month."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Selling part of mined bitcoins","src":"/images/articles/btc-after-mining/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is convenient for site rent, consumables, and electricity. But if BTC rises, you may miss upside."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Staking and DeFi","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Staking can add 3вЂ“6% APY by locking coins in a smart contract. For example, placing accumulated bitcoin or USDT worth в‚Ѕ100,000 at 5% can earn about в‚Ѕ5,000 a year."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It is not a huge return, but it is passive. The risk is platform reliability and possible token price drawdowns."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Trading","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For those willing to take risk and watch the market, trading is a way to earn from price swings. Usually no more than 10вЂ“15% of the portfolio is recommended for active trading. For example, from an Antminer T21 you might send в‚Ѕ1,200вЂ“1,800 to trading each month. That can raise overall yield, but without experience you risk losing what you put in."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Reinvesting in hardware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For business growth, reinvesting in new ASICs remains one of the most effective paths. A second Antminer T21 at the same ~в‚Ѕ200,000 price can raise revenue to ~в‚Ѕ49,455/month and net profit to ~в‚Ѕ24,800/month. You still need to account for rising network difficulty and BTC price swings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How much to hold and how much to withdraw?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An optimal model combines approaches:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["50% of mined coins can be sold immediately to cover costs;","30% вЂ” held long term;","10вЂ“15% вЂ” put into staking or DeFi;","10вЂ“15% вЂ” used for trading or a liquidity cushion."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That way you minimize risk and still use growth opportunities."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Strategy comparison","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"<table><thead><tr><th>Option</th><th>Yield</th><th>Risks</th><th>Liquidity</th></tr></thead><tbody><tr><td>Holding (HODL)</td><td>MediumвЂ“high</td><td>Price volatility</td><td>Medium</td></tr><tr><td>Partial sale</td><td>Medium</td><td>Missed upside if price rises</td><td>High</td></tr><tr><td>Staking and DeFi</td><td>LowвЂ“medium</td><td>Cyber risks</td><td>Medium</td></tr><tr><td>Reinvest in hardware</td><td>MediumвЂ“high</td><td>Price, network difficulty</td><td>Low</td></tr></tbody></table>","text":"Strategy comparison by yield, risks, and liquidity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 29
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
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What to do with bitcoin now depends on your goals, risk tolerance, and capital size. The steadiest option for beginners is to combine classic mining with an Antminer T21, selling part of the coins and holding BTC long term."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"For those ready to go further вЂ” add staking, trading, and reinvestment in hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That way you can keep a balance between yield, liquidity, and risk, and bitcoin in Russia stays not only a way to accumulate, but also a way to earn."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$What you need for home crypto mining$tmj$,
       $tmj$Hardware, power, cooling, noise, internet, and software вЂ” a full checklist to launch a home mining farm.$tmj$,
       $tmj$What you need for home mining$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
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
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining cryptocurrency in residential spaces is a common practice that has been relevant since the BTC blockchain launched and remains so today. For some, it is an excellent way to get familiar with the technology before investing in an industrial setup. For others, it is a source of side or even primary income that, when done right, can be quite substantial. Whatever your goals, you need to understand how this work operates. Below we explain in detail what you need for home cryptocurrency mining and how to run a farm in a dwelling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Home cryptocurrency mining","src":"/images/articles/home-mining/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"First thing you need for home mining вЂ” hardware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Classic cryptocurrency mining under Proof of Work (PoW) assumes running physical hardware (the exception is the cloud format, which we will analyze later). Today, four types of equipment can be used in residential spaces:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["CPUs. Digital asset mining history began with CPUs in 2009 вЂ” the first BTC block was obtained with processors. Today, interacting with the Bitcoin network on CPU is impossible because mining difficulty has grown and CPU power is insufficient. However, such hardware can mine some altcoins, for example Monero (XMR), Veruscoin (VRSC), Zephyr (ZEPH), Yadacoin (YDA), Spectre Network (SPR), Xelis (XEL), Tuske (TSK). Processors do not consume much energy, run quietly, and do not produce a large amount of heat;","GPUs. A few years after the crypto industry launched, graphics cards joined mining. The legendary GPU format was Ethereum mining, but in autumn 2022 that asset moved to PoS (Proof of Stake), making GPU computation for it impossible. ETH is now obtained via staking (similar to bank deposits), and GPUs are used for other tokens вЂ” Grin (GRIN), Ravencoin (RVN), Skydog (SKYDOG), Zano (ZANO), Nexa (NEXA), Gram (GRAM), Flux (FLUX), Bitcoin Gold (BTG), Ergo (ERG), Ethereum Classic (ETC), and so on. Advantages are comparable to CPUs, but GPU prices are much higher;","Classic ASICs of standard design. These are the familiar devices that can mine BTC as well as many other coins, for example Litecoin (LTC), Dogecoin (DOGE), Kaspa (KAS), Sedra (SDR), Bugna (BGA), Ethereum Classic (ETC), Kadena (KDA). They are noisy and вЂњhotвЂќ devices that consume a lot of electricity. Comfortable use in residential spaces is only possible under certain conditions вЂ” we cover them below;","Home ASICs for altcoin mining. A trend that emerged in 2024 was started as a replacement for CPUs and GPUs. Makers of such hardware enabled comfortable operation in dwellings, but with higher profitability than processors and graphics cards. These miners can run in an apartment without extra gear: neighbors can coexist peacefully and the room stays quiet."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is also a format for mining cryptocurrency without owning hardware: choosing cloud services where the investor rents capacity from the equipment owner."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That approach also works well in residential spaces because you do not need to buy and run ASICs. However, it should not be considered classic mining: it is more accurate to call it passive investment in digital assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Second component вЂ” electricity","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Classic ASICs have an important technical trait вЂ” substantial current consumption. We are talking about 3.5 kW per device, which can be critical in several cases:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Some apartments are capped at 5 kW, which rules out running miners while living there at the same time;","Wiring and circuit breakers face serious requirements: there is always a fire risk if the apartment has outdated outlets and thin cable;","Running a farm of three or more ASICs is not an option."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Electricity for home mining","src":"/images/articles/home-mining/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Note also the appearance in Russia of legislation regulating digital asset mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Since 2024, individuals have been limited to 6,000 kWh of electricity per month. That is only 8.3 kW per hour, equivalent to just two ASICs consuming about 3.5 kW each. If capacity exceeds these values, continuing legally requires registering as an individual entrepreneur (or a legal entity), joining the specialized registry, and paying taxes. As an alternative, you can choose GPUs, CPUs, or ASICs designed for residential use вЂ” that type of hardware consumes much less."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Third thing you need for home cryptocurrency mining вЂ” cooling","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another technical trait of crypto mining hardware is serious heat output. With a small number of cards and processors the issue is minor, but with a full rig or a classic ASIC you must solve heat removal very quickly."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In apartments and other dwellings you can exhaust air outdoors through a window or balcony door."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is also a format that heats tap water or heats living space: this approach is popular in Siberia, but requires extra engineering work and spending to reconfigure the farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Element number four вЂ” noise control","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Perhaps the most serious problem classic ASIC owners face in an apartment is high noise. Miner operation can be compared to running a powerful industrial vacuum cleaner. Not only apartment residents but all neighbors will feel this drawback, which is a tangible barrier to this form of earning."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are two ways to solve the problem:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Placing the ASIC in a dedicated sound box that can cut noise by roughly half;","Immersing the miner in immersion baths and redirecting farm heat to heat the premises. We mentioned this principle earlier: it also helps with noise."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC noise control","src":"/images/articles/home-mining/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Both formats involve extra costs, but a sound box costs much less than water cooling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"When using such add-ons, remember additional risks: maintaining a comfortable temperature regime and minimizing the chance of the miner catching fire."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Fifth thing you need for home mining вЂ” Internet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Any cryptocurrency mining hardware runs online and needs stable Internet access. In residential spaces this is easy, because almost every house or residential complex is connected to one or more providers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As an alternative you can use classic mobile connectivity: 3G or 4G is enough for solid farm operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Instead of a router you can use an ordinary mobile phone: just enable hotspot mode. Connection requirements are also minimal: 10вЂ“12 KB/s per device, ping up to 50вЂ“60 milliseconds, traffic volume no more than 1 GB."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Item #6: Software stack","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What else do you need for home cryptocurrency mining? Several software solutions help start the process and work comfortably with the assets you earn:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["A pool. Less than 1% of participants work with the blockchain in вЂњsoloвЂќ mode; the rest mine via specialized services вЂ” pools. On one such resource you create an account, get connection parameters, and enter them in your minerвЂ™s admin panel;","An exchange or swap service profile. Needed to withdraw funds via payment services or P2P;","Newer miner firmware. Such software can increase hashrate and lower power consumption. Choose third-party updates carefully: poor software can break the ASIC, not to mention the risk of stolen funds;","Remote monitoring programs. Managing the farm from afar, tracking operating temperatures, and emergency shutdown вЂ” all of these can be handled with third-party software."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Software tools for mining","src":"/images/articles/home-mining/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 32
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
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What do you need for home cryptocurrency mining? The list has six elements:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"CPU, GPU, classic ASIC, or a home miner;","title":"Hardware"},{"text":"","title":"Electricity"},{"text":"","title":"Cooling"},{"text":"","title":"A way to control noise"},{"text":"","title":"Internet"},{"text":"","title":"Software stack"}],"ordered":true}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Remember, though, that even the most thorough preparation will not turn a home farm into a full-fledged investment tool. Ambitious goals require a dedicated facility or sending hardware to a professional site."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- chto-vygodnee-majnit-ili-pokupat-kriptovalyutu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Is it better to mine or buy crypto?$tmj$,
       $tmj$Mining vs buying BTC: pros and cons of each path, timing of entry, and the role of a mining calculator.$tmj$,
       $tmj$Mine or buy cryptocurrency$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
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
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Coffee with milk or without? Japanese or German cars? Mine bitcoin or simply buy it? Three of humanityвЂ™s most pressing questions вЂ” and none of them are easy. Since you are on a portal dedicated to digital assets, we will try to answer the blockchain-related riddle. Let someone else argue about drinks and cars!"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to get BTC: two ways","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"First, it helps to understand which legal ways exist to become an owner of digital gold. There are two known methods:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Running a mining process. For that you need specialized hardware called a miner (a GPU or an ASIC). You mine yourself, learn the craft, pay for electricity, and maintain the equipment. Your reward is the amount of crypto you produce;","Buying crypto on an exchange. You simply purchase assets without dealing with the technical side of obtaining them."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is the difference between these two approaches? Above all, whether you need technical gear вЂ” or an entire farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"How to get BTC: two ways","src":"/images/articles/mine-or-buy/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Hardware must be purchased, maintained, and monitored вЂ” that is an extra investment. On the other hand, you can sell the gear later вЂ” another way to earn from crypto once the device has paid for itself. We will cover that below."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Buying crypto: pros and cons","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"We will start with the simpler option вЂ” buying cryptocurrency. Today you can quickly register on an exchange and earn from a rising coin price. This kind of investment has the following advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Any beginner can learn how an exchange works вЂ” it usually takes no more than half an hour. After that, more currency can be bought in just a couple of minutes;","A simple and crystal-clear way to invest: if the price rises, you profit on the вЂњbuy BTC cheaper, sell higherвЂќ principle;","You can trade like on a stock exchange. With BTC, profits can be even higher because digital assets are more volatile;"],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is also a downside that affects your earnings: profit depends only on the crypto price, while mining also involves changes in hardware value вЂ” another chance to earn more."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Cryptocurrency mining: pros and cons","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An alternative way to get crypto is to take an ASIC (Antminer or Whatsminer) and become a real miner. What advantages does this method offer:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["An investor can grow capital not only from crypto price swings, but also from the ASICвЂ™s residual secondary-market value. Once the equipment has paid back (the money invested in it is recovered), the remaining hardware price becomes an extra earning opportunity;","There is room to overclock an ASIC to mine more вЂ” there is no shortage of modification guides today, which can make the business even more profitable;","Extra side benefits. For example, heat from an ASIC can warm a home and cut utility bills вЂ” a practice actively used in cooler climates."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrency mining: pros and cons","src":"/images/articles/mine-or-buy/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are risks and downsides as well:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Rising BTC mining difficulty reduces profit;","Selling an ASIC on the secondary market is a difficult and lengthy process;","Hardware can become obsolete when mining algorithms change. We all remember ETHвЂ™s controversial move to PoS. After that, GPU profitability dropped sharply."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is everything you need to weigh before deciding whether to buy a miner or a GPU to mine digital gold."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mine or buy?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What conclusion should you draw when answering this question? The first and key factor is timing. There are two chronological landmarks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["When you buy the asset (BTC or equipment). Hardware prices track the crypto market, so the best time to purchase is a bear market, when prices are lowest;","When you sell the asset (both crypto and hardware). The profitable window is a rising cycle вЂ” bullish hype and market euphoria. That is when you can get the maximum amount from a sale."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There is only one practical tool for estimating returns from crypto assets вЂ” a mining calculator. It helps you run a proper calculation based on key parameters: hardware manufacturer, exchange rate, mining difficulty, electricity cost, and so on."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"By the way, there is no universal answer to whether mining or buying crypto is more profitable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Everything depends on individual conditions вЂ” for example, the ASIC model you use or even electricity prices in the region where you mine. Arm yourself with a modern calculator, and you will be able to choose the right way to earn on the digital gold market for your specific case."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$chto-vygodnee-majnit-ili-pokupat-kriptovalyutu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Blockchain Life 2025 in Dubai вЂ” Akon on the official AfterParty$tmj$,
       $tmj$October 28вЂ“29 in Dubai: Blockchain Life 2025. Akon performs at the Soho Garden DXB AfterParty. 10% off tickets with promo code TOPMINING.$tmj$,
       $tmj$Blockchain Life 2025 Dubai$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On October 28вЂ“29 in Dubai, the long-awaited global crypto event вЂ” <a href=\"https://blockchain-life.com/?utm_medium=referral&amp;utm_source=top-mining.ru&amp;utm_campaign=topmining#tickets-row\"><strong>Blockchain Life 2025</strong></a> вЂ” will take place. Right on the eve of the bull run, the Forum will bring together more than 15,000 participants from 130+ countries, including market leaders, top executives of major companies, and the industryвЂ™s leading media figures.","text":"On October 28вЂ“29 in Dubai, the long-awaited global crypto event вЂ” Blockchain Life 2025 вЂ” will take place. Right on the eve of the bull run, the Forum will bring together more than 15,000 participants from 130+ countries, including market leaders, top executives of major companies, and the industryвЂ™s leading media figures."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The culmination of the event will be a <strong>legendary Afterparty</strong> at one of the worldвЂ™s best clubs вЂ” <strong>Soho Garden DXB.</strong> Guests can expect premium networking with more than 1,300 VIP participants, including forum speakers, plus catering, a show program, and a bar вЂ” all inclusive.","text":"The culmination of the event will be a legendary Afterparty at one of the worldвЂ™s best clubs вЂ” Soho Garden DXB. Guests can expect premium networking with more than 1,300 VIP participants, including forum speakers, plus catering, a show program, and a bar вЂ” all inclusive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The highlight of the evening will be an <strong>exclusive set by global superstar Akon</strong>, whose performance will make the anniversary 15th Blockchain Life truly unforgettable.","text":"The highlight of the evening will be an exclusive set by global superstar Akon, whose performance will make the anniversary 15th Blockchain Life truly unforgettable."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Confirmed forum participants already include: <strong>OKX, Bybit, KuCoin, HTX, Bitget, BingX, Ledger, Tron, Trust Wallet, MEXC,Bitmain, Canaan, A7A5, Uminers and many others</strong>.","text":"Confirmed forum participants already include: OKX, Bybit, KuCoin, HTX, Bitget, BingX, Ledger, Tron, Trust Wallet, MEXC,Bitmain, Canaan, A7A5, Uminers and many others."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Learn more and <a href=\"https://blockchain-life.com/?utm_medium=referral&amp;utm_source=top-mining.ru&amp;utm_campaign=topmining#tickets-row\">buy tickets with a 10% discount</a> using promo code TOPMINING.","text":"Learn more and buy tickets with a 10% discount using promo code TOPMINING."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Blockchain Life 2025 Dubai вЂ” forum banner","src":"/images/articles/blockchain-life-2025-dubai/banner.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Where to find fresh mining news in Russia and worldwide$tmj$,
       $tmj$Manufacturers, distributors, crypto media, and national press вЂ” reliable sources for mining news.$tmj$,
       $tmj$Where to find mining news$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
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
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Timely, relevant information is one of the key resources of the 21st century. Having fresh data opens new doors, creates opportunities, and improves the odds of reaching your goals. Cryptocurrencies and mining only confirm this rule вЂ” here, knowledge lets you build a long-term strategy for successful earnings. Where should you look for ASIC news in Russia and worldwide today? We answer this frequently asked question in detail."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Hardware and equipment manufacturers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The most reliable source of fresh data is the official channels of hardware brands. The brandвЂ™s own press office provides verified information on new ASIC release dates, new firmware, and energy-efficient devices that may go on sale in the coming months or years."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The websites and social networks of companies such as BITMAIN, MicroBT, Sunlune Technology, iPollo, and Iceriver are the highest-quality sources of knowledge."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To know release dates for new products and understand technical details, follow the brandsвЂ™ social networks and visit their websites periodically. If there is a language barrier, you can always use online translators."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Manufacturers and distributors","src":"/images/articles/mining-news-sources/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Sellers and distributors","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A downside of monitoring news on manufacturersвЂ™ official sites is the difficulty of following several sources at once. That is why mining news in Russia from major stores and distributors is an effective alternative."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"As a rule, such companies partner with leading ASIC brands. Their press teams stay on top of events and try to share insights with their own customers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"On distributorsвЂ™ official websites and social networks you can find timely news items:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Announcements of new ASIC models;","Details on manufacturersвЂ™ work on high-performance devices;","Shipment data and whether a given device can be purchased soon;","Broader crypto industry announcements вЂ” for example, legislative changes, tariff updates, restrictions, and bans."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To capture customersвЂ™ attention, mining equipment sellers try to make their news feeds useful and engaging."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That works in the buyerвЂ™s favor, since they can subscribe to the feed. There is a major downside, though: content quality depends on the storeвЂ™s level and the press teamвЂ™s professionalism. If that team does a poor job, readers may miss important nuances. Another negative scenario is a storeвЂ™s interest in promoting a particular brand вЂ” in that case that manufacturerвЂ™s strengths will be highlighted, especially against competitorsвЂ™ weaknesses."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Websites and social networks about cryptocurrencies and mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Portals and niche channels on cryptocurrencies and working with them also deserve respect. Their advantage is a neutral stance on the news cycle. As a rule, such resources are not interested in promoting a particular brand вЂ” editorial opinion is neutral and independent, which helps you get truly timely news about working with crypto."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In addition to mining, such platforms also cover related topics, which can also be useful for a farm owner."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That can include new regulations, profitable ways to work with crypto, and promising earning formats. Crypto enthusiasts usually do not limit themselves to mining alone: trading, drops, and investments also interest them."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining portals and media","src":"/images/articles/mining-news-sources/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Portals and websites","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Another possible source of fresh information on earning from digital assets today is general news portals that cover essentially everything happening in Russia and worldwide. Advantages of this format are high reach and brand recognition."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"However, keep in mind the risk of low expertise: mining is a complex technical topic that requires certain knowledge from journalists."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"So quality is not always exemplary, not to mention shallow coverage. News portals also will not publish niche items вЂ” for example, an upcoming new ASIC вЂ” because that topic does not interest a mass audience. A reader may therefore miss an important announcement if they rely only on federal media."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
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
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Just want to stay informed and know the key mining news in Russia and worldwide today? Reading classic online media is enough. Deeper analysis is available on mining and crypto portals and similar social channels. Following the press output of major stores and distributors is a good option, but that source cannot offer full neutrality. Finally, the most verified and up-to-date data is on the manufacturersвЂ™ own platforms вЂ” but quality monitoring of those resources always takes time and often requires translating the original text."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- gde-kupit-asik-dlya-majninga-top-10-magazinov
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Where to buy an ASIC: top 10 stores$tmj$,
       $tmj$Cheapest is not always best вЂ” how to choose a reliable ASIC shop for quality, warranty, and delivery.$tmj$,
       $tmj$R7miner mining equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
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
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Where to buy ASIC? The most popular question that is most often asked not only by beginners, but also by experienced miners. The quality of choosing a store when buying an ASIC miner is not only about вЂњwhere is cheaperвЂќ, but also a matter of reliability, security and profit. Here's why it's important:","text":"Where to buy ASIC? The most popular question that is most often asked not only by beginners, but also by experienced miners. The quality of choosing a store when buying an ASIC miner is not only about вЂњwhere is cheaperвЂќ, but also a matter of reliability, security and profit. Here's why it's important:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Money down the drain - if you end up in the hands of scammers, you can be left without an ASIC and without money;","Defects and breakdowns вЂ“ an unreliable store may sell a used or faulty miner without a guarantee;","No support - without help, an investor will spend a lot of time and nerves setting up and maintaining equipment;","Unjustified costs - hidden fees, customs clearance, delivery and overpayments can вЂњeat upвЂќ all the benefits from mining;","Problems with the law - if the equipment is imported вЂњgrayвЂќ, there may be difficulties with customs or tax authorities. This is especially true recently, since the presence of a cargo customs declaration is a mandatory requirement for legal mining."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A good store is reliable insurance against problems, losses and hassle. Therefore, when answering the question of where to buy an ASIC, you should analyze many factors.","text":"A good store is reliable insurance against problems, losses and hassle. Therefore, when answering the question of where to buy an ASIC, you should analyze many factors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Where to buy an ASIC: criteria for choosing wisely","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"An express analysis of a store for a potential purchase of a miner can be carried out using a simple table. In it, we examined the key requirements for sellers of mining equipment.","text":"An express analysis of a store for a potential purchase of a miner can be carried out using a simple table. In it, we examined the key requirements for sellers of mining equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Criterion","value":"Description"},{"label":"Reputation and experience","value":"Study the history of the company, customer reviews on independent sites and forums. Make sure that the company participates in specialized exhibitions and conferences."},{"label":"Range and relevance of models","value":"Make sure that the company offers modern models of ASIC miners for various algorithms (SHA-256, Scrypt, Ethash, etc.). Please note that there is information about hashrate, power consumption and efficiency for each model."},{"label":"Pricing transparency","value":"Compare prices with other suppliers. Check to see if delivery, customs duties and VAT are included in the price."},{"label":"Warranty and service","value":"Check the warranty conditions and the availability of certified service centers. Check the procedure for returning and exchanging equipment."},{"label":"Technical support","value":"Evaluate the quality and efficiency of technical support by asking a few questions. Find out if the company provides assistance in setting up and optimizing your equipment."},{"label":"Legality of activity","value":"Check the availability of legal information on the companyвЂ™s website (TIN, OGRN). Make sure the company has the necessary licenses and certificates."},{"label":"Terms of delivery and payment","value":"Check delivery times and methods. Research the available payment methods and their security."},{"label":"Additional services","value":"Find out if the company offers hosting services or assistance in placing equipment in data centers."}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Let's look at each element of the list in more detail:","text":"Let's look at each element of the list in more detail:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Why itвЂ™s important: there are many intermediaries and dubious sellers in the mining market, and a good reputation reduces the risk of running into scammers. What to look for: reviews on forums and Telegram chats of miners, time on the market (the longer the better), social networks, participation in exhibitions, mentions in the media, the presence of public cases and reviews from large clients;","title":"Reputation and experience"},{"text":"Why itвЂ™s important: different devices work on different algorithms and give different returns. What to look for: are there any popular models, for example, Antminer S21 or Antminer L9, is the information on the website about hashrate, power consumption, temperature conditions up-to-date, is there a filter by algorithms (SHA-256, EtHash), can they help you choose a model for your purposes (data center/home mining, etc.);","title":"Range and relevance of models"},{"text":"Why itвЂ™s important: Some stores attract you with a low price, and then add hidden fees. What to look for: turnkey price (is delivery, VAT, customs clearance included), is there an online calculator or commercial offer, the ability to fix the rate when booking or making advance payments;","title":"Pricing transparency"},{"text":"Why itвЂ™s important: the ASIC can fail, especially if delivered or incorrectly configured. What to look for: warranty period (usually 6вЂ“12 months), what is included in the warranty (for example, board repair, fan replacement), is there a service center in Russia, return or exchange conditions (within 14 days);","title":"Warranty and service"},{"text":"Why it's important: Setting up hardware can be a daunting task for beginners. What to look for: how quickly and thoroughly they answer questions before purchasing, is there support after the sale (telegram, e-mail, calls), are they ready to help with setup, firmware, connecting to the pool, do they provide training or issue instructions;","title":"Technical support"},{"text":"Why is it important: working with a registered legal entity. face is reliability and protection of the rights of customers. What to look for: is there an INN/OGRN on the website, work under a contract, provision of receipts, official delivery with a customs declaration, and not вЂњgray importвЂќ, readiness to enter into a purchase and sale agreement with a legal entity/individual entrepreneur;","title":"Legality of activity"},{"text":"Why itвЂ™s important: poor quality logistics = risk of receiving damaged goods. What to look for: is there delivery to your city, within the Russian Federation or abroad, work with transport companies (SDEK, Business Lines), is it possible to pay with crypto, bank transfer, through a bank account, is it possible to pay in parts or installments;","title":"Terms of delivery and payment"},{"text":"Why is it important: mining is not only a purchase, but also an operation. What to look for: hosting services (location in a data center), installation, turnkey configuration, maintenance and repair, provision of API or remote monitoring;","title":"Additional services"},{"text":"Why itвЂ™s important: Russia now has clear rules for regulating mining. What to look for: the seller is guided by current legislation, does not violate the law on the import/use of equipment (availability of a cargo customs declaration), can formalize the purchase officially, taking into account VAT;","title":"Legal Compliance"},{"text":"Why it matters: The real experiences of other users can tell more than advertising. What to look for: are there positive and negative reviews, does the store respond to criticism, are there any cases on websites or in Telegram from customers.","title":"Reviews and recommendations"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"How to buy ASIC? Choosing a reliable and trusted equipment supplier is a key factor for minimizing risks, ensuring uninterrupted operation of devices and achieving planned profitability. A responsible approach to choosing a partner allows you to avoid financial losses, technical problems and legal difficulties.","text":"How to buy ASIC? Choosing a reliable and trusted equipment supplier is a key factor for minimizing risks, ensuring uninterrupted operation of devices and achieving planned profitability. A responsible approach to choosing a partner allows you to avoid financial losses, technical problems and legal difficulties."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: R7miner (Ersemminer)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The R7miner company has been selling mining equipment since 2017, and in 2023 it opened its own data center in the city of Troitsk. The store focuses on the completely legal import of equipment from China with all accompanying and supporting documents. The seller works with Bitmain and Whatsminer products, which somewhat limits the capabilities of miners. But for legal entities there is leasing, and order delivery is carried out on a turnkey basis with minimal client participation. The head office is located in St. Petersburg, there is a representative office and warehouse in Moscow.","text":"The R7miner company has been selling mining equipment since 2017, and in 2023 it opened its own data center in the city of Troitsk. The store focuses on the completely legal import of equipment from China with all accompanying and supporting documents. The seller works with Bitmain and Whatsminer products, which somewhat limits the capabilities of miners. But for legal entities there is leasing, and order delivery is carried out on a turnkey basis with minimal client participation. The head office is located in St. Petersburg, there is a representative office and warehouse in Moscow."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"R7miner - mining equipment","src":"/images/articles/rating-countries/datacenter-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"RIGHT GROUP\""},{"label":"Revenue","value":"305.1 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Years on the market","value":"more than 2.5"},{"label":"Authorized capital","value":"10 thousand в‚Ѕ"},{"label":"Website","value":"r7miner.com"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"Yes"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2022"},{"label":"Store rating, Yandex","value":"4,4"},{"label":"Number of reviews, Yandex","value":"13"},{"label":"Office address","value":"St. Petersburg, 10th line V.O., 15, Lit. Ah, pom. 1H"},{"label":"Equipment brands","value":"Bitmain, Whatsminer"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest company rating in Yandex;","A small number of reviews."],"pros":["An absolutely вЂњwhiteвЂќ way of selling machinery and equipment;","Own hosting;","Leasing for legal entities;","Emphasis on prompt delivery;"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Sibmain (Sibmain)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another company that implements an integrated approach to mining is Sibmain. Here you can buy equipment for mining cryptocurrencies and place it in a Siberian data center with favorable electricity tariffs. The store offers a basic assortment - the main models of famous manufacturers are presented, including Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo and Goldshell.","text":"Another company that implements an integrated approach to mining is Sibmain. Here you can buy equipment for mining cryptocurrencies and place it in a Siberian data center with favorable electricity tariffs. The store offers a basic assortment - the main models of famous manufacturers are presented, including Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo and Goldshell."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Buyers may be put off by the lack of a large number of reviews on specialized sites - and this despite the fact that Sibmine has been providing specialized services for more than five years. But clients have access to a leasing format, as well as investing in mining with a payback of 10 months.","text":"Buyers may be put off by the lack of a large number of reviews on specialized sites - and this despite the fact that Sibmine has been providing specialized services for more than five years. But clients have access to a leasing format, as well as investing in mining with a payback of 10 months."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Sibmain - mining in Siberia","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Website","value":"sibmain.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2021"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"17"},{"label":"Office address","value":"Moscow, Kaluzhskaya square, 1/1"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo, Goldshell"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A small number of reviews about the company."],"pros":["Own hosting in Siberia;","Prices for some items look attractive;","Availability of a basic range of popular models;","вЂњTurnkeyвЂќ client support;","Format of investment cooperation."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Getasic (Getasik)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Getasic has been providing services in the field of sales and placement of mining equipment since 2017. During its work, the seller has established itself as a trusted counterparty, providing an impressive range of equipment for mining cryptocurrencies. In the Getasic store you can even find rare ASIC models that are not available on competitorsвЂ™ product shelves. Buyers are also offered installment plans and leasing for legal entities. Some of the equipment is located in warehouses in the Russian Federation; the remaining items will have to wait for delivery from China.","text":"Getasic has been providing services in the field of sales and placement of mining equipment since 2017. During its work, the seller has established itself as a trusted counterparty, providing an impressive range of equipment for mining cryptocurrencies. In the Getasic store you can even find rare ASIC models that are not available on competitorsвЂ™ product shelves. Buyers are also offered installment plans and leasing for legal entities. Some of the equipment is located in warehouses in the Russian Federation; the remaining items will have to wait for delivery from China."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In addition to selling equipment, Getasic offers the services of a mining hotel and service center. For novice miners there is a free training course, and for advanced users - firmware to optimize the operation of the equipment. Until 2022, a certain amount of negative reviews was noted, however, the work carried out on the errors made it possible to correct the situation - since then, reviews about the Getasik company have only been positive.","text":"In addition to selling equipment, Getasic offers the services of a mining hotel and service center. For novice miners there is a free training course, and for advanced users - firmware to optimize the operation of the equipment. Until 2022, a certain amount of negative reviews was noted, however, the work carried out on the errors made it possible to correct the situation - since then, reviews about the Getasik company have only been positive."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Getasic - ASIC store","src":"/images/articles/rating-countries/globe-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Website","value":"miningmoon.ru"},{"label":"Own hosting","value":"no data"},{"label":"Official equipment sales","value":"Yes"},{"label":"Unofficial equipment sales","value":"Yes"},{"label":"Domain registration date","value":"2017"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"83"},{"label":"Office address","value":"Moscow, Ostapovsky proezd, 3, building 29"},{"label":"Equipment brands","value":"Aixin, Baikal, Bitfly, Bitmain, Canaan, Cheetah, Dayun, Dragonmint, Ebang, Goldshell, Hummer, iBeLink, Innosilicon, Jasminer, MicroBT, StrongU, Toddminer, Iceriver"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Negative reviews until 2022."],"pros":["Old trusted supplier;","Large range of manufacturers and models available for purchase;","Own hosting and service center;","Leasing and installments;","Official format of work with all necessary documents;","Author's firmware for equipment is presented;","Impeccable reputation from 2022;","Sales both from a warehouse in Moscow and wholesale format of work with China;","Several offices in Russia."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Asgard (Asgard)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Asgard company has been selling mining equipment since 2017. In addition to the store, Asgard provides service center services, hosting, and investing in cryptocurrency mining. A good range of equipment is complemented by the sellerвЂ™s assurances that more than 90% of the items are in warehouses in Russia - there is no need to wait for long delivery from China. In addition to mining equipment, the Asgard company offers ready-made containers, immersion cooling kits and components.","text":"The Asgard company has been selling mining equipment since 2017. In addition to the store, Asgard provides service center services, hosting, and investing in cryptocurrency mining. A good range of equipment is complemented by the sellerвЂ™s assurances that more than 90% of the items are in warehouses in Russia - there is no need to wait for long delivery from China. In addition to mining equipment, the Asgard company offers ready-made containers, immersion cooling kits and components."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The company has a good reputation as a reliable counterparty, and competitive prices allow you to purchase equipment on market conditions. Leasing is possible for legal entities, and special prices apply for wholesale buyers.","text":"The company has a good reputation as a reliable counterparty, and competitive prices allow you to purchase equipment on market conditions. Leasing is possible for legal entities, and special prices apply for wholesale buyers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Asgard - store and hosting","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"ASGARD\""},{"label":"Revenue","value":"175.5 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Years on the market","value":"more than 3"},{"label":"Authorized capital","value":"50 thousand в‚Ѕ"},{"label":"Website","value":"asg-ard.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2021"},{"label":"Store rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"42"},{"label":"Office address","value":"Moscow, 2nd Kabelny proezd 2A"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Canaan, Innisilicon"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There are negative reviews about slow work and poor quality repairs."],"pros":["A decent range of popular equipment;","Own hosting and service center;","Investment format of cooperation;","Leasing for legal entities;","The bulk of the equipment is located in warehouses in Russia;","The range is complemented by water cooling kits;","Several offices in Russia."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Umnus (Umnus)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Industrial mining operator Umnus is positioned as a company with an integrated approach to cryptocurrency mining. This is not only an equipment store, but also a hosting with two sites, a service center, and also a business partner offering various formats for investing in cryptocurrencies. You can choose package interaction options with different returns if you do not plan to independently mine digital assets and become familiar with the technical nuances of this business.","text":"Industrial mining operator Umnus is positioned as a company with an integrated approach to cryptocurrency mining. This is not only an equipment store, but also a hosting with two sites, a service center, and also a business partner offering various formats for investing in cryptocurrencies. You can choose package interaction options with different returns if you do not plan to independently mine digital assets and become familiar with the technical nuances of this business."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Umnus product range is limited to only a few equipment manufacturers, and navigation on the site is not convenient or of high quality. The Umnus operating model is more focused on investors and business partners, while private miners and ordinary buyers may experience some difficulties.","text":"The Umnus product range is limited to only a few equipment manufacturers, and navigation on the site is not convenient or of high quality. The Umnus operating model is more focused on investors and business partners, while private miners and ordinary buyers may experience some difficulties."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Umnus - industrial mining","src":"/images/articles/rating-countries/map-bitcoin-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"SMART DEVICES\""},{"label":"Revenue","value":"246 million в‚Ѕ"},{"label":"Courts","value":"Plaintiff: won - 0%, lost - 100%"},{"label":"Years on the market","value":"more than 4"},{"label":"Authorized capital","value":"8.5 million в‚Ѕ"},{"label":"Website","value":"umnus.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2019"},{"label":"Store rating, Yandex","value":"4,7"},{"label":"Number of reviews, Yandex","value":"35"},{"label":"Office address","value":"Moscow, Nagorny proezd, building 10, building 2, building 3"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Canaan"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited range of equipment;","The site does not always work correctly;","A small number of reviews about the company."],"pros":["An integrated approach to working with cryptocurrencies;","Focus on investments and business partnerships (ready-made packages);","Two data centers (Elektrogorsk and Sosnovoborsk);","Own service center;","Author's mobile application for Google Play and App Store."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Uminers","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Uminers company is part of an international digital platform that combines a marketplace, a logistics system and hosting for equipment placement. The head office began operating in China in 2014, while the Russian representative office is much younger. The store's catalog includes ASICs from Whatsminer, Bitmain, Innosilicon and some models of video cards. Part of the assortment is in a warehouse in Moscow, the rest of the inventory is shipped from China.","text":"The Uminers company is part of an international digital platform that combines a marketplace, a logistics system and hosting for equipment placement. The head office began operating in China in 2014, while the Russian representative office is much younger. The store's catalog includes ASICs from Whatsminer, Bitmain, Innosilicon and some models of video cards. Part of the assortment is in a warehouse in Moscow, the rest of the inventory is shipped from China."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The company is small, the range is based on basic models, however, the cost of the equipment is quite competitive. There is practically no negative, and if desired, the buyer can place his own equipment in the Uminers data center in Krasnoyarsk. In addition, Uminers provides logistics services all over the world, as this area is one of the key ones for the brand.","text":"The company is small, the range is based on basic models, however, the cost of the equipment is quite competitive. There is practically no negative, and if desired, the buyer can place his own equipment in the Uminers data center in Krasnoyarsk. In addition, Uminers provides logistics services all over the world, as this area is one of the key ones for the brand."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Uminers - marketplace and logistics","src":"/images/articles/rating-countries/datacenter-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Website","value":"uminers.com"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2017"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"29"},{"label":"Office address","value":"Moscow, Khodynsky Boulevard, 11"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Innosilicon"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest assortment;","Not the most detailed company website;","A small number of reviews, which does not allow us to fully form an idea of вЂ‹вЂ‹the company."],"pros":["Part of an international platform with an office in China;","Competitive prices;","The catalog contains not only ASICs, but also video cards;","Own data center in Krasnoyarsk."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Gis mining (GIS Mining)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Gis mining group of companies is a store selling equipment for the extraction of digital assets, as well as a mining hotel, service office, data center developer, monitoring system provider and seller of mining containers. The sale of equipment is carried out officially with the provision of all necessary documents. Reviews about the store are extremely positive, the reputation is not spoiled by incidents and cases of deception.","text":"The Gis mining group of companies is a store selling equipment for the extraction of digital assets, as well as a mining hotel, service office, data center developer, monitoring system provider and seller of mining containers. The sale of equipment is carried out officially with the provision of all necessary documents. Reviews about the store are extremely positive, the reputation is not spoiled by incidents and cases of deception."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Gis mining is the official dealer of Bitmain and Whatsminer in Russia, providing a 1-year warranty. The store cooperates with delivery services Business Lines, SDEK, OZON and Yandex Market. Among the partners announced are Rosatom, Alfa Bank, VSK Insurance House, as well as BTC.com and AllBTC.","text":"Gis mining is the official dealer of Bitmain and Whatsminer in Russia, providing a 1-year warranty. The store cooperates with delivery services Business Lines, SDEK, OZON and Yandex Market. Among the partners announced are Rosatom, Alfa Bank, VSK Insurance House, as well as BTC.com and AllBTC."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Gis mining - official dealer","src":"/images/articles/rating-countries/map-bitcoin-wide.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"GLOBAL INFORMATION SYSTEMS\""},{"label":"Revenue","value":"406.3 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Years on the market","value":"more than 3"},{"label":"Authorized capital","value":"1.9 million в‚Ѕ"},{"label":"Website","value":"gis-mining.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"Yes"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2021"},{"label":"Store rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"68"},{"label":"Office address","value":"Moscow, Varshavskoe highway, 1c1-2"},{"label":"Equipment brands","value":"Bitmain, Whatsminer"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young company вЂ“ operating since 2021;","A small number of equipment manufacturers in the catalog."],"pros":["Part of a whole group of companies (store, data center, service, related services);","Official format for selling equipment;","Long warranty: 1 year;","Own service center (no need to send equipment to China);","Office in Moscow;","Impeccable reputation and high rating;","Turnkey mining support;","Possible purchase on lease for individual entrepreneurs and legal entities."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Intelion Data Systems (Intelion Data Systems)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Intelion Data Systems or Intelion Mine was founded in 2017. It specializes in both the sale of equipment for cryptocurrency mining and the provision of hosting services on two of its own sites in Russia. Purchase of equipment is available for cash, online, through leasing or non-cash payments for legal entities, as well as on marketplaces. Delivery is carried out by leading transport companies - SDEK, Business Lines, DPD and DHL.","text":"Intelion Data Systems or Intelion Mine was founded in 2017. It specializes in both the sale of equipment for cryptocurrency mining and the provision of hosting services on two of its own sites in Russia. Purchase of equipment is available for cash, online, through leasing or non-cash payments for legal entities, as well as on marketplaces. Delivery is carried out by leading transport companies - SDEK, Business Lines, DPD and DHL."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite the fact that Intelion Data Systems has been on the mining market for a long time, the range is based on the Bitmain and Whatsminer models, which is clearly not enough for some buyers. However, the seller has proven to be a reliable counterparty: there are practically no negative reviews about working with Intelion Mine.","text":"Despite the fact that Intelion Data Systems has been on the mining market for a long time, the range is based on the Bitmain and Whatsminer models, which is clearly not enough for some buyers. However, the seller has proven to be a reliable counterparty: there are practically no negative reviews about working with Intelion Mine."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Intelion Data Systems","src":"/images/articles/rating-countries/datacenter-orange.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"LLC \"INTELION MINE\""},{"label":"Revenue","value":"1 billion rubles"},{"label":"Courts","value":"Plaintiff: won - 28%, lost - 29%, others - 43%. Defendant: lost - 33%, others - 67%"},{"label":"Years on the market","value":"more than 6"},{"label":"Authorized capital","value":"2 million в‚Ѕ"},{"label":"Website","value":"intelionmine.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2018"},{"label":"Store rating, Yandex","value":"4,8"},{"label":"Number of reviews, Yandex","value":"25"},{"label":"Office address","value":"Moscow, Verkhniy Mikhailovsky 2nd passage, building 9"},{"label":"Equipment brands","value":"Bitmain, Whatsminer"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited assortment;","Prices for some items are higher than those of competitors;","Equipment repairs under warranty are carried out by the manufacturer."],"pros":["An old proven company selling equipment;","Two own data centers (Kalinin NPP and Tula);","Services for the construction of infrastructure sites for mining;","Purchase of equipment in installments and leasing;","Many payment options for your order;"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 56
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
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Promminer is an old and well-known company selling mining equipment in Russia: it has been operating on the market since 2017, being one of the founders of the segment. We have our own data center in Siberia, as well as related formats of cooperation - ready-made turnkey business, leasing, investments. Separately, packages for overclocking equipment are offered. The key benefit of buying here is one of the most impressive ranges of equipment available, both in terms of manufacturer and model range.","text":"Promminer is an old and well-known company selling mining equipment in Russia: it has been operating on the market since 2017, being one of the founders of the segment. We have our own data center in Siberia, as well as related formats of cooperation - ready-made turnkey business, leasing, investments. Separately, packages for overclocking equipment are offered. The key benefit of buying here is one of the most impressive ranges of equipment available, both in terms of manufacturer and model range."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main negative of cooperation with the Promminer company in customer reviews is based on cases of delays in orders and transfer of equipment to hotels. A possible reason is the scale of the company: an impressive flow of orders and a large number of clients often leads to a breakdown in the well-functioning mechanics of interaction.","text":"The main negative of cooperation with the Promminer company in customer reviews is based on cases of delays in orders and transfer of equipment to hotels. A possible reason is the scale of the company: an impressive flow of orders and a large number of clients often leads to a breakdown in the well-functioning mechanics of interaction."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Promminer - assortment of ASICs","src":"/images/articles/rating-countries/datacenter-fans.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"PROMMINER LLC"},{"label":"Revenue","value":"121.2 million в‚Ѕ"},{"label":"Courts","value":"No"},{"label":"Years on the market","value":"more than one and a half years; (probably a new LLC)"},{"label":"Authorized capital","value":"500 thousand в‚Ѕ"},{"label":"Website","value":"promminer.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2019"},{"label":"Store rating, Yandex","value":"4,9"},{"label":"Number of reviews, Yandex","value":"90"},{"label":"Office address","value":"Moscow, st. Letnaya, 99 st3, office 4"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Canaan, Innosilicon, AnexMiner, Goldshell, Hummer, iBeLink, IceRiver, iPollo, Jasminer, YAMI"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There are cases of delays in delivery of orders, repair of equipment and startup of equipment in the data center;","Loss of warranty for some equipment after repair at the storeвЂ™s service center;","Cases of indicating an incomplete cost of equipment on the website."],"pros":["One of the oldest and largest stores selling mining equipment in Russia;","An impressive range of brands, including rare models;","Own hosting in Siberia;","Various formats of cooperation, including investments and purchase of an existing business;","Close interaction with the media, which allows you to achieve brand recognition of Promminer;","Office not only in Moscow, but also in other regions of Russia;","Possibility of purchasing packages for overclocking devices;","Turnkey cooperation format;","Own service center."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: IBMM Technology (IBM Technology)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest companies selling mining equipment in Russia, which has its own representative office in China. The start of work dates back to 2017: during this time, IBMM Technology managed to fulfill orders from more than 10,000 clients, and more than 7,000 miners mine cryptocurrency in data centers. The organization cooperates with a large number of mining equipment manufacturers and a number of major transport companies.","text":"One of the oldest companies selling mining equipment in Russia, which has its own representative office in China. The start of work dates back to 2017: during this time, IBMM Technology managed to fulfill orders from more than 10,000 clients, and more than 7,000 miners mine cryptocurrency in data centers. The organization cooperates with a large number of mining equipment manufacturers and a number of major transport companies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"IBMM Technology regularly takes an active part in specialized exhibitions both in Russia and abroad. The company has five hosting sites in different regions of Russia; the seller claims fast order delivery and 24-hour customer support. The disadvantages lie in the peculiarities of cooperation with a large company - sometimes clients complain about long solutions to problems and too long repair times.","text":"IBMM Technology regularly takes an active part in specialized exhibitions both in Russia and abroad. The company has five hosting sites in different regions of Russia; the seller claims fast order delivery and 24-hour customer support. The disadvantages lie in the peculiarities of cooperation with a large company - sometimes clients complain about long solutions to problems and too long repair times."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IBMM Technology is the leader of the rating","src":"/images/articles/rating-countries/globe-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Legal entity","value":"no data"},{"label":"Revenue","value":"no data"},{"label":"Courts","value":"no data"},{"label":"Years on the market","value":"no data"},{"label":"Authorized capital","value":"no data"},{"label":"Website","value":"ibmm.ru"},{"label":"Own hosting","value":"Yes"},{"label":"Official equipment sales","value":"no data"},{"label":"Unofficial equipment sales","value":"no data"},{"label":"Domain registration date","value":"2017"},{"label":"Store rating, Yandex","value":"5"},{"label":"Number of reviews, Yandex","value":"225"},{"label":"Office address","value":"Moscow, MKAD, 44 km., building 1"},{"label":"Equipment brands","value":"Bitmain, Whatsminer, Canaan, Innosilicon, Goldshell, Jasminer"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Prices for some equipment items are higher than those of competitors;","It is not always possible to promptly resolve customer issues due to the scale of the organization."],"pros":["One of the largest companies on the Russian market in the field of ASIC sales;","Five own hotels for mining in different parts of the country;","An impressive range of equipment offered;","High rating and good reputation;","24/7 support;","Large staff;","Possibility of purchasing a ready-made container for mining;","Possibility of purchasing a gas piston power plant;","Own representative office in China."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 68
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
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Before you buy an ASIC, remember that this is a serious investment that requires a balanced approach. Use the above criteria as a guide for choosing a reliable store and partner who will not only sell the equipment, but also provide support at all stages. Remember: a good start is the key to successful and stable work in the mining industry.","text":"Before you buy an ASIC, remember that this is a serious investment that requires a balanced approach. Use the above criteria as a guide for choosing a reliable store and partner who will not only sell the equipment, but also provide support at all stages. Remember: a good start is the key to successful and stable work in the mining industry."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$gde-kupit-asik-dlya-majninga-top-10-magazinov$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$How to use the online mining calculator$tmj$,
       $tmj$Step-by-step: pick an ASIC and coin, set the power rate, read results, and handle non-standard scenarios.$tmj$,
       $tmj$Online mining calculator guide$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
ON CONFLICT (article_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  excerpt = EXCLUDED.excerpt,
  image_alt = EXCLUDED.image_alt,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Online mining calculator: step-by-step guide","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Using the service follows a few simple steps:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Select a device. In the dropdown, find the ASIC model you need вЂ” we continuously add new devices to keep the tool up to date. To speed things up, use search: start typing the model name in the search field;","Select a coin. Within each algorithm you can mine different assets: the market offers many options, from popular tokens to rare altcoins;","Equipment price and number of ASICs. This matters for calculating investment size and payback period;","Electricity cost. This metric affects the income the farm owner will earn and the time needed to recover investments."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These four parameters are individual: their values depend on the user, so you need to enter them manually."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The remaining characteristics are filled in automatically based on the properties you specify:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Hashrate вЂ” the power of the selected ASIC model;","Power consumption вЂ” how much electricity is used;","BTC to USD rate;","USD to RUB rate;","Pool fee вЂ” the percentage of revenue charged by the service for its services;","Block reward вЂ” the current amount of BTC received for successfully mining a block;","Network difficulty вЂ” the current hashrate relevant on the day of calculation."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"All 7 options are set by default: the source is our serviceвЂ™s dynamic databases."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If needed, the user can change these characteristics and enter the parameters they care about."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This matters for custom calculations with non-standard scenarios. For successful work and analysis, the default data is usually enough."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Step-by-step calculator guide","src":"/images/articles/calc-guide/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Calculation results","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The toolвЂ™s output is valuable information made up of key metrics:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Income volume per hour, day, month, and year;","Hosting cost вЂ” the expense side needed to pay for electricity;","Payback period вЂ” the time required to recover investments (including equipment price and electricity costs);","Net profit вЂ” the final profitability figure after electricity costs."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This way, the miner gets the full set of values needed for a detailed profitability review: results can be shown in BTC, rubles, and US dollars."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Our Bitcoin and altcoin mining calculator not only accounts for the list of input variables, but also performs a detailed analysis of the revenue side."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is what sets us apart from most similar tools: we help run precise analysis based on an extended data pool."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Calculation results and benefits","src":"/images/articles/calc-guide/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Benefits of using it","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"By using the service, a miner can count on these advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["A constantly updated device database: we add modern models to the directories so users can run the most accurate and convenient calculations;","Algorithm selection: we calculate the profitability of alternative tokens to find the most profitable formats and combinations;","Accounting for equipment cost and the number of purchased units. This lets you factor in not only electricity expenses, but also the initial purchase investment;","Editable hashrate and power consumption. Useful if you did not find your ASIC in the directory or your hardwareвЂ™s efficiency differs from factory specs (for example, the miner was overclocked, or over the years the ASIC lost some performance);","Currency fluctuations with Bitcoin and ruble rates. Within the tool you can run a wide range of calculations;","Additional metrics such as pool fee, mining difficulty, and block reward;","Extended analytics output: not only monthly revenue, but also the expense side and payback period."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Deep analysis and data completeness set Miningcalculator.ru apart from alternative tools. Our instrument is genuinely convenient and offers significantly more serious functionality than competitors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Non-standard scenarios","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Most often, the mining profitability calculator in rubles is used to determine monthly profit. At the same time, Miningcalculator.ruвЂ™s rich functionality enables much deeper calculations for complex tasks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Estimate profitability after the halving. For this, you can manually set the block reward and determine farm profitability for any time period;","ASIC overclocking potential. Editable power and energy-consumption values let you move beyond factory specs and account for updated farm technical parameters;","Choosing the best pool. By manually setting the pool fee, the user can find the most profitable platform that maximizes revenue;","Forecasting. The manual network-difficulty control helps you see what income to expect in a month or two, or any other period. Knowing the projected network hashrate from statistical variables, you can review near-term profitability analytics;","Currency experiments. Miningcalculator.ru lets you change the BTC/USD and USD/RUB rates. This mechanism helps you understand at what levels it is better to sell assets to reach your goal. For example, you can determine the Bitcoin price needed for a full return on invested capital;","Purchase forecasting to reach a target income level. You can calculate how many ASICs you need for a given earnings level: these metrics can be adjusted, including farm cost in the checklist."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To make a farm purchase as profitable as possible, use a modern profitability calculator."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The more detailed the analytical work, the more predictable investments in digital asset mining will be."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- kak-rabotayut-asiki-dlya-majninga
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$How ASIC miners work$tmj$,
       $tmj$Inside an ASIC: SHA-256, Scrypt, and kHeavyHash, plus power supply, hash boards, fans, and the control board.$tmj$,
       $tmj$How ASIC miners work$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
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
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The first technical question a beginner investor in digital asset mining asks is: how do ASICs for mining work? A peculiarity of earning from BTC and altcoin computation is that knowing the technical details of the process is not strictly required вЂ” far from every farm owner can answer this question. Still, having this information is useful to form a basic understanding of the procedure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"An ASIC is a supercomputer","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"A basic understanding of how a miner works starts with the device concept: it is a real supercomputer capable of performing thousands or even millions of calculations in a short period of time."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"If you open the unit, inside you will find several boards made entirely of computer chips."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC вЂ” a supercomputer","src":"/images/articles/how-asics-work/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"While a classic PC has only one processor, an ASIC has dozens of them. That potential is needed to solve the mathematical task of computing a block on the network. As soon as that goal is achieved, the miner that found it receives a reward вЂ” Bitcoins. At the moment, that is 3.125 BTC per block. The procedure is cyclical: a successful answer is found approximately once every 10 minutes, which is built into Bitcoin blockchain algorithms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Accordingly, the higher the ASICвЂ™s hashrate, the larger the earnings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Finding that block with a single device is unlikely, given the huge number of ASICs running on the network. That is why farm owners use joint mining services (pools), where the reward is distributed in proportion to the hashrate contributed."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How a mining ASIC works: different algorithms","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"To compute tasks inside a blockchain, rule sets вЂ” algorithms вЂ” are used. For example, BTC mining uses SHA-256, Litecoin and Dogecoin use Scrypt, and Kaspa mining uses kHeavyHash."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"These are the rules of the game, or the order of computation: ASICs designed for one algorithm cannot be used under another."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That does not mean every miner can only mine a single token. For example, under the familiar SHA-256 algorithm, more than thirty assets are available. The best known among them is Bitcoin."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The technical process of how an ASIC works","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"When the hardware is powered on, the unit starts computing вЂ” a process we have already covered. What components does the ASIC itself consist of, and what makes its operation possible? There are four main parts:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Power supply: equipped with a cable connector and a power button. This component converts current and delivers electricity to the boards;","Boards вЂ” two or three bases that hold the chips (processors). Heat sinks are also installed here for an effective cooling system;","Fans (2 or 4 units, depending on the model). The coolersвЂ™ job is to remove and exhaust heated air;","Control board вЂ” the вЂњbrainвЂќ of the system, coordinating all ASIC components. This module runs on dedicated firmware that can be replaced if needed."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Technical process of how an ASIC works","src":"/images/articles/how-asics-work/cover.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"That is how ASICs for mining work when you look at a classic design."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"There are alternative formats as well, for example miners with water cooling: the difference is using liquid, a radiator, and a pump to remove heat instead of fans, as in standard designs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 18
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
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How a miner works is based on computational processes within a given blockchain and algorithm. Manufacturers build compact devices with sets of chips on boards: the high performance of ASICs makes it fair to call these systems full-fledged supercomputers without exaggeration."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kak-rabotayut-asiki-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Which ASICs to choose: top manufacturers$tmj$,
       $tmj$Leading ASIC brands for mining вЂ” from Goldshell to BITMAIN вЂ” and how to pick the right maker.$tmj$,
       $tmj$BITMAIN$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
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
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Buying an ASIC is a serious investment that needs a thoughtful approach. One key factor that directly affects a mining projectвЂ™s success is choosing the deviceвЂ™s manufacturer brand. Today we cover how to choose a miner brand and review the key players in the mining hardware market.","text":"Buying an ASIC is a serious investment that needs a thoughtful approach. One key factor that directly affects a mining projectвЂ™s success is choosing the deviceвЂ™s manufacturer brand. Today we cover how to choose a miner brand and review the key players in the mining hardware market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How do you choose an ASIC manufacturer and what does it affect?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At first glance all ASICs look alike: a chassis, noisy fans, numbers in the specs. In practice the brand determines:","text":"At first glance all ASICs look alike: a chassis, noisy fans, numbers in the specs. In practice the brand determines:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["How long the device will run;","How quickly warranty issues are resolved;","How easy it is to find spare parts;","What overall yield you can expect."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"LetвЂ™s break down what depends on choosing the right manufacturer.","text":"LetвЂ™s break down what depends on choosing the right manufacturer."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC miner chip and boards","src":"/images/articles/asic-manufacturers/circuit-board.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"What it means: quality brands use better components and proven cooling and assembly tech. Why it matters: an ASIC runs 24/7 under high load and temperature. Reliable hardware lowers breakdown risk, downtime, and income loss. Examples: Bitmain is known for high Antminer model stability. WhatsMiner from MicroBT shows excellent endurance over long stretches;","title":"Hardware reliability"},{"text":"What it means: brands with a good reputation value customers and aim to make truly quality devices. Why it matters: a strong reputation lowers the risk of defective goods, poor warranty service, or mismatched specs. Examples: Bitmain and MicroBT are market leaders with years of experience. Young brands without reputation may attract with price but often raise quality questions;","title":"Manufacturer reputation"},{"text":"What it means: self-respecting makers give an official warranty and process warranty cases quickly. Why it matters: if an ASIC fails in the first months, the warranty is your protection from losses. Examples: Bitmain offers a standard 6-month warranty. MicroBT offers extended support for some models;","title":"Warranty and support terms"},{"text":"What it means: official or partner service centers allow fast, quality repairs. Why it matters: shipping a miner to China or having no repair options in your region can make service uneconomical. Examples: Bitmain has authorized service centers in Asia, Europe, and the US. Some makers work through local partners, speeding repairs;","title":"Availability of service centers"},{"text":"What it means: fans, controllers, chips, and power supplies for the miner are available for sale. Why it matters: small repairs without replacing the whole unit can greatly extend ASIC life. Examples: for Antminer you can easily find any parts. Rare models from little-known brands often вЂњdieвЂќ with no recovery path;","title":"Spare parts availability"},{"text":"What it means: real miner opinions, forum discussions, and YouTube reviews give a true sense of model pros and cons. Why it matters: a brand with real reviews means less risk of buying a pig in a poke;","title":"User and community reviews"},{"text":"What it means: ability to safely update device software, overclock, and optimize power use. Why it matters: firmware can substantially raise miner yield or stability. Examples: Antminer has many third-party firmwares (e.g. Braiins OS). Some ASICs do not support third-party updates, limiting user options.","title":"Reflashing and tuning options"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Choosing the right ASIC manufacturer is an investment in long-term reliability, income stability, and peace of mind. LetвЂ™s review available brands so you can make a smart purchase.","text":"Choosing the right ASIC manufacturer is an investment in long-term reliability, income stability, and peace of mind. LetвЂ™s review available brands so you can make a smart purchase."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Goldshell","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2017 Goldshell appeared, specializing in mining hardware. The brand is well known in cryptocurrency mining, but it failed to compete with SHA-256 mining leaders. That pushed GoldshellвЂ™s management to seek alternative paths: so the Chinese maker began developing gear for specific coins on diverse blockchains. Today Goldshell hardware successfully mines tokens on Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR, and Eaglesong.","text":"In 2017 Goldshell appeared, specializing in mining hardware. The brand is well known in cryptocurrency mining, but it failed to compete with SHA-256 mining leaders. That pushed GoldshellвЂ™s management to seek alternative paths: so the Chinese maker began developing gear for specific coins on diverse blockchains. Today Goldshell hardware successfully mines tokens on Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR, and Eaglesong."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Goldshell gained the most popularity in Asia, but Russian miners know the maker well too. Still, this brandвЂ™s gear is hard to call popular in the CIS, because mining alts always carries risk. You can still order ASICs, especially models mining Kadena on Blake2s. That currencyвЂ™s potential is not fully explored, so mining prospects remain tangible.","text":"Goldshell gained the most popularity in Asia, but Russian miners know the maker well too. Still, this brandвЂ™s gear is hard to call popular in the CIS, because mining alts always carries risk. You can still order ASICs, especially models mining Kadena on Blake2s. That currencyвЂ™s potential is not fully explored, so mining prospects remain tangible."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Goldshell BOX Series","src":"/images/articles/asic-manufacturers/goldshell.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2017"},{"label":"Brand","value":"Goldshell"},{"label":"Devices in the model range","value":"more than 20"},{"label":"Which ASIC to buy","value":"Goldshell KD5 (mining KDA with optimal energy efficiency)"},{"label":"Which ASIC is best (TOP model)","value":"Goldshell KD6 at 26.3 TH/s"},{"label":"ASIC algorithms","value":"Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR, and Eaglesong"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: SealMiner","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SealMiner is a young brand (founded in 2024), but behind it stands BitdeerвЂ™s infrastructure, experience, and reputation, making it one of the most discussed and promising ASIC market players. SealMiner focuses on SHA-256 ASICs, meaning its purpose is Bitcoin mining. While many companies simply chase hashrate, SealMiner bets on energy efficiency and cooling tech.","text":"SealMiner is a young brand (founded in 2024), but behind it stands BitdeerвЂ™s infrastructure, experience, and reputation, making it one of the most discussed and promising ASIC market players. SealMiner focuses on SHA-256 ASICs, meaning its purpose is Bitcoin mining. While many companies simply chase hashrate, SealMiner bets on energy efficiency and cooling tech."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SealMiner is a manufacturer that came not only to sell miners but to deploy engineering solutions that can change BTC mining economics. The mix of energy efficiency, thoughtful cooling, and Bitdeer support makes the brand especially attractive for those considering long-term mining investment.","text":"SealMiner is a manufacturer that came not only to sell miners but to deploy engineering solutions that can change BTC mining economics. The mix of energy efficiency, thoughtful cooling, and Bitdeer support makes the brand especially attractive for those considering long-term mining investment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"SealMiner / Bitdeer","src":"/images/articles/asic-manufacturers/sealminer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"USA"},{"label":"Founded","value":"2024"},{"label":"Brand","value":"SealMiner"},{"label":"Number of devices in the lineup","value":"about 10"},{"label":"Which ASIC to buy","value":"SealMiner A3 (optimal on efficiency and hashrate)"},{"label":"Which ASIC is best (TOP model)","value":"Sealminer A3 Pro Hydro at 660 Th/s"},{"label":"ASIC algorithms","value":"SHA-256"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["A young brand still building practical reputation;","High hardware cost typical of the premium segment;","Limited retail availability and possible supply queues."],"pros":["One of the best energy-efficiency figures on the market;","Air and water cooling support вЂ” choose for your infrastructure;","Suitable for large farms and professional miners;","Low noise relative to power;","Direct support and Bitdeer technology base."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: IceRiver","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Chinese company IceRiver is unique: the makerвЂ™s lineup has six devices built to mine a single coin вЂ” KASPA on kHeavyHash. The young maker chose not to compete with famous brands and went its own way into the uncontested KASPA niche. So if a miner decides to mine this token, there is no choice among many makers вЂ” there is only one option on the market.","text":"Chinese company IceRiver is unique: the makerвЂ™s lineup has six devices built to mine a single coin вЂ” KASPA on kHeavyHash. The young maker chose not to compete with famous brands and went its own way into the uncontested KASPA niche. So if a miner decides to mine this token, there is no choice among many makers вЂ” there is only one option on the market."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On one hand, low niche competition interests not only IceRiver but miners too, because lower network difficulty can mean higher earnings. On the other hand, extra risks appear such as coin scams or a sharp price drop: then KASPA hardware turns into a pile of metal вЂ” and an expensive one.","text":"On one hand, low niche competition interests not only IceRiver but miners too, because lower network difficulty can mean higher earnings. On the other hand, extra risks appear such as coin scams or a sharp price drop: then KASPA hardware turns into a pile of metal вЂ” and an expensive one."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"IceRiver","src":"/images/articles/asic-manufacturers/iceriver.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"No data"},{"label":"Brand","value":"IceRiver"},{"label":"Devices in the model range","value":"6"},{"label":"Which ASIC to buy","value":"IceRiver KAS KS2 (optimal hardware cost-to-hashrate ratio)"},{"label":"Which ASIC is best (TOP model)","value":"IceRiver KAS KS2 at 8 TH/s"},{"label":"ASIC algorithms","value":"kHeavyHash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young, unproven manufacturer;","Risks of mining less popular coins;","Ability to mine only one token;","High price of TOP models."],"pros":["Low-competition niche вЂ” chance to earn more than on other algorithms;","No manufacturer choice problem: KASPA mining is only possible on IceRiver ASICs."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Sunlune Technology","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The name Sunlune Technology means almost nothing to local miners, because the company only recently entered mining. More recognizable is the ASIC brand under which the Chinese maker ships gear вЂ” Jasminer. This is an altcoin mining lineup: Jasminer runs Ethash and EtcHash, enabling mining of about forty coins.","text":"The name Sunlune Technology means almost nothing to local miners, because the company only recently entered mining. More recognizable is the ASIC brand under which the Chinese maker ships gear вЂ” Jasminer. This is an altcoin mining lineup: Jasminer runs Ethash and EtcHash, enabling mining of about forty coins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Jasminer products stand out with excellent energy-efficiency figures вЂ” among the best on the market. There are also home-use models with low consumption and low noise. These are no longer compact iPollos but productive ASICs around 2,000 MH/s. That drives noticeable Jasminer popularity among miners even with limited brand fame.","text":"Jasminer products stand out with excellent energy-efficiency figures вЂ” among the best on the market. There are also home-use models with low consumption and low noise. These are no longer compact iPollos but productive ASICs around 2,000 MH/s. That drives noticeable Jasminer popularity among miners even with limited brand fame."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Jasminer X16-Q Pro","src":"/images/articles/asic-manufacturers/jasminer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"No data"},{"label":"Brand","value":"Jasminer"},{"label":"Devices in the model range","value":"up to 10"},{"label":"Which ASIC to buy","value":"Jasminer X16-Q (comfortable home mining вЂ” 1,950 MH/s, 620 W, and only 40 dB noise)"},{"label":"Which ASIC is best (TOP model)","value":"Jasminer X16-P at 5,800 MH/s"},{"label":"ASIC algorithms","value":"EtHash, EtcHash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Little-known manufacturer;","High hardware cost;","Difficulties with repair and service."],"pros":["Full home mining format;","One of the best energy-efficiency parameters on the market."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: iPollo","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"SingaporeвЂ™s iPollo is one of the youngest in our ranking: founded in 2022, the brand quickly made itself known worldwide. Despite a full hardware lineup, special attention goes to the V1 Mini, built for home mining. Five series devices feature low consumption and nearly silent operation, partly thanks to Ethash focus.","text":"SingaporeвЂ™s iPollo is one of the youngest in our ranking: founded in 2022, the brand quickly made itself known worldwide. Despite a full hardware lineup, special attention goes to the V1 Mini, built for home mining. Five series devices feature low consumption and nearly silent operation, partly thanks to Ethash focus."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Overall, iPollo products focus on that algorithm, while other standards appear more experimentally. For example, there is one ASIC for BTC and a model for Cuckatoo32 (GRIN). Classic Ethash ASICs look competitive, but brand youth may scare off many buyers.","text":"Overall, iPollo products focus on that algorithm, while other standards appear more experimentally. For example, there is one ASIC for BTC and a model for Cuckatoo32 (GRIN). Classic Ethash ASICs look competitive, but brand youth may scare off many buyers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"iPollo","src":"/images/articles/asic-manufacturers/ipollo.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"Singapore"},{"label":"Founded","value":"2022"},{"label":"Brand","value":"iPollo"},{"label":"Devices in the model range","value":"up to 20"},{"label":"Which ASIC to buy","value":"iPollo V1 Mini (compact, quiet, low-power ASIC for home mining)"},{"label":"Which ASIC is best (TOP model)","value":"Ipollo G1 on Cuckatoo32 for mining Grin"},{"label":"ASIC algorithms","value":"SHA-256, Ethash, Cuckatoo32"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Gear from a young brand not yet proven by time;","Difficulties with repair and buying spare parts."],"pros":["Interesting V1 Mini lineup for home mining;","Prices lower than competitors;","A fast-growing company that loudly announced itself in a short time;","Work with experimental formats, e.g. a Cuckatoo32 ASIC."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Innosilicon","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Innosilicon began in 2006 вЂ” then the Chinese brand made semiconductors for computer and IT industries. Later, with miningвЂ™s rise, it switched to crypto mining gear, which Innosilicon still earns from today. Despite impressive experience, tradition, and niche knowledge, the brandвЂ™s lineup has recently lost ground to more modern makers.","text":"Innosilicon began in 2006 вЂ” then the Chinese brand made semiconductors for computer and IT industries. Later, with miningвЂ™s rise, it switched to crypto mining gear, which Innosilicon still earns from today. Despite impressive experience, tradition, and niche knowledge, the brandвЂ™s lineup has recently lost ground to more modern makers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Falling Innosilicon popularity stems from energy-efficiency problems that hurt hardware payback times. Likely for that reason the company almost abandoned SHA-256 and focused on altcoin mining gear. Today Innosilicon offers devices not only for BTC but ASICs on Equihash, Ethash, and Scrypt.","text":"Falling Innosilicon popularity stems from energy-efficiency problems that hurt hardware payback times. Likely for that reason the company almost abandoned SHA-256 and focused on altcoin mining gear. Today Innosilicon offers devices not only for BTC but ASICs on Equihash, Ethash, and Scrypt."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Innosilicon","src":"/images/articles/asic-manufacturers/innosilicon.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2006"},{"label":"Brand","value":"Innosilicon"},{"label":"Devices in the model range","value":"up to 15"},{"label":"Which ASIC to buy","value":"Innosilicon A11 Pro (one of the companyвЂ™s few ASICs that still works with tangible market profit)"},{"label":"Which ASIC is best (TOP model)","value":"Innosilicon A11 Pro at 1,500 MH/s"},{"label":"ASIC algorithms","value":"SHA-256, Equihash, Ethash, and Scrypt"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Modest hardware energy efficiency;","Lack of truly profitable models (especially for BTC);","Strategic mistakes and, as a result, lost competitive positions."],"pros":["One of the oldest brands with a rich history;","Inexpensive products;","Good reliability level;","Many working algorithms."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Canaan","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Unofficially, the worldвЂ™s first ASIC was developed in 2013 by Chinese company Canaan in its founding year. Despite an innovative mining approach and constant development, this maker stays in the shadow of more popular rivals, though AvalonMiner gear (CanaanвЂ™s own brand) is quite competitive. The companyвЂ™s products never topped sales rankings by volume, but that does not stop it from shipping modern, energy-efficient ASICs.","text":"Unofficially, the worldвЂ™s first ASIC was developed in 2013 by Chinese company Canaan in its founding year. Despite an innovative mining approach and constant development, this maker stays in the shadow of more popular rivals, though AvalonMiner gear (CanaanвЂ™s own brand) is quite competitive. The companyвЂ™s products never topped sales rankings by volume, but that does not stop it from shipping modern, energy-efficient ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Canaan specializes in SHA-256 gear: the AvalonMiner lineup has nearly 20 devices, priced somewhat below competitor peers. The most productive today is CanaanвЂ™s 14th series: for example, the A1466 delivers 150 TH/s. The maker does not chase hashrate records, because winning against famous brands in that segment is extremely hard. So CanaanвЂ™s key market is entry-level ASICs and mid-class products.","text":"Canaan specializes in SHA-256 gear: the AvalonMiner lineup has nearly 20 devices, priced somewhat below competitor peers. The most productive today is CanaanвЂ™s 14th series: for example, the A1466 delivers 150 TH/s. The maker does not chase hashrate records, because winning against famous brands in that segment is extremely hard. So CanaanвЂ™s key market is entry-level ASICs and mid-class products."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Canaan AvalonMiner","src":"/images/articles/asic-manufacturers/canaan.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2013"},{"label":"Brand","value":"AvalonMiner"},{"label":"Devices in the model range","value":"up to 20"},{"label":"Which ASIC to buy","value":"Avalon A1346 (powerful, relatively inexpensive BTC miner)"},{"label":"Which ASIC is best (TOP model)","value":"Avalon A16XP at 300 TH/s"},{"label":"ASIC algorithms","value":"SHA-256"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Users report claimed chip hashrate declining over time;","Expensive repairs and possible parts issues."],"pros":["One of the oldest ASIC makers with rich traditions;","Unofficial pioneer title for shipping the worldвЂ™s first ASIC;","Good hardware reliability;","Hardware cost lower than competitors."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: ElphaPex","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex is not a loud market leader but a confident player gradually gathering miners who value practicality, energy efficiency, and stable hardware operation. The brand is especially interesting for those who see long-term Litecoin and Dogecoin mining potential, where narrow specialization sometimes matters more than versatility. This maker focuses exclusively on Scrypt ASICs, so its gear is meant for the most popular coins in that family: Litecoin and Dogecoin.","text":"ElphaPex is not a loud market leader but a confident player gradually gathering miners who value practicality, energy efficiency, and stable hardware operation. The brand is especially interesting for those who see long-term Litecoin and Dogecoin mining potential, where narrow specialization sometimes matters more than versatility. This maker focuses exclusively on Scrypt ASICs, so its gear is meant for the most popular coins in that family: Litecoin and Dogecoin."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Focus on a narrow niche lets the company carefully tune hardware parameters: power balance, energy efficiency, and stable operation became the developersвЂ™ key philosophy. ElphaPex actively supports users: brand warranty, service availability, and tech support are not marketing copy but a working tool in the fight for community trust.","text":"Focus on a narrow niche lets the company carefully tune hardware parameters: power balance, energy efficiency, and stable operation became the developersвЂ™ key philosophy. ElphaPex actively supports users: brand warranty, service availability, and tech support are not marketing copy but a working tool in the fight for community trust."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex Miner","src":"/images/articles/asic-manufacturers/elphapex.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2005"},{"label":"Brand","value":"ElphaPex"},{"label":"Number of devices in the lineup","value":"about 10"},{"label":"Which ASIC to buy","value":"ElphaPex DG Home 1 (efficient Scrypt miner for home and farm)"},{"label":"Which ASIC is best (TOP model)","value":"ElphaPex DG2 at 20,000 Mh/s"},{"label":"ASIC algorithms","value":"Scrypt"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Narrow specialization: hardware suits only Scrypt mining;","A young brand that has not yet proven reliability over time;","Limited model choice versus industry giants."],"pros":["Focus on Scrypt and hardware optimization for LTC and DOGE;","High energy efficiency versus peers;","Full warranty and technical support;","ASICs with both water and air cooling."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: MicroBT","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"MicroBT was founded by engineer Yang Zuoxing, who worked at BITMAIN until 2016 and then decided to create his own mining hardware company. Notably, Yang Zuoxing helped develop the Antminer S9, so he is a cult figure in mining. Still, BITMAIN and the specialist parted ways вЂ” and a new market player was born.","text":"MicroBT was founded by engineer Yang Zuoxing, who worked at BITMAIN until 2016 and then decided to create his own mining hardware company. Notably, Yang Zuoxing helped develop the Antminer S9, so he is a cult figure in mining. Still, BITMAIN and the specialist parted ways вЂ” and a new market player was born."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"MicroBT products ship under the Whatsminer brand вЂ” a mark well known to miners and a reliability benchmark. Whatsminer confidently holds an honorable second place in mining gear, and every miner knows the legendary Whatsminer M21S lineup. The companyвЂ™s most productive ASIC today is the Whatsminer M53S++ at 320 TH/s. Note that MicroBT remains a direct BITMAIN competitor, so both brandsвЂ™ assortments are similar.","text":"MicroBT products ship under the Whatsminer brand вЂ” a mark well known to miners and a reliability benchmark. Whatsminer confidently holds an honorable second place in mining gear, and every miner knows the legendary Whatsminer M21S lineup. The companyвЂ™s most productive ASIC today is the Whatsminer M53S++ at 320 TH/s. Note that MicroBT remains a direct BITMAIN competitor, so both brandsвЂ™ assortments are similar."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MicroBT WhatsMiner","src":"/images/articles/asic-manufacturers/microbt-whatsminer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2016"},{"label":"Brand","value":"Whatsminer"},{"label":"Devices in the model range","value":"more than 20"},{"label":"Which ASIC to buy","value":"Whatsminer M50 (the brandвЂ™s bestseller today)"},{"label":"Which ASIC is best (TOP model)","value":"WhatsMiner M63S++ 464 TH/s"},{"label":"ASIC algorithms","value":"SHA-256"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Paying a premium for the brand;","Per user reviews, Whatsminer ASICs are noisier than competitors."],"pros":["The worldвЂ™s second most popular brand;","Reputation as a maker of quality, reliable gear;","A solid model range;","Availability of spare parts and service centers."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: BITMAIN","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Chinese company BITMAIN was founded in 2013 and today holds about a 75% market share in mining hardware sales and service. Headquarters are in Beijing, with offices in Singapore, Hong Kong, and the US. BITMAIN products are known to miners as Antminer вЂ” more than twenty models used to mine BTC, ETC, LTC, DOGE, KDA, and other coins on SHA-256, Scrypt, Kadena, and EtHash.","text":"Chinese company BITMAIN was founded in 2013 and today holds about a 75% market share in mining hardware sales and service. Headquarters are in Beijing, with offices in Singapore, Hong Kong, and the US. BITMAIN products are known to miners as Antminer вЂ” more than twenty models used to mine BTC, ETC, LTC, DOGE, KDA, and other coins on SHA-256, Scrypt, Kadena, and EtHash."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BITMAINвЂ™s first ASIC was the Antminer S1 in 2013. Today the makerвЂ™s combined lineup has more than twenty hardware options, including modern Antminer T21, Antminer S21, and even water-cooled Antminer S21 Hyd. Legendary BITMAIN models include the вЂњunkillableвЂќ Antminer S9 and the 19th series that appeared in 2020 and remains relevant.","text":"BITMAINвЂ™s first ASIC was the Antminer S1 in 2013. Today the makerвЂ™s combined lineup has more than twenty hardware options, including modern Antminer T21, Antminer S21, and even water-cooled Antminer S21 Hyd. Legendary BITMAIN models include the вЂњunkillableвЂќ Antminer S9 and the 19th series that appeared in 2020 and remains relevant."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"BITMAIN Antminer","src":"/images/articles/asic-manufacturers/bitmain.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Country of manufacturer","value":"China"},{"label":"Founded","value":"2013"},{"label":"Brand","value":"Antminer"},{"label":"Devices in the model range","value":"more than 20"},{"label":"Which ASIC to buy","value":"Antminer S21 (optimal price-to-efficiency ratio)"},{"label":"Which ASIC is best (TOP model)","value":"Antminer S23 Hydro 3U at 1.16 PH/s"},{"label":"ASIC algorithms","value":"SHA-256, Scrypt, Kadena, and EtHash"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["There were cases of unsuccessful models, e.g. the Antminer 17th lineup;","Paying a premium for the brand."],"pros":["One of the oldest ASIC makers and the market leader;","An impressive model range including different mining algorithms;","High competition among Antminer stores вЂ” which positively affects prices;","Availability of spare parts and service centers;","Strong brand reputation and high product quality."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 67
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
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"When buying, consider not only device price but many other important parameters. Among them:","text":"When buying, consider not only device price but many other important parameters. Among them:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Proven brand reputation;","Warranty terms and support;","Availability of service centers and spare parts;","Real user experience;","Optimization options via firmware."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Recommended brands to buy today: Bitmain (Antminer) вЂ” the industry gold standard, MicroBT (WhatsMiner) вЂ” powerful, reliable devices, iPollo and Goldshell вЂ” good solutions for specific algorithms and home conditions.","text":"Recommended brands to buy today: Bitmain (Antminer) вЂ” the industry gold standard, MicroBT (WhatsMiner) вЂ” powerful, reliable devices, iPollo and Goldshell вЂ” good solutions for specific algorithms and home conditions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
