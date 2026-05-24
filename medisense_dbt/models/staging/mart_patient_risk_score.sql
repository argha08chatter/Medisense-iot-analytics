WITH anomaly_counts AS (
    SELECT
        patient_id,
        COUNT(*) as total_anomalies,
        SUM(hr_flag) as hr_anomalies,
        SUM(spo2_flag) as spo2_anomalies,
        SUM(temp_flag) as temp_anomalies,
        SUM(bp_flag) as bp_anomalies,
    FROM `medisense-project.medisense_dbt.mart_anomaly_flags`
    GROUP BY patient_id
)
SELECT
    patient_id,
    total_anomalies,
    hr_anomalies,
    spo2_anomalies,
    temp_anomalies,
    bp_anomalies,
    ROUND((hr_anomalies * 0.3) + (spo2_anomalies * 0.4) + (temp_anomalies * 0.2) + (bp_anomalies * 0.1), 2) as risk_score
FROM anomaly_counts
ORDER BY risk_score DESC