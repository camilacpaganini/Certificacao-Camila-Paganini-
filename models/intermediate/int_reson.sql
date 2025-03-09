WITH motivos AS (
    SELECT * FROM {{ ref('stg_order_salesreson') }}
)
, descricao_motivos AS (
    SELECT * FROM {{ ref('stg_sales_reson') }}
)
, consolidado AS (
    SELECT 
        CAST(motivos.fk_pedido AS STRING) || '-' || COALESCE(CAST(detalhes.fk_produto AS STRING), 'SEM_PRODUTO') AS pk_pedido_motivovenda, -- 🔹 Corrigindo conversão de tipos
        motivos.fk_pedido,
        LISTAGG(descricao_motivos.nome_motivo, ', ') WITHIN GROUP (ORDER BY descricao_motivos.nome_motivo) AS fk_motivo_venda_agrupado
    FROM motivos
    LEFT JOIN descricao_motivos 
        ON motivos.fk_motivo_venda = descricao_motivos.pk_motivo_venda
    LEFT JOIN {{ ref('stg_sales_order_detail') }} detalhes
        ON motivos.fk_pedido = detalhes.fk_pedido 
    GROUP BY motivos.fk_pedido, detalhes.fk_produto
)
SELECT * FROM consolidado

