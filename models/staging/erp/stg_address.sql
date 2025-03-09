WITH 
    fonte_address AS (
        SELECT * 
        FROM {{ source('erp', 'Address') }}
    ), 
    renomeando AS (
        SELECT 
            CAST(addressid AS INT) AS pk_address
        ,   CAST(city AS STRING) AS cidade
        ,   CAST(stateprovinceid AS INT) AS fk_estado
        FROM fonte_address
    )

SELECT *
FROM renomeando