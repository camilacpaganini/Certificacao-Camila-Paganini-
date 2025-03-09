WITH fonte_person AS (
    SELECT *
    FROM {{ source('erp', 'Person') }}
),
stg_person AS (
    SELECT 
        CAST(BUSINESSENTITYID AS INT) AS pk_pessoa,
        COALESCE(FIRSTNAME, '') || ' ' || COALESCE(LASTNAME, '') AS nome_completo_cliente
    FROM fonte_person
)

SELECT *
FROM stg_person