# Write your MySQL query statement below

with T as (
    select e.team, avg(p.workload) as avg_workload from project p join employees e using(employee_id) group by e.team  
)

select p.employee_id, p.project_id, e.name as employee_name, p.workload as project_workload  
    from project p join employees e using(employee_id)
    join T t on e.team = t.team
    where p.workload > t.avg_workload
    order by p.employee_id, p.project_id
