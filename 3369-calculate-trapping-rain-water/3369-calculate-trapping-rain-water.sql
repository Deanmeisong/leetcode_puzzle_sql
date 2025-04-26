# Write your MySQL query statement below

with T as (
    select id, height,
        max(height) over(order by id) as l,
        max(height) over(order by id desc) as r
        from heights
)

select sum(least(l, r) - height) as total_trapped_water from T 
