with source as (

    select * from dbt_achen.order_items_upload
    
),

renamed as (

    select
       
       --ids
       id as order_items_id,       
       order_id,
       
       --item information    
       price as item_price,     
       quantity,    
       size,  
       color,       
       product_id
        
        
    from source

)

select * from renamed