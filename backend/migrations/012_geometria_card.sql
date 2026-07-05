-- Поля карточки организации в списке каталога + данные Geometria
SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_tags TEXT[] NOT NULL DEFAULT '{}',
    ADD COLUMN IF NOT EXISTS card_features TEXT[] NOT NULL DEFAULT '{}';

UPDATE catalog_organizations
SET
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новое',
        'Объем продаж: ОПТ; Розница от 5 шт.',
        'Наличие: В наличии и под заказ'
    ],
    card_features = ARRAY[
        'Напрямую от производителей',
        'Официальный импорт с НДС',
        'При покупке у нас — 0 ₽ за размещение'
    ]
WHERE slug = 'geometria';

INSERT INTO organization_tags (organization_id, tag_id)
SELECT o.id, t.id
FROM catalog_organizations o
JOIN catalog_tags t ON t.slug IN (
    'with-vat',
    'new-equipment',
    'wholesale',
    'retail',
    'in-stock',
    'on-order',
    'direct-from-manufacturer',
    'official-import'
)
WHERE o.slug = 'geometria'
ON CONFLICT DO NOTHING;
