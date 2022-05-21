with
    staging_person_address as (
        select 
           	address_id							
            , state_province_id
            , city            

        from {{ref('stg_person_address')}}
    )

,   staging_person_stateprovince as (
        select
           	state_province_id											
            , state_province_code
            , country_region_code
            , state_name

        from {{ref('stg_person_stateprovince')}}    

)

,   staging_person_countryregion as (
        select
           	county_region_code											
            , country_name

        from {{ref('stg_person_countryregion')}}
)

,   transformed as (
        select
            row_number () over (order by address_id) as location_sk
            , staging_person_address.address_id
            , staging_person_address.state_province_id
            , staging_person_address.city											
            , staging_person_stateprovince.state_province_code
            , staging_person_stateprovince.country_region_code
            , staging_person_stateprovince.state_name
            , staging_person_countryregion.county_region_code											
            , staging_person_countryregion.country_name
        
        from staging_person_address
        left join staging_person_stateprovince on staging_person_address.state_province_id = staging_person_stateprovince.state_province_id
        left join staging_person_countryregion on staging_person_stateprovince.country_region_code = staging_person_countryregion.county_region_code
)

select *
from transformed