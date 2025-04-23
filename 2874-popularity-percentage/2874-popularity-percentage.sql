# Write your MySQL query statement below
with F as (
    select user1, user2 from friends
    union
    select user2 as user1, user1 as user2 from friends
),
    T as (
        select count(distinct user1) as cnt from F
    )

select distinct user1,
    round(
        (count(1) over(partition by user1)) *100 / (SELECT cnt FROM T),2
    ) as percentage_popularity
    from F
    order by user1

