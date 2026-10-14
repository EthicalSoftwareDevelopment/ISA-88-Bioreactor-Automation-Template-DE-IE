PROGRAM UtilityMonitor_PRG
VAR
    UtilityFB : UtilityMonitor_FB_ST;

    // Inputs
    Steam_Available       : BOOL;
    ChilledWater_Available: BOOL;
    Air_Available         : BOOL;

    // Outputs
    Utilities_OK     : BOOL;
    Steam_OK         : BOOL;
    ChilledWater_OK  : BOOL;
    Air_OK           : BOOL;
END_VAR

// Call the Utility Monitor FB
UtilityFB(
    Steam_Available := Steam_Available,
    ChilledWater_Available := ChilledWater_Available,
    Air_Available := Air_Available,
    Utilities_OK => Utilities_OK,
    Steam_OK => Steam_OK,
    ChilledWater_OK => ChilledWater_OK,
    Air_OK => Air_OK
);
