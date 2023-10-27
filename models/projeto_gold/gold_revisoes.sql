{{
    config(
        materialized="table"
    )
}}

WITH revisoes_por_acomodacao AS (
    SELECT
        id_acomodacao,
        COUNT(*) AS quantidade_revisoes
    FROM silver_review_airbnb
    GROUP BY id_acomodacao
),
ultima_data_revisao AS (
    SELECT
        id_acomodacao,
        MAX(data_revisao) AS data_ultima_revisao
    FROM silver_review_airbnb
    GROUP BY id_acomodacao
)
SELECT
    r.id_acomodacao,
    r.quantidade_revisoes,
    d.data_ultima_revisao
FROM revisoes_por_acomodacao r
JOIN ultima_data_revisao d ON r.id_acomodacao = d.id_acomodacao

