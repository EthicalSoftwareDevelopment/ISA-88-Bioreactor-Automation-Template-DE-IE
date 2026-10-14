FUNCTION_BLOCK HeatStage_FB_ST
FUNCTION_BLOCK HeatStage_FB_ST
VAR_INPUT
  Cycle_Active    : BOOL;
  T1_Mix_Complete : BOOL;
  T1_Temp_Sensor  : INT;
  T1_Temp_Setpoint: INT;
END_VAR

VAR_OUTPUT
  T1_Heater       : BOOL;
  T1_Temp_Alarm   : BOOL;
  Heat_Complete   : BOOL;
END_VAR
END_FUNCTION_BLOCK

IF Cycle_Active AND T1_Mix_Complete AND (T1_Temp_Sensor < T1_Temp_Setpoint) THEN
    T1_Heater := TRUE;
ELSE
    T1_Heater := FALSE;
END_IF;

IF Cycle_Active AND T1_Mix_Complete AND (T1_Temp_Sensor > T1_Temp_Setpoint) THEN
    T1_Temp_Alarm := TRUE;
ELSE
    T1_Temp_Alarm := FALSE;
END_IF;

IF Cycle_Active AND T1_Mix_Complete AND (T1_Temp_Sensor >= T1_Temp_Setpoint) THEN
    Heat_Complete := TRUE;
END_IF;


END_FUNCTION_BLOCK