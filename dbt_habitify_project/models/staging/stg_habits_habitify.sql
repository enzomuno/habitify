-- Import
WITH source AS (
    SELECT
        id
        ,name
        ,is_archived
        ,start_date
        ,time_of_day
        ,goal
        ,goal_history_items
        ,log_method
        ,recurrence
        ,remind
        ,area
        ,created_date
        ,priority
    FROM {{ source('raw', 'habits_habitify') }}
),

-- Process
processed AS (
    SELECT
        id                                                                      AS habit_id
        ,name                                                                   AS habit_name
        ,is_archived                                                            AS is_archived
        ,start_date::timestamp                                                  AS start_date
        ,created_date::timestamp                                                AS created_date
        ,log_method                                                             AS log_method
        
        -- Parse JSON: goal
        ,(goal ->> 'value')::float                                              AS goal_value
        ,(goal ->> 'unit_type')::VARCHAR(15)                                    AS goal_unit,
        ,(goal ->> 'periodicity')::VARCHAR(15)                                  AS goal_periodicity
        
        -- Recurrence split (ical format, separando start e regra)
        ,SPLIT_PART(recurrence, CHR(10), 1)                                     AS recurrence_start
        ,SPLIT_PART(recurrence, CHR(10), 2)                                     AS recurrence_rule
        
        -- Lista de horários como string (ex: ["06:00","18:00"])
        ,time_of_day::text                                                      AS time_of_day_list
        ,remind::text                                                           AS remind_time_list

        -- Area (outra estrutura json)
        ,area ->> 'id'                                                          AS area_id
        ,area ->> 'name'                                                        AS area_name
        ,area ->> 'priority'                                                    AS area_priority

        -- Campo de prioridade (parece ser ruído, vamos tentar converter)
        ,NULLIF(priority::float, 0)                                             AS numeric_priority
    FROM source
)


-- Final select
SELECT * FROM processed
