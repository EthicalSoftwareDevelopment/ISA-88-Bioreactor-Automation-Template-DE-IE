FUNCTION_BLOCK CIPManager_FB_ST
VAR_INPUT
    Start_CIP       : BOOL;   // Operator command to start CIP
    Stop_CIP        : BOOL;   // Operator command to stop CIP
    Tank_Empty      : BOOL;   // TRUE if tank is empty (required for CIP)
    CIP_Temp_Sensor : REAL;   // Temperature feedback
    CIP_Flow_Sensor : BOOL;   // Flow feedback
END_VAR

VAR_OUTPUT
    CIP_Active   : BOOL := FALSE; // TRUE while CIP is running
    CIP_Complete : BOOL := FALSE; // TRUE when all stages finished

    // Stage control signals
    PreFlush_Start   : BOOL := FALSE;
    Wash_Start       : BOOL := FALSE;
    Rinse_Start      : BOOL := FALSE;
    Sterilize_Start  : BOOL := FALSE;

    PreFlush_Stop    : BOOL := FALSE;
    Wash_Stop        : BOOL := FALSE;
    Rinse_Stop       : BOOL := FALSE;
    Sterilize_Stop   : BOOL := FALSE;

    // Stage completion flags (fed back from stage FBs)
    PreFlush_Complete : BOOL := FALSE;
    Wash_Complete     : BOOL := FALSE;
    Rinse_Complete    : BOOL := FALSE;
    Sterilize_Complete: BOOL := FALSE;
END_VAR

VAR
    StageStep : INT := 0; // 0=Idle, 1=PreFlush, 2=Wash, 3=Rinse, 4=Sterilize
END_VAR

// --- CIP orchestration logic ---
IF Stop_CIP THEN
    // Reset everything
    CIP_Active := FALSE;
    CIP_Complete := FALSE;
    StageStep := 0;

    PreFlush_Start := FALSE; Wash_Start := FALSE;
    Rinse_Start := FALSE; Sterilize_Start := FALSE;

    PreFlush_Stop := TRUE; Wash_Stop := TRUE;
    Rinse_Stop := TRUE; Sterilize_Stop := TRUE;
END_IF;

// Start sequence
IF Start_CIP AND Tank_Empty AND (StageStep = 0) THEN
    CIP_Active := TRUE;
    CIP_Complete := FALSE;
    StageStep := 1;
    PreFlush_Start := TRUE;
END_IF;

// Stage transitions
CASE StageStep OF
    1: // PreFlush
        IF PreFlush_Complete THEN
            PreFlush_Start := FALSE;
            PreFlush_Stop := TRUE;
            StageStep := 2;
            Wash_Start := TRUE;
        END_IF;

    2: // Wash
        IF Wash_Complete THEN
            Wash_Start := FALSE;
            Wash_Stop := TRUE;
            StageStep := 3;
            Rinse_Start := TRUE;
        END_IF;

    3: // Rinse
        IF Rinse_Complete THEN
            Rinse_Start := FALSE;
            Rinse_Stop := TRUE;
            StageStep := 4;
            Sterilize_Start := TRUE;
        END_IF;

    4: // Sterilize
        IF Sterilize_Complete THEN
            Sterilize_Start := FALSE;
            Sterilize_Stop := TRUE;
            StageStep := 0;
            CIP_Active := FALSE;
            CIP_Complete := TRUE;
        END_IF;
END_CASE;
