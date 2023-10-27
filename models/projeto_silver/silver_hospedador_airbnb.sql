{{ config(
    materialized='table',
) }}

WITH cleaned_host AS (
    SELECT
        host_id as ID_HOST,
        host_url as URL_HOST,
        UPPER(host_name) as NOME_HOST,
        TO_DATE(host_since, 'YYYY-MM-DD') AS DATA_CADASTRO_HOST,
        upper(host_about) as DESCRICAO_HOST,
        UPPER(host_response_time) as GRUPO_TEMPO_RESPOSTA,
        CASE
            WHEN host_response_rate LIKE '%%' THEN
                CAST(REGEXP_REPLACE(host_response_rate, '%', '', 'g') AS DECIMAL(5, 2)) / 100
            ELSE NULL
        END AS TAXA_RESPOSTA_HOST,
        CASE
            WHEN host_acceptance_rate LIKE '%%' THEN
                CAST(REGEXP_REPLACE(host_acceptance_rate, '%', '', 'g') AS DECIMAL(5, 2)) / 100
            ELSE NULL
        END AS TAXA_ACEITACAO_HOST,
        CASE
            WHEN host_is_superhost = 't' THEN TRUE
            WHEN host_is_superhost = 'f' THEN FALSE
            ELSE NULL
        END AS SUPERHOST,
        UPPER(host_neighbourhood) as BAIRRO,
        host_listings_count as CONTAGEM_ACOMODACAO_HOST,
        host_total_listings_count as CONTAGEM_TOTAL_ACOMODACAO_HOST
    FROM public.listings
),
deduplicated_host AS (
    SELECT DISTINCT *
    FROM cleaned_host
)
SELECT *
FROM deduplicated_host