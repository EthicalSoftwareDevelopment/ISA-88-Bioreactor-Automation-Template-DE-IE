FUNCTION_BLOCK TankCycle_FB_ST
FUNCTION_BLOCK TankCycle_FB_ST
VAR_INPUT
    Start_Cycle       : BOOL;   // trigger to start cycle
    Tn_Level_High     : BOOL;   // tank full sensor
    Tn_Level_Low      : BOOL;   // tank empty sensor
    Tn_Temp_Value     : REAL;   // current temperature
    Tn_Temp_Setpoint  : REAL;   // desired temperature
END_VAR

VAR_OUTPUT
    Valve_Inlet       : BOOL := FALSE;
    Mixer_Motor       : BOOL := FALSE;
    Heater            : BOOL := FALSE;
    Valve_Outlet      : BOOL := FALSE;
    Cycle_Complete    : BOOL := FALSE;
END_VAR
VAR
    Fill_Complete     : BOOL := FALSE;
    Mix_Complete      : BOOL := FALSE;
    Heat_Complete     : BOOL := FALSE;
    Discharge_Complete: BOOL := FALSE;
END_VAR

// implementation here...

// Sequence logic
IF Start_Cycle AND NOT Fill_Complete THEN
    Valve_Inlet := NOT Tn_Level_High;
    IF Tn_Level_High THEN
        Fill_Complete := TRUE;
        Valve_Inlet := FALSE;
    END_IF;
END_IF;

IF Fill_Complete AND NOT Mix_Complete THEN
    Mixer_Motor := TRUE;
    // Example: mixing runs for 10s
    // (replace with TON timer instance in real project)
    Mix_Complete := TRUE; // stub: set after timer
    Mixer_Motor := FALSE;
END_IF;

IF Mix_Complete AND NOT Heat_Complete THEN
    Heater := (Tn_Temp_Value < Tn_Temp_Setpoint);
    IF Tn_Temp_Value >= Tn_Temp_Setpoint THEN
        Heat_Complete := TRUE;
        Heater := FALSE;
    END_IF;
END_IF;

IF Heat_Complete AND NOT Discharge_Complete THEN
    Valve_Outlet := NOT Tn_Level_Low;
    IF Tn_Level_Low THEN
        Discharge_Complete := TRUE;
        Valve_Outlet := FALSE;
    END_IF;
END_IF;

IF Discharge_Complete THEN
    Cycle_Complete := TRUE;
END_IF;

END_FUNCTION_BLOCK
