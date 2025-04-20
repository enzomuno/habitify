SELECT
    journal_id
    ,created_at
    ,unit_type
    ,periodicity
    ,target_value
    ,current_value
FROM {{ ref('stg_journal_habitify') }}