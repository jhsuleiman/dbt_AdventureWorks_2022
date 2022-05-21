with 
    staging_sales_customer as (
        select
            customer_id
            , personid	
            , territoryid

        from {{ref('stg_sales_customer')}}
    )

    , staging_person_person as (
        select 
            businessentityid	
            , first_name
            , last_name

        from {{ref('stg_person_person')}}
    )

    , staging_sales_personcreditcard as (
        select
            businessentityid
            , creditcardid	

        from {{ref('stg_sales_personcreditcard')}}            
    )

    , staging_sales_creditcard as (
        select
            creditcardid
            , cardtype

        from {{ref('stg_sales_creditcard')}}  
    )

    , transformed as (
        select
            row_number() over (order by customer_id) as customer_sk -- auto-incremental surrogate key
            , staging_sales_customer.customer_id
            , staging_sales_customer.territoryid
            , staging_person_person.businessentityid
            , staging_person_person.first_name
            , staging_person_person.last_name
            , staging_sales_personcreditcard.creditcardid
            , staging_sales_creditcard.cardtype

        from staging_sales_customer
        left join staging_person_person on staging_sales_customer.personid = staging_person_person.businessentityid
        left join staging_sales_personcreditcard on staging_person_person.businessentityid = staging_sales_personcreditcard.businessentityid
        left join staging_sales_creditcard on staging_sales_personcreditcard.creditcardid = staging_sales_creditcard.creditcardid
    )

select *
from transformed


