with
    source_data as (        
        select
            /* Primary key */
           	addressid as address_id							
               		

            /* Foreign key */
            , stateprovinceid as state_province_id
            --, rowguid

            /* Columns */
            --, postalcode
            --, addressline1
            --, addressline2
            , city            
            --, spatiallocation
            --, modifieddate

        from {{ source('AdventureWorks', 'person_address') }}
    )

select * 
from source_data