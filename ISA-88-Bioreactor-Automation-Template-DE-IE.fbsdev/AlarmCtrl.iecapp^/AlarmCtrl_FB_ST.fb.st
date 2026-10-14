FUNCTION_BLOCK AlarmCtrl_FB_ST
VAR_INPUT
    Pump_Alarm    : BOOL;   // Fault from PumpController
    Thermal_Alarm : BOOL;   // Over-temperature from ThermalManager
    Mixer_Alarm   : BOOL;   // Overload from MixerController
    CIP_Alarm     : BOOL;   // Abnormal condition from CIPManager
    Ack_Alarm     : BOOL;   // Operator acknowledgment/reset
END_VAR

VAR_OUTPUT
    Alarm_Active  : BOOL := FALSE;          // TRUE if any alarm present
    Alarm_Code    : INT := 0;               // Numeric code for active alarm
    Alarm_Message : STRING(80) := '';       // Text message for HMI/SCADA
    Alarm_Latched : BOOL := FALSE;          // Latched until acknowledged
END_VAR

// Main alarm logic
IF (Pump_Alarm OR Thermal_Alarm OR Mixer_Alarm OR CIP_Alarm) THEN
    Alarm_Active := TRUE;
    Alarm_Latched := TRUE;

    // Prioritize alarms in order of severity
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

// Reset logic when operator acknowledges
IF Ack_Alarm THEN
    Alarm_Active := FALSE;
    Alarm_Latched := FALSE;
    Alarm_Code := 0;
    Alarm_Message := '';
END_IF;
