WITH 
    produto AS (
        SELECT * 
        FROM {{ ref('stg__erp_products') }}
    )
,   subcategoria_produto AS (
        SELECT * 
        FROM {{ ref('stg_product_subcategory') }}
    )
,   categoria_produto AS (
        SELECT * 
        FROM {{ ref('stg_product_category') }}
    )
,   renomeando AS (
        SELECT 
            p.pk_produto
        ,   p.nome_produto
        ,   s.nome_subcategoria
        ,   c.nome_categoria
        FROM produto p
        LEFT JOIN subcategoria_produto s 
            ON p.fk_subcategoria_produto = s.pk_subcategoria_produto
        LEFT JOIN categoria_produto c 
            ON s.fk_categoria_produto = c.pk_categoria_produto
    )

SELECT *
FROM renomeando
