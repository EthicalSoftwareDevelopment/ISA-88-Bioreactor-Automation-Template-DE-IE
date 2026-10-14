# 🧪 Bioreactor Automation Program Roadmap

## 1. PROGRAM MAIN_ST
- **Role:** Orchestrator of the entire plant.
- **Top Panel:** Declare FB instances (TankCycle, FillStage, MixStage, HeatStage, DischargeStage, CIPCycle, AlarmHandler, UtilityMonitor, CycleComplete).
- **Bottom Panel:** Call FBs in sequence, wire them to global variables, handle plant-wide interlocks (Start/Stop, Emergency, Alarm reset).

---

## 2. FUNCTION_BLOCK Files (each in its own file)
These define reusable logic modules. Each FB file has:
- **Top Panel:** `FUNCTION_BLOCK <Name>` + `VAR_INPUT` / `VAR_OUTPUT`.
- **Bottom Panel:** Logic + `END_FUNCTION_BLOCK`.

### Example FBs:
- **TankCycle_FB_ST**
  - Inputs: Start/Stop, Level sensors, Temp sensors.
  - Outputs: Cycle_Active, Temp_Setpoint.
  - Logic: Latch cycle, reset on Stop or Level_High.

- **FillStage_FB_ST**
  - Inputs: Cycle_Active, Level sensors.
  - Outputs: Fill_Complete.
  - Logic: Control inlet valve until Level_High.

- **MixStage_FB_ST**
  - Inputs: Cycle_Active, Fill_Complete.
  - Outputs: Mix_Complete.
  - Logic: Run mixer motor for set time.

- **HeatStage_FB_ST**
  - Inputs: Cycle_Active, Mix_Complete, Temp sensor.
  - Outputs: Heat_Complete.
  - Logic: Control heater until Temp reaches setpoint.

- **DischargeStage_FB_ST**
  - Inputs: Cycle_Active, Heat_Complete.
  - Outputs: Discharge_Complete.
  - Logic: Open outlet valve until Level_Low.

- **CIPCycle_FB_ST**
  - Inputs: CIP_Start, CIP_Stop.
  - Outputs: CIP_Complete.
  - Logic: Cleaning/sterilization sequence.

- **AlarmHandler_FB_ST**
  - Inputs: All critical sensors (Temp high, Level fault, Valve stuck).
  - Outputs: Alarm flags.
  - Logic: Collect alarms, drive interlocks.

- **UtilityMonitor_FB_ST**
  - Inputs: Utility status (Air, Steam, Water).
  - Outputs: Utility_OK.
  - Logic: Check utilities before cycle start.

- **CycleComplete_FB_ST**
  - Inputs: Fill/Mix/Heat/Discharge complete flags.
  - Outputs: Cycle_Reset.
  - Logic: Reset TankCycle when all stages complete.

---

## 3. Global Variable File (GV_TankFarm)
- **Role:** Central mapping of I/O.
- **Contents:** Sensors, actuators, alarms, setpoints.
- **Naming convention:** Prefixes (`T1_`, `CIP_`, `Alarm_`) for clarity.

---

## 4. Optional Support Programs
- **PROGRAM CIP_ST** (if you want CIP logic separate from MAIN).
- **PROGRAM Diagnostics_ST** (for testing sensors/actuators independently).
- **PROGRAM Simulation_ST** (for offline simulation or training).

---

# ⚡ Best Practice Flow
1. **GV_TankFarm** → holds all I/O mappings.  
2. **FB files** → encapsulate subsystem logic.  
3. **MAIN_ST** → orchestrates FBs, handles interlocks, resets.  
4. **Optional programs** → CIP, Diagnostics, Simulation (if needed).  

👉 Keep **only one PROGRAM MAIN_ST** for orchestration. Everything else should be a `FUNCTION_BLOCK` in its own file.
