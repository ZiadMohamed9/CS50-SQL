CREATE VIEW "frequently_reviewed" AS
SELECT l."id", l."property_type", l."host_name", COUNT(r."id") AS 'reviews'
FROM "listings" AS 'l'
JOIN "reviews" AS 'r'
ON l."id" = r."listing_id"
GROUP BY r."listing_id"
ORDER BY "reviews" DESC, "property_type", "host_name"
LIMIT 100;
