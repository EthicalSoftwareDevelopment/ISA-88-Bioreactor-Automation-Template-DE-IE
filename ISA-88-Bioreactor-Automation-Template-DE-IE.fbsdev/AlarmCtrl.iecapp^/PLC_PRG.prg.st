FUNCTION_BLOCK PLC_PRG
VAR_INPUT
    Pump_Alarm    : BOOL;
    Thermal_Alarm : BOOL;
    Mixer_Alarm   : BOOL;
    CIP_Alarm     : BOOL;
    Ack_Alarm     : BOOL;
END_VAR

VAR_OUTPUT
    Alarm_Active  : BOOL := FALSE;
    Alarm_Code    : INT := 0;
    Alarm_Message : STRING(80) := '';
    Alarm_Latched : BOOL := FALSE;
END_VAR

// Logic
IF (Pump_Alarm OR Thermal_Alarm OR Mixer_Alarm OR CIP_Alarm) THEN
    Alarm_Active := TRUE;
    Alarm_Latched := TRUE;

    IF Pump_Alarm THEN
        Alarm_Code := 1;
        Alarm_Message := 'Pump fault detected';
    ELSIF Thermal_Alarm THEN
        Alarm_Code := 2;
        Alarm_Message := 'Thermal over-temperature';
    ELSIF Mixer_Alarm THEN
        Alarm_Code := 3;
        Alarm_Message := 'Mixer overload';
    ELSIF CIP_Alarm THEN
        Alarm_Code := 4;
        Alarm_Message := 'CIP cycle abnormal';
    END_IF;
END_IF;

// Acknowledge/reset
IF Ack_Alarm THEN
    Alarm_Active := FALSE;
    Alarm_Latched := FALSE;
    Alarm_Code := 0;
    Alarm_Message := '';
END_IF;
