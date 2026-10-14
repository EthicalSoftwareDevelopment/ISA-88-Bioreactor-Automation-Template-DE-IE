PROGRAM MAIN_ST
VAR
    FillStage      : FillStage_FB_ST;
    MixStage       : MixStage_FB_ST;
    HeatStage      : HeatStage_FB_ST;
    DischargeStage : DischargeStage_FB_ST;
    CycleComplete  : CycleComplete_FB_ST;
END_VAR

PROGRAM MAIN_ST
TankCycle(
    Start_Cycle     := GV_TankFarm.Start_Cycle,
    Stop_Cycle      := GV_TankFarm.Stop_Cycle,
    T1_Level_High   := GV_TankFarm.T1_Level_High,
    T1_Temp_Sensor  := GV_TankFarm.T1_Temp_Sensor
);

FillStage(
    Cycle_Active   := TankCycle_FB_ST.Cycle_Active,
    T1_Level_High  := GV_TankFarm.T1_Level_High
);

// … other FB calls …

IF CycleComplete.Cycle_Reset THEN
    TankCycle.Cycle_Active := FALSE;
END_IF;

END_PROGRAM

END_PROGRAM