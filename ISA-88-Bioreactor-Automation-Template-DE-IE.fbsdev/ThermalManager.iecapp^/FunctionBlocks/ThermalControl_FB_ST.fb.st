FUNCTION_BLOCK ThermalControl_FB_ST
VAR_INPUT
    Cycle_Active     : BOOL;   // cycle running
    Mix_Complete     : BOOL;   // mixing finished
    Tn_Temp_Value    : REAL;   // current temperature
    Tn_Temp_Setpoint : REAL;   // desired setpoint
END_VAR

VAR_OUTPUT
    Heater           : BOOL := FALSE;
    Heat_Complete    : BOOL := FALSE;
END_VAR

// Heat control logic
IF Cycle_Active AND Mix_Complete THEN
    Heater := (Tn_Temp_Value < Tn_Temp_Setpoint);
    IF Tn_Temp_Value >= Tn_Temp_Setpoint THEN
        Heat_Complete := TRUE;
        Heater := FALSE;
    END_IF;
ELSE
    Heater := FALSE;
    Heat_Complete := FALSE;
END_IF;
