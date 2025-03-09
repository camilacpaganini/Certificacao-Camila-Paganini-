WITH 
    fonte_state_province AS (
        SELECT * 
        FROM {{ source('erp', 'StateProvince') }}
    ), 
    renomeando AS (
        SELECT 
            CAST(stateprovinceid AS INT) AS pk_estado
        ,   CAST(name AS STRING) AS estado
        ,   CAST(countryregioncode AS STRING) AS pais
        FROM fonte_state_province
    )

SELECT *
FROM renomeando