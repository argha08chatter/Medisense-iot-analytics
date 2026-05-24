import pandas as pd
import numpy as np

NUMBER_OF_PATIENTS = 100
READINGS_PER_PATIENT = 10000
ANOMALY_RATE = 0.05

all_data = []

for i in range(1, NUMBER_OF_PATIENTS + 1):
    patient_id = f'Patient_{i:03d}'
    for j in range(READINGS_PER_PATIENT):
        is_anomaly = np.random.random() < ANOMALY_RATE
        if is_anomaly:
            Heart_rate = round(float(np.random.choice([np.random.normal(35, 3), np.random.normal(140, 5)])), 1)
        else:
            Heart_rate = round(float(np.random.normal(80, 10)), 1)
        if is_anomaly:
            SPO2 = round(float(np.random.normal(85, 3)), 1)
        else:
            SPO2 = round(float(np.random.normal(97, 1.5)), 1)
        if is_anomaly:
            Temperature = round(float(np.random.choice([np.random.normal(34, 0.5), np.random.normal(40, 0.5)])), 1)
        else:
            Temperature = round(float(np.random.normal(37.0, 0.3)), 1)
        if is_anomaly:
            Systolic_BP = round(float(np.random.choice([np.random.normal(75, 5), np.random.normal(185, 5)])), 1)
        else:
            Systolic_BP = round(float(np.random.normal(115, 10)), 1)
        row={
            'Patient_ID': patient_id,
            'Reading_NO': j + 1,
            'Heart_Rate': np.random.normal(80, 10),
            'SPO2': np.random.normal(97, 1.5),
            'Temperature': np.random.normal(37.0, 0.3),
            'Systolic_BP': np.random.normal(115, 10),
            'is_Anomaly' : int(is_anomaly)
        }
        all_data.append(row)

df = pd.DataFrame(all_data)
df.to_csv('simulated_patient_data.csv', index=False)
total = len(df)
anomalies = df['is_Anomaly'].sum()
print(f"Done! Generated {total} rows")
print(f"Anomalies injected: {anomalies} ({(anomalies/total)*100:.1f}%)")
print()
print(df.head(10))
print()
print("Anomaly examples:")
print(df[df['is_Anomaly'] == 1].head(5))