# Write your MySQL query statement below

select u.user_id as seller_id,
    case when u.favorite_brand = b.item_brand then 'yes' else 'no' end as 2nd_item_fav_brand
    from users u
    left join
    (
        select a.seller_id, a.item_id, i.item_brand from
            (
                select seller_id, item_id,
                    rank() over(partition by seller_id order by order_date) as rnk
                from orders
            ) a
            join items i
            on a.item_id = i.item_id
            where rnk = 2
    ) b
    on u.user_id = b.seller_id


