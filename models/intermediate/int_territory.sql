WITH 
    endereco AS (
        SELECT * 
        FROM {{ ref('stg_address') }}
    )
,   estado AS (
        SELECT * 
        FROM {{ ref('stg_state_province') }}
    )
,   consolidado AS (
        SELECT 
            endereco.pk_address AS pk_territorio
        ,   endereco.cidade
        ,   estado.estado
        ,   estado.pais
        FROM endereco
        LEFT JOIN estado 
            ON endereco.fk_estado = estado.pk_estado
    )

SELECT *
FROM consolidado