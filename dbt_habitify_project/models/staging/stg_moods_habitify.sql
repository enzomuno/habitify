-- Import
WITH source AS (
    SELECT
        id
        ,created_at
        ,value
    FROM {{ source('raw', 'moods_habitify') }}
),

-- Process
processed AS (
    SELECT
        id AS mood_id
        ,created_at AS created_at
        ,value AS mood_value
        ,CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS updated_at
    FROM source
)

-- Final Select
SELECT *
FROM processed
