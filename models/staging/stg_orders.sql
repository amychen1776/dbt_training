{{
    config(
        schema='staging'
    )
}}
with source as (

    select * from {{ ref('orders_upload') }}
    
),
  
stg_orders as (

    select
    
        --ids
        id as order_id,
        customer_id,
        
        --money
        total as invoice_total,
        
        --order status
        completed,
        
        --contact info
        ip_address,
        street_address,
        billing_country_code,
        email,
        
        --tracking
        referral_domain,
        referral_url,
        
        --dates
        created_at as order_date
        
        
    from source

)

select * from stg_orders