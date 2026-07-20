SET client_encoding = 'UTF8';

CREATE OR REPLACE FUNCTION sync_organization_rating(p_org_id BIGINT)
RETURNS VOID AS $$
BEGIN
    UPDATE catalog_organizations o
    SET
        rating = COALESCE(s.avg_rating, 0),
        review_count = COALESCE(s.cnt, 0)::INT,
        has_public_rating = COALESCE(s.cnt, 0) > 0,
        updated_at = NOW()
    FROM (
        SELECT
            ROUND(AVG(r.rating)::numeric, 1) AS avg_rating,
            COUNT(*) AS cnt
        FROM organization_reviews r
        WHERE r.organization_id = p_org_id
          AND r.status = 'approved'
    ) s
    WHERE o.id = p_org_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION trg_sync_organization_rating()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        PERFORM sync_organization_rating(OLD.organization_id);
        RETURN OLD;
    END IF;

    PERFORM sync_organization_rating(NEW.organization_id);

    IF TG_OP = 'UPDATE' AND OLD.organization_id IS DISTINCT FROM NEW.organization_id THEN
        PERFORM sync_organization_rating(OLD.organization_id);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS organization_reviews_sync_rating ON organization_reviews;

CREATE TRIGGER organization_reviews_sync_rating
AFTER INSERT OR UPDATE OR DELETE ON organization_reviews
FOR EACH ROW EXECUTE FUNCTION trg_sync_organization_rating();


-- Разовое выравнивание всех организаций при установке триггера
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT id FROM catalog_organizations LOOP
        PERFORM sync_organization_rating(r.id);
    END LOOP;
END $$;
