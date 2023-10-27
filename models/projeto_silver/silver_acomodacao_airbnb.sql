
{{ config(
    materialized='table',
) }}

WITH cleaned_listings AS (
    SELECT
        id as ID_ACOMODACAO,
        listing_url as URL_ACOMODACAO,
        scrape_id as SRACPE_ID,
        TO_DATE(last_scraped, 'YYYY-MM-DD') AS DATE_ULTIMO_SRACPE,
        host_id as ID_HOST,
        latitude as LAT,
        longitude as LONG,
        STRING_TO_ARRAY(
            REGEXP_REPLACE(amenities, '["\\[\\]]', '', 'g'),
            ', '
        ) AS ACOMODACOES,
        accommodates as QTE_ACOMODACOES,
        number_of_reviews_ltm as NUM_REVIEWS_LTM,
        number_of_reviews_l30d as NUM_REVIEWS_30D,
        review_scores_rating as PONTUACAO_AVALIACOES,
        review_scores_accuracy as PRECISAO_AVALIACOES,
        review_scores_cleanliness as LIMPEZA_AVALIACOES,
        review_scores_checkin as CHECKIN_AVALIACOES,
        review_scores_communication as COMUNICACAO_AVALIACOES,
        review_scores_location as LOCALIZACAO_AVALIACOES,
        review_scores_value as VALOR_AVALIACOES,
        reviews_per_month as AVALIACOES_POR_MES
    FROM public.listings
),
deduplicated_listings AS (
    SELECT DISTINCT *
    FROM cleaned_listings
)
SELECT *
FROM deduplicated_listings

