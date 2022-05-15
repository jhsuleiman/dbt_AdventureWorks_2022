with
    source_data as (        
        select
            /* Primary key */
           	businessentityid	
               		

            /* Foreign key */
            --, rowguid

            /* Columns */
            --, persontype	
            --, namestyle
            --, title
            , cast(firstname as string) as first_name
            --, middlename
            , cast(lastname as string) as last_name
            --, suffix
            --, emailpromotion
            --, additionalcontactinfo
            --, demographics
            --, modifieddate

        from {{ source('AdventureWorks', 'person_person') }}
    )

select * 
from source_data