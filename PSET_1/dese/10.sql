select d.name, e.per_pupil_expenditure
from districts as d
join expenditures as e
on d.id = e.district_id
where d.type = 'Public School District'
order by e.per_pupil_expenditure desc
limit 10;
