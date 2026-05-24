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
    AVG(heart_rate) as avg_heart_rate,
    AVG(spo2) as avg_spo2,
    AVG(temperature) as avg_temperature,
    AVG(systolic_bp) as avg_systolic_bp,
    SUM(is_anomaly) as total_anomalies,
    COUNT(*) as total_readings
FROM base
GROUP BY patient_id