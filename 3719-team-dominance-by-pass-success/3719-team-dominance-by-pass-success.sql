# Write your MySQL query statement below
with T as (
    select t1.team_name as team_name,
        if(p.time_stamp <= '45:00', 1, 2) as half_number,
        if(t1.team_name = t2.team_name, 1, -1) as dominance 
    from Passes p
    left join Teams t1 on t1.player_id = p.pass_from
    left join Teams t2 on t2.player_id = p.pass_to
)

select team_name, half_number, sum(dominance) as dominance from T
group by 1, 2
order by 1, 2;