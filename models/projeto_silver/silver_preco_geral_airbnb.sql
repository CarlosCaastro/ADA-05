
{{ config(
    materialized='table',
) }}

WITH ranked_calendar AS (
    SELECT
        listing_id as ID_ACOMODACAO,
        TO_DATE(date, 'YYYY-MM-DD') AS DATA,
        CAST(REGEXP_REPLACE(price, '[^0-9.]', '', 'g') AS DECIMAL(10, 2)) AS PRECO,
        CAST(REGEXP_REPLACE(adjusted_price, '[^0-9.]', '', 'g') AS DECIMAL(10, 2)) AS PRECO_AJUSTADO,
        minimum_nights as MINIMO_NOITES,
        maximum_nights as MAXIMO_NOITES,
        CASE
            WHEN available = 't' THEN TRUE
            WHEN available = 'f' THEN FALSE
            ELSE NULL
        END AS DISPONIVEL
    FROM calendar
)
SELECT
ID_ACOMODACAO,
DATA,
PRECO,
PRECO_AJUSTADO,
MINIMO_NOITES,
MAXIMO_NOITES,
DISPONIVEL
FROM ranked_calendar
