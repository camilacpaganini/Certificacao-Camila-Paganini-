WITH 
    fonte_detalhes AS (
        SELECT * 
        FROM {{ source('erp', 'SalesOrderDetail') }}
    )
,   renomeando AS (
        SELECT 
            CAST(SALESORDERID AS INT) AS fk_pedido
        ,   CAST(SALESORDERDETAILID AS INT) AS pk_pedido_detalhe
        ,   CAST(PRODUCTID AS INT) AS fk_produto
        ,   CAST(ORDERQTY AS INT) AS quantidade
        ,   CAST(UNITPRICE as numeric (18,4)) AS preco_unitario
        ,   CAST(UNITPRICEDISCOUNT as numeric (18,4)) AS desconto
        FROM fonte_detalhes
    )

SELECT *
FROM renomeando