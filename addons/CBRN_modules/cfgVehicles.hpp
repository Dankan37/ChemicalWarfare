class cfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	
	//Used by zeus to remove players exposure
	class ModuleCBRN_RemoveExposure: Module_F
	{
		displayName = "Remove Exposure";
		author = "Assaultboy";
		scope = 2;
		scopeCurator = 2;
		category = "CBRN_modules";
		
		isGlobal = 1;
		function = "CBRN_fnc_handleAI";
		CBRN_type = "exposure";
		class Attributes: AttributesBase
		{
			class Units: Units
			{
				property = "ModuleCBRN_RemoveExposure_Units";
			};	
		};
	};

	class ModuleCBRN_AddCBRNGear: ModuleCBRN_RemoveExposure
	{
		displayName = "Add CBRN Equipment";
		function = "CBRN_fnc_addCBRNGear";
	};

	class ModuleCBRN_makeImmune: ModuleCBRN_RemoveExposure
	{
		displayName = "Toggle immune";
		function = "CBRN_fnc_handleAI";
		CBRN_type = "immune";
	};

	class ModuleCBRN_ignoreCBRN: ModuleCBRN_RemoveExposure
	{
		displayName = "Toggle ignore";
		function = "CBRN_fnc_handleAI";
		CBRN_type = "ignore";
	};

	class ModuleCBRN_FillGasArea: Module_F
	{
		displayName = "Fill area with Sarin Gas (200m)";
		author = "Dankan37";
		scope = 2;
		scopeCurator = 2;
		category = "CBRN_modules";
		function = "CBRN_fnc_fillAreaGas";
		
		isGlobal = 1;
	};
	
	//Used by zeus to drop chemical shells
	class ModuleOrdnanceMortar_F;
	class ModuleOrdnanceMortar_Chemical_Sarin: ModuleOrdnanceMortar_F
	{
		author = "Dankan37";
		displayName = "155 mm Sarin Gas";
		category = "CBRN_modules";
		function = "CBRN_fnc_moduleProjectile";
		ammo = "Sh_155mm_AMOS_Chem_Sarin";

		scope = 2;
		scopeCurator = 2;
	};
	
	class ModuleOrdnanceMortar_Chemical_Tear: ModuleOrdnanceMortar_Chemical_Sarin
	{
		displayName = "155 mm Tear Gas";
		ammo = "Sh_155mm_AMOS_Chem_Tear";
	};
	
	class ModuleOrdnanceMortar_Chemical_VX: ModuleOrdnanceMortar_Chemical_Sarin
	{
		displayName = "155 mm Nerve agent";
		ammo = "Sh_155mm_AMOS_Chem_VX";
	};
};