WITH fonte_customer AS (
    SELECT *
    FROM {{ source('erp', 'Customer') }}
),
stg_customer AS (
    SELECT 
        CAST(CUSTOMERID AS INT) AS pk_cliente
        ,CAST(PERSONID AS INT) AS fk_pessoa_cliente
    FROM fonte_customer
)

SELECT *
FROM stg_customer