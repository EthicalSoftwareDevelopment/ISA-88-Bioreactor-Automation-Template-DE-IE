FUNCTION_BLOCK BatchCounter_FB_ST
VAR_INPUT
    Cycle_Complete : BOOL;   // Signal from TankCycler/PLC_PRG when a batch finishes
    Reset_Counter  : BOOL;   // Operator request to reset batch count
END_VAR

VAR_OUTPUT
    Batch_Count : INT := 0;       // Total number of completed batches
    Batch_Logged : BOOL := FALSE; // Flag indicating a batch was logged
END_VAR

VAR
    Prev_CycleComplete : BOOL := FALSE; // Edge detection helper
END_VAR

// Reset logic
IF Reset_Counter THEN
    Batch_Count := 0;
    Batch_Logged := FALSE;
END_IF;

// Rising edge detection for Cycle_Complete
IF (Cycle_Complete AND NOT Prev_CycleComplete) THEN
    Batch_Count := Batch_Count + 1;
    Batch_Logged := TRUE;
END_IF;

// Update previous state
Prev_CycleComplete := Cycle_Complete;
