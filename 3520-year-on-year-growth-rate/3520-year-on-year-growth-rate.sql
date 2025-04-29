WITH T AS (
    SELECT 
        product_id, 
        YEAR(transaction_date) AS cur_year, 
        SUM(spend) AS spend
    FROM user_transactions
    GROUP BY product_id, cur_year
),
S AS (
    SELECT 
        t1.cur_year AS year, 
        t1.product_id, 
        t1.spend AS curr_year_spend, 
        t2.spend AS prev_year_spend 
    FROM T AS t1
    LEFT JOIN T AS t2
        ON t1.product_id = t2.product_id 
        AND t1.cur_year = t2.cur_year + 1
)
SELECT 
    year, 
    product_id, 
    curr_year_spend, 
    prev_year_spend,
    ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100, 2) AS yoy_rate
FROM S
ORDER BY product_id, year;
