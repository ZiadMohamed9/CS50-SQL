select first_name, last_name
from players
where id in(
    select player_id
    from salaries
    where salary = (
    select max(salary)
    from salaries
    )
);
