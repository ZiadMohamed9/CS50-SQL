CREATE VIEW "june_vacancies" AS
SELECT l."id", l."property_type", l."host_name", COUNT(a."id") AS 'days_vacant'
FROM "listings" AS l
JOIN "availabilities" AS a
ON l."id" = a."listing_id"
WHERE a."available" = 'TRUE' AND a."date" Like '2023-06%'
GROUP BY l."id";
