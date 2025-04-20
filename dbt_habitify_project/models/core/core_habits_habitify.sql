SELECT
    habit_id
    ,habit_name
    ,is_archived
    ,start_date - interval '3 hours' AS start_date_brt
    ,goal_value
    ,goal_unit
    ,goal_periodicity
    ,time_of_day_list
    ,remind_time_list
    ,area_id
    ,updated_at - interval '3 hours' AS updated_at_brt
FROM {{ ref('stg_habits_habitify') }}