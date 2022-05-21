with
    source_data as (
        select
            /* Primary key */
            salesorderdetailid  as order_detail_id
            , salesorderid  as order_id

            /* Foreign keys */
            , productid as product_id
            , specialofferid

            /* Columns */
            , orderqty 
            , unitprice
            , unitpricediscount 
            --, carriertrackingnumber
            --, modifieddate
            --, rowguid

        from {{ source('AdventureWorks', 'sales_salesorderdetail') }}
    )

select * 
from source_data