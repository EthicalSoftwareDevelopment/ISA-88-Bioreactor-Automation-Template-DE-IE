FUNCTION_BLOCK ThermalTimer_FB_ST
VAR_INPUT
    Cycle_Active : BOOL;   // overall cycle running
    Mix_Complete : BOOL;   // mixing finished
    PT           : TIME := T#15s; // preset Thermaling time (adjust as needed)
END_VAR

VAR_OUTPUT
    ThermalTimer_Done : BOOL := FALSE;
END_VAR

VAR
    TON_Thermal : TON; // IEC timer instance
END_VAR

// Timer logic
TON_Thermal(IN := (Cycle_Active AND Mix_Complete), PT := PT);

ThermalTimer_Done := TON_Thermal.Q;
