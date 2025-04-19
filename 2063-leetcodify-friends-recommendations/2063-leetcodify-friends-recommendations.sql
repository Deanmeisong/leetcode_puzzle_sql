# Write your MySQL query statement below
with T as (
    select user1_id as user_id, user2_id as friend_id from Friendship 
    union
    select user2_id as user_id, user1_id as friend_id from Friendship
)

select distinct l1.user_id as user_id, l2.user_id as recommended_id
from Listens l1, Listens l2
where l1.song_id = l2.song_id and l1.user_id != l2.user_id and l1.day = l2.day
and not exists (
    select 1 from T as t where t.user_id = l1.user_id and t.friend_id = l2.user_id
)
group by l1.day, l1.user_id, l2.user_id
having count(distinct l1.song_id) >= 3