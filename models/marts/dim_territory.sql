WITH 
    territorio AS (
        SELECT * 
        FROM {{ ref('int_territory') }}
    )

SELECT *
FROM territorio