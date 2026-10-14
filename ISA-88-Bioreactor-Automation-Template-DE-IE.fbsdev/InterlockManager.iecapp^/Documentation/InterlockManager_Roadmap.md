# InterlockManager Roadmap

## Phase 1 – Basic Demo
- Implement simple binary interlocks (heater vs empty tank, pump vs closed valve).
- Provide a single `Interlock_OK` flag.

## Phase 2 – Expanded Coverage
- Add mixer and CIP interlocks.
- Provide subsystem-specific interlock flags (e.g., `Pump_OK`, `Heater_OK`).

## Phase 3 – Advanced Logic
- Implement conditional interlocks (e.g., allow pump only if both valve open AND utility available).
- Add configurable parameters for interlock rules.

## Phase 4 – Integration
- Connect interlock violations to AlarmCtrl.
- Provide interlock status visualization in SCADA/HMI.
- Log interlock events for compliance and reporting.
