{{
    config(
        materialized="view"
    )
}}

SELECT
    a.id_acomodacao,
    a.disponivel,
    a.preco,
    sa.date_ultimo_sracpe,
    sa.qte_acomodacoes,
    sa.num_reviews_ltm,
    sa.pontuacao_avaliacoes,
    a.url_acomodacao
FROM silver_preco_acomodacao_airbnb a
LEFT JOIN silver_acomodacao_airbnb sa
    ON a.id_acomodacao = sa.id_acomodacao
WHERE a.disponivel = TRUE