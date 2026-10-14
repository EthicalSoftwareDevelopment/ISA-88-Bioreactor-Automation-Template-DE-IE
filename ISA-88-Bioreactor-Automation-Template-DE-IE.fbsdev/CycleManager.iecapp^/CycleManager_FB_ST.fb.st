FUNCTION_BLOCK CycleManager_FB_ST
VAR_INPUT
    Global_Start        : BOOL;   // Operator command to start plant
    Global_Stop         : BOOL;   // Operator command to stop plant
    Tank1_CycleComplete : BOOL;   // Tank 1 cycle finished
    Tank2_CycleComplete : BOOL;   // Tank 2 cycle finished
    CIP_Complete_T1     : BOOL;   // Tank 1 CIP finished
    CIP_Complete_T2     : BOOL;   // Tank 2 CIP finished
    Utilities_OK        : BOOL;   // Consolidated utility status
    Interlock_OK        : BOOL;   // Consolidated interlock status
END_VAR

VAR_OUTPUT
    Plant_Active     : BOOL := FALSE; // Plant running
    Plant_Stopped    : BOOL := TRUE;  // Plant stopped
    Tank1_StartCycle : BOOL := FALSE; // Command to start Tank 1 cycle
    Tank2_StartCycle : BOOL := FALSE; // Command to start Tank 2 cycle
    Tank1_StartCIP   : BOOL := FALSE; // Command to start Tank 1 CIP
    Tank2_StartCIP   : BOOL := FALSE; // Command to start Tank 2 CIP
END_VAR

VAR
    Tank1_NeedsCIP : BOOL := FALSE;
    Tank2_NeedsCIP : BOOL := FALSE;
END_VAR

// Plant start/stop logic
IF Global_Start AND Utilities_OK AND Interlock_OK THEN
    Plant_Active := TRUE;
    Plant_Stopped := FALSE;
END_IF;

IF Global_Stop THEN
    Plant_Active := FALSE;
    Plant_Stopped := TRUE;
    Tank1_StartCycle := FALSE;
    Tank2_StartCycle := FALSE;
    Tank1_StartCIP := FALSE;
    Tank2_StartCIP := FALSE;
END_IF;

// Tank 1 cycle/CIP orchestration
IF Plant_Active THEN
    IF Tank1_CycleComplete THEN
        Tank1_NeedsCIP := TRUE;
    END_IF;

    IF Tank1_NeedsCIP AND NOT Tank1_StartCycle THEN
        Tank1_StartCIP := TRUE;
    END_IF;

    IF CIP_Complete_T1 THEN
        Tank1_NeedsCIP := FALSE;
        Tank1_StartCIP := FALSE;
        Tank1_StartCycle := TRUE; // Ready for next production cycle
    END_IF;
END_IF;

// Tank 2 cycle/CIP orchestration
IF Plant_Active THEN
    IF Tank2_CycleComplete THEN
        Tank2_NeedsCIP := TRUE;
    END_IF;

    IF Tank2_NeedsCIP AND NOT Tank2_StartCycle THEN
        Tank2_StartCIP := TRUE;
    END_IF;

    IF CIP_Complete_T2 THEN
        Tank2_NeedsCIP := FALSE;
        Tank2_StartCIP := FALSE;
        Tank2_StartCycle := TRUE; // Ready for next production cycle
    END_IF;
END_IF;
