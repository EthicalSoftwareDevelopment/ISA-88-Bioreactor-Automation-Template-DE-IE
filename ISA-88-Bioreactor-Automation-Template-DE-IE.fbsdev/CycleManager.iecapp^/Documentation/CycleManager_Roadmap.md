# CycleManager Roadmap

## Phase 1 – Basic Demo
- Orchestrate two TankCycler instances.
- Trigger CIP after each cycle completes.
- Provide simple plant-wide start/stop.

## Phase 2 – Expanded Scheduling
- Add support for multiple tanks (scalable).
- Implement round-robin or priority scheduling.
- Allow operator override for cycle order.

## Phase 3 – Advanced Features
- Integrate with InterlockManager and UtilityMonitor.
- Add recipe-based scheduling (different cycle types).
- Provide supervisory flags for SCADA visualization.

## Phase 4 – Integration
- Connect to AlarmCtrl for plant-wide fault handling.
- Log cycle and CIP events for compliance.
- Provide reporting on throughput and downtime.
