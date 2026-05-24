WITH source AS (
    SELECT
        Patient_ID as patient_id,
        Reading_NO as reading_no,
        Heart_Rate as heart_rate,
        SPO2 as spo2,
        Temperature as temperature,
        Systolic_BP as systolic_bp,
        is_Anomaly as is_anomaly
        FROM `medisense-project.medisense_raw.raw_sensor_readings`
)
SELECT * FROM source