# Write your MySQL query statement below

with t1 as (
    select user1_id as user_id, user2_id as friend_id from Friendship
    union
    select user2_id as user_id, user1_id as friend_id from Friendship
)

select t1.user_id, l.page_id, count(distinct t1.friend_id) as friends_likes from t1
left join Likes l on t1.friend_id = l.user_id
left join Likes l2 on l.page_id = l2.page_id and l2.user_id = t1.user_id
where l2.user_id is null
group by 1, 2
