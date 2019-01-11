{{
    config(
        materialized='table'
    )
}}
with order_items as (

    select * from {{ ref('stg_order_items') }}
        
),

orders_info as (
        
    select * from {{ ref('stg_orders') }}

),

joined as (

    select 
        order_items.*,
        orders_info.order_date,
        orders_info.customer_id,
        orders_info.email
        
    from order_items
    
    left join orders_info using (order_id)
    
)

select * from joined as fct_order_items
