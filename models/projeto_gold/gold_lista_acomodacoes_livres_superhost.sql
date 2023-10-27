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
    sa.url_acomodacao
FROM silver_preco_acomodacao_airbnb a
LEFT JOIN silver_acomodacao_airbnb sa
    ON a.id_acomodacao = sa.id_acomodacao
LEFT JOIN silver_hospedador_airbnb sh
    on sh.ID_HOST= sa.ID_HOST
WHERE a.disponivel = TRUE
AND sh.SUPERHOST = TRUE