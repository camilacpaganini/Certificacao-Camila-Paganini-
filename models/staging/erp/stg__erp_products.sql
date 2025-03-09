WITH produto AS (
    SELECT
        productid AS pk_produto,
        name AS nome_produto,
        productsubcategoryid AS fk_subcategoria_produto
    FROM {{ source('erp', 'Product') }}
)

SELECT 
    * 
FROM produto
