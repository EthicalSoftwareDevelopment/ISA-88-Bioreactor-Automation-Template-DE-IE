# AlarmCtrl Roadmap

## Phase 1 – Basic Demo
- Collect subsystem alarms.
- Raise a single `Alarm_Active` flag.
- Provide simple text message.

## Phase 2 – Categorization
- Assign numeric codes for each alarm type.
- Provide descriptive messages for HMI/SCADA.
- Add latch/reset logic.

## Phase 3 – Advanced Handling
- Implement alarm priorities (critical, warning).
- Support multiple simultaneous alarms.
- Add operator acknowledgment workflow.

## Phase 4 – Integration
- Connect to AlarmHandler in SCADA layer.
- Log alarm events for compliance.
- Provide alarm history and reporting.
