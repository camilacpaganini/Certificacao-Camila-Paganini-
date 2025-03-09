WITH 
    fonte_subcategoria_produto AS (
        SELECT * 
        FROM {{ source('erp', 'ProductSubcategory') }}
    )
,   renomeando AS (
        SELECT 
            CAST(productsubcategoryid AS INT) AS pk_subcategoria_produto
        ,   CAST(productcategoryid AS INT) AS fk_categoria_produto
        ,   name AS nome_subcategoria
        FROM fonte_subcategoria_produto
    )

SELECT *
FROM renomeando
