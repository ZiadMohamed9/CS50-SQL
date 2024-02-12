select name, sum(H) as 'total hits'
from teams as t
join performances as p
on t.id = p.team_id
where p.year = 2001
group by t.name
order by "total hits" desc
limit 5;
