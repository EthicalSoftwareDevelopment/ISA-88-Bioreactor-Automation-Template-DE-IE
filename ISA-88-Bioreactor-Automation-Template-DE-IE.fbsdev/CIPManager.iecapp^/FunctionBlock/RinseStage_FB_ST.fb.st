FUNCTION_BLOCK RinseStage_FB_ST
VAR_INPUT
    Start_Rinse : BOOL;
    Flow_Sensor : BOOL;
END_VAR

VAR_OUTPUT
    Valve_Inlet    : BOOL := FALSE;
    Pump           : BOOL := FALSE;
    Rinse_Complete : BOOL := FALSE;
END_VAR

// Logic
IF Start_Rinse AND NOT Rinse_Complete THEN
    Valve_Inlet := TRUE;
    Pump := TRUE;

    // Replace with TON timer for rinse duration
    IF Flow_Sensor THEN
        Rinse_Complete := TRUE;
        Valve_Inlet := FALSE;
        Pump := FALSE;
    END_IF;
END_IF;
