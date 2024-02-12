select d.name
from districts as d
join expenditures as e
on d.id = e.district_id
order by e.pupils
limit 1;
