with source as (

    select * from {{ source('olist_raw', 'olist_customers_dataset_csv') }}

),

renamed as (

    select
        customer_id,
        customer_unique_id,
        -- CORREÇÃO: Trocamos 'string' por 'varchar'
        cast(customer_zip_code_prefix as varchar) as customer_zip_code_prefix,
        customer_city,
        customer_state

    from source

)

select * from renamed