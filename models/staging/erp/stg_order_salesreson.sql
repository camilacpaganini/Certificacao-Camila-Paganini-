WITH 
    fonte_pedido_motivo AS (
        SELECT * 
        FROM {{ source('erp', 'SalesOrderHeaderSalesReason') }}
    )
,   renomeando AS (
        SELECT 
            CAST(SALESORDERID AS INT) AS fk_pedido
        ,   CAST(SALESREASONID AS INT) AS fk_motivo_venda
        FROM fonte_pedido_motivo
    )

SELECT *
FROM renomeando