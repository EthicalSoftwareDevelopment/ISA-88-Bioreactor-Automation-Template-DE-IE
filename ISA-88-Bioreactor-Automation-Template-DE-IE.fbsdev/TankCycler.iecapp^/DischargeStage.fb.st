FUNCTION_BLOCK DischargeStage_FB_ST
VAR_INPUT
  Cycle_Active     : BOOL;
  Heat_Complete    : BOOL;
END_VAR

VAR_OUTPUT
  T1_Valve_Outlet  : BOOL;
  Discharge_Complete : BOOL;
END_VAR

// implementation here...

IF Cycle_Active AND Heat_Complete THEN
    T1_Valve_Outlet := TRUE;
ELSE
    T1_Valve_Outlet := FALSE;
END_IF;

IF Cycle_Active AND Heat_Complete THEN
    Discharge_Complete := TRUE;
END_IF;


END_FUNCTION_BLOCK