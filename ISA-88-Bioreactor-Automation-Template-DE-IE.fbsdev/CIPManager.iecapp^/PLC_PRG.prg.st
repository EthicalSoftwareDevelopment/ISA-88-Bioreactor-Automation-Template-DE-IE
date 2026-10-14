PROGRAM PLC_PRG
VAR
    // CIP Manager
    CIPMgr : CIPManager_FB_ST;

    // Stage FBs
    PreFlushStage : PreFlushStage_FB_ST;
    WashStage     : WashStage_FB_ST;
    RinseStage    : RinseStage_FB_ST;
    SterilizeStage: SterilizeStage_FB_ST;

    // Inputs
    Start_CIP       : BOOL;
    Stop_CIP        : BOOL;
    CIP_Temp_Sensor : REAL;
    CIP_Flow_Sensor : BOOL;
    Tank_Empty      : BOOL;

    // Outputs
    CIP_Active   : BOOL;
    CIP_Complete : BOOL;
END_VAR

// --- CIP Manager orchestration ---
CIPMgr(
    Start_CIP := Start_CIP,
    Stop_CIP := Stop_CIP,
    Tank_Empty := Tank_Empty,
    CIP_Temp_Sensor := CIP_Temp_Sensor,
    CIP_Flow_Sensor := CIP_Flow_Sensor,
    CIP_Active => CIP_Active,
    CIP_Complete => CIP_Complete
);

// --- Stage calls (sequenced by CIPMgr flags) ---
PreFlushStage(
    CIP_Start := CIPMgr.PreFlush_Start,
    CIP_Stop := CIPMgr.PreFlush_Stop,
    Stage_Complete => CIPMgr.PreFlush_Complete
);

WashStage(
    CIP_Start := CIPMgr.Wash_Start,
    CIP_Stop := CIPMgr.Wash_Stop,
    Stage_Complete => CIPMgr.Wash_Complete
);

RinseStage(
    CIP_Start := CIPMgr.Rinse_Start,
    CIP_Stop := CIPMgr.Rinse_Stop,
    Stage_Complete => CIPMgr.Rinse_Complete
);

SterilizeStage(
    CIP_Start := CIPMgr.Sterilize_Start,
    CIP_Stop := CIPMgr.Sterilize_Stop,
    Stage_Complete => CIPMgr.Sterilize_Complete
);
