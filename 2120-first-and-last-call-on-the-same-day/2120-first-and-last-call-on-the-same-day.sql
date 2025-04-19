# Write your MySQL query statement below
with cte1 as (
    select caller_id, recipient_id, call_time from calls
    union
    select recipient_id as caller_id, caller_id as recipient_id, call_time from calls
),
cte2 as (
    select caller_id, recipient_id, date(call_time) as call_date,
    dense_rank() over (partition by caller_id, date(call_time) order by call_time asc) as first_call,
    dense_rank() over (partition by caller_id, date(call_time) order by call_time desc) as last_call
    from cte1
)

select distinct caller_id as user_id from cte2
where first_call = 1 or last_call = 1
group by caller_id, call_date
having count(distinct recipient_id) = 1;