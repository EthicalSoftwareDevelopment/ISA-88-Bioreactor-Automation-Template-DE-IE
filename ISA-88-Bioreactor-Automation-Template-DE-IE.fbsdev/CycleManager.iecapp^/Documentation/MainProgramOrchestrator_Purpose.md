# Global Project Main (PLC_PRG)

## Purpose
Acts as the top-level orchestrator for the bioreactor demo.  
Coordinates all subsystem applications and ensures safe, sequential operation.

## Responsibilities
- Start/stop tank cycles.
- Call submodules in correct order.
- Monitor alarms and interlocks.
- Manage utilities and CIP routines.
- Provide supervisory signals to HMI/SCADA.

## Submodules Called
- TankCycler
- PumpController
- MixerController
- ThermalManager
- CIPManager
- AlarmHandler
- InterlockManager
- UtilityMonitor
- BatchCounter
- CycleManager (if multi-tank)

## Outputs
- Plant-wide `Cycle_Active` and `Cycle_Complete`.
- Consolidated alarm signals.
- Batch count for reporting.
- Utility status flags.
