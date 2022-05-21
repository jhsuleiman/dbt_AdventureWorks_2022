with
    source_data as (        
        select
            /* Primary key */
           	stateprovinceid	as state_province_id											
               		

            /* Foreign key */
            --, territoryid
            --, rowguid

            /* Columns */
            , stateprovincecode as state_province_code
            , countryregioncode as country_region_code
            , name as state_name
            --, isonlystateprovinceflag
            --, modifieddate

        from {{ source('AdventureWorks', 'person_stateprovince') }}
    )

select * 
from source_data
