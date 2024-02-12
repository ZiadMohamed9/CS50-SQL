select name
from teams
where id in(
    select team_id
    from performances
    where player_id = (
        select id
        from players
        where first_name = 'Satchel'
        and last_name = 'Paige'
    )
);
