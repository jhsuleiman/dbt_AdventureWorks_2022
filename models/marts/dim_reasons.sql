with 
    staging_header_reason as (
        select 
            order_id
            , reason_id

        from {{ ref ( 'stg_sales_salesorderheadersalesreason' ) }}
    )

    , staging_sales_reason as (
        select
            reason_id
            , reason_type

        from {{ ref ( 'stg_sales_salesreason' ) }}
    )

    , transformed as (
        select
            row_number() over (order by order_id) as reason_sk
            , staging_header_reason.order_id
            , staging_header_reason.reason_id
            , staging_sales_reason.reason_type

        from staging_header_reason
        left join staging_sales_reason on staging_header_reason.reason_id = staging_sales_reason.reason_id
    )

select * from transformed