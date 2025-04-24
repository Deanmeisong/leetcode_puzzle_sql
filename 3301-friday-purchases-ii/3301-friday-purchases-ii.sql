# Write your MySQL query statement below

with recursive T as (
    select '2023-11-01' as purchase_date
    union
    select purchase_date + interval 1 day from T
    where purchase_date < '2023-11-30'
)

select ceil(dayofmonth(purchase_date)/7) as week_of_month,
    purchase_date,
    ifnull(sum(amount_spend), 0) as total_amount
    from T
    left join Purchases
    using (purchase_date)
    where dayofweek(purchase_date) = 6
    group by 2
    order by 1

