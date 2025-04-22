# Write your MySQL query statement below
with cte as (
    -- select pur.invoice_id, pur.product_id, sum(pur.quantity * pro.price) as price2
    --     from purchases pur left join products pro on pur.product_id = pro.product_id
    --     group by invoice_id order by price2 limit 1
        select pur.invoice_id, pur.product_id, sum(pur.quantity * pro.price) as price2
        from purchases pur left join products pro on pur.product_id = pro.product_id
        group by invoice_id order by price2 desc, invoice_id asc limit 1
)

select pur.product_id, pur.quantity, pur.quantity*pro.price as price
    from purchases pur left join products pro on pur.product_id = pro.product_id
    where pur.invoice_id in (select invoice_id from cte)