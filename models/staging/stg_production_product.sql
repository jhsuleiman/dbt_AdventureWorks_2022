with
    source_data as (        
        select
            /* Primary key */
           	productid as product_id																				
               		

            /* Foreign key */
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, productsubcategoryid
            --, productmodelid

            /* Columns */
            , cast(name as string) as product_name 
            --, productnumber
            --, makeflag
            --, finishedgoodsflag
            --, color
            --, safetystocklevel
            --, reorderpoint
            --, standardcost
            --, listprice
            --, size
            --, weight
            --, daystomanufacture
            --, productline
            --, class
            --, style
            --, sellstartdate
            --, sellenddate
            --, discontinueddate
            --, rowguid
            --, modifieddate

        from {{ source('AdventureWorks', 'production_product') }}
    )

select * 
from source_data