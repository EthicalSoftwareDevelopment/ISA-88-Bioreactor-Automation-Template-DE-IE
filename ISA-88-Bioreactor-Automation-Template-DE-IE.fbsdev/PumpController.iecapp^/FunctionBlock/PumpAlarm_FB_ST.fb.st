FUNCTION_BLOCK PumpAlarm_FB_ST
VAR_INPUT
    Pump_Discharge : BOOL;   // pump running
    Tn_Level_Low   : BOOL;   // tank empty sensor
    PT             : TIME := T#5s; // timeout duration
END_VAR

VAR_OUTPUT
    Pump_Alarm : BOOL := FALSE;
END_VAR

VAR
    TON_Alarm : TON; // IEC timer instance
END_VAR

// Alarm logic
IF Pump_Discharge AND NOT Tn_Level_Low THEN
    TON_Alarm(IN := TRUE, PT := PT);
ELSE
    TON_Alarm(IN := FALSE, PT := PT);
    Pump_Alarm := FALSE;
END_IF;

IF TON_Alarm.Q THEN
    Pump_Alarm := TRUE;
END_IF;
