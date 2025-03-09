WITH dim_motivos_venda AS (
    SELECT *
    FROM {{ ref('int_reson') }}
)

SELECT * FROM dim_motivos_venda