# CycleManager

## Purpose
The **Cycle Manager** acts as the supervisory controller for plant-wide orchestration.  
It coordinates multiple tanks or bioreactors, schedules production cycles, triggers CIP routines, and enforces global stop/start commands.  
By centralizing decision-making, it ensures efficient sequencing, resource sharing, and safe transitions between production and cleaning.

## Responsibilities
- Manage scheduling of multiple TankCycler instances.
- Decide when to trigger CIP cycles for each tank.
- Handle plant-wide start/stop commands.
- Coordinate interlocks and utility availability across subsystems.
- Provide supervisory flags to SCADA/HMI for operator visibility.

## Inputs
- `Global_Start : BOOL` — operator command to start plant.
- `Global_Stop : BOOL` — operator command to stop plant.
- `Tank1_CycleComplete : BOOL`
- `Tank2_CycleComplete : BOOL`
- `CIP_Complete_T1 : BOOL`
- `CIP_Complete_T2 : BOOL`
- `Utilities_OK : BOOL`
- `Interlock_OK : BOOL`

## Outputs
- `Plant_Active : BOOL`
- `Tank1_StartCycle : BOOL`
- `Tank2_StartCycle : BOOL`
- `Tank1_StartCIP : BOOL`
- `Tank2_StartCIP : BOOL`
- `Plant_Stopped : BOOL`
