SET client_encoding = 'UTF8';

ALTER TABLE rating_categories
    ADD COLUMN IF NOT EXISTS home_columns SMALLINT
        CHECK (home_columns IS NULL OR home_columns IN (1, 2));

ALTER TABLE rating_items
    ADD COLUMN IF NOT EXISTS show_on_home BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS home_sort_order INT,
    ADD COLUMN IF NOT EXISTS home_display_number TEXT;

CREATE INDEX IF NOT EXISTS rating_items_home_idx
    ON rating_items (category_id, home_sort_order)
    WHERE show_on_home = TRUE;
