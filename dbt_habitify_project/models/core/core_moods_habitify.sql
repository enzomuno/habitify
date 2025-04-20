SELECT
    mood_id
    ,created_at - interval '3 hours' AS created_at_brt
    ,mood_value
    ,updated_at - interval '3 hours' AS updated_at_brt
FROM {{ ref('stg_moods_habitify') }}
