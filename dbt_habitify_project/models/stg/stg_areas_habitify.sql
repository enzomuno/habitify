{{ config(materialized='view') }}

-- Import
WITH source AS (
    SELECT
        id,
        name,
        color,
        priority,
        created_at
    FROM {{ source('raw', 'areas_habitify') }}
),

-- Process
processed AS (
    SELECT
        id AS area_id,
        name AS area_name,
        created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Sao_Paulo' AS created_date_br,
        NOW() AS updated_at
    FROM source
)

-- Final Select
SELECT *
FROM processed
