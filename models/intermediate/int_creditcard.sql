WITH int_cartoes AS (
    SELECT *
    FROM {{ ref('stg_creditcard') }}
)

SELECT * FROM int_cartoes