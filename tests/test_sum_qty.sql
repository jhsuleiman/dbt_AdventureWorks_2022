with    
    staging_test_sum_qty as (
        select sum(orderqty) as sum_val
        from {{ref ('facts_salesorderdetails')}}
        where order_date between '2012-05-31' and '2013-10-18'
    )

select * 
from staging_test_sum_qty 
where sum_val != 154387