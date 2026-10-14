FUNCTION_BLOCK FillStage_FB_ST

VAR_INPUT
  Cycle_Active   : BOOL;
  T1_Level_High  : BOOL;
END_VAR

VAR_OUTPUT
  T1_Valve_Inlet : BOOL;
  Fill_Complete  : BOOL;
END_VAR

VAR
END_VAR

// implementation here...
// Fill logic
IF Start_Fill THEN
    Valve_Inlet := NOT Tn_Level_High;
    IF Tn_Level_High THEN
        Fill_Complete := TRUE;
        Valve_Inlet := FALSE;
    END_IF;
ELSE
    Valve_Inlet := FALSE;
    Fill_Complete := FALSE;
END_IF;


END_FUNCTION_BLOCK
