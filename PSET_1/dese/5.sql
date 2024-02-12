SELECT city, count(*) AS c
FROM schools
where type = 'Public School'
GROUP BY city
HAVING c <= 3
ORDER BY c DESC, city;
