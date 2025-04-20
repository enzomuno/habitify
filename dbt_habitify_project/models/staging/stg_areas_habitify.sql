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
        created_at AS created_at,
        CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS updated_at
    FROM source
)

-- Final Select
SELECT *
FROM processed
