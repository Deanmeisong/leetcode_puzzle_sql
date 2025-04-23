with t as (
    select t1.*,
        sum(
            case
                when t2.customer_id is null then 1 else 0
            end
        ) over (order by customer_id, transaction_date) as start
        from Transactions t1
        left join Transactions  t2
        on t1.customer_id = t2.customer_id
            and t1.amount > t2.amount
            and datediff(t1.transaction_date, t2.transaction_date) = 1
)

select customer_id, min(transaction_date) as consecutive_start, max(transaction_date) as consecutive_end
    from t
    group by customer_id, start
    having count(customer_id) >= 3
    order by customer_id, consecutive_start, consecutive_end asc

