select salary
from salaries
where year = 2001
and player_id = (
    select player_id
    from performances
    where year = 2001
    and HR = (
        select max(HR)
        from performances
        where year = 2001
    )
);
