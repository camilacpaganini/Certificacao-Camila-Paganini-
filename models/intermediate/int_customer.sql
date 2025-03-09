WITH fonte_cliente AS (
    SELECT *
    FROM {{ ref('stg_customer') }}
),
fonte_pessoa AS (
    SELECT *
    FROM {{ ref('stg_person') }}
),
stg_consolidado AS (
    SELECT
        fonte_cliente.pk_cliente,
        fonte_cliente.fk_pessoa_cliente,
        COALESCE(fonte_pessoa.nome_completo_cliente, 'Cliente Desconhecido') AS nome_cliente,
    FROM fonte_cliente
    LEFT JOIN fonte_pessoa 
        ON fonte_cliente.fk_pessoa_cliente = fonte_pessoa.pk_pessoa
)

SELECT *
FROM stg_consolidado