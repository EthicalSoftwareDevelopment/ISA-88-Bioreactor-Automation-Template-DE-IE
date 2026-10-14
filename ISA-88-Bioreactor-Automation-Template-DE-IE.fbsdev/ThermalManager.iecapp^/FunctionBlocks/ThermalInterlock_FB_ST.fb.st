FUNCTION_BLOCK ThermalInterlock_FB_ST
VAR_INPUT
    Pump_Discharge : BOOL; // pump running
    Mixer_Motor    : BOOL; // mixer running
END_VAR

VAR_OUTPUT
    Thermal_Enable : BOOL := FALSE;
END_VAR

// Interlock logic
Thermal_Enable := NOT (Pump_Discharge OR Mixer_Motor);
