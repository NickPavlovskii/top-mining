SET client_encoding = 'UTF8';

DELETE FROM organization_reviews
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'geometria');

DELETE FROM catalog_organizations
WHERE slug = 'geometria';
