WITH dim_clientes AS (
    SELECT *
    FROM {{ ref('int_customer') }}
)

SELECT * FROM dim_clientes