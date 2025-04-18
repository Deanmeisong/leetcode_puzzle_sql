# Write your MySQL query statement below

with recursive cte as 
    (
        select min(period_start) as date from Sales
        union all
        select date_add(date, interval 1 day) from cte
        where date <= all (select max(period_end) from sales)
    )

select s.product_id, p.product_name, left(e.date, 4) as report_year, sum(s.average_daily_sales) as total_amount 
from sales s join product p on s.product_id = p.product_id
join cte e on s.period_start <= e.date and e.date <= s.period_end
group by 1,2,3
order by 1,3