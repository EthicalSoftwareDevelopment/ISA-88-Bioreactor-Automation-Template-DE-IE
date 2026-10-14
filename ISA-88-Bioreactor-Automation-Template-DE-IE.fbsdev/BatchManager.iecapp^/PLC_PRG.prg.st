PROGRAM BatchCounter_PRG
VAR
    BatchFB : BatchCounter_FB_ST;

    // Inputs
    Cycle_Complete : BOOL;
    Reset_Counter  : BOOL;

    // Outputs
    Batch_Count : INT;
    Batch_Logged : BOOL;
END_VAR

// Call the Batch Counter FB
BatchFB(
    Cycle_Complete := Cycle_Complete,
    Reset_Counter := Reset_Counter,
    Batch_Count => Batch_Count,
    Batch_Logged => Batch_Logged
);
