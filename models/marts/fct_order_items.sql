with order_items as (

        select * from {{ ref('stg_order_items') }}
        
),

orders_info as (
        
        select 
            order_id
            order_date,
            customer_id,
            email
            from {{ ref('stg_orders') }}
)

select * from order_items
join orders_info as fct_order_items on order_id