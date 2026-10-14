FUNCTION_BLOCK InterlockManager_FB_ST
VAR_INPUT
    Tank_Empty       : BOOL;   // TRUE if tank is empty
    OutletValve_Open : BOOL;   // TRUE if outlet valve is open
    Cycle_Active     : BOOL;   // TRUE if production cycle is running
    CIP_Active       : BOOL;   // TRUE if cleaning-in-place cycle is active
    Utility_OK       : BOOL;   // TRUE if required utilities are available
END_VAR

VAR_OUTPUT
    Pump_OK      : BOOL := FALSE;   // Pump allowed
    Heater_OK    : BOOL := FALSE;   // Heater allowed
    Mixer_OK     : BOOL := FALSE;   // Mixer allowed
    CIP_OK       : BOOL := FALSE;   // CIP allowed
    Interlock_OK : BOOL := FALSE;   // Global interlock status
END_VAR

// Pump interlock: only if outlet valve open AND utilities available
Pump_OK := OutletValve_Open AND Utility_OK;

// Heater interlock: only if tank not empty AND utilities available
Heater_OK := (NOT Tank_Empty) AND Utility_OK;

// Mixer interlock: only if production cycle active AND CIP not active
Mixer_OK := Cycle_Active AND (NOT CIP_Active);

// CIP interlock: only if production cycle not active AND utilities available
CIP_OK := (NOT Cycle_Active) AND Utility_OK;

// Global interlock: all subsystems safe
Interlock_OK := Pump_OK AND Heater_OK AND Mixer_OK AND CIP_OK;
