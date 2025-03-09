WITH dim_cartoes AS (
    SELECT *
    FROM {{ ref('int_creditcard') }}
)

SELECT * FROM dim_cartoes