# Write your MySQL query statement below
with T as (
    select user_id,
        rank() over (partition by user_id order by session_start) as rk,
        session_type
        from sessions
)

select user_id, count(1) as sessions_count
    from T as t
    join sessions as s using(user_id)
    where t.session_type = 'Viewer' and s.session_type = 'Streamer' and rk = 1
    group by 1
    order by 2 desc, 1 desc
