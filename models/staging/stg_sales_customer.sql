with
    source_data as (        
        select
            /* Primary key */
            customerid as customer_id					

            /* Foreign key */
            , personid
            --, storeid
            , territoryid

            /* Columns */
            --, rowguid
            --, modifieddate

        from {{ source('AdventureWorks', 'sales_customer') }}
    )

select * 
from source_data