WITH 
    fonte_pedidos AS (
        SELECT * 
        FROM {{ source('erp', 'SalesOrderHeader') }}
    )
,   renomeando AS (
        SELECT 
            CAST(SALESORDERID AS INT) AS pk_pedido
        ,   CAST(CUSTOMERID AS INT) AS fk_cliente
        ,   CAST(SHIPTOADDRESSID AS INT) AS fk_territorio
        ,   CAST(CREDITCARDID AS INT) AS fk_cartao
        ,   CAST(ORDERDATE AS DATE) AS data_pedido
        ,   CAST(FREIGHT AS FLOAT) AS valor_frete
        ,   CAST(TOTALDUE AS FLOAT) AS total_venda
        FROM fonte_pedidos
    )

SELECT *
FROM renomeando