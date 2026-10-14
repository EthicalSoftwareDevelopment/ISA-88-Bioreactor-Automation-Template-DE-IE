# AlarmCtrl

## Purpose
The **Alarm Controller** centralizes monitoring of critical conditions across the bioreactor plant demo.  
It ensures that abnormal states (temperature, pump faults, mixer overloads, valve failures) are detected and flagged for operator response.

## Responsibilities
- Collect alarm signals from subsystem controllers (PumpController, ThermalManager, MixerController, CIPManager).
- Apply logic to raise consolidated alarms (e.g., OR conditions across multiple sources).
- Provide outputs for HMI/SCADA visualization.
- Reset alarms when acknowledged by operator.

## Inputs
- `Pump_Alarm : BOOL` — fault from PumpController.
- `Thermal_Alarm : BOOL` — over-temperature from ThermalManager.
- `Mixer_Alarm : BOOL` — overload or timeout from MixerController.
- `CIP_Alarm : BOOL` — cleaning cycle abnormal condition.
- `Ack_Alarm : BOOL` — operator acknowledgment/reset.

## Outputs
- `Alarm_Active : BOOL` — any alarm present.
- `Alarm_Code : INT` — numeric code for active alarm.
- `Alarm_Message : STRING` — descriptive text for HMI.
- `Alarm_Latched : BOOL` — latched alarm until acknowledged.
