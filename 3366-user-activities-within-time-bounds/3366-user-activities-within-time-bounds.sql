# Write your MySQL query statement below


with T as (
    select *,
    lead(session_start) over (partition by user_id, session_type order by session_start) as next_session_start
    from sessions
)

select distinct user_id
    from T
    where next_session_start is not null 
    and TIMESTAMPDIFF(hour, session_end, next_session_start) <= 12