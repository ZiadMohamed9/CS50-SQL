with least_exp_HbyDollars as(
    select pl.first_name, pl.last_name, pl.id
    from players as pl
    join salaries as s
    on pl.id = s.player_id
    join performances as pf
    on pl.id = pf.player_id
    and s.year = pf.year
    where s.year = 2001
    and H != 0
    order by (s.salary/pf.H), first_name, last_name
    limit 10
),
least_exp_RBIbyDollars as(
    select pl.first_name, pl.last_name, pl.id
    from players as pl
    join salaries as s
    on pl.id = s.player_id
    join performances as pf
    on pl.id = pf.player_id
    and s.year = pf.year
    where s.year = 2001
    and RBI != 0
    order by (s.salary/pf.RBI), first_name, last_name
    limit 10
)
select h.first_name, h.last_name
from least_exp_HbyDollars as h
join least_exp_RBIbyDollars as r
on h.id = r.id
order by h.id, h.last_name;

