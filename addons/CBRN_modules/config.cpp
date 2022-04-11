class CfgPatches
{
	class CBRN_modules
	{
		units[] = {"ModuleOrdnanceMortar_Chemical_Sarin", "ModuleOrdnanceMortar_Chemical_Tear", "ModuleOrdnanceMortar_Chemical_VX", "ModuleCBRN_RemoveExposure", "ModuleCBRN_AddCBRNGear", "ModuleCBRN_FillGasArea", "ModuleCBRN_makeImmune", "ModuleCBRN_ignoreCBRN"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Modules_F", "A3_Modules_F_Curator_Ordnance"};
	};
};

#include "cfgFactionClasses.hpp"
#include "cfgVehicles.hpp"
#include "cfgFunctions.hpp"
