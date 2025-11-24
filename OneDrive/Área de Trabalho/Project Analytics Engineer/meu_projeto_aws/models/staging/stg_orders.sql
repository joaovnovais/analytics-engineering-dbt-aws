with source as (

    select * from {{ source('olist_raw', 'olist_orders_dataset_csv') }}

),

renamed as (

    select
        -- Mapeamento manual: De 'colX' para o nome real de negócio
        col0 as order_id,
        col1 as customer_id,
        col2 as order_status,
        
        -- Tratamento de datas:
        -- NULLIF(col, ''): Se o campo estiver vazio, transforma em NULL (evita erro de conversão)
        cast(nullif(col3, '') as timestamp) as purchased_at,
        cast(nullif(col4, '') as timestamp) as approved_at,
        cast(nullif(col5, '') as timestamp) as delivered_to_carrier_at,
        cast(nullif(col6, '') as timestamp) as delivered_to_customer_at,
        cast(nullif(col7, '') as timestamp) as estimated_delivery_at

    from source
    
    -- FILTRO CRUCIAL: Remove a linha que contêm o cabeçalho original
    where col0 != 'order_id'

)

select * from renamed