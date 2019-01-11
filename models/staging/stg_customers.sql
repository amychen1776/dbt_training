with source as (

    select * from {{ref('customers_upload')}}
    
),

stg_customers as (

    select
       
       --ids   
       id as customer_id,                
       email,             
       first_name,        
       last_name,        
       gender,
       
       --marketing            
       accepts_marketing,
       
       --dates
       created_at 
        
        
     from source

)

select * from stg_customers