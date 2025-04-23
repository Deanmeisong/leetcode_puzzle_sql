with s as (
    select *,
        max(end_day) over (partition by hall_id order by start_day) as cur_max_end_day
        from HallEvents
),
    t as (
        select *,
            if(start_day <= lag(cur_max_end_day) over(partition by hall_id order by start_day), 0, 1) as start
            from s
    ),
    p as (
        select *,
            sum(start) over (partition by hall_id order by start_day) as gid
            from t
    )

select hall_id, min(start_day) as start_day, max(end_day) as end_day
    from p
    group by hall_id, gid