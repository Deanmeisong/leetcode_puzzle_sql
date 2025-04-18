# Write your MySQL query statement below
select item_category as CATEGORY,
IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 2 THEN quantity END), 0) AS 'MONDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 3 THEN quantity END), 0) AS 'TUESDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 4 THEN quantity END), 0) AS 'WEDNESDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 5 THEN quantity END), 0) AS 'THURSDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 6 THEN quantity END), 0) AS 'FRIDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 7 THEN quantity END), 0) AS 'SATURDAY',
       IFNULL(SUM(CASE WHEN DAYOFWEEK(order_date) = 1 THEN quantity END), 0) AS 'SUNDAY'
    from items i
    left join orders o on i.item_id = o.item_id
    group by item_category
    order by item_category