SELECT
    journal_id
    ,created_at
    ,unit_type
    ,periodicity
    ,target_value
    ,current_value
    ,updated_at - interval '3 hours' AS updated_at_brt
FROM {{ ref('stg_journal_habitify') }}