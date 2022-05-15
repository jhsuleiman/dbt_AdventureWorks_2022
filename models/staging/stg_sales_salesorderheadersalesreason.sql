with
    source_data as (        
        select
            /* Primary key */
            salesorderid as order_id
            , salesreasonid as reason_id
            
            /* Foreign key */
            --, não existente

            /* Columns */
            --, modifieddate

        from {{ source('AdventureWorks', 'sales_salesorderheadersalesreason') }}
    )

select * 
from source_data