CREATE TABLE IF NOT EXISTS leads (
    id          BIGSERIAL PRIMARY KEY,
    source      TEXT NOT NULL,
    name        TEXT NOT NULL DEFAULT '',
    contact     TEXT NOT NULL DEFAULT '',
    message     TEXT NOT NULL DEFAULT '',
    payload     JSONB NOT NULL DEFAULT '{}'::jsonb,
    page_path   TEXT NOT NULL DEFAULT '',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_leads_created_at ON leads (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_leads_source ON leads (source);
