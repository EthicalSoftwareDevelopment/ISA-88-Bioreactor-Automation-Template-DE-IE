PROGRAM PLC_PRG
VAR
    // Supervisory
    CycleMgr      : CycleManager_FB_ST;

    // Submodules
    TankCycle     : TankCycler_FB_ST;
    PumpCtrl      : PumpController_FB_ST;
    ThermalCtrl   : ThermalManager_FB_ST;
    MixerCtrl     : MixerController_FB_ST;
    CIPCtrl       : CIPManager_FB_ST;
    AlarmCtrl     : AlarmCtrl_FB_ST;
    InterlockCtrl : InterlockManager_FB_ST;
    UtilityCtrl   : UtilityMonitor_FB_ST;
    BatchCtrl     : BatchCounter_FB_ST;

    // Operator inputs
    Global_Start  : BOOL;
    Global_Stop   : BOOL;

    // Supervisory outputs
    Plant_Active     : BOOL;
    Plant_Stopped    : BOOL;
    Tank1_StartCycle : BOOL;
    Tank1_StartCIP   : BOOL;
END_VAR

// --- Supervisory orchestration ---
CycleMgr(
    Global_Start := Global_Start,
    Global_Stop := Global_Stop,
    Tank1_CycleComplete := TankCycle.Cycle_Complete,
    Tank2_CycleComplete := FALSE, // add if you have Tank2
    CIP_Complete_T1 := CIPCtrl.CIP_Complete,
    CIP_Complete_T2 := FALSE,
    Utilities_OK := UtilityCtrl.Utilities_OK,
    Interlock_OK := InterlockCtrl.Interlock_OK,
    Plant_Active => Plant_Active,
    Plant_Stopped => Plant_Stopped,
    Tank1_StartCycle => Tank1_StartCycle,
    Tank1_StartCIP => Tank1_StartCIP
);

// --- Submodules execution ---
TankCycle(
    Start_Cycle := Tank1_StartCycle,
    Stop_Cycle := Global_Stop,
    T1_Level_High := T1_Level_High,
    T1_Level_Low := T1_Level_Low,
    T1_Temp_Sensor := T1_Temp_Sensor,
    T1_Temp_Setpoint := T1_Temp_Setpoint
);

PumpCtrl(
    Cycle_Active := TankCycle.Cycle_Active,
    Discharge_Complete := TankCycle.Discharge_Complete
);

ThermalCtrl(
    Cycle_Active := TankCycle.Cycle_Active,
    Mix_Complete := TankCycle.Mix_Complete,
    Tn_Temp_Value := T1_Temp_Sensor,
    Tn_Temp_Setpoint := T1_Temp_Setpoint
);

MixerCtrl(
    Cycle_Active := TankCycle.Cycle_Active,
    Fill_Complete := TankCycle.Fill_Complete
);

CIPCtrl(
    Start_CIP := Tank1_StartCIP,
    Cycle_Complete := TankCycle.Cycle_Complete
);

AlarmCtrl(
    Pump_Alarm := PumpCtrl.Pump_Alarm,
    Thermal_Alarm := ThermalCtrl.Thermal_Alarm,
    Mixer_Alarm := MixerCtrl.Mixer_Alarm,
    CIP_Alarm := CIPCtrl.CIP_Alarm,
    Ack_Alarm := Ack_Alarm
);

InterlockCtrl(
    Cycle_Active := TankCycle.Cycle_Active,
    Utility_OK := UtilityCtrl.Utilities_OK
);

UtilityCtrl(); // monitors steam, water, air

BatchCtrl(
    Cycle_Complete := TankCycle.Cycle_Complete,
    Reset_Counter := Reset_Counter
);
