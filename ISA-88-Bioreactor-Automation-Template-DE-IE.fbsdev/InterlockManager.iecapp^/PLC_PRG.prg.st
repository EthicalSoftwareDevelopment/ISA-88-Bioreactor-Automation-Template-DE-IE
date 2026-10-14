PROGRAM PLC_PRG
VAR
    InterlockFB : InterlockManager_FB_ST;

    // Inputs from subsystems and sensors
    Tank_Empty       : BOOL;
    OutletValve_Open : BOOL;
    Cycle_Active     : BOOL;
    CIP_Active       : BOOL;
    Utility_OK       : BOOL;

    // Outputs
    Pump_OK      : BOOL;
    Heater_OK    : BOOL;
    Mixer_OK     : BOOL;
    CIP_OK       : BOOL;
    Interlock_OK : BOOL;
END_VAR

// Call the Interlock Manager FB
InterlockFB(
    Tank_Empty := Tank_Empty,
    OutletValve_Open := OutletValve_Open,
    Cycle_Active := Cycle_Active,
    CIP_Active := CIP_Active,
    Utility_OK := Utility_OK,
    Pump_OK => Pump_OK,
    Heater_OK => Heater_OK,
    Mixer_OK => Mixer_OK,
    CIP_OK => CIP_OK,
    Interlock_OK => Interlock_OK
);
