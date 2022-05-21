with
    source_data as (        
        select
            /* Primary key */
           	businessentityid					
               		
            /* Foreign key */
            , creditcardid

            /* Columns */
            --, modifieddate

        from {{ source('AdventureWorks', 'sales_personcreditcard') }}
    )

select * 
from source_data