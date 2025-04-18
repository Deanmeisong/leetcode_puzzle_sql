# Write your MySQL query statement below

with cte as (
    select e.exam_id, e.student_id, e.score, s.student_name,
    rank() over (partition by exam_id order by score asc) as rnk1,
    rank() over (partition by exam_id order by score desc) as rnk2
    from exam e left join student s on e.student_id = s.student_id
)

select distinct student_id, student_name
    from cte
    where student_id not in (
        select student_id from cte where rnk1 = 1 or rnk2 = 1
    )
    order by student_id