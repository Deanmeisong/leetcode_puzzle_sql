# Write your MySQL query statement below

select e1.id, e1.month, (ifnull(e1.salary, 0)+ifnull(e2.salary, 0)+ifnull(e3.salary, 0)) as salary
from
(
    select id, max(month) as month from employee
    group by id having count(*) > 1
) as maxmonth
left join employee e1 on (maxmonth.id = e1.id and maxmonth.month > e1.month)
left join employee e2 on (e1.id = e2.id and e2.month = e1.month-1)
left join employee e3 on (e1.id = e3.id and e3.month = e1.month-2)
order by id asc, month desc;


