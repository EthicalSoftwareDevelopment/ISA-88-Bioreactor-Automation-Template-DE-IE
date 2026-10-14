# UtilityMonitor Roadmap

## Phase 1 – Basic Demo
- Monitor simple binary flags for steam, chilled water, and compressed air.
- Provide consolidated `Utilities_OK` output.

## Phase 2 – Expanded Monitoring
- Add flow/pressure sensors for each utility.
- Provide subsystem-specific utility flags (e.g., `Heater_OK` depends on steam).

## Phase 3 – Advanced Logic
- Implement thresholds (minimum pressure, minimum temperature).
- Add configurable parameters for utility requirements.

## Phase 4 – Integration
- Connect utility failures to AlarmCtrl.
- Provide utility status visualization in SCADA/HMI.
- Log utility availability events for compliance and reporting.
