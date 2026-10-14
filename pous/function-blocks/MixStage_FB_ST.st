FUNCTION_BLOCK MixStage_FB_ST
FUNCTION_BLOCK MixStage_FB_ST
VAR_INPUT
    Cycle_Active  : BOOL;   // latch from TankCycle
    Fill_Complete : BOOL;   // signal from FillStage
END_VAR

VAR_OUTPUT
    Mix_Complete  : BOOL := FALSE; // goes high when mixing done
END_VAR


// Body logic
IF Cycle_Active AND Fill_Complete THEN
    Mix_Complete := TRUE;
ELSE
    Mix_Complete := FALSE;
END_IF;

END_FUNCTION_BLOCK


END_FUNCTION_BLOCK