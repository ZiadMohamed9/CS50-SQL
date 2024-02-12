select t.name, round(avg(s.salary), 2) as 'average salary'
from teams as t
join salaries as s
on t.id = s.team_id
where s.year = 2001
group by t.name
order by "average salary"
limit 5;
