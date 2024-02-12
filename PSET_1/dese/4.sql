SELECT city, count(*) as c
FROM schools
where type = 'Public School'
GROUP BY city
ORDER BY c DESC, city
LIMIT 10;
