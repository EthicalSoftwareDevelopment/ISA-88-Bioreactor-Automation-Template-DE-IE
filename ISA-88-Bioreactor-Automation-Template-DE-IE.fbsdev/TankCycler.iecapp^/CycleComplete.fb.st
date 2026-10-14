FUNCTION_BLOCK CycleComplete_FB_ST
VAR_INPUT
    Cycle_Active       : BOOL;
    Fill_Complete      : BOOL;
    Mix_Complete       : BOOL;
    Heat_Complete      : BOOL;
    Discharge_Complete : BOOL;
END_VAR

VAR_OUTPUT
    T1_Cycle_Complete  : BOOL := FALSE;
    Cycle_Reset        : BOOL := FALSE;
END_VAR

// Body logic
IF Cycle_Active AND Fill_Complete AND Mix_Complete AND Heat_Complete AND Discharge_Complete THEN
    T1_Cycle_Complete := TRUE;
    Cycle_Reset := TRUE;   // signal to reset latch in TankCycle_FB
ELSE
    T1_Cycle_Complete := FALSE;
    Cycle_Reset := FALSE;
END_IF;

IF Cycle_Active AND Discharge_Complete THEN
    T1_Cycle_Complete := TRUE;
    Cycle_Active := FALSE;   // reset latch
END_IF;


END_FUNCTION_BLOCK
