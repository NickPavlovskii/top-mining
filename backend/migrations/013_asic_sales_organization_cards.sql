-- Данные карточек организаций «Продажа ASIC» (top-mining.ru)
SET client_encoding = 'UTF8';

UPDATE catalog_organizations SET slug = 'algoritm' WHERE name = 'Algoritm';
UPDATE catalog_organizations SET slug = 'mining-center' WHERE name = 'Mining center';
UPDATE catalog_organizations SET slug = 'gis-mining' WHERE name = 'GIS Mining';
UPDATE catalog_organizations SET slug = 'ibmm' WHERE name = 'IBMM';

-- ALGORITM
UPDATE catalog_organizations
SET
    founded_year = 2007,
    office_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новые',
        'Объем продаж: Оптом',
        'Наличие: Под заказ'
    ],
    card_features = ARRAY[
        'Доступна поставка без аванса',
        'Рассрочка под залог BTC'
    ],
    updated_at = NOW()
WHERE slug = 'algoritm';

-- MINING CENTER
UPDATE catalog_organizations
SET
    founded_year = 2017,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    card_tags = ARRAY[
        'Счет на оплату: Без НДС',
        'Состояние: Новое',
        'Объем продаж: Розница, Опт',
        'Наличие: Наличие на складе, Поставка'
    ],
    card_features = ARRAY[
        'Оплата в USDT',
        'Рассрочка 50%',
        'Прямые поставки с Китая'
    ],
    updated_at = NOW()
WHERE slug = 'mining-center';

-- R7MINER
UPDATE catalog_organizations
SET
    office_city = 'Москва',
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новое',
        'Объем продаж: Розница, Опт',
        'Наличие: Под заказ'
    ],
    card_features = ARRAY[
        'Прямые поставки',
        'Гарантия по договору',
        'Белый ввоз'
    ],
    updated_at = NOW()
WHERE slug = 'r7miner';

-- TTM MINING
UPDATE catalog_organizations
SET
    founded_year = 2024,
    office_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = FALSE,
    card_tags = ARRAY[
        'Состояние: Новое и БУ',
        'Объем продаж: Розница; ОПТ',
        'Наличие: В наличии и под заказ'
    ],
    card_features = ARRAY[
        'Доставка по России и миру',
        'Bitmain, Whatsminer, IceRiver, Jasminer',
        'ASIC-майнеры в наличии',
        'Гибкие условия оплаты'
    ],
    updated_at = NOW()
WHERE slug = 'ttm-mining';

-- GIS MINING
UPDATE catalog_organizations
SET
    founded_year = 2019,
    rating = 4.8,
    review_count = 146,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'gis-mining';

-- IBMM
UPDATE catalog_organizations
SET
    founded_year = 2017,
    rating = 4.8,
    review_count = 486,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'ibmm';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, v.equipment_type, v.equipment_condition, v.sales_volume, v.availability, v.extras
FROM catalog_organizations o
JOIN (
    VALUES
        ('algoritm', 'ASIC', 'Новые', 'Оптом', 'Под заказ', ARRAY['Доступна поставка без аванса', 'Рассрочка под залог BTC']::TEXT[]),
        ('mining-center', 'ASIC', 'Новое', 'Розница, Опт', 'Наличие на складе, Поставка', ARRAY['Оплата в USDT', 'Рассрочка 50%', 'Прямые поставки с Китая']::TEXT[]),
        ('r7miner', 'ASIC', 'Новое', 'Розница, Опт', 'Под заказ', ARRAY['Прямые поставки', 'Гарантия по договору', 'Белый ввоз']::TEXT[])
) AS v(slug, equipment_type, equipment_condition, sales_volume, availability, extras)
    ON o.slug = v.slug
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

UPDATE organization_equipment_sales es
SET extras = ARRAY[
    'Доставка по России и миру',
    'Bitmain, Whatsminer, IceRiver, Jasminer',
    'ASIC-майнеры в наличии',
    'Гибкие условия оплаты'
]
FROM catalog_organizations o
WHERE es.organization_id = o.id AND o.slug = 'ttm-mining';
