FUNCTION_BLOCK PreFlushStage_FB_ST
VAR_INPUT
    Start_PreFlush : BOOL;
    Flow_Sensor    : BOOL;
END_VAR

VAR_OUTPUT
    Valve_Inlet       : BOOL := FALSE;
    Pump              : BOOL := FALSE;
    PreFlush_Complete : BOOL := FALSE;
END_VAR

// Logic
IF Start_PreFlush AND NOT PreFlush_Complete THEN
    Valve_Inlet := TRUE;
    Pump := TRUE;

    // Replace with TON timer for flush duration
    IF Flow_Sensor THEN
        PreFlush_Complete := TRUE;
        Valve_Inlet := FALSE;
        Pump := FALSE;
    END_IF;
END_IF;
