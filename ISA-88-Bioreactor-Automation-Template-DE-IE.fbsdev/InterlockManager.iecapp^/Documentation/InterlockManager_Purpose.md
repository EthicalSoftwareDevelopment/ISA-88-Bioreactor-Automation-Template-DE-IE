# InterlockManager

## Purpose
The **Interlock Manager** enforces plant-wide safety rules by preventing unsafe combinations of subsystem operations.  
It ensures that pumps, heaters, mixers, and valves only run when conditions are safe, protecting equipment and operators.

## Responsibilities
- Collect interlock conditions from subsystems (TankCycler, PumpController, ThermalManager, MixerController, CIPManager).
- Block actuator outputs when unsafe states are detected (e.g., heater on with empty tank).
- Provide consolidated `Interlock_OK` flags to subsystems.
- Signal interlock violations to AlarmCtrl for operator visibility.

## Typical Interlocks
- Heater disabled if tank is empty.
- Pump disabled if outlet valve closed.
- Mixer disabled during CIP cycle.
- CIP cycle blocked if production cycle active.
