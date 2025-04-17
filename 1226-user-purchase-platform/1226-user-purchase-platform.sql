select p.spend_date, p.platform, ifnull(sum(amount), 0) total_amount, count(user_id) total_users
from
(
    select distinct(spend_date), 'mobile' platform from spending
    union
    select distinct(spend_date), 'desktop' platform from spending
    union
    select distinct(spend_date), 'both' platform from spending
) p left join
(
    select spend_date, user_id,
        if(mobile_amount>0, if(desktop_amount>0, 'both', 'mobile'), 'desktop') platform,
        (mobile_amount+desktop_amount) as amount
        from
        (
            select spend_date, user_id,
                sum(case platform when 'mobile' then amount else 0 end) mobile_amount,
                sum(case platform when 'desktop' then amount else 0 end) desktop_amount
                from spending
                group by spend_date, user_id
        ) o
) t
on p.platform=t.platform and p.spend_date=t.spend_date
group by spend_date, platform

