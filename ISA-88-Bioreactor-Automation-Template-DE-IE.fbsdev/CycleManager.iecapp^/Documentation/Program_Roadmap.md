# Bioreactor Plant Facility Demo – Suggested Applications

## 1. PumpController
- Manages pump operation, timers, alarms, and interlocks.
- Prevents dry run and ensures safe discharge.

## 2. TankCycler
- Orchestrates the full tank cycle: Fill → Mix → Thermal → Discharge.
- Provides cycle start/stop and completion flags.

## 3. ThermalManager
- Controls heating stage with timers, alarms, and interlocks.
- Ensures temperature reaches setpoint safely.

## 4. MixerController
- Runs mixer motor for homogenization.
- Includes timer for mixing duration and overload protection.

## 5. CIPManager (Cleaning-in-Place)
- Automates cleaning and sterilization cycles.
- Controls valves, pumps, and heaters for CIP/SIP routines.

## 6. AlarmHandler
- Centralized collection of alarms (overflow, motor fault, temperature high).
- Provides operator-facing alarm signals.

## 7. InterlockManager
- Supervisory safety logic across subsystems.
- Prevents unsafe combinations (e.g., heater on with empty tank).

## 8. UtilityMonitor
- Tracks availability of steam, chilled water, compressed air.
- Provides interlock flags to TankCycler and ThermalManager.

## 9. BatchCounter
- Records number of completed batches.
- Useful for reporting and production tracking.

## 10. CycleManager (Supervisory)
- High-level orchestration across multiple tanks or bioreactors.
- Decides scheduling, CIP triggers, and plant-wide stop/start.