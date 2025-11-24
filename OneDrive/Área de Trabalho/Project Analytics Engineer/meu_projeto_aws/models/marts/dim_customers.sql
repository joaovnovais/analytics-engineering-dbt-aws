with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        customer_id,
        min(purchased_at) as first_order_date,
        max(purchased_at) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1

),

final as (

    select
        customers.customer_id,
        customers.customer_unique_id,
        customers.customer_city,
        customers.customer_state,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    -- CORREÇÃO AQUI:
    -- Trocamos "using (customer_id)" por "on ..."
    left join customer_orders on customers.customer_id = customer_orders.customer_id

)

select * from final