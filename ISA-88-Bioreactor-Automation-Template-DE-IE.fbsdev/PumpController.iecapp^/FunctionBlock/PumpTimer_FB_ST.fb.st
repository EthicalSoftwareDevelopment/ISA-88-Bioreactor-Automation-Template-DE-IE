FUNCTION_BLOCK PumpTimer_FB_ST
VAR_INPUT
    Cycle_Active : BOOL;   // overall cycle running
    Stage_Ready  : BOOL;   // discharge stage condition met
    PT           : TIME := T#10s; // preset time (adjust as needed)
END_VAR

VAR_OUTPUT
    PumpTimer_Done : BOOL := FALSE;
END_VAR

VAR
    TON_Pump : TON; // IEC timer instance
END_VAR

// Timer logic
TON_Pump(IN := (Cycle_Active AND Stage_Ready), PT := PT);

PumpTimer_Done := TON_Pump.Q;
