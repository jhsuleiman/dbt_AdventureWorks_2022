with
    source_data as (        
        select
            /* Primary key */
           	countryregioncode as county_region_code											
               		

            /* Foreign key */
           

            /* Columns */
            , cast(name as string) as country_name
            --, modifieddate	
            

        from {{ source('AdventureWorks', 'person_countryregion') }}
    )

select * 
from source_data
