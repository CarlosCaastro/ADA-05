{{ config(
    materialized='table',
) }}

WITH reviewer_cte AS (
    SELECT DISTINCT reviewer_id, reviewer_name
    FROM public.review
)
SELECT 
reviewer_id as ID_REVISOR, 
upper(reviewer_name) as NOME_REVISOR
FROM reviewer_cte