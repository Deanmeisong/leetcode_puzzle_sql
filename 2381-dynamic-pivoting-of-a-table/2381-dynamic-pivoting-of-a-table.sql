CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    -- set group_concat_max_len = 5000;
    -- select group_concat(distinct 'max(case when store = \'',
    --         store,
    --         '\' then price else null end) as ', store order by store) into @sql
    --     from Products;
    
    -- set @sql = concat('select product_id, ', @sql, ' from Products group by product_id');
    -- prepare stmt from @sql;
    -- execute stmt;
    -- deallocate prepare stmt;
    set group_concat_max_len = 5000;
    select group_concat(distinct'max(case when store = \'', store, '\' then price else null end) as ', store order by store) into @sql from products;
    set @sql = concat('select product_id, ', @sql, ' from Products group by product_id');
    prepare stat from @sql;
    execute stat;
    deallocate prepare stat;
 
END

