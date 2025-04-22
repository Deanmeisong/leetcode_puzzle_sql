# Write your MySQL query statement below

select post_id,
    IFNULL(GROUP_CONCAT(DISTINCT k.topic_id ORDER BY k.topic_id), 'Ambiguous!') AS topic     
    from Posts p
    left join Keywords k
    ON CONCAT(' ', LOWER(P.content), ' ') LIKE CONCAT('% ', LOWER(K.word), ' %')
    group by p.post_id

