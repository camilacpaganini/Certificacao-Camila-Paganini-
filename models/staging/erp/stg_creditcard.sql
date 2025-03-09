WITH cartao AS (
    SELECT
        creditcardid AS pk_cartao,
        cardtype AS tipo_cartao
    FROM {{ source('erp', 'CreditCard') }}
)

SELECT 
    * 
FROM cartao
