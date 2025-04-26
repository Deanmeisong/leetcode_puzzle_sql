# Write your MySQL query statement below
with T as (
    select *,
        rank() over(partition by user_id, session_type order by session_start) as rk
        from sessions
)

SELECT DISTINCT t1.user_id
FROM T t1
JOIN T t2
  ON t1.user_id = t2.user_id
 AND t1.session_type = t2.session_type
 AND t2.rk = t1.rk + 1  -- t2 is immediately after t1
WHERE TIMESTAMPDIFF(HOUR, t1.session_end, t2.session_start) <= 12
ORDER BY t1.user_id;