select pl.first_name, pl.last_name, s.salary, pf.HR, pf.year
from players as pl
join performances as pf
on pl.id = pf.player_id
join salaries as s
on pl.id = s.player_id
and pf.year = s.year
order by s.player_id, s.year desc, HR desc, salary desc;
