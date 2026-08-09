SET client_encoding = 'UTF8';

-- Seed EN translations from former frontend i18n mocks.
-- Safe to re-run: UPSERT by (article_id, locale) / (block_id, locale).

-- kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Which crypto wallet to choose: 10 best hot wallets$tmj$,
       $tmj$Lost access or a hack can wipe you out вЂ” compare leading hot wallets for everyday crypto storage.$tmj$,
       $tmj$Cryptocurrency wallet$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
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
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In the cryptocurrency world, storing digital assets is critically important. Losing access or getting hacked can cost the owner a significant sum, so choosing a wallet is one of the first and most important steps. Among many solutions, hot wallets stand out вЂ” software tools that provide fast access to crypto via the Internet. We will explain what these wallets are, how they work, who they suit, what risks they involve, and introduce the top 10 best software solutions for storing cryptocurrencies.","text":"In the cryptocurrency world, storing digital assets is critically important. Losing access or getting hacked can cost the owner a significant sum, so choosing a wallet is one of the first and most important steps. Among many solutions, hot wallets stand out вЂ” software tools that provide fast access to crypto via the Internet. We will explain what these wallets are, how they work, who they suit, what risks they involve, and introduce the top 10 best software solutions for storing cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Wallet for storing cryptocurrency","src":"/images/articles/hot-wallets/wallet-hero.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is a hot wallet?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A hot wallet is a software cryptocurrency storage format that is constantly or periodically connected to the Internet.","text":"A hot wallet is a software cryptocurrency storage format that is constantly or periodically connected to the Internet."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"It lets you:","text":"It lets you:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Store cryptocurrency;","Send and receive funds;","Track balances and transactions in real time."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The key feature is online availability. That makes hot wallets extremely convenient for daily operations, but also reduces protection against cyber threats.","text":"The key feature is online availability. That makes hot wallets extremely convenient for daily operations, but also reduces protection against cyber threats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In terms of security, hot wallets lag behind cold ones (hardware or paper), but for convenience and speed they have no equal.","text":"In terms of security, hot wallets lag behind cold ones (hardware or paper), but for convenience and speed they have no equal."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrency coins","src":"/images/articles/hot-wallets/crypto-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What kinds of hot wallets exist?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hot wallets fall into several categories depending on platform and access method:","text":"Hot wallets fall into several categories depending on platform and access method:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Installed on a PC or laptop. Examples: Exodus, Electrum, Atomic Wallet. Often offer extended functionality (including in-app crypto swaps, NFT and token management, hardware wallet connections);","title":"Desktop wallets"},{"text":"Apps for Android and iOS. Examples: Trust Wallet, Coinomi, Mycelium, SafePal. Convenient for everyday use, fast payments, and P2P transfers;","title":"Mobile wallets"},{"text":"Work through a web interface. Examples: Blockchain.com, MetaMask, Binance Wallet. No install required; work on any device with a browser;","title":"Web (browser) wallets"},{"text":"Tied to an account on a centralized exchange. Examples: Binance, Bybit, OKX, KuCoin. Suitable for active trading, but do not give control over private keys.","title":"Exchange wallets"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a hot wallet?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The choice depends on goals, the userвЂ™s technical level, and security preferences. Here are several factors to consider:","text":"The choice depends on goals, the userвЂ™s technical level, and security preferences. Here are several factors to consider:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"2FA, PIN codes, biometrics, and data encryption. Ability to back up the seed phrase. Multisig support вЂ” extra protection against unauthorized access;","title":"Security"},{"text":"Support for needed cryptocurrencies and tokens (ERC-20, BEP-20, etc.). Built-in exchangers, charts, DeFi and NFT access. Ability to connect to Web3 apps (for MetaMask, Trust Wallet, etc.);","title":"Functionality"},{"text":"A convenient, clear interface, multilingual support, cross-platform use вЂ” mobile and desktop versions at the same time;","title":"Accessibility and interface"},{"text":"Ideally, the wallet does not store private keys on the developerвЂ™s side.","title":"Control over keys"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Pros and cons of hot wallets","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Higher risk of hacks and phishing attacks;","Vulnerability if the device is infected with malware;","Dependence on the Internet;","Anonymity is not always guaranteed;","Losing the seed phrase or private key = losing funds."],"pros":["Instant access to funds 24/7;","Ease of use вЂ” especially for beginners;","High transaction speed;","Suitable for daily use and small amounts;","Many are available for free."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Nuances and security tips","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Although hot wallets are less protected, a sensible approach can greatly reduce risks:","text":"Although hot wallets are less protected, a sensible approach can greatly reduce risks:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Never store the seed phrase online or in a screenshot вЂ” only offline (on paper, metal, etc.);","Use unique passwords and password managers;","Enable two-factor authentication wherever possible;","Update apps and devices вЂ” vendors regularly fix vulnerabilities;","Do not use public Wi-Fi for cryptocurrency operations."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Next we review the top 10 best hot (software) wallets for working with digital assets.","text":"Next we review the top 10 best hot (software) wallets for working with digital assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Tonkeeper","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The final spot in our ranking goes to a specialized wallet for The Open Network (TON). Many analysts foresee an impressive future for this system, and Toncoin already lists on most exchanges and participates in many projects. The ecosystem is growing fast, so reliable storage matters вЂ” that is exactly what hot Tonkeeper provides.","text":"The final spot in our ranking goes to a specialized wallet for The Open Network (TON). Many analysts foresee an impressive future for this system, and Toncoin already lists on most exchanges and participates in many projects. The ecosystem is growing fast, so reliable storage matters вЂ” that is exactly what hot Tonkeeper provides."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Tonkeeper is young, yet that did not stop it from becoming #1 on its native blockchain. Users get swap, staking, and NFT features. The wallet has its own browser, high performance, and a simple authorization system for partner services.","text":"Tonkeeper is young, yet that did not stop it from becoming #1 on its native blockchain. Users get swap, staking, and NFT features. The wallet has its own browser, high performance, and a simple authorization system for partner services."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Tonkeeper","src":"/images/articles/hot-wallets/tonkeeper.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"Only Toncoin and blockchain coins"},{"label":"Location","value":"Mobile devices"},{"label":"Platforms","value":"Mobile apps"},{"label":"Fees","value":"Only the blockchain fee"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Works only with The Open Network (TON);","Young project."],"pros":["The key wallet for working with TON;","Swap, staking, and niche browser utilities;","High performance;","Buy TON with a card."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: CoinPayments","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another long-standing, proven wallet: CoinPayments supports more than 2,000 cryptocurrencies, so users do not lack diversification. Besides classic swaps, there is an interesting вЂњSafeвЂќ tool that freezes part of an asset like a cold wallet вЂ” extra protection for digital assets.","text":"Another long-standing, proven wallet: CoinPayments supports more than 2,000 cryptocurrencies, so users do not lack diversification. Besides classic swaps, there is an interesting вЂњSafeвЂќ tool that freezes part of an asset like a cold wallet вЂ” extra protection for digital assets."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Card top-ups are available in some countries, but Russia is not on that list. Adequate Russian translation for some sections is also missing, which makes the system harder to use. Full access requires identity verification вЂ” another downside of CoinPayments.","text":"Card top-ups are available in some countries, but Russia is not on that list. Adequate Russian translation for some sections is also missing, which makes the system harder to use. Full access requires identity verification вЂ” another downside of CoinPayments."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"CoinPayments","src":"/images/articles/hot-wallets/coinpayments.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"More than 2,000 coins"},{"label":"Location","value":"Mobile devices"},{"label":"Platforms","value":"Mobile apps"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Identity verification required for some operations;","Private keys stored on the developersвЂ™ side;","Poor Russian translation in a number of sections."],"pros":["Large number of supported networks and coins;","Built-in exchanger;","вЂњSafeвЂќ feature;","Long-standing, proven platform;","Good partner program."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Enjin Wallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A relatively young hot wallet that appeared in 2018. The project has its own utility token ENJ, which can be used to buy digital assets and make swaps. Enjin Wallet works with key networks including ERC-20 and BTC. It supports NFTs and has its own marketplace. The wallet is fully anonymous with a high security level, but the source code is closed.","text":"A relatively young hot wallet that appeared in 2018. The project has its own utility token ENJ, which can be used to buy digital assets and make swaps. Enjin Wallet works with key networks including ERC-20 and BTC. It supports NFTs and has its own marketplace. The wallet is fully anonymous with a high security level, but the source code is closed."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There is no staking and no direct card top-up. Instead of desktop and browser versions, developers offer mobile only, which is not always convenient. There are extra features (price tracker, unlimited wallets) and translations into many languages, including Russian.","text":"There is no staking and no direct card top-up. Instead of desktop and browser versions, developers offer mobile only, which is not always convenient. There are extra features (price tracker, unlimited wallets) and translations into many languages, including Russian."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Enjin Wallet","src":"/images/articles/hot-wallets/enjin-wallet.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"Key networks (including BTC and ETH)"},{"label":"Location","value":"Mobile devices"},{"label":"Platforms","value":"Mobile apps"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Mobile devices only;","No staking;","Closed-source code."],"pros":["Works with major networks and tokens;","NFT interaction (including its own marketplace);","Russian language support;","Anonymity;","Built-in exchanger;","Tied to the ENJ utility token;","Manual fee control when the network is congested."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: MyEtherWallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"As an alternative to MetaMask for Ethereum, you can use the hot wallet MyEtherWallet. The functionality is fairly easy to learn even though not all app sections are translated into Russian. It supports most popular platforms for both mobile and desktop.","text":"As an alternative to MetaMask for Ethereum, you can use the hot wallet MyEtherWallet. The functionality is fairly easy to learn even though not all app sections are translated into Russian. It supports most popular platforms for both mobile and desktop."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Besides Ethereum, MyEtherWallet works with other blockchains including BNB, ETC, and test formats. A built-in exchanger enables internal swaps, and manual fee control lets you adjust transfer speed. MyEtherWallet has a strong reputation and high security, allowing it to compete with MetaMask.","text":"Besides Ethereum, MyEtherWallet works with other blockchains including BNB, ETC, and test formats. A built-in exchanger enables internal swaps, and manual fee control lets you adjust transfer speed. MyEtherWallet has a strong reputation and high security, allowing it to compete with MetaMask."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"MyEtherWallet","src":"/images/articles/hot-wallets/myetherwallet.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"ETH and some other networks"},{"label":"Location","value":"WEB"},{"label":"Platforms","value":"Mobile devices (including PC versions)"},{"label":"Fees","value":"Manual gas control"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited set of networks (e.g. no BTC);","Difficult wallet recovery if access is lost;","Not all functionality is translated into Russian."],"pros":["A solid MetaMask competitor with similar features;","Many usage options вЂ” mobile apps, browsers, extensions;","Hardware wallet support (e.g. Trezor and Ledger);","NFT and DeFi support;","Manual fee control;","Built-in exchanger;","ICO participation;","Buy tokens with a bank card;","High level of security."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Exodus","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Exodus appeared in 2016: today it is a tool with basic functionality enough for storing assets and making swaps. There is no NFT support, no staking, and no other options that expand the wallet. ExodusвЂ™s core idea is simplicity and easy use even for beginners вЂ” and it succeeds at that.","text":"Exodus appeared in 2016: today it is a tool with basic functionality enough for storing assets and making swaps. There is no NFT support, no staking, and no other options that expand the wallet. ExodusвЂ™s core idea is simplicity and easy use even for beginners вЂ” and it succeeds at that."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are noticeable downsides, such as needing to fund the wallet before you can save your own seed phrase. Exodus users also face high fees and security vulnerabilities, which deters many potential crypto enthusiasts.","text":"There are noticeable downsides, such as needing to fund the wallet before you can save your own seed phrase. Exodus users also face high fees and security vulnerabilities, which deters many potential crypto enthusiasts."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Exodus","src":"/images/articles/hot-wallets/exodus.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"More than a hundred popular assets"},{"label":"Location","value":"WEB"},{"label":"Platforms","value":"Mobile apps and browsers"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["No NFT support;","High fees;","Need to fund the account to get the seed phrase;","Security system vulnerabilities;","Closed-source code;","No staking feature;","No Russian language."],"pros":["Ease of use;","Versions for mobile and desktop platforms;","Built-in browser;","Support for major coins;","Built-in exchanger."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Blockchain Wallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the oldest hot wallets, operating since 2011. By user count Blockchain Wallet is comparable to our ranking leaders MetaMask and Trust Wallet, with support from the Blockchain.com exchange. Downsides include a limited coin set, no desktop version, and private keys stored on the walletвЂ™s side.","text":"One of the oldest hot wallets, operating since 2011. By user count Blockchain Wallet is comparable to our ranking leaders MetaMask and Trust Wallet, with support from the Blockchain.com exchange. Downsides include a limited coin set, no desktop version, and private keys stored on the walletвЂ™s side."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Full access to all Blockchain Wallet tools requires full identity verification, which conflicts with many usersвЂ™ privacy needs. On the plus side, the wallet has a simple, clear interface (including Russian), an exchanger, a fiat account, and a high security level.","text":"Full access to all Blockchain Wallet tools requires full identity verification, which conflicts with many usersвЂ™ privacy needs. On the plus side, the wallet has a simple, clear interface (including Russian), an exchanger, a fiat account, and a high security level."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Blockchain Wallet","src":"/images/articles/hot-wallets/blockchain-wallet.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"BTC, ETH and several other tokens"},{"label":"Location","value":"WEB"},{"label":"Platforms","value":"Mobile apps and browsers"},{"label":"Fees","value":"Depends on transaction size"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Identity verification required for full functionality;","Private keys stored on the walletвЂ™s servers;","Limited set of coins."],"pros":["Oldest wallet with an excellent security system;","Simple, clear interface;","Russian language support;","Fiat account support;","Built-in exchanger;","Option to create multiple addresses within one wallet;","Manual fee control;","Analytics and charts module."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Coinbase Wallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Coinbase Wallet is developed by the like-named exchange familiar to digital asset holders worldwide. The exchange itself stopped serving Russian users some time ago, but today there are no restrictions on using the Coinbase Wallet hot wallet itself. Future prospects remain unclear, so CIS users decide for themselves whether to use the platform.","text":"Coinbase Wallet is developed by the like-named exchange familiar to digital asset holders worldwide. The exchange itself stopped serving Russian users some time ago, but today there are no restrictions on using the Coinbase Wallet hot wallet itself. Future prospects remain unclear, so CIS users decide for themselves whether to use the platform."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Strengths of Coinbase Wallet include asset protection and many tools (staking, DApps, marketplace integrations, NFTs). You can also send tokens inside the ecosystem without the recipientвЂ™s wallet address вЂ” knowing only their Coinbase Wallet nickname is enough.","text":"Strengths of Coinbase Wallet include asset protection and many tools (staking, DApps, marketplace integrations, NFTs). You can also send tokens inside the ecosystem without the recipientвЂ™s wallet address вЂ” knowing only their Coinbase Wallet nickname is enough."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Coinbase Wallet","src":"/images/articles/hot-wallets/coinbase-wallet.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"Most coins (except ADA, BNB and some others)"},{"label":"Location","value":"Mobile devices"},{"label":"Platforms","value":"Mobile apps (PC versions have reduced functionality)"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Unclear prospects in the RU segment;","No full-featured PC experience;","No support for some popular coins."],"pros":["Backed by a well-known exchange;","High asset protection (no hacks throughout the platformвЂ™s history);","In-app token swaps;","Integration with various platforms and venues;","Fast internal transfers without wallet addresses (send by nickname);","Passive income tools;","Built-in browser."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Phantom","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Phantom hot wallet works on Solana вЂ” the most popular platform for transactions and niche NFTs on that blockchain. It offers staking, asset swaps, and bank-card top-ups via Moonpay.","text":"The Phantom hot wallet works on Solana вЂ” the most popular platform for transactions and niche NFTs on that blockchain. It offers staking, asset swaps, and bank-card top-ups via Moonpay."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Phantom is backed by well-known funds, and asset security relies on a non-custodial model. It also supports Ledger wallets, and biometric authentication adds to security. Most crypto enthusiasts see it as the best wallet for Solana.","text":"Phantom is backed by well-known funds, and asset security relies on a non-custodial model. It also supports Ledger wallets, and biometric authentication adds to security. Most crypto enthusiasts see it as the best wallet for Solana."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Phantom","src":"/images/articles/hot-wallets/phantom.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"Solana blockchain coins"},{"label":"Location","value":"WEB"},{"label":"Platforms","value":"Mobile apps and browsers"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited coin set вЂ” focused on SOL;","No Russian on the official website;","Desktop OS use is only via a browser extension."],"pros":["Maximally simple and convenient Solana experience;","SOL staking feature;","In-app token swaps;","NFT support;","Card top-ups;","Works on mobile apps and desktop OS;","Built-in browser simplifies user work;","Russian language in the app;","High asset protection;","Ledger cold wallet support;","DApps support."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Trust Wallet","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"A key MetaMask competitor is Trust Wallet, which despite broader features is somewhat less popular among crypto enthusiasts. It supports BTC and SOL, plus staking that lets you earn by sending coins to specialized vaults.","text":"A key MetaMask competitor is Trust Wallet, which despite broader features is somewhat less popular among crypto enthusiasts. It supports BTC and SOL, plus staking that lets you earn by sending coins to specialized vaults."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On security, Trust Wallet offers stronger conditions вЂ” private keys stay with the user, not on the developerвЂ™s servers. That lets users write down the seed phrase and store it safely themselves.","text":"On security, Trust Wallet offers stronger conditions вЂ” private keys stay with the user, not on the developerвЂ™s servers. That lets users write down the seed phrase and store it safely themselves."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Trust Wallet","src":"/images/articles/hot-wallets/trust-wallet.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"Most popular coins, including BTC and SOL"},{"label":"Location","value":"Mobile devices"},{"label":"Platforms","value":"Mobile apps (no PC)"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Limited to the mobile version;","No two-factor authentication;","No DApps support;","Because the platform belongs to Binance, prospects on the Russian market remain unclear."],"pros":["Free to use;","Support for major networks including BTC and SOL;","Private keys stored on the userвЂ™s side;","Ability to work with NFT assets;","Staking feature;","Maximally simple, friendly interface;","Anonymity when working with crypto;","Russian language support."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: MetaMask","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"One of the best-known hot wallets, uniting tens of millions of users worldwide. It is equally convenient on mobile and desktop via extensions for popular browsers. MetaMask supports popular networks including experimental formats, letting users take part in testing new platforms.","text":"One of the best-known hot wallets, uniting tens of millions of users worldwide. It is equally convenient on mobile and desktop via extensions for popular browsers. MetaMask supports popular networks including experimental formats, letting users take part in testing new platforms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main downside is lack of BTC and SOL compatibility. In short, you cannot work with those cryptocurrencies because MetaMask only supports Ethereum and EVM-compatible networks. For Bitcoin, Solana, and some other coins you will need alternatives.","text":"The main downside is lack of BTC and SOL compatibility. In short, you cannot work with those cryptocurrencies because MetaMask only supports Ethereum and EVM-compatible networks. For Bitcoin, Solana, and some other coins you will need alternatives."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Metamask","src":"/images/articles/hot-wallets/metamask.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Support","value":"EVM networks (ETH, BNB, Polygon, etc.)"},{"label":"Location","value":"WEB"},{"label":"Platforms","value":"Mobile versions, Chrome, Firefox, Edge browsers"},{"label":"Fees","value":"Depends on the cryptocurrency"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 80
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Cannot work with BTC and SOL;","Adding new networks can be difficult for beginners;","Ambiguous anonymity policy."],"pros":["Free to use;","Maximum simplicity;","Ability to work with NFT assets;","Built-in browser expands user possibilities;","Support for a large number of protocols;","Works with test networks;","Browser extensions and mobile apps."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
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
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hot wallets are an excellent choice for everyday use, fast transfers, trading, and Web3 activity. They are convenient, accessible, and functional вЂ” especially for those who actively work with cryptocurrencies.","text":"Hot wallets are an excellent choice for everyday use, fast transfers, trading, and Web3 activity. They are convenient, accessible, and functional вЂ” especially for those who actively work with cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 83
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For large sums, however, consider a combined strategy: a hot wallet for daily operations and a cold wallet for savings.","text":"For large sums, however, consider a combined strategy: a hot wallet for daily operations and a cold wallet for savings."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 84
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ideal approach is risk splitting and sound security management. Only then can you enjoy digital assets without fear of losing funds.","text":"The ideal approach is risk splitting and sound security management. Only then can you enjoy digital assets without fear of losing funds."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh$tmj$
) ordered
WHERE ordered.idx = 85
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Mining company catalog: find a reliable partner faster$tmj$,
       $tmj$Use the TOP MINING catalog to pick ASIC suppliers, mining hotels, pools, exchanges, and repair services вЂ” filters, reviews, and company checks.$tmj$,
       $tmj$Mining company catalog$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
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
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Mining is not only equipment and electricity. Behind every successful project stands a whole ecosystem: ASIC suppliers, mining hotels, repair services, pools, exchanges, and dozens of other players. To bring all these links into one clear system, the TOP MINING company catalog was created вЂ” RussiaвЂ™s largest database of organizations related to mining and cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The catalog unites every industry direction, helps you quickly find verified partners, and analyze the market without wasting time. It is not just a contact list вЂ” it is a work tool where every company has been reviewed and has a detailed card with reviews, specs, and search filters."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"What is the TOP MINING company catalog","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The TOP MINING catalog is a structured platform that gathers organizations providing goods and services for mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Here you can:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["find an ASIC equipment supplier with the model and payment terms you need;","choose a mining hotel for farm hosting based on tariff, capacity, and region;","pick a company for ASIC repair;","explore pools, exchanges, wallets, and firmwares;","follow key industry events."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The catalog features more than a hundred company cards and 4,500+ real client reviews that have been moderated. Many companies are verified via rusprofile and TOP MININGвЂ™s own check, which ensures data reliability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1. ASIC sales: where to buy equipment without risk","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњASIC SalesвЂќ section is a database of equipment suppliers for cryptocurrency mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"In the filters you can set:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["List of services provided (sales, repair, hotel);","Years on the market вЂ” to filter out unverified companies;","Office location and delivery cities;","additional payment terms and contract form;","ASIC models вЂ” for precise equipment selection."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Each card contains a detailed description, prices, photos, client reviews, and a TOP MINING verification mark. This helps avoid buying from shady sellers and immediately assess reputation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ASIC sales in the catalog","src":"/images/articles/catalog-companies/img-1.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2. Mining hotels: where it is more profitable to host equipment","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњMining hotelsвЂќ section gathers companies offering ASIC farm hosting."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters include:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Hotel location,","Price to install one ASIC,","Site capacity,","Electricity type (wind generator, gas generation, hydropower, thermal power, or nuclear plant),","Minimum number of ASICs for placement,","Payment terms and contract form."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Hotel cards include site photos, real reviews, a map pin, and a verification mark. This is especially important when choosing a hotel remotely: you can immediately see whom to trust with your equipment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining hotels in the catalog","src":"/images/articles/catalog-companies/img-2.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3. ASIC repair: verified services","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњASIC RepairвЂќ section includes service centers and private workshops."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters let you choose a company by:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Work experience,","Additional services available (mining hotel maintenance, device firmware),","Location,","Payment and contract terms."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Users can compare prices, timelines, and company ratings. Client reviews help show who actually solves problems and who only makes promises."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4. Mining pools: where to launch stable mining","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњMining poolsвЂќ section is a tool for analyzing collective mining platforms."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters let you select pools by:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Mined coins,","Commission,","Total hashrate,","Minimum payout limit,","Reward accrual frequency,","Profit distribution method."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This data helps choose a pool with optimal profitability and stable payouts. It also shows how many years the company has been on the market, which helps assess reliability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5. Crypto exchanges: where to trade safely","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњCrypto exchangesвЂќ section brings together platforms available to users."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Available filters:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Jurisdiction,","Number of trading pairs and coins,","Additional features available,","Years on the market."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Exchange cards include a description, rating, fees, interface screenshots, and user reviews вЂ” a useful tool for those looking for a platform for trading or depositing/withdrawing funds."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Crypto exchanges and wallets","src":"/images/articles/catalog-companies/img-3.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6. Crypto wallets: storage without unnecessary risk","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњCrypto walletsвЂќ section includes both hardware and online solutions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters let you sort wallets by:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["NFT and coin support,","Platform,","Fee calculation method,","Duration of operation."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This helps pick a wallet for specific tasks вЂ” storage, daily operations, or mining integration."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7. ASIC manufacturers: who stands behind the hardware","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњASIC manufacturersвЂќ section gathers mining equipment makers вЂ” from major brands to local factories."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters include:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Supported algorithms,","Number of models,","Years on the market."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This lets you quickly compare brands, study specs, and find official representatives."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8. ASIC firmwares: optimization for profitability","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњASIC firmwaresвЂќ section includes developers and suppliers of alternative ASIC firmwares."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Available filters:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Equipment manufacturer,","Office location,","Payment terms,","Contract form."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Here you can find solutions that raise mining efficiency, lower power consumption, and improve device stability."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9. Events: focus on the industry","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The вЂњEventsвЂќ section includes industry conferences, exhibitions, forums, and hackathons."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Filters let you search events by:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Year held,","Country held,","Tags (BUSINESS, COIN, CRYPTO, EDUCATION, HR, INVESTMENTS, MINING, TRADING),","Event type (exhibition, private meetup, conference, summit, forum)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"This helps miners and entrepreneurs stay on top of current events and find partners and investors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Events and catalog ecosystem","src":"/images/articles/catalog-companies/img-4.jpg"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why the TOP MINING catalog is more than just a directory?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Our catalog is not just a database вЂ” it is a working platform for analysis and selection."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Advantages:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Filters for any task вЂ” find a company by the criteria you need, from geography to ASIC model;","Verification and moderation вЂ” all companies go through audit and verification;","User reviews вЂ” more than 4,500 ratings help avoid mistakes when choosing;","Condition comparison вЂ” ability to compare offers and pick the optimal one;","Updated base вЂ” the catalog is regularly expanded with new organizations and current information."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to use the catalog in practice","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Beginner miners вЂ” to choose equipment and hosting without risk.","Entrepreneurs вЂ” to find partners and analyze competitors.","Investors вЂ” to understand which players hold key market positions.","Marketers вЂ” to study the market and build promotion strategies."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The catalog helps save weeks of analysis and quickly gather the contractors you need in one place."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 63
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
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"The TOP MINING catalog is not just a tool for miners вЂ” it is a full data ecosystem that unites every market link: from equipment suppliers to hosting sites, from firmware developers to crypto exchanges."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"It is a space where verified information replaces chaos, and finding a partner becomes a conscious choice."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"TOP MINING helps you see the market as a whole, make decisions based on facts, and build mining projects with maximum efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best cryptocurrencies for investing: coin ranking$tmj$,
       $tmj$Which assets stand out for investors вЂ” a practical ranking to guide allocation beyond hype alone.$tmj$,
       $tmj$Cryptocurrencies for investing$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
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
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Cryptocurrency mining is a highly competitive industry that requires not only powerful equipment, but also a competent approach to choosing assets for mining. The efficiency of your investment, the rate of return on equipment, and your resistance to market fluctuations directly depend on what coin you mine. In this material, we will look at the key factors when choosing a cryptocurrency for mining, ways to assess the prospects of coins, and provide practical recommendations for beginners and experienced miners.","text":"Cryptocurrency mining is a highly competitive industry that requires not only powerful equipment, but also a competent approach to choosing assets for mining. The efficiency of your investment, the rate of return on equipment, and your resistance to market fluctuations directly depend on what coin you mine. In this material, we will look at the key factors when choosing a cryptocurrency for mining, ways to assess the prospects of coins, and provide practical recommendations for beginners and experienced miners."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrencies for investment","src":"/images/articles/best-crypto-invest/mixed-coins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why is it important to carefully select a coin to mine?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Mining is not just about connecting equipment and waiting for profit. A successful strategy requires a systematic approach: technical, economic and market parameters are taken into account. One of the most common mistakes is mining вЂњby earвЂќ - without preliminary analysis. This is fraught with losses due to high competition, stranded electricity costs and insufficient liquidity of the chosen coin.","text":"Mining is not just about connecting equipment and waiting for profit. A successful strategy requires a systematic approach: technical, economic and market parameters are taken into account. One of the most common mistakes is mining вЂњby earвЂќ - without preliminary analysis. This is fraught with losses due to high competition, stranded electricity costs and insufficient liquidity of the chosen coin."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The quality choice of a mining asset is a balance between potential profit, technical implementation and sustainability of the project in the long term.","text":"The quality choice of a mining asset is a balance between potential profit, technical implementation and sustainability of the project in the long term."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Choosing a cryptocurrency for mining","src":"/images/articles/best-crypto-invest/coins-pcb.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Key parameters that determine mining profitability","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To objectively assess the attractiveness of a coin, it is necessary to take into account a complex of factors.","text":"To objectively assess the attractiveness of a coin, it is necessary to take into account a complex of factors."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Among them:","text":"Among them:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Each cryptocurrency is based on a specific consensus algorithm. It depends on what equipment can be used to extract it. The most common: SHA-256 вЂ“ Bitcoin and derivatives (Bitcoin Cash, etc.); Scrypt вЂ“ Litecoin, Dogecoin; EtHash вЂ“ Ethereum Classic; KawPow / ProgPow / RandomX вЂ“ ASIC-resistant and GPU-oriented coins. The type of algorithm determines hardware compatibility, power consumption and mining difficulty level;","title":"Algorithm type"},{"text":"Hashrate shows the total computing power used to mine a specific cryptocurrency. The higher this indicator, the more difficult it is to compete. However, high difficulty does not always mean low profit: as the price of the coin increases, it can be compensated;","title":"Hashrate and network complexity"},{"text":"The size of the reward affects the income of miners. It is also important to consider whether halving is carried out (reduction of the reward at a certain frequency), like Bitcoin, or the reward remains fixed;","title":"Block reward"},{"text":"Even a technically promising coin may not be profitable if it does not have sufficient liquidity. The key criteria here are volumes on exchanges, exchange rate stability and demand;","title":"Market price and trading volume"},{"text":"Profitability depends on the cost of electricity. For example, at a tariff of 6 rubles/kWh or more, the profitability of mining most popular coins drops significantly. Power-hungry algorithms (like SHA-256) require particularly cheap electricity;","title":"Energy costs"},{"text":"It is important to understand who is behind the development, how actively the ecosystem is developing and whether the project is supported by the community. Coins without technical support quickly lose value.","title":"Project reputation"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Mining profitability parameters","src":"/images/articles/best-crypto-invest/btc-circuit-network.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"How to choose a coin for your existing equipment?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The right choice depends on what equipment you are using.","text":"The right choice depends on what equipment you are using."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Below is a basic classification of suitable coins by device type:","text":"Below is a basic classification of suitable coins by device type:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"ASIC (Application-Specific Integrated Circuit) are devices optimized for a specific algorithm. They are characterized by high performance, but lack flexibility. ASICS provide maximum efficiency, but require stable infrastructure and low electricity prices;","title":"Asics"},{"text":"Mining on video cards (GPU) is more versatile. The same rig can mine dozens of coins, switching between them depending on profitability. GPU mining is suitable for those who value flexibility and plan to actively optimize their strategy.","title":"GPU farms"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Cryptocurrency mining equipment","src":"/images/articles/best-crypto-invest/datacenter.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Tools for calculating profitability","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Before you start mining, it is important to calculate real profitability indicators.","text":"Before you start mining, it is important to calculate real profitability indicators."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Here are the key tools and techniques:","text":"Here are the key tools and techniques:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Profitability calculators. Services like TOP MINING allow you to enter the equipment model, the cost of electricity and get an estimate of daily, monthly and annual profit;","Equipment catalogs. Use databases of ASIC and GPU specifications, including power efficiency (J/TH or W/MH), to select the best power-to-power ratio;","Real-time profitability monitoring. Connecting to the pools API allows you to track actual performance based on network conditions."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Calculation of mining profitability","src":"/images/articles/best-crypto-invest/btc-chip.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Additional coin evaluation criteria","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"To secure your investment and minimize risks, you should pay attention to additional aspects.","text":"To secure your investment and minimize risks, you should pay attention to additional aspects."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Key parameters:","text":"Key parameters:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Trading volumes on centralized and decentralized exchanges;","Availability of an official website, GitHub repository, road map;","Support for staking, DeFi protocols, NFTs or other forms of coin use;","Availability of an active community and technical support;","Legal validity of the project: no risk of sanctions or restrictions."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Practical recommendations for miners","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Review the current coin regularly. Changes in course, difficulty or rewards can dramatically reduce profitability;","Use multipools or auto-algorithms. They allow you to automatically switch to the most profitable coins;","Keep an eye on firmware updates and optimizations. ASIC firmware updates can significantly increase profitability or reduce consumption;","Work with proven pools. A reliable pool reduces the risk of missing rewards;","Consider long-term holding. Sometimes it is wiser not to sell the mined coin immediately, but to wait for a favorable exchange rate."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Practical advice for miners","src":"/images/articles/best-crypto-invest/altcoins-pile.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Dogecoin (DOGE)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"If an investor decides to work with memcoins, DOGE represents the most secure option. Memes themselves are characterized by increased volatility and the potential for depreciation, but in the case of Dogecoin the situation is more stable for three reasons. Firstly, this is the most famous and oldest memcoin, familiar to everyone. Secondly, the project has strong support from the community, including interest from Elon Musk. Thirdly, capitalization: DOGE has been among the TOP 15 cryptocurrencies in terms of the volume of invested funds for several years now.","text":"If an investor decides to work with memcoins, DOGE represents the most secure option. Memes themselves are characterized by increased volatility and the potential for depreciation, but in the case of Dogecoin the situation is more stable for three reasons. Firstly, this is the most famous and oldest memcoin, familiar to everyone. Secondly, the project has strong support from the community, including interest from Elon Musk. Thirdly, capitalization: DOGE has been among the TOP 15 cryptocurrencies in terms of the volume of invested funds for several years now."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"In 2026, Dogecoin has every chance of success, and especially after the adoption of the spot Ethereum-ETF: this could trigger the explosive growth of many alts, and the DOGE memcoin is one of the first candidates. In addition, it is possible that help will come from Elon Musk, whose tweet alone can lead to an increase in the Dogecoin rate by 10-15% within an hour.","text":"In 2026, Dogecoin has every chance of success, and especially after the adoption of the spot Ethereum-ETF: this could trigger the explosive growth of many alts, and the DOGE memcoin is one of the first candidates. In addition, it is possible that help will come from Elon Musk, whose tweet alone can lead to an increase in the Dogecoin rate by 10-15% within an hour."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Dogecoin (DOGE)","src":"/images/articles/best-crypto-invest/doge-shiba.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Dogecoin, DOGE, Dogecoin, Dogi"},{"label":"Year of appearance","value":"2013"},{"label":"Extraction technology","value":"PoW"},{"label":"Emission","value":"unlimited"},{"label":"Capitalization","value":"more than $10 billion"},{"label":"Maximum cost","value":"$0.7316 (May 8, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Memcoins are an asset with increased investment risks;","Unlimited issue, which depreciates the coin;","Record number of tokens in circulation;","The influence of speculative factors."],"pros":["The oldest and most famous memcoin;","High capitalization (TOP-15);","Strong support from the community;","Elon Musk's interest (including the possibility of paying for some manufactured products using DOGE);","Dogecoin can be mined, which provides support from miners."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: ZCash (ZEC)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Which cryptocurrency from our rating can be called the most controversial and risky in 2026? This is the ZCash project and its ZEC token. The main feature of the network is a high degree of anonymity: it is difficult to find out the transaction participant and the transferred amount, which makes ZEC an optimal asset for conducting dubious transactions on the darknet. This is both a disadvantage and an advantage of the product, which is the main reason for many contradictions.","text":"Which cryptocurrency from our rating can be called the most controversial and risky in 2026? This is the ZCash project and its ZEC token. The main feature of the network is a high degree of anonymity: it is difficult to find out the transaction participant and the transferred amount, which makes ZEC an optimal asset for conducting dubious transactions on the darknet. This is both a disadvantage and an advantage of the product, which is the main reason for many contradictions."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"On the one hand, many regulators today strive to make the crypto market transparent and controlled: projects such as ZCash clearly do not fit into this concept. Bottom line: many exchanges and projects have already stopped working with ZEC, which is unprofitable for users. But on the other hand, if you want to maintain almost complete anonymity, blockchain can be an excellent solution. ZEC can also be mined using the Proof of Work algorithm: the network hashrate is stable and does not succumb to the negative news background. Such support from miners could lead to an increase in the ZCash rate in 2026.","text":"On the one hand, many regulators today strive to make the crypto market transparent and controlled: projects such as ZCash clearly do not fit into this concept. Bottom line: many exchanges and projects have already stopped working with ZEC, which is unprofitable for users. But on the other hand, if you want to maintain almost complete anonymity, blockchain can be an excellent solution. ZEC can also be mined using the Proof of Work algorithm: the network hashrate is stable and does not succumb to the negative news background. Such support from miners could lead to an increase in the ZCash rate in 2026."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"ZCash, ZEC"},{"label":"Year of appearance","value":"2016"},{"label":"Extraction technology","value":"PoW"},{"label":"Emission","value":"limited"},{"label":"Capitalization","value":"more than $300 million"},{"label":"Maximum cost","value":"$3,191.93 (October 29, 2016)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Regulators' struggle with such assets;","Delisting on a number of exchanges."],"pros":["One of the few projects that ensure anonymity of transactions;","Limited emissions (artificial scarcity effect);","Confident support from a stable network hashrate;","Past ZEC growth cycles have been quite noticeable: if the trend repeats, investors can make good money."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Litecoin (LTC)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Litecoin was born in 2011 as a вЂњlighterвЂќ version of BTC with its shortcomings eliminated. Despite the fact that more than 10 years have passed since then, LTC has not managed to surpass its older brother, however, it is regularly included in the TOP 25 largest coins by capitalization. This is a reliable asset with a good reputation without negative stories or high-profile scandals.","text":"Litecoin was born in 2011 as a вЂњlighterвЂќ version of BTC with its shortcomings eliminated. Despite the fact that more than 10 years have passed since then, LTC has not managed to surpass its older brother, however, it is regularly included in the TOP 25 largest coins by capitalization. This is a reliable asset with a good reputation without negative stories or high-profile scandals."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are several reasons why this cryptocurrency is interesting. Firstly, this is the Litecoin halving that took place in August 2023: the size of the block reward was halved, which means that the asset has become even more scarce (especially considering its limited supply). Secondly, the growing difficulty of mining - here the situation is similar to BTC. Since the difficulty is growing, it means miners see the prospects of the coin and plan to further invest in its production. Thirdly, it is possible to simultaneously mine LTC and a second asset вЂ“ Dogecoin. Another advantage in terms of popularity among miners and a big plus in growth prospects.","text":"There are several reasons why this cryptocurrency is interesting. Firstly, this is the Litecoin halving that took place in August 2023: the size of the block reward was halved, which means that the asset has become even more scarce (especially considering its limited supply). Secondly, the growing difficulty of mining - here the situation is similar to BTC. Since the difficulty is growing, it means miners see the prospects of the coin and plan to further invest in its production. Thirdly, it is possible to simultaneously mine LTC and a second asset вЂ“ Dogecoin. Another advantage in terms of popularity among miners and a big plus in growth prospects."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Litecoin (LTC)","src":"/images/articles/best-crypto-invest/litecoin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Litecoin, LTC, Lightcoin, Light"},{"label":"Year of appearance","value":"2011"},{"label":"Extraction technology","value":"PoW"},{"label":"Emission","value":"limited"},{"label":"Capitalization","value":"more than $5 billion"},{"label":"Maximum cost","value":"$410.26 (May 10, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Litecoin is inferior to competitors in terms of intensity of development and implementation of new solutions;","Many people believe that the time of LTC has already passed."],"pros":["An old and proven coin;","Litecoin can be mined on video cards and ASICs;","Possibility of dual mining: mining LTC together with DOGE;","In 2023, halving took place: the asset became more scarce, and the situation with mining rewards will remain unchanged for another 4 years;","The difficulty of mining Litecoin is growing: new investors are appearing in the field, as is the case with the BTC network. This means that miners believe in the project;","Limited emissions вЂ“ the effect of artificial scarcity."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Toncoin (TON)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Rapid integration with Telegram, active participation of Pavel Durov and his team, records for transaction processing speed - we are talking about The Open Network, which has impressive development prospects. Many claim that this particular cryptocurrency is a dark horse in 2024, from which the most significant growth can be expected. Even if we discard these bold predictions, it is difficult to disagree with the fact that the interest of developers and investors in Toncoin is rapidly increasing.","text":"Rapid integration with Telegram, active participation of Pavel Durov and his team, records for transaction processing speed - we are talking about The Open Network, which has impressive development prospects. Many claim that this particular cryptocurrency is a dark horse in 2024, from which the most significant growth can be expected. Even if we discard these bold predictions, it is difficult to disagree with the fact that the interest of developers and investors in Toncoin is rapidly increasing."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The number of services on TON is growing, and at the end of 2023, The Open Network set a record for the speed of operation among all modern blockchains. TON can also be mined using mining вЂ“ this is the format in which Pavel DurovвЂ™s Cocoon project operates.","text":"The number of services on TON is growing, and at the end of 2023, The Open Network set a record for the speed of operation among all modern blockchains. TON can also be mined using mining вЂ“ this is the format in which Pavel DurovвЂ™s Cocoon project operates."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Toncoin, TON, Tonkoin, Tone"},{"label":"Year of appearance","value":"2017"},{"label":"Extraction technology","value":"PoS"},{"label":"Emission","value":"limited"},{"label":"Capitalization","value":"more than $5 billion"},{"label":"Maximum cost","value":"$5.29 (November 12, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["SEC restrictions;","A young project that does not have the reputation of a proven counterparty with a rich history;","Not all platforms and exchanges are supported."],"pros":["One of the most dynamically developing blockchains;","Support of Pavel Durov and his team;","Limited emissions and, as a consequence, the effect of artificial shortage;","Record network speed;","Increased interest among application and tool developers in The Open Network platform;","Mining within the Cocoon project."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Solana (SOL)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The SOL coin was once called the вЂњkillerвЂќ of Ethereum, however, the collapse of the FTX exchange (the main investor of the network) somewhat undermined the reputation of the Solana blockchain. However, Solana coped with the negativity and managed to fully recover from this event, which opens up good prospects for growth. In terms of capitalization, trading volumes and investor interest, SOL is still far from ETH, but this could be the assetвЂ™s growth potential. Moreover, numerous NFT collections and memes are created on the basis of Solana, which is the strength of the platform.","text":"The SOL coin was once called the вЂњkillerвЂќ of Ethereum, however, the collapse of the FTX exchange (the main investor of the network) somewhat undermined the reputation of the Solana blockchain. However, Solana coped with the negativity and managed to fully recover from this event, which opens up good prospects for growth. In terms of capitalization, trading volumes and investor interest, SOL is still far from ETH, but this could be the assetвЂ™s growth potential. Moreover, numerous NFT collections and memes are created on the basis of Solana, which is the strength of the platform."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Today, Solana can be called not the вЂњkillerвЂќ of Ethereum, but its undervalued (and not yet so technologically advanced) copy. The project survived the collapse of FTX, and according to some experts, sooner or later the SOL rate may reach $3,200. Based on this, the answer to the question of which cryptocurrency is the most undervalued in 2026 may well be Solana.","text":"Today, Solana can be called not the вЂњkillerвЂќ of Ethereum, but its undervalued (and not yet so technologically advanced) copy. The project survived the collapse of FTX, and according to some experts, sooner or later the SOL rate may reach $3,200. Based on this, the answer to the question of which cryptocurrency is the most undervalued in 2026 may well be Solana."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Solana, SOL, Solana, Salt"},{"label":"Year of appearance","value":"2017"},{"label":"Extraction technology","value":"PoS"},{"label":"Emission","value":"unlimited"},{"label":"Capitalization","value":"more than $40 billion"},{"label":"Maximum cost","value":"$259.96 (November 6, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Damaged reputation due to FTX bankruptcy;","The presence of more technologically advanced and fast-growing competitors;","It has been in the status of a promising project and a вЂњkillerвЂќ of Ethereum for an excessively long time, which somewhat disappoints investors."],"pros":["Entry into the TOP 5 cryptocurrencies in 2024 by capitalization;","The coin managed to recover after the collapse of the FTX exchange;","High network speed;","Minimum commissions;","Popularity of NFT collections on Solana;","Underestimation, which can become a trigger for rapid growth."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Ethereum (ETH)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite the transition of the Ether mining procedure to the PoS algorithm in 2022, the asset has not become less popular. ETH continues to hold strong second place in terms of capitalization and interest from crypto investors after BTC. This means that this cryptocurrency should also be in the portfolio in 2026: in addition to earning money from the growth of the exchange rate, Ethereum owners can earn money by staking - sending an asset to specialized storage facilities with a reward. It is by this principle that Ethereum is mined today after changing the algorithm from PoW to PoS. For joint earnings, specialized pools have been created that allow you to stake almost any amount of ETH.","text":"Despite the transition of the Ether mining procedure to the PoS algorithm in 2022, the asset has not become less popular. ETH continues to hold strong second place in terms of capitalization and interest from crypto investors after BTC. This means that this cryptocurrency should also be in the portfolio in 2026: in addition to earning money from the growth of the exchange rate, Ethereum owners can earn money by staking - sending an asset to specialized storage facilities with a reward. It is by this principle that Ethereum is mined today after changing the algorithm from PoW to PoS. For joint earnings, specialized pools have been created that allow you to stake almost any amount of ETH."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The plans of Ethereum developers are no less interesting: a number of important updates are planned to increase the speed of the network and expand the capabilities of the blockchain. Also in 2024, the adoption of a spot Ethereum-ETF took place, which attracts new investors and becomes a trigger for the growth of the ETH rate.","text":"The plans of Ethereum developers are no less interesting: a number of important updates are planned to increase the speed of the network and expand the capabilities of the blockchain. Also in 2024, the adoption of a spot Ethereum-ETF took place, which attracts new investors and becomes a trigger for the growth of the ETH rate."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Ethereum (ETH)","src":"/images/articles/best-crypto-invest/eth-coin.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Ethereum, ETH, Ethereum, Ethereum"},{"label":"Year of appearance","value":"2015"},{"label":"Extraction technology","value":"PoS"},{"label":"Emission","value":"unlimited"},{"label":"Capitalization","value":"more than $250 billion"},{"label":"Maximum cost","value":"$4,878.26 (November 10, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Negative attitude of miners due to the transition to PoS;","Not the most outstanding network speed;","High commissions;","Problems with scaling, which further affects the speed of transactions;","Unlimited emission, which can lead to inflation."],"pros":["The second largest cryptocurrency by capitalization in 2024;","Increased attention to the platform of many digital solution developers;","A real means of payment for paying for goods and services in some countries;","High liquidity, which allows for quick transactions on most platforms;","The most expensive and famous NFT collections are created on the Ethereum network."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"1st place: Bitcoin (BTC)","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At any time, regardless of the market situation, Bitcoin should be in the portfolio of a trader, investor, or simply a person who wants to make money in the niche of digital assets. BTC is the fundamental format around which any trends, forecasts and activities are built: the Bitcoin price, BTC dominance, the complexity of the Bitcoin network - all these are the main metrics used by both miners and investment experts. Compared to other coins, BTC has the least volatility, which guarantees the safety of funds even in difficult market times.","text":"At any time, regardless of the market situation, Bitcoin should be in the portfolio of a trader, investor, or simply a person who wants to make money in the niche of digital assets. BTC is the fundamental format around which any trends, forecasts and activities are built: the Bitcoin price, BTC dominance, the complexity of the Bitcoin network - all these are the main metrics used by both miners and investment experts. Compared to other coins, BTC has the least volatility, which guarantees the safety of funds even in difficult market times."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitcoin can be considered as an optimal investment option not only because of its capitalization and fundamentals, but also because of the influence of halving. BTC is the uncontested first place in the ranking of promising cryptocurrencies in 2024вЂ“2025.","text":"Bitcoin can be considered as an optimal investment option not only because of its capitalization and fundamentals, but also because of the influence of halving. BTC is the uncontested first place in the ranking of promising cryptocurrencies in 2024вЂ“2025."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitcoin (BTC)","src":"/images/articles/best-crypto-invest/btc-network.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Titles","value":"Bitcoin, BTC, Bitcoin, Bitcoin"},{"label":"Year of appearance","value":"2009"},{"label":"Extraction technology","value":"PoW, SHA-256 algorithm"},{"label":"Emission","value":"limited"},{"label":"Capitalization","value":"more than $800 billion"},{"label":"Maximum cost","value":"$69,044.77 (November 10, 2021)"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Due to minimal volatility, the assetвЂ™s profitability is inferior to alternative coins;","The growing difficulty of mining, which reduces the income of those involved in mining;","A complex calculation procedure, which forces the use of expensive, resource-intensive and noisy equipment."],"pros":["The oldest and most reliable digital asset;","Minimal volatility and exposure to speculative factors;","Limited issue, which creates the effect of artificial scarcity (such an asset always increases in price);","You can not only buy for investment, but also mine through mining;","Support with all cryptocurrency tools and services;","Instant transactions due to maximum liquidity on major exchanges and platforms;","Possibility of paying for goods and services in some countries."]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 67
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
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Selecting a coin for mining is not a one-time task, but a dynamic process that requires taking into account many parameters: from technical characteristics of equipment to global market trends. In conditions of high competition and market volatility, the most successful miners are those who do not rely on luck, but use analytics, regularly review their strategy and rely on proven data.","text":"Selecting a coin for mining is not a one-time task, but a dynamic process that requires taking into account many parameters: from technical characteristics of equipment to global market trends. In conditions of high competition and market volatility, the most successful miners are those who do not rely on luck, but use analytics, regularly review their strategy and rely on proven data."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ability to choose promising coins and wisely select equipment for them allows you not only to maintain profitability, but also to build a sustainable income model even in conditions of uncertainty. Awareness and flexibility are the two pillars of effective mining today.","text":"The ability to choose promising coins and wisely select equipment for them allows you not only to maintain profitability, but also to build a sustainable income model even in conditions of uncertainty. Awareness and flexibility are the two pillars of effective mining today."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best Antminer ASICs from Bitmain$tmj$,
       $tmj$Top Bitmain Antminers for 2026: from KS5 Pro to S23 Hydro 3U вЂ” hashrate, efficiency, pros and cons.$tmj$,
       $tmj$Antminer S23 Hydro 3U$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
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
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Chinese company Bitmain is the universally recognized world leader in manufacturing and selling crypto mining hardware. The Antminer brand lineup includes dozens of diverse devices for both SHA-256 and altcoins: every digital-farm investor knows this trademark. Many service centers successfully work with Bitmain products, and spare parts can be found in any specialized workshop. LetвЂ™s look at the best Antminer models вЂ” we analyze the TOP ASICs that are most interesting in 2026.","text":"The Chinese company Bitmain is the universally recognized world leader in manufacturing and selling crypto mining hardware. The Antminer brand lineup includes dozens of diverse devices for both SHA-256 and altcoins: every digital-farm investor knows this trademark. Many service centers successfully work with Bitmain products, and spare parts can be found in any specialized workshop. LetвЂ™s look at the best Antminer models вЂ” we analyze the TOP ASICs that are most interesting in 2026."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Why Antminer and Bitmain?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain Technologies was founded in 2013 in China and quickly became a leading player in the crypto mining industry. Its flagship device lineup under the Antminer brand revolutionized Bitcoin mining thanks to high energy efficiency and compute power.","text":"Bitmain Technologies was founded in 2013 in China and quickly became a leading player in the crypto mining industry. Its flagship device lineup under the Antminer brand revolutionized Bitcoin mining thanks to high energy efficiency and compute power."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain started by releasing ASIC chips вЂ” specialized integrated circuits designed exclusively for mining. Unlike ordinary GPUs, ASICs are optimized for specific algorithms, for example SHA-256 used in Bitcoin.","text":"Bitmain started by releasing ASIC chips вЂ” specialized integrated circuits designed exclusively for mining. Unlike ordinary GPUs, ASICs are optimized for specific algorithms, for example SHA-256 used in Bitcoin."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Already in 2014 the Antminer S1 became one of the most popular devices among miners worldwide.","text":"Already in 2014 the Antminer S1 became one of the most popular devices among miners worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Since then the company has consistently released new models, each surpassing the previous one in power and energy efficiency. The S-series devices (S9, S17, S19, etc.) set industry standards.","text":"Since then the company has consistently released new models, each surpassing the previous one in power and energy efficiency. The S-series devices (S9, S17, S19, etc.) set industry standards."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Bitmain Antminer ASIC miner","src":"/images/articles/best-antminer-2026/bitmain-antminer-intro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":[{"text":"Antminer ASICs provide high hashing speed at relatively low power consumption;","title":"Maximum performance"},{"text":"Devices are designed for prolonged 24/7 operation;","title":"Reliability"},{"text":"A convenient interface, update support, and quick setup are important pluses for both beginners and experienced miners;","title":"Ease of operation"},{"text":"Bitmain has multi-language support, a developed supply network, and a user community worldwide;","title":"Global community"},{"text":"Modern Antminer models offer the best hashrate-to-energy ratio;","title":"High energy efficiency"},{"text":"Devices are equipped with durable fans or, in some models, a water-cooling system;","title":"Reliable cooling system"},{"text":"Antminer ASICs work well for both home farms and industrial mining centers;","title":"Scalability"},{"text":"Bitmain regularly releases new device generations, allowing miners to stay at the cutting edge.","title":"Continuous model-range updates"}],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"BitmainвЂ™s Antminer has long been a symbol of efficiency and reliability in crypto mining. Thanks to powerful technical solutions, a smart development strategy, and quality support, Bitmain holds leading positions in the ASIC market, remaining the number-one choice for miners worldwide.","text":"BitmainвЂ™s Antminer has long been a symbol of efficiency and reliability in crypto mining. Thanks to powerful technical solutions, a smart development strategy, and quality support, Bitmain holds leading positions in the ASIC market, remaining the number-one choice for miners worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Antminer KAS Miner KS5 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Hype around the kHeavyHash algorithm had clearly faded by the end of 2024 because of a substantial increase in Kaspa mining difficulty. If you plan to mine KAS, it is recommended to do so with top-tier equipment that will stay relevant for several years ahead. One such device is the KAS Miner KS5 Pro вЂ” a powerful ASIC running on kHeavyHash.","text":"Hype around the kHeavyHash algorithm had clearly faded by the end of 2024 because of a substantial increase in Kaspa mining difficulty. If you plan to mine KAS, it is recommended to do so with top-tier equipment that will stay relevant for several years ahead. One such device is the KAS Miner KS5 Pro вЂ” a powerful ASIC running on kHeavyHash."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Kaspa can be considered a reliable cryptocurrency among proven altcoins. Despite its relative youth, the asset trades on all major platforms, and high market capitalization helps minimize risks of severe volatility. The only threat to miners is continued growth in mining difficulty. But KAS Miner KS5 Pro owners are relatively safe, because the modelвЂ™s high performance keeps work efficient as blockchain hashrate grows.","text":"Kaspa can be considered a reliable cryptocurrency among proven altcoins. Despite its relative youth, the asset trades on all major platforms, and high market capitalization helps minimize risks of severe volatility. The only threat to miners is continued growth in mining difficulty. But KAS Miner KS5 Pro owners are relatively safe, because the modelвЂ™s high performance keeps work efficient as blockchain hashrate grows."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer KAS Miner KS5 Pro","src":"/images/articles/best-antminer-2026/antminer-ks5-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"21 TH/s"},{"label":"Power consumption","value":"3,300 W"},{"label":"Energy efficiency","value":"157 W per TH"},{"label":"Algorithm","value":"kHeavyHash"},{"label":"Coins available for mining","value":"3"},{"label":"Noise level","value":"76 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Rapid growth in KAS mining difficulty","A small number of coins available for mining on this ASIC"],"pros":["One of the top devices for Kaspa","The KAS asset has already proven its viability and reliability","Keeping the miner relevant going forward"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Antminer L9","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Scrypt algorithm became a true leader among altcoins in 2024вЂ“2025. DOGE shows noticeable growth, and besides that token, Scrypt ASICs can mine 5 more coins (in merged mining format). At the moment the Antminer L9 is the most powerful ASIC for Dogecoin mining, which drives impressive profitability and elevated demand.","text":"The Scrypt algorithm became a true leader among altcoins in 2024вЂ“2025. DOGE shows noticeable growth, and besides that token, Scrypt ASICs can mine 5 more coins (in merged mining format). At the moment the Antminer L9 is the most powerful ASIC for Dogecoin mining, which drives impressive profitability and elevated demand."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model appeared in 2024 with 16 GH/s power: that is a guarantee of staying relevant for several years. The L9 is one of the bestsellers of the current cycle among altcoin miners вЂ” sales break records as buyers understand the prospects of such equipment and the current profitability of mining on top Scrypt hardware.","text":"The model appeared in 2024 with 16 GH/s power: that is a guarantee of staying relevant for several years. The L9 is one of the bestsellers of the current cycle among altcoin miners вЂ” sales break records as buyers understand the prospects of such equipment and the current profitability of mining on top Scrypt hardware."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L9","src":"/images/articles/best-antminer-2026/antminer-l9.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"16 GH/s"},{"label":"Power consumption","value":"3,360 W"},{"label":"Energy efficiency","value":"210 W per GH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"22"},{"label":"Noise level","value":"76 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost"],"pros":["One of the most powerful ASICs for Scrypt","Merged mining of 6 assets at once (LTC + DOGE + BELLS + PEP + LKY + JKC)","Relevance across several cycles","Working with the most popular altcoin algorithm"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Antminer T21","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Working with the first blockchain remains the most popular mining format: this segment has its bestsellers that are optimal on price-to-performance. In 2024вЂ“2025 such a model is the Antminer T21, which can mine BTC. Working within SHA-256 is the most stable and predictable mining format, which attracts hundreds of thousands of investors worldwide.","text":"Working with the first blockchain remains the most popular mining format: this segment has its bestsellers that are optimal on price-to-performance. In 2024вЂ“2025 such a model is the Antminer T21, which can mine BTC. Working within SHA-256 is the most stable and predictable mining format, which attracts hundreds of thousands of investors worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The key feature of the Antminer T21 is a relatively low cost per terahash of power versus competitors. A possible reason is three-phase connection, which is not feasible at every site. But if that problem can be solved, the investor gets an excellent opportunity to build a powerful, productive farm on classic air cooling. The Antminer T21 is unpretentious, stable, and familiar to almost all service centers, which only increases this modelвЂ™s popularity.","text":"The key feature of the Antminer T21 is a relatively low cost per terahash of power versus competitors. A possible reason is three-phase connection, which is not feasible at every site. But if that problem can be solved, the investor gets an excellent opportunity to build a powerful, productive farm on classic air cooling. The Antminer T21 is unpretentious, stable, and familiar to almost all service centers, which only increases this modelвЂ™s popularity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer T21","src":"/images/articles/best-antminer-2026/antminer-t21.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"190 TH/s"},{"label":"Power consumption","value":"3,500 W"},{"label":"Energy efficiency","value":"18.5 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Three-phase connection","Rising difficulty reduces the modelвЂ™s profitability"],"pros":["SHA-256 bestseller in 2024вЂ“2025","A reliable and proven mining format","One of the most attractive prices per terahash of power","Reliability and unpretentiousness"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"7th place: Antminer S21 XP","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The most modern Antminer ASIC lineup within the SHA-256 algorithm is the 21st miner series. There is equipment with both water and air cooling вЂ” the total number of models has exceeded 10 units. If you prefer the classic temperature approach and are not ready to experiment with water, the Antminer S21 XP is a solid choice. Unlike the T21, the S21 XP has more impressive power вЂ” 270 TH/s вЂ” making it one of the most productive air-cooled BTC machines today.","text":"The most modern Antminer ASIC lineup within the SHA-256 algorithm is the 21st miner series. There is equipment with both water and air cooling вЂ” the total number of models has exceeded 10 units. If you prefer the classic temperature approach and are not ready to experiment with water, the Antminer S21 XP is a solid choice. Unlike the T21, the S21 XP has more impressive power вЂ” 270 TH/s вЂ” making it one of the most productive air-cooled BTC machines today."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer S21 XP energy efficiency reaches impressive values вЂ” 13.5 W per TH, which seemed impossible only a few years ago. There is a high probability that in the near future it will be hard to invent something more powerful while keeping traditional power consumption: new records in efficiency and performance will be reached only within water cooling. Therefore the Antminer S21 XP at 270 TH/s can be considered unique.","text":"Antminer S21 XP energy efficiency reaches impressive values вЂ” 13.5 W per TH, which seemed impossible only a few years ago. There is a high probability that in the near future it will be hard to invent something more powerful while keeping traditional power consumption: new records in efficiency and performance will be reached only within water cooling. Therefore the Antminer S21 XP at 270 TH/s can be considered unique."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21 XP","src":"/images/articles/best-antminer-2026/antminer-s21-xp.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"270 TH/s"},{"label":"Power consumption","value":"3,645 W"},{"label":"Energy efficiency","value":"13.5 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"36"},{"label":"Noise level","value":"75 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost","Risk of serious heating, which creates serious requirements for the premises and operating conditions"],"pros":["One of the most powerful air-cooled ASICs for SHA-256","Unmatched energy-efficiency figure","Interaction within the most reliable algorithm","Staying relevant for several years ahead"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"6th place: Antminer L11 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain continues developing Scrypt equipment, announcing the Antminer L11 Pro in 2025. The ASIC is aimed at mining Litecoin, Dogecoin, and merged mining of additional tokens, making it a profitable option for those seeking a stable income source in the altcoin segment.","text":"Bitmain continues developing Scrypt equipment, announcing the Antminer L11 Pro in 2025. The ASIC is aimed at mining Litecoin, Dogecoin, and merged mining of additional tokens, making it a profitable option for those seeking a stable income source in the altcoin segment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device has an impressive 21 GH/s hashrate, which noticeably exceeds previous models in the lineup. The design is familiar to most miners: air cooling, standard dimensions, and clear setup. The Antminer L11 Pro is built for a long relevance window вЂ” high power and merged mining help keep profitability even as network difficulty grows.","text":"The device has an impressive 21 GH/s hashrate, which noticeably exceeds previous models in the lineup. The design is familiar to most miners: air cooling, standard dimensions, and clear setup. The Antminer L11 Pro is built for a long relevance window вЂ” high power and merged mining help keep profitability even as network difficulty grows."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Pro","src":"/images/articles/best-antminer-2026/antminer-l11-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"21 GH/s"},{"label":"Power consumption","value":"3,680 W"},{"label":"Energy efficiency","value":"0.183 W per GH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"22"},{"label":"Noise level","value":"76 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 38
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost","Power-grid and cooling requirements"],"pros":["High performance","Merged mining","Energy efficiency"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"5th place: Antminer S23","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer series continues to evolve, and the S23 became one of BitmainвЂ™s key 2025 releases. The ASIC is aimed at mining Bitcoin and other SHA-256 coins (more than 20 assets in total) and is built as a universal solution for those who want to maximize performance without switching to water cooling.","text":"The Antminer series continues to evolve, and the S23 became one of BitmainвЂ™s key 2025 releases. The ASIC is aimed at mining Bitcoin and other SHA-256 coins (more than 20 assets in total) and is built as a universal solution for those who want to maximize performance without switching to water cooling."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 features modern chip architecture and shows an excellent 318 TH/s hashrate, putting it alongside top devices of the current generation. Energy efficiency is 11 J/TH вЂ” one of the best figures among air-cooled models. Consumption of 3,498 W makes the ASIC optimal for sites where equipment payback matters under stable energy costs.","text":"The Antminer S23 features modern chip architecture and shows an excellent 318 TH/s hashrate, putting it alongside top devices of the current generation. Energy efficiency is 11 J/TH вЂ” one of the best figures among air-cooled models. Consumption of 3,498 W makes the ASIC optimal for sites where equipment payback matters under stable energy costs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model is aimed at long-term relevance: high power lets it confidently withstand rising network difficulty, while the classic design eases maintenance and integration into an existing farm.","text":"The model is aimed at long-term relevance: high power lets it confidently withstand rising network difficulty, while the classic design eases maintenance and integration into an existing farm."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23","src":"/images/articles/best-antminer-2026/antminer-s23.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 44
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"318 TH/s"},{"label":"Power consumption","value":"3,498 W"},{"label":"Energy efficiency","value":"11 J/TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"20+"},{"label":"Noise level","value":"76 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High load on the power grid","Need to ensure stable cooling in the premises"],"pros":["High performance","Energy efficiency","Air cooling without complicated infrastructure"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"4th place: Antminer S23 Imm","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 Immersion version is a specialized Bitmain lineup modification created specifically for industrial farms and data centers. The device works in an immersion environment, meaning no fans, reduced noise, and a significantly longer equipment lifespan by minimizing wear.","text":"The Antminer S23 Immersion version is a specialized Bitmain lineup modification created specifically for industrial farms and data centers. The device works in an immersion environment, meaning no fans, reduced noise, and a significantly longer equipment lifespan by minimizing wear."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ASIC shows 368 TH/s hashrate, exceeding most air-cooled models in the same class. Energy efficiency stays at 11 J/TH, making the device an optimal solution for large projects where stability, predictable payback, and maximum profitability matter under rising network difficulty.","text":"The ASIC shows 368 TH/s hashrate, exceeding most air-cooled models in the same class. Energy efficiency stays at 11 J/TH, making the device an optimal solution for large projects where stability, predictable payback, and maximum profitability matter under rising network difficulty."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Immersion cooling ensures stable temperature even under prolonged loads, allowing mining capacity to scale without overheating risk. The Antminer S23 Imm is designed for SHA-256, including Bitcoin, Bitcoin Cash, and more than 20 compatible cryptocurrencies.","text":"Immersion cooling ensures stable temperature even under prolonged loads, allowing mining capacity to scale without overheating risk. The Antminer S23 Imm is designed for SHA-256, including Bitcoin, Bitcoin Cash, and more than 20 compatible cryptocurrencies."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 50
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Immersion","src":"/images/articles/best-antminer-2026/antminer-s23-imm.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"368 TH/s"},{"label":"Power consumption","value":"4,048 W"},{"label":"Energy efficiency","value":"11 J/TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"20+"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires liquid infrastructure and special equipment for placement"],"pros":["High power","Fanless operation вЂ” low noise level","Stability under 24/7 loads","Industrial scalability"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"3rd place: Antminer S21e XP Hyd 3U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"This model is not destined to become a bestseller or gain worldwide popularity. But that does not cancel another simple fact: the Antminer S21e XP Hyd 3U is the most powerful ASIC for Bitcoin mining today вЂ” its power is 860 TH/s, considered unreachable for competitors. Consumption is no less impressive вЂ” 11,180 W, which seriously limits where such equipment can be used.","text":"This model is not destined to become a bestseller or gain worldwide popularity. But that does not cancel another simple fact: the Antminer S21e XP Hyd 3U is the most powerful ASIC for Bitcoin mining today вЂ” its power is 860 TH/s, considered unreachable for competitors. Consumption is no less impressive вЂ” 11,180 W, which seriously limits where such equipment can be used."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Another feature of the model is water cooling: far from all sites can host such hardware, which puts this ASICвЂ™s prospects in question. But energy-efficiency figures are also record-setting вЂ” 13 W per TH. That is what the most powerful SHA-256 miner looks like: within this concept the market for new BTC equipment will form with even more impressive performance values.","text":"Another feature of the model is water cooling: far from all sites can host such hardware, which puts this ASICвЂ™s prospects in question. But energy-efficiency figures are also record-setting вЂ” 13 W per TH. That is what the most powerful SHA-256 miner looks like: within this concept the market for new BTC equipment will form with even more impressive performance values."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 56
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S21e XP Hyd 3U","src":"/images/articles/best-antminer-2026/antminer-s21e-xp-hyd-3u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"860 TH/s"},{"label":"Power consumption","value":"11,180 W"},{"label":"Energy efficiency","value":"13 W per TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"22"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High cost","Impressive power consumption","Water-based cooling principle"],"pros":["The most powerful ASIC for mining BTC","Leading mining algorithm","Low noise level","Impeccable energy efficiency"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"2nd place: Antminer L11 Hydro 6U","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer L11 Hydro 6U became one of BitmainвЂ™s most technological solutions in the Scrypt mining segment. The device is aimed at mining Litecoin, Dogecoin, and merged mining of several more assets, offering a high 33 GH/s hashrate that puts it in the premium category for large sites.","text":"The Antminer L11 Hydro 6U became one of BitmainвЂ™s most technological solutions in the Scrypt mining segment. The device is aimed at mining Litecoin, Dogecoin, and merged mining of several more assets, offering a high 33 GH/s hashrate that puts it in the premium category for large sites."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The modelвЂ™s main feature is water cooling, which ensures stable operation under prolonged loads and reduces overheating risk. Energy efficiency at 5,676 W consumption helps keep attractive payback as network difficulty grows. Thanks to thoughtful architecture, the L11 Hydro 6U suits 24/7 operation and minimizes downtime, which is especially important in industrial mining.","text":"The modelвЂ™s main feature is water cooling, which ensures stable operation under prolonged loads and reduces overheating risk. Energy efficiency at 5,676 W consumption helps keep attractive payback as network difficulty grows. Thanks to thoughtful architecture, the L11 Hydro 6U suits 24/7 operation and minimizes downtime, which is especially important in industrial mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 62
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device runs quietly (about 50 dB), which by Scrypt equipment standards is a rare advantage. That makes the model convenient for data centers and large farms where low noise and strict temperature control matter.","text":"The device runs quietly (about 50 dB), which by Scrypt equipment standards is a rare advantage. That makes the model convenient for data centers and large farms where low noise and strict temperature control matter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro 6U","src":"/images/articles/best-antminer-2026/antminer-l11-hydro-6u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"33 GH/s"},{"label":"Power consumption","value":"5,676 W"},{"label":"Energy efficiency","value":"0.172 W per GH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Coins available for mining","value":"22"},{"label":"Noise level","value":"50 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires a hydro system and elevated infrastructure resources","High cost"],"pros":["High power","Water cooling вЂ” low noise level","The most powerful Scrypt ASIC"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 66
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
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer S23 Hydro 3U became a revolution in mining: it is the first Bitmain ASIC to cross the 1 petahash power threshold. The modelвЂ™s hashrate reaches 1,160 TH/s, making the device the most productive SHA-256 miner today. That power level lets data-center operators and large investors significantly increase compute density with minimal space requirements.","text":"The Antminer S23 Hydro 3U became a revolution in mining: it is the first Bitmain ASIC to cross the 1 petahash power threshold. The modelвЂ™s hashrate reaches 1,160 TH/s, making the device the most productive SHA-256 miner today. That power level lets data-center operators and large investors significantly increase compute density with minimal space requirements."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 68
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The device uses water cooling, which ensures stable temperature under high load, low noise, and extends equipment life. Energy efficiency is 9.5 J/TH, one of the best figures in the industry, and guarantees attractive profitability even accounting for rising network difficulty and crypto market changes.","text":"The device uses water cooling, which ensures stable temperature under high load, low noise, and extends equipment life. Energy efficiency is 9.5 J/TH, one of the best figures in the industry, and guarantees attractive profitability even accounting for rising network difficulty and crypto market changes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The compact 3U form factor lets you integrate the device into standard server racks, turning it into a powerful tool for scaling industrial farms. The Antminer S23 Hydro 3U is aimed exclusively at large-scale mining вЂ” its potential is realized in professional infrastructure where a full hydro-cooling system can be installed.","text":"The compact 3U form factor lets you integrate the device into standard server racks, turning it into a powerful tool for scaling industrial farms. The Antminer S23 Hydro 3U is aimed exclusively at large-scale mining вЂ” its potential is realized in professional infrastructure where a full hydro-cooling system can be installed."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer S23 Hydro 3U","src":"/images/articles/best-antminer-2026/antminer-s23-hydro-3u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2025"},{"label":"Hashrate","value":"1160 TH/s"},{"label":"Power consumption","value":"11,020 W"},{"label":"Energy efficiency","value":"9,5 J/TH"},{"label":"Algorithm","value":"SHA-256"},{"label":"Coins available for mining","value":"20+"},{"label":"Noise level","value":"40 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High infrastructure and power-consumption cost","Suitable only for industrial sites","High cost"],"pros":["Record performance","Compactness for server racks","Water cooling","Best energy efficiency among SHA-256 ASICs"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 73
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
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 74
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Bitmain tirelessly proves its leadership in mining hardware across several parameters: sales volumes, the number of models in the lineup, and the diversity of coins that can be mined with Antminer. That is what leading positions look like, letting investors choose exactly the equipment that is optimal and highly profitable at the current moment.","text":"Bitmain tirelessly proves its leadership in mining hardware across several parameters: sales volumes, the number of models in the lineup, and the diversity of coins that can be mined with Antminer. That is what leading positions look like, letting investors choose exactly the equipment that is optimal and highly profitable at the current moment."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
-- luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc
INSERT INTO article_translations (article_id, locale, title, excerpt, image_alt, content)
SELECT a.id, 'en',
       $tmj$Best altcoin ASICs 2026: top miners not for BTC$tmj$,
       $tmj$Top 10 altcoin ASICs in 2026: from Iceriver AE3 to Antminer L11 Hydro 6U вЂ” hardware built for non-BTC coins.$tmj$,
       $tmj$Altcoin mining equipment$tmj$,
       ''
FROM articles a
WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 0
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Most often miners split into two types: some prefer mining Bitcoin, seeing it as the worldвЂ™s most reliable and resilient asset; others choose altcoins, whose yields can be much higher. We focus on the second group, analyzing the TOP-10 ASICs not for BTC. We prepared a full review of the best altcoin miners in ascending order of quality, reliability, and fundamentals of the tokens earned.","text":"Most often miners split into two types: some prefer mining Bitcoin, seeing it as the worldвЂ™s most reliable and resilient asset; others choose altcoins, whose yields can be much higher. We focus on the second group, analyzing the TOP-10 ASICs not for BTC. We prepared a full review of the best altcoin miners in ascending order of quality, reliability, and fundamentals of the tokens earned."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 1
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"Altcoin mining вЂ” what do you need to know?","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 2
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Altcoins (from English вЂњalternative coinsвЂќ) are all cryptocurrencies besides Bitcoin. Since BTC appeared in 2009, many other digital assets have launched, each with its own tech solutions, use cases, and operating mechanisms. Ethereum, Solana, and even Trumpcoin are examples of so-called вЂњalts,вЂќ some of which can be mined with ASICs.","text":"Altcoins (from English вЂњalternative coinsвЂќ) are all cryptocurrencies besides Bitcoin. Since BTC appeared in 2009, many other digital assets have launched, each with its own tech solutions, use cases, and operating mechanisms. Ethereum, Solana, and even Trumpcoin are examples of so-called вЂњalts,вЂќ some of which can be mined with ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 3
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Altcoin mining is the process of mining cryptocurrencies alternative to Bitcoin. It includes coins such as Ethereum (before the Proof-of-Stake switch), Litecoin, Monero, Zcash, Kaspa, and many others. Although Bitcoin remains the best-known cryptocurrency, interest in altcoins keeps growing вЂ” largely thanks to mining opportunities and the yields they offer.","text":"Altcoin mining is the process of mining cryptocurrencies alternative to Bitcoin. It includes coins such as Ethereum (before the Proof-of-Stake switch), Litecoin, Monero, Zcash, Kaspa, and many others. Although Bitcoin remains the best-known cryptocurrency, interest in altcoins keeps growing вЂ” largely thanks to mining opportunities and the yields they offer."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 4
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Dogecoin and other altcoins","src":"/images/articles/altcoin-asics-2026/doge-altcoins.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 5
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"For altcoins, mining can use different algorithms (not only SHA-256 like Bitcoin), for example:","text":"For altcoins, mining can use different algorithms (not only SHA-256 like Bitcoin), for example:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 6
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Scrypt вЂ” Litecoin and Dogecoin;","RandomX (Monero);","Equihash (Zcash);","Ethash (on Ethereum before the Proof-of-Stake switch);","kHeavyHash (Kaspa)."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 7
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Depending on the algorithm, you can use ASIC devices or ordinary graphics cards (GPUs).","text":"Depending on the algorithm, you can use ASIC devices or ordinary graphics cards (GPUs)."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 8
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Advantages of altcoin mining:","text":"Advantages of altcoin mining:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 9
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Low entry barrier. Some altcoins can be mined even on a home PC, not to mention dozens of ASIC models for вЂњaltsвЂќ;","Less competition. Versus Bitcoin, many altcoins have far fewer network participants, making mining more accessible;","Growth potential. Some altcoins can spike in price, rewarding those who started mining early;","Algorithm diversity. This lets you pick the optimal coin for available hardware."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 10
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"There are drawbacks too, and you should remember them:","text":"There are drawbacks too, and you should remember them:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 11
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["High volatility. Altcoin prices can change sharply, and not always upward;","Scam risks: some projects prove unreliable or disappear as quickly as they appear;","Low liquidity. Not all altcoins can be easily swapped for fiat or other cryptocurrencies;","Hard to choose. Among thousands of altcoins it is hard to pick promising and truly reliable ones."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 12
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Examples of popular mining altcoins that can be mined with modern ASICs:","text":"Examples of popular mining altcoins that can be mined with modern ASICs:"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 13
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"items":["Litecoin (LTC): runs on Scrypt. Popular among miners thanks to stability and support;","Dogecoin (DOGE): mined together with LTC on Scrypt via merged mining;","Kaspa (KAS): a relatively new promising project with high block processing speed, actively discussed in the community and attracting miners;","Ethereum Classic (ETC) вЂ” the original Ethereum blockchain that stayed unchanged after Ether moved to PoS. Mined on ASICs, including home-use units."],"ordered":false}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 14
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Notably, for altcoin mining so-called home-use miners are relevant.","text":"Notably, for altcoin mining so-called home-use miners are relevant."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 15
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"These are quiet, power-efficient devices that follow a вЂњcivilianвЂќ approach to blockchain work. That is another important advantage, because Bitcoin mining hardware today is mainly relevant in industrial formats.","text":"These are quiet, power-efficient devices that follow a вЂњcivilianвЂќ approach to blockchain work. That is another important advantage, because Bitcoin mining hardware today is mainly relevant in industrial formats."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 16
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Working with altcoin mining hardware","src":"/images/articles/altcoin-asics-2026/intro-engineer.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 17
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"10th place: Iceriver AE3","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 18
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Iceriver AE3 is a powerful next-generation ASIC built specifically for mining ALEO. The device targets stable long-term operation, so the maker emphasized reliability, thoughtful cooling, and energy efficiency. The miner handles 24/7 loads well and supports stable network work вЂ” especially important for zkSNARK, which is demanding on compute resources.","text":"Iceriver AE3 is a powerful next-generation ASIC built specifically for mining ALEO. The device targets stable long-term operation, so the maker emphasized reliability, thoughtful cooling, and energy efficiency. The miner handles 24/7 loads well and supports stable network work вЂ” especially important for zkSNARK, which is demanding on compute resources."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 19
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"With a built-in PSU and a relatively compact chassis, AE3 is convenient in small home spaces and professional farms. It needs no complex setup вЂ” it connects quickly and runs stably. Noise stays typical for this class, so AE3 is usually placed in separate rooms or racks.","text":"With a built-in PSU and a relatively compact chassis, AE3 is convenient in small home spaces and professional farms. It needs no complex setup вЂ” it connects quickly and runs stably. Noise stays typical for this class, so AE3 is usually placed in separate rooms or racks."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 20
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The main advantage is high hashrate that supports stable income on the promising Aleo network. The miner is for users who want power, efficiency, and reliability without extra operational complexity.","text":"The main advantage is high hashrate that supports stable income on the promising Aleo network. The miner is for users who want power, efficiency, and reliability without extra operational complexity."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 21
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Iceriver AE3","src":"/images/articles/altcoin-asics-2026/iceriver-ae3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 22
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"ICERIVER"},{"label":"Model","value":"Iceriver AE3"},{"label":"Algorithm","value":"zkSNARK"},{"label":"Hashrate","value":"2000 Mh/s"},{"label":"Power consumption","value":"3400 W"},{"label":"Coin","value":"ALEO"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"370 Г— 195 Г— 290 mm"},{"label":"Weight","value":"15 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 23
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Noise above comfort level for placement next to living areas","Narrow specialization вЂ” the device is only suitable for mining ALEO"],"pros":["High hashrate suitable for long-term ALEO mining","Simple installation and fast startup","Suitable for home conditions (with a separate room or sound box) and for farms","Reliable operation under 24/7 loads","Modern 2025 model with up-to-date architecture"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 24
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"9th place: Jasminer X44-P","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 25
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Jasminer X44-P is an updated Ethash/Etchash miner family model built for stable, predictable ETC mining. The device bets on energy efficiency and durability: proprietary 3D chips give Jasminer high throughput at relatively low power draw.","text":"Jasminer X44-P is an updated Ethash/Etchash miner family model built for stable, predictable ETC mining. The device bets on energy efficiency and durability: proprietary 3D chips give Jasminer high throughput at relatively low power draw."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 26
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The miner suits professional farms and anyone seeking reliable gear with minimal payback risk. X44-P runs stably even under 24/7 load without complex setup вЂ” connect the unit, set the pool, and start mining.","text":"The miner suits professional farms and anyone seeking reliable gear with minimal payback risk. X44-P runs stably even under 24/7 load without complex setup вЂ” connect the unit, set the pool, and start mining."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 27
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Due to traditional noise levels, place it best in a separate room, server rack, or garage farm. Thanks to efficiency and solid architecture, X44-P can earn over the long term even as network difficulty changes.","text":"Due to traditional noise levels, place it best in a separate room, server rack, or garage farm. Thanks to efficiency and solid architecture, X44-P can earn over the long term even as network difficulty changes."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 28
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Jasminer X44-P","src":"/images/articles/altcoin-asics-2026/jasminer-x44-p.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 29
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Jasminer"},{"label":"Model","value":"Jasminer X44-P"},{"label":"Algorithm","value":"Etchash"},{"label":"Hashrate","value":"2340 MH/s (2.34 GH/s)"},{"label":"Power consumption","value":"2550 W"},{"label":"Coin","value":"ETC"},{"label":"Noise level","value":"70 dB"},{"label":"Dimensions","value":"212 Г— 300 Г— 374 mm"},{"label":"Weight","value":"14.5 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 30
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Fairly high noise вЂ” undesirable next to living rooms","Works only with Etchash вЂ” no versatility","Price higher than less powerful previous-generation models"],"pros":["High energy efficiency thanks to JasminerвЂ™s proprietary architecture","Stable, predictable yield on Etchash","Easy startup and maintenance","Modern model with up-to-date specs","Suitable for 24/7 work without performance loss"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 31
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"text":"8th place: Antminer Z15 Pro","level":2}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 32
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer Z15 Pro is an updated version of one of the most popular Equihash ASIC miners. It is designed for Zcash and other coins on this algorithm, combining high compute power with solid energy efficiency.","text":"Antminer Z15 Pro is an updated version of one of the most popular Equihash ASIC miners. It is designed for Zcash and other coins on this algorithm, combining high compute power with solid energy efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 33
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The model suits those who want to mine ZEC steadily without complex setup: connection and launch take minimal time, and the miner shows stable hashrate even under 24/7 operation.","text":"The model suits those who want to mine ZEC steadily without complex setup: connection and launch take minimal time, and the miner shows stable hashrate even under 24/7 operation."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 34
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite a compact chassis and low weight, Z15 Pro delivers impressive hashrate at relatively moderate power draw. Thanks to BitmainвЂ™s proven architecture, the model stays in demand among beginners and experienced miners seeking reliable Equihash gear.","text":"Despite a compact chassis and low weight, Z15 Pro delivers impressive hashrate at relatively moderate power draw. Thanks to BitmainвЂ™s proven architecture, the model stays in demand among beginners and experienced miners seeking reliable Equihash gear."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 35
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer Z15 Pro","src":"/images/articles/altcoin-asics-2026/antminer-z15-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 36
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer Z15 Pro"},{"label":"Algorithm","value":"Equihash"},{"label":"Hashrate","value":"860 Kh/s"},{"label":"Power consumption","value":"2600 W"},{"label":"Coin","value":"ZEC"},{"label":"Noise level","value":"70 dB"},{"label":"Dimensions","value":"132.5 Г— 245 Г— 290 mm"},{"label":"Weight","value":"5.9 kg"},{"label":"Release year","value":"2023"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 37
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Medium noise вЂ” not suitable for living rooms","Energy efficiency lower than more modern ASIC lineups"],"pros":["High efficiency on the Equihash algorithm","Compact size and low weight","Easy installation and startup","Suitable for stable 24/7 operation","One of the most powerful, reliable Zcash miners in its class"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 38
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 39
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The undisputed leader of our ranking can rightly be considered BitmainвЂ™s Antminer L9. First, it is a miner on the popular Scrypt algorithm, which gained higher yield thanks to Bellscoin. Second, Bitmain affiliation guarantees high quality and reliability: the market leader is an excellent example of solid customer work.","text":"The undisputed leader of our ranking can rightly be considered BitmainвЂ™s Antminer L9. First, it is a miner on the popular Scrypt algorithm, which gained higher yield thanks to Bellscoin. Second, Bitmain affiliation guarantees high quality and reliability: the market leader is an excellent example of solid customer work."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 40
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Despite a relatively high price, the Antminer L9 at 16 GH/s has already become a bestseller. It is a quality solution on a proven algorithm that will stay relevant for several more years. Maximum hashrate provides headroom for several cycles, which attracts buyers worldwide.","text":"Despite a relatively high price, the Antminer L9 at 16 GH/s has already become a bestseller. It is a quality solution on a proven algorithm that will stay relevant for several more years. Maximum hashrate provides headroom for several cycles, which attracts buyers worldwide."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 41
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L9","src":"/images/articles/altcoin-asics-2026/antminer-l9.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 42
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain"},{"label":"Release year","value":"2024"},{"label":"Hashrate","value":"16 GH/s"},{"label":"Power consumption","value":"3,360 W"},{"label":"Energy efficiency","value":"210 W per GH"},{"label":"Algorithm","value":"Scrypt"},{"label":"Number of coins available for mining","value":"22"},{"label":"Noise level","value":"76 dB"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 43
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High price"],"pros":["One of the most reliable algorithms among altcoins","Merged mining LTC+DOGE+BEL","Many alternative mining options","Proven manufacturer"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 44
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 45
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 is the top model in BitmainвЂ™s Scrypt miner family, built for maximum hashrate mining Litecoin, Dogecoin, and six more coins on this algorithm. At 20 GH/s it is a logical lineup evolution, roughly doubling power versus prior generations while keeping stability and high energy efficiency.","text":"Antminer L11 is the top model in BitmainвЂ™s Scrypt miner family, built for maximum hashrate mining Litecoin, Dogecoin, and six more coins on this algorithm. At 20 GH/s it is a logical lineup evolution, roughly doubling power versus prior generations while keeping stability and high energy efficiency."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 46
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The miner has balanced power draw, thoughtful design, and a reliable cooling system, making it suitable for private farms and industrial use. Antminer L11 is especially popular among miners who want to scale Scrypt coin mining and maximize returns as network difficulty grows.","text":"The miner has balanced power draw, thoughtful design, and a reliable cooling system, making it suitable for private farms and industrial use. Antminer L11 is especially popular among miners who want to scale Scrypt coin mining and maximize returns as network difficulty grows."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 47
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11","src":"/images/articles/altcoin-asics-2026/antminer-l11.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 48
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer L11"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"20000 Mh/s"},{"label":"Power consumption","value":"3680 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"76 dB"},{"label":"Dimensions","value":"400 Г— 195 Г— 290 mm"},{"label":"Weight","value":"14.2 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 49
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["High noise вЂ” needs a separate room, sound box, or mining hotel","Significant power draw versus mid-class models","High price versus previous generations"],"pros":["Increased power вЂ” significantly higher than prior counterparts","Supports mining eight Scrypt coins at once","High energy efficiency for its hashrate","Reliable, stable operation under 24/7 load","Optimal for scalable farms and large pools"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 50
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 51
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"VolcMiner D3 is a modern industrial Scrypt ASIC built for stable high-performance mining of Litecoin, Dogecoin, and other compatible coins. It delivers 20 GH/s at 3580 W with excellent energy efficiency вЂ” 0.179 J/Mh. That balance makes D3 attractive for those seeking maximum returns on Scrypt coins.","text":"VolcMiner D3 is a modern industrial Scrypt ASIC built for stable high-performance mining of Litecoin, Dogecoin, and other compatible coins. It delivers 20 GH/s at 3580 W with excellent energy efficiency вЂ” 0.179 J/Mh. That balance makes D3 attractive for those seeking maximum returns on Scrypt coins."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 52
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The miner uses a sturdy metal chassis with two fans rated for 24/7 loads. Support for 5вЂ“45 В°C and resistance to higher humidity allow safe use of VolcMiner D3 in mining hotels and professional farms. The model targets large setups where reliability, hashrate, and stability matter.","text":"The miner uses a sturdy metal chassis with two fans rated for 24/7 loads. Support for 5вЂ“45 В°C and resistance to higher humidity allow safe use of VolcMiner D3 in mining hotels and professional farms. The model targets large setups where reliability, hashrate, and stability matter."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 53
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"VolcMiner D3","src":"/images/articles/altcoin-asics-2026/volcminer-d3.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 54
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"VolcMiner"},{"label":"Model","value":"VolcMiner D3"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"20 GH/s"},{"label":"Power consumption","value":"3580 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"384 Г— 217 Г— 316 mm"},{"label":"Weight","value":"22 kg"},{"label":"Release year","value":"2026"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 55
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Designed for industrial spaces: limited suitability for home mining due to noise and heat","The manufacturer does not yet have the reliability history of market leaders"],"pros":["High hashrate at moderate power draw","Sturdy industrial design built for 24/7 operation","Energy efficiency higher than many Scrypt competitors","Stable operation across a wide temperature and humidity range","Suitable for professional mining farms and large placements"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 56
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 57
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"ElphaPex DG2 is a next-generation Scrypt model built for Litecoin, Dogecoin, and other compatible coins. It targets those seeking maximum yield and stability as network difficulty grows. At 20 GH/s and 3800 W, DG2 delivers 0.19вЂ“0.22 J/MH вЂ” a figure that competes confidently with market leaders.","text":"ElphaPex DG2 is a next-generation Scrypt model built for Litecoin, Dogecoin, and other compatible coins. It targets those seeking maximum yield and stability as network difficulty grows. At 20 GH/s and 3800 W, DG2 delivers 0.19вЂ“0.22 J/MH вЂ” a figure that competes confidently with market leaders."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 58
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The ASIC is oriented to professional use: reliable construction, thoughtful cooling, and ability to run under constant loads make it suitable for large mining farms. Although the Elphapex brand is young, the DG series is quickly gaining popularity through a mix of hashrate, reliability, and optimal price versus peers.","text":"The ASIC is oriented to professional use: reliable construction, thoughtful cooling, and ability to run under constant loads make it suitable for large mining farms. Although the Elphapex brand is young, the DG series is quickly gaining popularity through a mix of hashrate, reliability, and optimal price versus peers."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 59
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"ElphaPex DG2","src":"/images/articles/altcoin-asics-2026/elphapex-dg2.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 60
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Elphapex"},{"label":"Model","value":"ElphaPex DG2"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"20000 Mh/s (20 GH/s)"},{"label":"Power consumption","value":"3800 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"75 dB"},{"label":"Dimensions","value":"432 Г— 196 Г— 287 mm"},{"label":"Weight","value":"18.3 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 61
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Young manufacturer вЂ” long-term reliability still needs to be proven","High noise unsuitable for home mining","Needs a good electrical connection and quality cooling"],"pros":["High hashrate вЂ” 20 GH/s at optimal power draw","Competitive energy efficiency","Sturdy construction and reliable cooling system","Suitable for 24/7 industrial operation","A promising brand focused on innovation and quality"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 62
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 63
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Pro stands out with improved stability and higher yield thanks to 21 GH/s. The device is built for 24/7 work and fits small setups and industrial farms alike.","text":"Antminer L11 Pro stands out with improved stability and higher yield thanks to 21 GH/s. The device is built for 24/7 work and fits small setups and industrial farms alike."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 64
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"L11 Pro starts quickly, needs no complex setup, and suits those who want to raise total hashrate without adding more units. An updated cooling system keeps stable operation even under high load. It fits users seeking more predictable, efficient mining and those upgrading old farms for more yield per kilowatt.","text":"L11 Pro starts quickly, needs no complex setup, and suits those who want to raise total hashrate without adding more units. An updated cooling system keeps stable operation even under high load. It fits users seeking more predictable, efficient mining and those upgrading old farms for more yield per kilowatt."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 65
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Pro","src":"/images/articles/altcoin-asics-2026/antminer-l11-pro.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 66
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer L11 Pro"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"21000 Mh/s"},{"label":"Power consumption","value":"3680 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"76 dB"},{"label":"Dimensions","value":"400 Г— 195 Г— 290 mm"},{"label":"Weight","value":"14.2 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 67
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Strong noise вЂ” recommended only for specialized rooms","Requires quality cooling","Consumes quite a lot of energy for home placement"],"pros":["High yield thanks to 21 GH/s hashrate","Simple installation and fast startup","Suitable for farmers who want more power without expanding floor space","Stable operation under constant load","Good ratio of hashrate to power consumption"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 68
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 69
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"The Antminer U2L9H ASIC is for users who want to maximize hashrate without significantly expanding the farm. Water cooling ensures stable operation even under prolonged high load, cutting overheating risk and extending hardware life.","text":"The Antminer U2L9H ASIC is for users who want to maximize hashrate without significantly expanding the farm. Water cooling ensures stable operation even under prolonged high load, cutting overheating risk and extending hardware life."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 70
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At 27 GH/s and optimal energy efficiency, U2L9H helps lower electricity costs and raise mining profitability. The miner suits industrial farms and experienced enthusiasts seeking a reliable long-term mining solution.","text":"At 27 GH/s and optimal energy efficiency, U2L9H helps lower electricity costs and raise mining profitability. The miner suits industrial farms and experienced enthusiasts seeking a reliable long-term mining solution."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 71
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer U2L9H","src":"/images/articles/altcoin-asics-2026/antminer-u2l9h.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 72
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer U2L9H"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"27000 Mh/s"},{"label":"Power consumption","value":"5670 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"445 Г— 188 Г— 670 mm"},{"label":"Weight","value":"12.8 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 73
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Requires connection to a water cooling system","High power draw вЂ” optimal for industrial conditions","Size and weight make home placement difficult"],"pros":["High 27 GH/s hashrate for maximum yield","Water cooling ensures stable operation under load","Energy efficiency lowers electricity costs","Suitable for long-term use on industrial farms","Reliable, stable hardware operation"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 74
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 75
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Antminer L11 Hydro 6U is a top Scrypt miner for Litecoin, Dogecoin, and six more compatible cryptocurrencies. The model targets large industrial farms and users seeking maximum hashrate at optimal power draw. Hydro cooling ensures stable operation even under high loads, reducing overheating risk and minimizing downtime.","text":"Antminer L11 Hydro 6U is a top Scrypt miner for Litecoin, Dogecoin, and six more compatible cryptocurrencies. The model targets large industrial farms and users seeking maximum hashrate at optimal power draw. Hydro cooling ensures stable operation even under high loads, reducing overheating risk and minimizing downtime."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 76
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"At 33 GH/s and industrial-grade energy efficiency, Antminer L11 Hydro 6U delivers maximum income at reasonable electricity costs. Reliable construction and thoughtful architecture make it an ideal solution for long-term use and scaling mining infrastructure.","text":"At 33 GH/s and industrial-grade energy efficiency, Antminer L11 Hydro 6U delivers maximum income at reasonable electricity costs. Reliable construction and thoughtful architecture make it an ideal solution for long-term use and scaling mining infrastructure."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 77
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"alt":"Antminer L11 Hydro 6U","src":"/images/articles/altcoin-asics-2026/antminer-l11-hyd-6u.png"}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 78
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"rows":[{"label":"Manufacturer","value":"Bitmain Antminer"},{"label":"Model","value":"Antminer L11 Hydro 6U"},{"label":"Algorithm","value":"Scrypt"},{"label":"Hashrate","value":"33000 Mh/s"},{"label":"Power consumption","value":"5676 W"},{"label":"Coins","value":"LTC, DOGE"},{"label":"Noise level","value":"50 dB"},{"label":"Dimensions","value":"600 Г— 450 Г— 350 mm"},{"label":"Weight","value":"25 kg"},{"label":"Release year","value":"2025"}]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 79
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"cons":["Not suitable for home use due to size and water cooling","High price вЂ” oriented to professional farms","Requires organizing a hydro cooling system"],"pros":["Maximum 33 GH/s hashrate for high yield","Hydro cooling ensures stable operation and long service life","Optimal power consumption for industrial conditions","Reliable, durable construction","Suitable for scalable mining farms with minimal downtime"]}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
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
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 81
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();

INSERT INTO article_block_translations (block_id, locale, payload)
SELECT ordered.id, 'en', $tmj${"html":"Altcoins are standalone crypto projects with different technologies and goals. Altcoin mining remains a relevant way to earn in the crypto industry, especially for those using modern ASICs.","text":"Altcoins are standalone crypto projects with different technologies and goals. Altcoin mining remains a relevant way to earn in the crypto industry, especially for those using modern ASICs."}$tmj$::jsonb
FROM (
  SELECT b.id,
         row_number() OVER (ORDER BY b.position, b.id) - 1 AS idx
  FROM article_blocks b
  JOIN articles a ON a.id = b.article_id
  WHERE a.slug = $tmj$luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc$tmj$
) ordered
WHERE ordered.idx = 82
ON CONFLICT (block_id, locale) DO UPDATE SET
  payload = EXCLUDED.payload,
  updated_at = NOW();
