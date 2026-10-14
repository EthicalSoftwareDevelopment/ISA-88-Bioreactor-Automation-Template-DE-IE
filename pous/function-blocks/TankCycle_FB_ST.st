FUNCTION_BLOCK TankCycle_FB_ST
VAR_INPUT
    Start_Cycle     : BOOL;   // trigger to start cycle
    Stop_Cycle      : BOOL;   // trigger to stop cycle
    T1_Level_High   : BOOL;   // sensor input
    T1_Temp_Sensor  : INT;    // temperature input
END_VAR

FUNCTION_BLOCK TankCycle_FB_ST
VAR_INPUT
    Start_Cycle     : BOOL;   // trigger to start cycle
    Stop_Cycle      : BOOL;   // trigger to stop cycle
    T1_Level_High   : BOOL;   // sensor input
    T1_Temp_Sensor  : INT;    // temperature input
END_VAR

VAR_OUTPUT
    Cycle_Active    : BOOL := FALSE; // latch for active cycle
    T1_Temp_Setpoint: INT := 60;     // default setpoint
END_VAR

// Body logic
IF Stop_Cycle THEN
    Cycle_Active := FALSE;
ELSIF Start_Cycle THEN
    Cycle_Active := TRUE;
END_IF;

// Example: reset if tank is full
IF T1_Level_High AND Cycle_Active THEN
    Cycle_Active := FALSE;
END_IF;

END_FUNCTION_BLOCK

END_FUNCTION_BLOCK