with T1 as (
    select power,
    (case
    when factor > 0 then '+'
    else '-'
    end) as sgn,
    (case
    when power > 1 then concat(abs(factor), 'X^', power)
    when power = 1 then concat(abs(factor), 'X')
    else abs(factor)
    end) as power_rep
    from Terms
)

select concat(group_concat(sgn, power_rep ORDER BY power DESC SEPARATOR ''), '=0') as equation
from T1
