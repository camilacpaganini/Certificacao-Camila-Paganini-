WITH 
    fonte_categoria_produto AS (
        SELECT * 
        FROM {{ source('erp', 'ProductCategory') }}
    )
,   renomeando AS (
        SELECT 
            CAST(productcategoryid AS INT) AS pk_categoria_produto
        ,   name AS nome_categoria
        FROM fonte_categoria_produto
    )

SELECT *
FROM renomeando
