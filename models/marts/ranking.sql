with ranked as(

select *,
  dense_rank() over 
  (partition by customer_id
  order by order_id) as order_num --row_number will number the rows, using rank( would be just more random?, use row number to fix duplication
 from dbt_achen.fct_order_items
 
)

select
    customer_id,
{% for order in [1,2,3] %}
    sum(case when order_num = {{order}}
           then item_price 
           else 0 end) as order_{{order}}_total
           {{"," if not loop.last}}
  {% endfor %}
  from ranked
  group by 1
  
