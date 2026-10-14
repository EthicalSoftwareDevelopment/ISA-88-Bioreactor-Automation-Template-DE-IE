FUNCTION_BLOCK WashStage_FB_ST
VAR_INPUT
    Start_Wash    : BOOL;
    Temp_Sensor   : REAL;
    Temp_Setpoint : REAL;
END_VAR

VAR_OUTPUT
    Pump          : BOOL := FALSE;
    Heater        : BOOL := FALSE;
    Wash_Complete : BOOL := FALSE;
END_VAR

// Logic
IF Start_Wash AND NOT Wash_Complete THEN
    Pump := TRUE;
    Heater := (Temp_Sensor < Temp_Setpoint);

    IF Temp_Sensor >= Temp_Setpoint THEN
        Wash_Complete := TRUE;
        Pump := FALSE;
        Heater := FALSE;
    END_IF;
END_IF;
