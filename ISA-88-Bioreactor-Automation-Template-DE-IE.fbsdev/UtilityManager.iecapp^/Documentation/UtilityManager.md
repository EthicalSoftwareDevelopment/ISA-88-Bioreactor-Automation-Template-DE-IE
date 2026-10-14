# UtilityMonitor

## Purpose
The **Utility Monitor** tracks the availability of essential plant utilities required for safe operation of the bioreactor demo.  
It ensures that subsystems (PumpController, ThermalManager, CIPManager, etc.) only run when utilities such as steam, chilled water, and compressed air are available.

## Responsibilities
- Monitor digital inputs or status flags for each utility.
- Provide consolidated `Utilities_OK` flag for InterlockManager and CIPManager.
- Signal utility failures to AlarmCtrl for operator visibility.
- Prevent subsystem operation when utilities are unavailable.

## Inputs
- `Steam_Available : BOOL`
- `ChilledWater_Available : BOOL`
- `Air_Available : BOOL`

## Outputs
- `Utilities_OK : BOOL` — TRUE if all required utilities are available.
- `Steam_OK : BOOL`
- `ChilledWater_OK : BOOL`
- `Air_OK : BOOL`
