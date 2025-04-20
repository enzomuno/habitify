-- Import
WITH source AS (
    SELECT
        id
        ,progress
        ,created_at
    FROM {{ source('raw', 'journal_habitify') }}
),

-- Process
processed AS (
    SELECT
        id AS journal_id,
        created_at,
        -- Desaninhando os campos do JSONB
        progress ->> 'unit_type'::VARCHAR(15)           AS unit_type,
        progress ->> 'periodicity'::VARCHAR(15)         AS periodicity,
        (progress ->> 'target_value')::numeric          AS target_value,
        (progress ->> 'current_value')::numeric         AS current_value,
        (progress ->> 'reference_date')                 AS reference_date
    FROM source
)

-- Final Select
SELECT  *
FROM processed