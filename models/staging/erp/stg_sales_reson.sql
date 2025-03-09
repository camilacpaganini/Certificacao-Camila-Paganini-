WITH 
    fonte_motivos AS (
        SELECT * 
        FROM {{ source('erp', 'SalesReason') }}
    )
,   renomeando AS (
        SELECT 
            CAST(SALESREASONID AS INT) AS pk_motivo_venda
        ,   CAST(NAME AS STRING) AS nome_motivo
        FROM fonte_motivos
    )

SELECT *
FROM renomeando