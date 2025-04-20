SELECT
    area_id,
    area_name,
    created_at - interval '3 hours' AS created_at_brt,
    updated_at - interval '3 hours' AS updated_at_brt
FROM {{ ref('stg_areas_habitify') }}
