PROGRAM PLC_PRG
VAR
    FillStage      : FillStage_FB_ST;
    MixStage       : MixStage_FB_ST;
    HeatStage      : HeatStage_FB_ST;
    DischargeStage : DischargeStage_FB_ST;
    CycleComplete  : CycleComplete_FB_ST;
END_VAR

// implementation here...
// TankCycle orchestrates the sequence
TankCycle(
    Start_Cycle     := GV_TankFarm.Start_Cycle,
    T1_Level_High   := GV_TankFarm.T1_Level_High,
    T1_Level_Low    := GV_TankFarm.T1_Level_Low,
    T1_Temp_Value   := GV_TankFarm.T1_Temp_Sensor,
    T1_Temp_Setpoint:= GV_TankFarm.T1_Temp_Setpoint
);

// FillStage
FillStage(
    Start_Fill    := TankCycle.Cycle_Active,
    Tn_Level_High := GV_TankFarm.T1_Level_High
);

// MixStage
MixStage(
    Cycle_Active  := TankCycle.Cycle_Active,
    Fill_Complete := FillStage.Fill_Complete
);

// HeatStage
HeatStage(
    Cycle_Active     := TankCycle.Cycle_Active,
    Mix_Complete     := MixStage.Mix_Complete,
    Tn_Temp_Value    := GV_TankFarm.T1_Temp_Sensor,
    Tn_Temp_Setpoint := TankCycle.Tn_Temp_Setpoint
);

// DischargeStage
DischargeStage(
    Cycle_Active   := TankCycle.Cycle_Active,
    Heat_Complete  := HeatStage.Heat_Complete,
    Tn_Level_Low   := GV_TankFarm.T1_Level_Low
);

// CycleComplete
CycleComplete(
    Cycle_Active       := TankCycle.Cycle_Active,
    Fill_Complete      := FillStage.Fill_Complete,
    Mix_Complete       := MixStage.Mix_Complete,
    Heat_Complete      := HeatStage.Heat_Complete,
    Discharge_Complete := DischargeStage.Discharge_Complete
);

// Reset logic
IF CycleComplete.Cycle_Reset THEN
    TankCycle.Cycle_Active := FALSE;
END_IF;


END_PROGRAM
