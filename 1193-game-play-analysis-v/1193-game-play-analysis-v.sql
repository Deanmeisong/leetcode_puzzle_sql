# Write your MySQL query statement below

with first_logins as (
    select a.player_id,
    min(a.event_date) as first_login
    from activity a
    group by a.player_id
), consec_login as (
    select f.player_id,
        (case
            when a.player_id is null then 0
            else 1
        end) as logged_in_consecutively,
        f.first_login
    from
        first_logins F left join
        activity a on f.player_id = a.player_id and f.first_login = DATE_SUB(a.event_date, interval 1 day)
)


select c.first_login as install_dt,
count(c.player_id) as installs,
round(
    sum(c.logged_in_consecutively) / count(player_id)
    ,2) as day1_retention
from consec_login c
group by c.first_login;

