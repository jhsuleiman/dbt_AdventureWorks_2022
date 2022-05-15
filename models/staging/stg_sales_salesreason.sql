with
    source_data as (        
        select
            /* Primary key */
            salesreasonid as reason_id

            /* Foreign key */
            --, não existente

            /* Columns */
            , reasontype as reason_type
            --, name
            --, modifieddate

        from {{ source('AdventureWorks', 'sales_salesreason') }}
    )

select * 
from source_data