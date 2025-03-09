with dim_produtos as (
    select *
    from {{ ref('int_products') }} 
)

select *
from dim_produtos