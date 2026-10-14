FUNCTION_BLOCK UtilityMonitor_FB_ST
VAR_INPUT
    Steam_Available        : BOOL;   // TRUE if steam supply is available
    ChilledWater_Available : BOOL;   // TRUE if chilled water supply is available
    Air_Available          : BOOL;   // TRUE if compressed air supply is available
END_VAR

VAR_OUTPUT
    Steam_OK        : BOOL := FALSE;   // Steam utility ready
    ChilledWater_OK : BOOL := FALSE;   // Chilled water utility ready
    Air_OK          : BOOL := FALSE;   // Compressed air utility ready
    Utilities_OK    : BOOL := FALSE;   // Consolidated utility status
END_VAR

// Logic
Steam_OK := Steam_Available;
ChilledWater_OK := ChilledWater_Available;
Air_OK := Air_Available;

// Consolidated flag: all required utilities must be available
Utilities_OK := Steam_OK AND ChilledWater_OK AND Air_OK;
