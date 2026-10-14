FUNCTION_BLOCK PumpController_FB_ST
VAR_INPUT
    Cycle_Active     : BOOL;   // cycle running
    Stage_Ready      : BOOL;   // stage condition met
    Tn_Level_Low     : BOOL;   // tank empty sensor
END_VAR

VAR_OUTPUT
    Pump_Discharge   : BOOL := FALSE;
    Discharge_Complete : BOOL := FALSE;
END_VAR

// Pump control logic
IF Cycle_Active AND Stage_Ready THEN
    Pump_Discharge := NOT Tn_Level_Low;
    IF Tn_Level_Low THEN
        Discharge_Complete := TRUE;
        Pump_Discharge := FALSE;
    END_IF;
ELSE
    Pump_Discharge := FALSE;
    Discharge_Complete := FALSE;
END_IF;
