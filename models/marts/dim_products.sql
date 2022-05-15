with
    staging_production_product as (
        select
            product_id
            , product_name

        from {{ref('stg_production_product')}}
    )
    
,   transformed as (
        select
        row_number () over (order by product_id) as product_sk -- auto-incremental surrogate key
        , *

    from staging_production_product
    )

select *
from transformed