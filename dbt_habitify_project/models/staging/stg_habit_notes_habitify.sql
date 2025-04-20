-- Import 
WITH source AS (
    SELECT
        id
        ,content
        ,created_date
        ,note_type
        ,habit_id
    FROM {{ source('raw','habit_notes_habitify') }}
),

-- Process
processed AS (
    SELECT
        id AS note_id
        ,content AS note_text
        ,created_date AS created_at
        ,note_type AS note_type
        ,habit_id AS habit_id
        ,CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS updated_at
    FROM source
)

-- Final Select
SELECT *
FROM processed