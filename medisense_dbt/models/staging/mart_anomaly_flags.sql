WITH base AS (
    SELECT
        patient_id,
        reading_no,
        heart_rate,
        spo2,
        temperature,
        systolic_bp,
        is_anomaly,
        FROM `medisense-project.medisense_dbt.stg_sensor_readings`
)
SELECT
    patient_id,
    reading_no,
    heart_rate,
    spo2,
    temperature,
    systolic_bp,
    is_anomaly,
    CASE WHEN heart_rate < 40 OR heart_rate > 130 THEN 1 ELSE 0 END as hr_flag,
    CASE WHEN spo2 < 90 THEN 1 ELSE 0 END as spo2_flag,
    CASE WHEN temperature < 35 OR temperature > 39.5 THEN 1 ELSE 0 END as temp_flag,
    CASE WHEN systolic_bp < 80 OR systolic_bp > 180 THEN 1 ELSE 0 END as bp_flag
FROM base
WHERE is_anomaly = 1