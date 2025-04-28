# Write your MySQL query statement below


with T as (
    select student_id from enrollments group by 1 having avg(GPA) >= 2.5
)

select student_id 
    from T join students using(student_id)
    join courses using(major)
    left join enrollments using(student_id, course_id)
    group by student_id
    having sum(mandatory = 'yes' and grade = 'A') = sum(mandatory = 'yes')
    and sum(mandatory = 'no' and grade is not null) = sum(mandatory ='no' and grade in ('A', 'B'))
    and sum(mandatory = 'no' and grade is not null) >= 2
    order by student_id
