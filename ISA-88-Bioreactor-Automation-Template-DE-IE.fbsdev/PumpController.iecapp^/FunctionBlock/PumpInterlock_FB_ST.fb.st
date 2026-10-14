FUNCTION_BLOCK PumpInterlock_FB_ST
VAR_INPUT
    Heater : BOOL; // heater ON/OFF
END_VAR

VAR_OUTPUT
    Pump_Enable : BOOL := FALSE;
END_VAR

// Interlock logic
Pump_Enable := NOT Heater;
