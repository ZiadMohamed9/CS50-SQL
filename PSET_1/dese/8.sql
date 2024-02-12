SELECT d.name, e.pupils
FROM districts as d
JOIN expenditures as e ON d.id = e.district_id
order by e.pupils desc;
