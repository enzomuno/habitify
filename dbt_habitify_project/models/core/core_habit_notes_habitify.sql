SELECT
    note_id
    ,note_text
    ,created_at AS created_at_brt
    ,note_type
    ,habit_id
    ,updated_at - interval '3 hours' AS updated_at_brt

FROM {{ ref('stg_habit_notes_habitify') }}