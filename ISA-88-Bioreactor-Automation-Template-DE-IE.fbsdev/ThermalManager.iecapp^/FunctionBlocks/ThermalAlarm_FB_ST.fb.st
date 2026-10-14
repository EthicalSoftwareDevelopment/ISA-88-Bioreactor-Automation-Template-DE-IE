FUNCTION_BLOCK ThermalAlarm_FB_ST
VAR_INPUT
    Tn_Temp_Value : REAL;   // current tank temperature
    Tn_Temp_Max   : REAL;   // maximum safe temperature
END_VAR

VAR_OUTPUT
    Thermal_Alarm : BOOL := FALSE;
END_VAR

// Alarm logic
IF Tn_Temp_Value > Tn_Temp_Max THEN
    Thermal_Alarm := TRUE;
ELSE
    Thermal_Alarm := FALSE;
END_IF;
