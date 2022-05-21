with
    source_data as (        
        select
            /* Primary key */
           	creditcardid						
               		

            /* Foreign key */
            --, cardnumber

            /* Columns */
            , cardtype	
            --, expmonth
            --, expyear
            --, modifieddate

        from {{ source('AdventureWorks', 'sales_creditcard') }}
    )

select * 
from source_data