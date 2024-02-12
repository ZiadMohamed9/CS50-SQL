select first_name, last_name, salary
from players as p
join salaries as s
on p.id = s.player_id
where year = 2001
order by salary, first_name, last_name, p.id
limit 50;
