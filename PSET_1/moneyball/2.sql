select year, salary
from salaries
where player_id = (
    select id
    from players
    where first_name = 'Cal'
    and last_name = 'Ripken'
)
order by year desc;
