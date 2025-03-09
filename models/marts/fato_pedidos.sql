WITH 
    pedidos AS (
        SELECT * 
        FROM {{ ref('int_fato_pedidos') }}
    )

SELECT *
FROM pedidos