FUNCTION_BLOCK SterilizeStage_FB_ST
VAR_INPUT
    Start_Sterilize    : BOOL;
    Temp_Sensor        : REAL;
    Sterilize_Setpoint : REAL;
END_VAR

VAR_OUTPUT
    Heater              : BOOL := FALSE;
    Sterilize_Complete  : BOOL := FALSE;
END_VAR

// Logic
IF Start_Sterilize AND NOT Sterilize_Complete THEN
    Heater := (Temp_Sensor < Sterilize_Setpoint);

    IF Temp_Sensor >= Sterilize_Setpoint THEN
        Sterilize_Complete := TRUE;
        Heater := FALSE;
    END_IF;
END_IF;
