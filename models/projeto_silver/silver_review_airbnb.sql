
{{ config(
    materialized='table',
) }}

WITH cte_comments AS (
    SELECT
        id AS ID_REVISAO,
        listing_id AS ID_ACOMODACAO,
        reviewer_id AS ID_REVISOR,
        UPPER(REPLACE(comments, '<br/>', '')) AS COMENTARIO,
        TO_DATE(date, 'YYYY-MM-DD') AS DATA_REVISAO
    FROM public.review
)
SELECT 
ID_REVISAO, 
ID_ACOMODACAO, 
ID_REVISOR, 
COMENTARIO,
DATA_REVISAO
FROM cte_comments