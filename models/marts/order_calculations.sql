with data_source as (
    
    select * from {{ref('fct_order_items')}}
),

lagged_source as (
    
    select
        order_id,
        customer_id,
        order_date,
        lag (order_date) over (partition by customer_id order by customer_id, order_date) as previous_order_date
    from data_source
),

order_calculations as (
    
    select
        customer_id,
        datediff(month, previous_order_date, order_date) as months_since_prior_order
    from lagged_source
        
)

    select 
        *
    from order_calculations