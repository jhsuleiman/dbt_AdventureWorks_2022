with
    reasons as (
        select 
            order_id
            , reason_id
            , reason_type

        from {{ ref ('dim_reasons')}}
    )

    , products as (
        select
            product_sk 
            , product_id
            , product_name

        from {{ ref ('dim_products')}}
    )

    , address as (
        select 
            location_sk
            , address_id
            , city
            , state_name
            , country_name

        from {{ ref ('dim_address')}}
    )

    , customers as (
        select 
            customer_sk
            , customer_id
            , first_name
            , last_name
            , cardtype

        from {{ ref ('dim_customers')}}
    )

    , salesorderheader_with_sk as(
        select
            salesorderheader.order_id
            , reasons.reason_id as reason_fk
            , address.address_id as address_fk
            , customers.customer_id as customer_fk
            , order_date
            , subtotal

        from {{ ref ('stg_salesorderheader')}} salesorderheader
        left join reasons on salesorderheader.order_id = reasons.order_id
        left join address on salesorderheader.shiptoaddressid = address.address_id
        left join customers on salesorderheader.customer_id = customers.customer_id

    )

    , salesorderdetails_with_sk as (
        select
            order_detail.order_id
            , order_detail.order_detail_id
            , products.product_id as product_fk
            , order_detail.orderqty 
            , order_detail.unitprice
            , order_detail.unitpricediscount 

        from {{ ref ( 'stg_salesorderdetail' ) }} order_detail
        left join products on order_detail.product_id = products.product_id
    )

    , transformed as (
        select
            salesorderheader_with_sk.order_id
            , salesorderdetails_with_sk.order_detail_id

            , salesorderheader_with_sk.reason_fk
            , salesorderheader_with_sk.address_fk
            , salesorderheader_with_sk.customer_fk
            , salesorderdetails_with_sk.product_fk

            , order_date

            , salesorderdetails_with_sk.orderqty 
            , salesorderdetails_with_sk.unitprice
            , salesorderdetails_with_sk.unitpricediscount
            , subtotal

        from salesorderheader_with_sk
        left join salesorderdetails_with_sk on salesorderheader_with_sk.order_id = salesorderdetails_with_sk.order_id

    )

select *
from transformed