# Write your MySQL query statement below


-- select book_id, name from books where available_from < '2019-06-23'
-- and book_id not in
-- (
--     select book_id from orders
--     where dispatch_date  between '2018-06-23' and '2019-06-23'
--     group by book_id
--     having sum(quantity) >= 10
-- )


SELECT book_id, 
       name
FROM Books
WHERE available_from < '2019-05-23'
AND book_id NOT IN
            (SELECT book_id
             FROM Orders
             WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
             GROUP BY book_id
             Having sum(quantity) >= 10) 
