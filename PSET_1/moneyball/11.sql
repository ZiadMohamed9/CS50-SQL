select first_name, last_name, (salary/H) as 'dollars per hit'
from players as pl
join salaries as s
on pl.id = s.player_id
join performances as pf
on pl.id = pf.player_id
and s.year = pf.year
where s.year = 2001
and H != 0
order by "dollars per hit", first_name, last_name
limit 10;
