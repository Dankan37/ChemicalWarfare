class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets;
    };

    class StaticMortar: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
    };

    class Mortar_01_base_F: StaticMortar {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] += {"4Rnd_82mm_Mo_Chemical_Sarin", "4Rnd_82mm_Mo_Chemical_VX", "8Rnd_82mm_Mo_Chemical_Tear"};
            };
        };
    };

    class MBT_01_base_F: LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };

    class MBT_01_arty_base_F : MBT_01_base_F {
        class Turrets: Turrets { 
            class MainTurret: MainTurret {
                magazines[] += {"6Rnd_155mm_Mo_Chemical_Sarin","10Rnd_155mm_Mo_Chemical_Tear","6Rnd_155mm_Mo_Chemical_VX"};
                weapons[] = {"CBRN_mortar_155mm_AMOS"};
            };
        };
    };
/*
    class MBT_02_base_F: LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };

    class MBT_02_arty_base_F : MBT_02_base_F {
        class Turrets: Turrets { 
            class MainTurret: MainTurret {
                magazines[] += {"6Rnd_155mm_Mo_Chemical_Sarin","10Rnd_155mm_Mo_Chemical_Tear","6Rnd_155mm_Mo_Chemical_VX"};
                weapons[] = {"CBRN_mortar_155mm_AMOS"};
            };
        };
    };
*/
    class MBT_01_mlrs_base_F: MBT_01_base_F {};
    class B_MBT_01_mlrs_base_F: MBT_01_mlrs_base_F {};
    class B_MBT_01_mlrs_F: B_MBT_01_mlrs_base_F {};

    class CBRN_B_MBT_01_mlrs_F: B_MBT_01_mlrs_F {
        displayName = "M5 Sandstorm MLRS (GAS)";

        class Turrets: Turrets { 
            class MainTurret: MainTurret {
                magazines[] = {"12Rnd_230mm_rockets_Sarin"};
            };
        };
    };

    class Truck_02_base_F: LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };
    class Truck_02_MRL_base_F: Truck_02_base_F {};
    class I_Truck_02_MRL_F: Truck_02_MRL_base_F {};

    class CBRN_I_Truck_02_MRL_F: I_Truck_02_MRL_F {
        displayName = "Zamak MRL (GAS)";

        class Turrets: Turrets { 
            class MainTurret: MainTurret {
                magazines[] = {"12Rnd_230mm_rockets_Sarin"};
            };
        };
    };
};


 