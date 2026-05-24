Medisense - IoT Patient Vitals Analytics Pipeline
Project Overview
End-to-End healthcare analytics pipeline simulating a hospital IoT sensor network.
Processs **1M+ patient readings** to detect critical vital sign anommalies in real time.

Tech Stack
Python | pandas | BigQuery | dbt | Looker Studio | Git

Architecture
IoT Sensors → Python Simulation → BigQuery → dbt Models → Looker Studio Dashboard

Key Results
- Processed **10,00,000 sensor readings** across **100 simulated patients**.
- Detected **50,000+ anomalous vital sign readings** (5% anomaly rate)
- Built 4 dbt transformation models (staging, mart, anomaly flags, risk scoring)
- Deployed live dashboard showing patient risk leaderboard

dbt Models
- stg_sensor_readings - Cleaned raw sensor data
- mart_vitals_hourly - Aggregated vitls per patient
- mart_anomaly_flags - Flagged critical readings with vital-specific flags
- mart_patient_risk_score - Composite daily score per patient

Dashboard
[View Live Dashboard]
https://datastudio.google.com/reporting/d7a6cd39-0148-489b-b11b-d1fef7cef792
